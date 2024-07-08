#include <chrono>

#include "dac_streaming.h"
#include "dac_streaming_lib/dac_net_controller.h"
#include "dac_streaming_lib/dac_streaming_manager.h"
#include "settings_lib/dac_settings.h"
#include "thread_cout.h"
#include "config.h"
#include "remote.h"

using namespace dac_streaming_lib;

std::map<std::string,CDACStreamingManager::Ptr> g_dac_manger;
std::map<std::string,CDACAsioNetController::Ptr> g_dac_asionet;

std::mutex         g_dac_smutex;
ClientOpt::Options g_dac_soption;
std::atomic<bool>  dac_sig_exit_flag(false);

std::map<std::string,long long int>   g_dac_timeBegin;
std::map<std::string,bool>            g_dac_terminate;
std::map<std::string,bool>            g_dac_connected;
std::map<std::string,uint64_t>        g_dac_BytesCount;
std::map<std::string,uint64_t>        g_dac_packCounter_ch1;
std::map<std::string,uint64_t>        g_dac_packCounter_ch2;

std::vector<std::thread>              dac_clients;

auto stopDACStreaming() -> void;
auto stopDACStreaming(std::string host) -> void;



auto dac_runClient(DacSettings conf) -> void{
    std::chrono::system_clock::time_point timeNow = std::chrono::system_clock::now();
    g_dac_timeBegin[conf.host] = std::chrono::time_point_cast<std::chrono::milliseconds >(timeNow).time_since_epoch().count();

    g_dac_packCounter_ch1[conf.host] = 0;
    g_dac_packCounter_ch2[conf.host] = 0;
    g_dac_BytesCount[conf.host] = 0;
    g_dac_terminate[conf.host] = false;
    g_dac_terminate[conf.host] = false;

    auto file_type = CDACStreamingManager::WAV_TYPE;

    switch(conf.file_type){
        case CStreamSettings::TDMS:
            file_type = CDACStreamingManager::TDMS_TYPE;
            break;
        case CStreamSettings::WAV:
            file_type = CDACStreamingManager::WAV_TYPE;
            break;
        default:
            stopDACStreaming(conf.host);
            return;
    }

    auto rep_mode = CStreamSettings::DACRepeat::DAC_REP_OFF;

    if (conf.dac_repeat == (int)ClientOpt::RepeatDAC::INF){
        rep_mode = CStreamSettings::DACRepeat::DAC_REP_INF;
    }
    if (conf.dac_repeat >= 0){
        rep_mode = CStreamSettings::DACRepeat::DAC_REP_ON;
    }

    int dac_rep = conf.dac_repeat >= 0 ? conf.dac_repeat : 0;


    g_dac_manger[conf.host] = CDACStreamingManager::Create(file_type ,conf.dac_file,rep_mode,dac_rep,conf.dac_memory);

    g_dac_manger[conf.host]->notifyStop.connect([=](CDACStreamingManager::NotifyResult res){
        const std::lock_guard<std::mutex> lock(g_dac_smutex);
        switch(res){
            case CDACStreamingManager::NotifyResult::NR_BROKEN:{
                if (conf.verbous)
                    aprintf(stdout,"%s File %s is broken\n",getTS(": ").c_str(),conf.dac_file.c_str());
                break;
            }
            case CDACStreamingManager::NotifyResult::NR_EMPTY:{
                if (conf.verbous)
                    aprintf(stdout,"%s File %s is empty\n",getTS(": ").c_str(),conf.dac_file.c_str());
                break;
            }
            case CDACStreamingManager::NotifyResult::NR_MISSING_FILE:{
                if (conf.verbous)
                    aprintf(stdout,"%s File %s is missing\n",getTS(": ").c_str(),conf.dac_file.c_str());
                break;
            }
            case CDACStreamingManager::NotifyResult::NR_STOP:{
                if (conf.verbous)
                    aprintf(stdout,"%s Got stop command from data controller\n",getTS(": ").c_str());
                break;
            }
            case CDACStreamingManager::NotifyResult::NR_ENDED:{
                if (conf.verbous)
                    aprintf(stdout,"%s All data sended %s\n",getTS(": ").c_str(),conf.dac_file.c_str());
                break;
            }
            default:
            break;
        }
        g_dac_terminate[conf.host] = true;
    });

    g_dac_connected[conf.host] = false;
    g_dac_asionet[conf.host] = std::make_shared<CDACAsioNetController>();
    g_dac_asionet[conf.host]->connectedNotify.connect([=](std::string host){
        const std::lock_guard<std::mutex> lock(g_dac_smutex);
        aprintf(stdout,"%s CLIENT CONNECTED  %s\n",getTS(": ").c_str(),host.c_str());
        g_dac_connected[host] = true;
    });

    g_dac_asionet[conf.host]->disconnectedNotify.connect([=](std::string host){
        const std::lock_guard<std::mutex> lock(g_dac_smutex);
        if (g_dac_connected[host])
            aprintf(stdout,"%s CLIENT DISCONNECTED  %s\n",getTS(": ").c_str(),host.c_str());
        g_dac_connected[host] = false;
    });

    g_dac_asionet[conf.host]->startAsioNet(net_lib::EMode::M_CLIENT,conf.host,conf.port != "" ? conf.port : "8903");

    auto beginTime = std::chrono::time_point_cast<std::chrono::milliseconds>(std::chrono::system_clock::now()).time_since_epoch().count();
    auto curTime = beginTime;
    while(!g_dac_connected[conf.host]){
        if (curTime - beginTime >= 5000) break;
        curTime = std::chrono::time_point_cast<std::chrono::milliseconds >(std::chrono::system_clock::now()).time_since_epoch().count();
    }


    if (g_dac_connected[conf.host]){
        while(1){
            uint8_t *ch1 = nullptr;
            uint8_t *ch2 = nullptr;
            size_t size1 = 0;
            size_t size2 = 0;
            auto res = g_dac_manger[conf.host]->getBuffer();
            if (!res.empty){
                ch1 = res.ch1;
                ch2 = res.ch2;
                size1 = res.size_ch1;
                size2 = res.size_ch2;
                g_dac_asionet[conf.host]->sendBuffer(ch1,size1,ch2,size2);
            }
            if (ch1){
                g_dac_packCounter_ch1[conf.host]++;
                g_dac_BytesCount[conf.host] += size1;
                delete[](ch1);
            }
            if (ch2){
                g_dac_packCounter_ch2[conf.host]++;
                g_dac_BytesCount[conf.host] += size2;
                delete[](ch2);
            }

            if (g_dac_terminate[conf.host]){
                break;
            }

            std::chrono::system_clock::time_point timeNow = std::chrono::system_clock::now();
            auto curTime = std::chrono::time_point_cast<std::chrono::milliseconds >(timeNow);
            auto value = curTime.time_since_epoch();
            if ((value.count() - g_dac_timeBegin[conf.host]) >= 5000) {
                const std::lock_guard<std::mutex> lock(g_dac_smutex);
                uint64_t bw = g_dac_BytesCount[conf.host];
                std::string pref = " ";
                if (g_dac_BytesCount[conf.host]  > (1024 * 5)) {
                    bw = g_dac_BytesCount[conf.host]  / (1024 * 5);
                    pref = " ki";
                }

                if (g_dac_BytesCount[conf.host]   > (1024 * 1024 * 5)) {
                    bw = g_dac_BytesCount[conf.host]   / (1024 * 1024 * 5);
                    pref = " Mi";
                }
                aprintf(stdout,"%s\tHOST IP: %s: Bandwidth:\t%d %sB/s \tData count ch1:\t%d\tch2:\t%d\n",getTS(": ").c_str(),conf.host.c_str(),bw,pref.c_str(),g_dac_packCounter_ch1[conf.host],g_dac_packCounter_ch2[conf.host]);
                g_dac_BytesCount[conf.host]  = 0;
                g_dac_timeBegin[conf.host] = value.count();
            }
        }
    }

    stopDACStreaming(conf.host);
}

auto startDACStreaming(std::shared_ptr<ClientNetConfigManager> cl,std::string &conf) -> void{
    auto settings = DacSettings::readFromFile(conf);
    if (settings.size() > 0){
        ClientOpt::Options remote_opt;
        remote_opt.mode = ClientOpt::Mode::REMOTE;
        remote_opt.remote_mode = ClientOpt::RemoteMode::START_DAC;
        bool verbous = false;
        for (auto &item : settings){
            remote_opt.hosts.push_back(item.host);
            remote_opt.ports.config_port = item.config_port  != "" ? item.config_port : ClientOpt::Ports().config_port;
            verbous |= item.verbous;
        }
        remote_opt.verbous = verbous;
        std::map<string,StateRunnedHosts> runned_hosts;
        if (startRemote(cl,remote_opt,&runned_hosts)){

            for(auto &kv:runned_hosts){
                if (kv.second == StateRunnedHosts::TCP){
                    auto find = std::find_if(std::begin(settings),std::end(settings),[&kv](const DacSettings &c){
                        return c.host == kv.first;
                    });
                    if (find != std::end(settings)){
                        dac_clients.push_back(std::thread(dac_runClient, *find));
                    }else{
                        continue;
                    }
                }
            }

            for (std::thread &t: dac_clients) {
                if (t.joinable()) {
                    t.join();
                }
            }
        }
    }
}

auto startDACStreaming(std::shared_ptr<ClientNetConfigManager> cl,ClientOpt::Options &option) -> void{
    g_dac_soption = option;

    ClientOpt::Options remote_opt = g_dac_soption;
    remote_opt.mode = ClientOpt::Mode::REMOTE;
    remote_opt.remote_mode = ClientOpt::RemoteMode::START_DAC;
    remote_opt.ports.config_port = g_dac_soption.ports.config_port  != "" ? g_dac_soption.ports.config_port : ClientOpt::Ports().config_port;
    remote_opt.verbous = g_dac_soption.verbous;
    std::map<string,StateRunnedHosts> runned_hosts;
    if (startRemote(cl,remote_opt,&runned_hosts)){

        for(auto &kv:runned_hosts){
            if (kv.second == StateRunnedHosts::TCP){
                DacSettings conf;
                conf.host = kv.first;
                conf.port = g_dac_soption.ports.dac_streaming_port  != "" ? g_dac_soption.ports.dac_streaming_port : ClientOpt::Ports().dac_streaming_port;
                switch(g_dac_soption.streamign_type){
                    case ClientOpt::StreamingType::TDMS:
                        conf.file_type = CStreamSettings::TDMS;
                        break;
                    case ClientOpt::StreamingType::WAV:
                        conf.file_type = CStreamSettings::WAV;
                        break;
                    default:
                        conf.file_type = CStreamSettings::UNDEF;
                        return;
                }
                conf.dac_file = g_dac_soption.dac_file;
                conf.dac_repeat = g_dac_soption.dac_repeat;
                conf.dac_memory = g_dac_soption.dac_memory;
                conf.verbous = g_dac_soption.verbous;
                dac_clients.push_back(std::thread(dac_runClient, conf));
            }
        }

        for (std::thread &t: dac_clients) {
            if (t.joinable()) {
                t.join();
            }
        }
    }
}

auto dac_streamingSIGHandler() -> void{
    stopDACStreaming();
    dac_sig_exit_flag = true;
}

auto stopDACStreaming(std::string host) -> void{
    if (g_dac_manger.count(host))
        g_dac_manger[host]->stop();
    if (g_dac_asionet.count(host))
        g_dac_asionet[host]->stopAsioNet();
    g_dac_terminate[host] = true;
}

auto stopDACStreaming() -> void{
    for(auto& kv : g_dac_terminate){
        kv.second = true;
    }
}
