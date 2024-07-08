#include <iostream>
#include <fstream>
#include <math.h>
#include "stream_settings.h"
#include "json/json.h"
#include "data_lib/thread_cout.h"

#ifndef _WIN32
#include <sys/stat.h>
#endif

#define UNUSED(x) [&x]{}()

using namespace std;

#ifndef _WIN32

auto createDir(const std::string dir) -> bool
{
    mkdir(dir.c_str(), 0777);
    return true;
}

auto createDirTree(const std::string full_path) -> bool
{
    char ch = '/';

    size_t pos = 0;
    bool ret_val = true;

    while(ret_val == true && pos != std::string::npos)
    {
        pos = full_path.find(ch, pos + 1);
        ret_val = createDir(full_path.substr(0, pos));
    }

    return ret_val;
}

#endif

CStreamSettings::CStreamSettings(){
    m_port = "";
    m_dac_file = "";
    m_protocol = TCP;
    m_samples = -1;
    m_format = WAV;
    m_type = RAW;
    m_saveType = NET;
    m_channels = 0;
    m_res = BIT_8;
    m_decimation = 1;
    m_attenuator = 0;
    m_calib = false;
    m_ac_dc = 0xF;

    m_dac_gain = 0;
    m_dac_file_type = WAV;
    m_dac_mode = DAC_NET;
    m_dac_repeat = DAC_REP_OFF;
    m_dac_port = "";
    m_dac_memoryUsage = 1024 * 1024;
    m_dac_repeatCount = 0;
    m_dac_speed_Hz = 0;

    m_loopback_timeout = 10;
    m_loopback_speed_Hz = -1;
    m_loopback_mode = LOOPBACKMode::DD;
    m_loopback_channels = LOOPBACKChannels::TWO;

    reset();
}

void CStreamSettings::reset(){
    m_var_changed.clear();
    m_var_changed = { {"m_port",        false},
                      {"m_dac_file",    false},
                      {"m_protocol",    false},
                      {"m_samples",     false},
                      {"m_format",      false},
                      {"m_type",        false},
                      {"m_saveType",    false},
                      {"m_channels",    false},
                      {"m_res",         false},
                      {"m_decimation",  false},
                      {"m_attenuator",  false},
                      {"m_calib",       false},
                      {"m_ac_dc",       false},

                      {"m_dac_gain",        false},
                      {"m_dac_file_type",   false},
                      {"m_dac_mode",        false},
                      {"m_dac_repeat",      false},
                      {"m_dac_port",        false},
                      {"m_dac_memoryUsage", false},
                      {"m_dac_repeatCount", false},
                      {"m_dac_speed_Hz",    false},

                      {"m_loopback_timeout",  false},
                      {"m_loopback_speed_Hz", false},
                      {"m_loopback_mode",     false},
                      {"m_loopback_channels", false}

                      };
}

auto CStreamSettings::resetDefault() -> void{
    reset();
    setPort("8900");
    setDACFile("");
    setProtocol(TCP);
    setSamples(2000000);
    setFormat(BIN);
    setType(RAW);
    setSaveType(NET);
    setChannels(0);
    setResolution(BIT_8);
    setAttenuator(0);
    setDecimation(1);
    setCalibration(false);
    setAC_DC(0xF);

    setDACGain(0);
    setDACFileType(WAV);
    setDACMode(DAC_NET);
    setDACRepeat(DAC_REP_OFF);
    setDACPort("8903");
    setDACMemoryUsage(1024 * 1024);
    setDACRepeatCount(0);
    setDACHz(0);

    setLoopbackTimeout(10);
    setLoopbackSpeed(-1);
    setLoopbackMode(LOOPBACKMode::DD);
    setLoopbackChannels(LOOPBACKChannels::TWO);

}

CStreamSettings::~CStreamSettings(){
}

CStreamSettings::CStreamSettings (const CStreamSettings& src){
    copy(src);
}

CStreamSettings& CStreamSettings::operator= (const CStreamSettings& src){
    copy(src);
    return *this;
}

auto CStreamSettings::copy(const CStreamSettings &src) -> void{
    m_port = src.m_port;
    m_dac_file = src.m_dac_file;
    m_protocol = src.m_protocol;
    m_samples = src.m_samples;
    m_format = src.m_format;

    m_type = src.m_type;
    m_saveType = src.m_saveType;
    m_channels = src.m_channels;
    m_res = src.m_res;
    m_decimation = src.m_decimation;
    m_attenuator = src.m_attenuator;
    m_calib = src.m_calib;
    m_ac_dc = src.m_ac_dc;

    m_dac_gain  = src.m_dac_gain;
    m_dac_file_type  = src.m_dac_file_type;
    m_dac_mode  = src.m_dac_mode;
    m_dac_repeat  = src.m_dac_repeat;
    m_dac_port  = src.m_dac_port;
    m_dac_memoryUsage  = src.m_dac_memoryUsage;
    m_dac_repeatCount  = src.m_dac_repeatCount;
    m_dac_speed_Hz  = src.m_dac_speed_Hz;

    m_loopback_timeout  = src.m_loopback_timeout;
    m_loopback_speed_Hz  = src.m_loopback_speed_Hz;
    m_loopback_mode  = src.m_loopback_mode;
    m_loopback_channels  = src.m_loopback_channels;

    m_var_changed  = src.m_var_changed;

}


bool CStreamSettings::isSetted(){
    for (auto& item: m_var_changed) {
        if (!item.second) return false;
    }
    return true;
}

bool CStreamSettings::writeToFile(string _filename){
    if (isSetted()){
        Json::Value root;
        Json::Value adc_config;
        Json::Value dac_config;
        Json::Value loopback_config;

        adc_config["port"] = getPort();
        adc_config["protocol"] = getProtocol();
        adc_config["samples"] = getSamples();
        adc_config["format"] = getFormat();
        adc_config["type"] = getType();
        adc_config["save_type"] = getSaveType();
        adc_config["channels"] = getChannels();
        adc_config["resolution"] = getResolution();
        adc_config["decimation"] = getDecimation();
        adc_config["attenuator"] = getAttenuator();
        adc_config["calibration"] = getCalibration();
        adc_config["coupling"] = getAC_DC();

        dac_config["dac_file"] = getDACFile();
        dac_config["dac_file_type"] = getDACFileType();
        dac_config["dac_gain"] = getDACGain();
        dac_config["dac_mode"] = getDACMode();
        dac_config["dac_repeat"] = getDACRepeat();
        dac_config["dac_repeatCount"] = getDACRepeatCount();
        dac_config["dac_port"] = getDACPort();
        dac_config["dac_memoryUsage"] = getDACMemoryUsage();
        dac_config["dac_speed"] = getDACHz();

        loopback_config["timeout"] = getLoopbackTimeout();
        loopback_config["dac_speed"] = getLoopbackSpeed();
        loopback_config["mode"] = getLoopbackMode();
        loopback_config["channels"] = getLoopbackChannels();


        root["adc_streaming"] = adc_config;
        root["dac_streaming"] = dac_config;
        root["loopback"] = loopback_config;

        Json::StreamWriterBuilder builder;
        const std::string json_file = Json::writeString(builder, root);

#ifndef _WIN32
        auto found = _filename.find_last_of("/\\");
        auto dirPath = _filename.substr(0, found);
        createDirTree(dirPath);
#endif

        ofstream file(_filename , 	ios::out | ios::trunc);
        if (!file.is_open()) {
            aprintf(stderr, "file write failed %d\n",std::strerror(errno));
            return false;
        }
        file << json_file;
        return true;
    }
    return false;
}

auto CStreamSettings::getJson()-> std::string{
    if (isSetted()){

        Json::Value root;
        Json::Value adc_config;
        Json::Value dac_config;
        Json::Value loopback_config;

        adc_config["port"] = getPort();
        adc_config["protocol"] = getProtocol();
        adc_config["samples"] = getSamples();
        adc_config["format"] = getFormat();
        adc_config["type"] = getType();
        adc_config["save_type"] = getSaveType();
        adc_config["channels"] = getChannels();
        adc_config["resolution"] = getResolution();
        adc_config["decimation"] = getDecimation();
        adc_config["attenuator"] = getAttenuator();
        adc_config["calibration"] = getCalibration();
        adc_config["coupling"] = getAC_DC();

        dac_config["dac_file"] = getDACFile();
        dac_config["dac_file_type"] = getDACFileType();
        dac_config["dac_gain"] = getDACGain();
        dac_config["dac_mode"] = getDACMode();
        dac_config["dac_repeat"] = getDACRepeat();
        dac_config["dac_repeatCount"] = getDACRepeatCount();
        dac_config["dac_port"] = getDACPort();
        dac_config["dac_memoryUsage"] = getDACMemoryUsage();
        dac_config["dac_speed"] = getDACHz();

        loopback_config["timeout"] = getLoopbackTimeout();
        loopback_config["dac_speed"] = getLoopbackSpeed();
        loopback_config["mode"] = getLoopbackMode();
        loopback_config["channels"] = getLoopbackChannels();

        root["adc_streaming"] = adc_config;
        root["dac_streaming"] = dac_config;
        root["loopback"] = loopback_config;

        Json::StreamWriterBuilder builder;
        const std::string json = Json::writeString(builder, root);
        return json;
    }
    return "INCOMPLETE SETTING";
}

auto CStreamSettings::String()-> std::string{
    if (isSetted()){
        std::string  str = "";

        str = str + "Port:\t\t\t"+getPort()+"\n";

        std::string  protocol = "ERROR";
        switch (getProtocol()) {
            case TCP:
                protocol = "TCP";
                break;
            case UDP:
                protocol = "UDP";
                break;
        }
        str = str + "Protocol:\t\t" + protocol  +"\n";

        std::string  channels = "";
        auto ch = getChannels();
        if (ch & CH1){
            channels = "Ch 1";
        }
        if (ch & CH2){
            if (channels.length()) channels += " + ";
            channels += "Ch 2";
        }
        if (ch & CH3){
            if (channels.length()) channels += " + ";
            channels += "Ch 3";
        }
        if (ch & CH4){
            if (channels.length()) channels += " + ";
            channels += "Ch 4";
        }

        if (!channels.length()) channels = "ERROR!";

        str = str + "Channels:\t\t" + channels  +"\n";

        str = str + "Decimation:\t\t" + std::to_string(getDecimation())  +"\n";

        std::string  resolution = "ERROR";
        switch (getResolution()) {
            case BIT_8:
                resolution = "8 Bit";
                break;
            case BIT_16:
                resolution = "16 Bit";
                break;
        }
        str = str + "Resolution:\t\t" + resolution  +"\n";

        std::string  attenuator = "";

        auto att = getAttenuator();

        if (att & CH1){
            attenuator = "Ch 1 (1:20)";
        }else{
            attenuator = "Ch 1 (1:1)";
        }

        if (att & CH2){
            attenuator += " + Ch 2 (1:20)";
        }else{
            attenuator += " + Ch 2 (1:1)";
        }

        if (att & CH3){
            attenuator += " + Ch 3 (1:20)";
        }else{
            attenuator += " + Ch 3 (1:1)";
        }

        if (att & CH4){
            attenuator += " + Ch 4 (1:20)";
        }else{
            attenuator += " + Ch 4 (1:1)";
        }

        str = str + "Attenuator:\t\t" + attenuator  +"\n";
        str = str + "Calibration:\t\t" + (getCalibration() ? "Enable" : "Disable")  +"\n";

        std::string  coupling = "";

        auto ac_dc = getAC_DC();

        if (ac_dc & CH1){
            coupling = "Ch 1 (DC)";
        }else{
            coupling = "Ch 1 (AC)";
        }

        if (ac_dc & CH2){
            coupling += " + Ch 2 (DC)";
        }else{
            coupling += " + Ch 2 (AC)";
        }

        if (ac_dc & CH3){
            coupling += " + Ch 3 (DC)";
        }else{
            coupling += " + Ch 3 (AC)";
        }

        if (ac_dc & CH4){
            coupling += " + Ch 4 (DC)";
        }else{
            coupling += " + Ch 4 (AC)";
        }

        str = str + "AC/DC mode:\t\t" + coupling  +" (250-12 only)\n";

        std::string  savetype = "ERROR";
        switch (getSaveType()) {
            case SaveType::NET:
                savetype = "Network";
                break;
            case SaveType::FILE:
                savetype = "Local file";
        }
        str = str + "Mode:\t\t\t" + savetype  + "\n";

        str = str + "Samples:\t\t" + (getSamples() == -1 ? "Unlimited" : std::to_string(getSamples()))  +" (In file mode)\n";

        std::string  format = "ERROR";
        switch (getFormat()) {
            case DataFormat::WAV:
                format = "WAV";
                break;
            case DataFormat::TDMS:
                format = "TDMS";
                break;
            case DataFormat::BIN:
                format = "BIN";
                break;
            default:
                break;
        }
        str = str + "Data format:\t\t" + format  +" (In file mode)\n";

        std::string  type = "ERROR";
        switch (getType()) {
            case DataType::RAW:
                type = "RAW";
                break;
            case DataType::VOLT:
                type = "Voltage";
        }
        str = str + "Data type:\t\t" + type  +" (In file mode)\n";

        str = str + "\n******************** DAC  streaming ********************\n";
        std::string  dac_mode = "ERROR";

        switch (getDACMode()) {
            case DACType::DAC_NET:
                dac_mode = "Network";
                break;
            case DACType::DAC_FILE:
                dac_mode = "Local file";
        }
        str = str + "DAC Mode:\t\t" + dac_mode  + "\n";

        str = str + "Local file:\t\t" + getDACFile() + "\n";
        str = str + "Port:\t\t\t" + getDACPort() + "\n";

        std::string  dac_format = "ERROR";
        switch (getDACFileType()) {
            case DataFormat::WAV:
                dac_format = "WAV";
                break;
            case DataFormat::TDMS:
                dac_format = "TDMS";
                break;
            default:
                break;
        }
        str = str + "Data format:\t\t" + dac_format  +" (In DAC file mode)\n";

        std::string  dac_repeat = "ERROR";
        switch (getDACRepeat()) {
            case DACRepeat::DAC_REP_OFF:
                dac_repeat = "OFF";
                break;
            case DACRepeat::DAC_REP_INF:
                dac_repeat = "INF";
                break;
            case DACRepeat::DAC_REP_ON:
                dac_repeat = "ON";
                break;
        }
        str = str + "DAC repeat:\t\t" + dac_repeat +" (In file mode)\n";
        str = str + "DAC repeat count:\t" + std::to_string(getDACRepeatCount())  +" (In DAC file mode)\n";
        str = str + "DAC memory cache:\t" + std::to_string(getDACMemoryUsage())  +" (In DAC file mode)\n";
        str = str + "DAC speed (Hz):\t\t" + std::to_string(getDACHz())  +"\n";


        std::string  dac_gain = "";

        auto dac_g = getDACGain();

        if (dac_g & CH1){
            dac_gain = "Ch 1 (x5)";
        }else{
            dac_gain = "Ch 1 (x1)";
        }

        if (dac_g & CH2){
            dac_gain += " + Ch 2 (x5)";
        }else{
            dac_gain += " + Ch 2 (x1)";
        }

        if (dac_g & CH3){
            dac_gain += " + Ch 3 (x5)";
        }else{
            dac_gain += " + Ch 3 (x1)";
        }

        if (dac_g & CH4){
            dac_gain += " + Ch 4 (x5)";
        }else{
            dac_gain += " + Ch 4 (x1)";
        }

        str = str + "DAC Gain:\t\t" + dac_gain  +" (250-12 only)\n";


        str = str + "\n******************** Loopback **************************\n";

        std::string  lb_mode = "ERROR";
        switch (getLoopbackMode()) {
            case LOOPBACKMode::DD:
                lb_mode = "DD";
                break;
            default:
                break;
        }
        str = str + "Mode:\t\t\t" + lb_mode  + "\n";

        std::string  lb_chs = "ERROR";
        switch (getLoopbackChannels()) {
            case LOOPBACKChannels::ONE:
                lb_chs = "ONE";
                break;
            case LOOPBACKChannels::TWO:
                lb_chs = "TWO";
                break;
            default:
                break;
        }
        str = str + "Channels:\t\t" + lb_chs  + "\n";

        str = str + "Timeout:\t\t" + std::to_string(getLoopbackTimeout()) +" (In sec)\n";

        auto lb_speed = getLoopbackSpeed();
        if (lb_speed == -1){
            str = str + "DAC Speed:\t\t" +"MAX\n";
        }else{
            str = str + "DAC Speed:\t\t" + std::to_string(lb_speed)  +"\n";
        }

        return str;
    }
    return "INCOMPLETE SETTING";
}

// auto CStreamSettings::StringStreaming()-> std::string{
//     if (isSetted()){
//         std::string  str = "";
//         str = str + "Port:\t\t\t"+getPort()+"\n";

//         std::string  protocol = "ERROR";
//         switch (getProtocol()) {
//             case TCP:
//                 protocol = "TCP";
//                 break;
//             case UDP:
//                 protocol = "UDP";
//                 break;
//         }
//         str = str + "Protocol:\t\t" + protocol  +"\n";

//         std::string  channels = "";
//         auto ch = getChannels();
//         if (ch & CH1){
//             channels = "Ch 1";
//         }
//         if (ch & CH2){
//             if (channels.length()) channels += " + ";
//             channels += "Ch 2";
//         }
//         if (ch & CH3){
//             if (channels.length()) channels += " + ";
//             channels += "Ch 3";
//         }
//         if (ch & CH4){
//             if (channels.length()) channels += " + ";
//             channels += "Ch 4";
//         }

//         if (!channels.length()) channels = "ERROR!";

//         str = str + "Channels:\t\t" + channels  +"\n";

//         str = str + "Decimation:\t\t" + std::to_string(getDecimation())  +"\n";

//         std::string  resolution = "";

//         auto res = getResolution();

//         if (res & CH1){
//             resolution = "Ch 1 (16Bit)";
//         }else{
//             resolution = "Ch 1 (8Bit)";
//         }

//         if (res & CH2){
//             resolution += " + Ch 2 (16Bit)";
//         }else{
//             resolution += " + Ch 2 (8Bit)";
//         }

//         if (res & CH3){
//             resolution += " + Ch 3 (16Bit)";
//         }else{
//             resolution += " + Ch 3 (8Bit)";
//         }

//         if (res & CH4){
//             resolution += " + Ch 4 (16Bit)";
//         }else{
//             resolution += " + Ch 4 (8Bit)";
//         }

//         str = str + "Resolution:\t\t" + resolution  +"\n";

//         std::string  attenuator = "";

//         auto att = getAttenuator();

//         if (att & CH1){
//             attenuator = "Ch 1 (1:20)";
//         }else{
//             attenuator = "Ch 1 (1:1)";
//         }

//         if (att & CH2){
//             attenuator += " + Ch 2 (1:20)";
//         }else{
//             attenuator += " + Ch 2 (1:1)";
//         }

//         if (att & CH3){
//             attenuator += " + Ch 3 (1:20)";
//         }else{
//             attenuator += " + Ch 3 (1:1)";
//         }

//         if (att & CH4){
//             attenuator += " + Ch 4 (1:20)";
//         }else{
//             attenuator += " + Ch 4 (1:1)";
//         }

//         str = str + "Attenuator:\t\t" + attenuator  +"\n";
//         str = str + "Calibration:\t\t" + (getCalibration() ? "Enable" : "Disable")  +"\n";

//         std::string  coupling = "ERROR";
//         switch (getAC_DC()) {
//             case AC:
//                 coupling = "AC";
//                 break;
//             case DC:
//                 coupling = "DC";
//                 break;
//         }
//         str = str + "AC/DC mode:\t\t" + coupling  +" (250-12 only)\n";

//         std::string  savetype = "ERROR";
//         switch (getSaveType()) {
//             case SaveType::NET:
//                 savetype = "Network";
//                 break;
//             case SaveType::FILE:
//                 savetype = "Local file";
//         }
//         str = str + "Mode:\t\t\t" + savetype  + "\n";

//         str = str + "Samples:\t\t" + (getSamples() == -1 ? "Unlimited" : std::to_string(getSamples()))  +" (In file mode)\n";

//         std::string  format = "ERROR";
//         switch (getFormat()) {
//             case DataFormat::WAV:
//                 format = "WAV";
//                 break;
//             case DataFormat::TDMS:
//                 format = "TDMS";
//                 break;
//             case DataFormat::BIN:
//                 format = "BIN";
//                 break;
//             default:
//                 break;
//         }
//         str = str + "Data format:\t\t" + format  +" (In file mode)\n";

//         std::string  type = "ERROR";
//         switch (getType()) {
//             case DataType::RAW:
//                 type = "RAW";
//                 break;
//             case DataType::VOLT:
//                 type = "Voltage";
//         }
//         str = str + "Data type:\t\t" + type  +" (In file mode)\n";
//         return str;
//     }
//     return "INCOMPLETE SETTING";
// }

auto CStreamSettings::readFromFile(string _filename) -> bool {

    Json::Value root;
    Json::Value board_config;
    Json::Value adc_config;
    Json::Value dac_config;
    Json::Value loopback_config;

    std::ifstream file(_filename , 	ios::in);
    if (!file.is_open()) {
        std::cerr << "file "<< _filename.c_str() <<" read failed: " << std::strerror(errno) << "\n";
        return false;
    }

    reset();
    Json::CharReaderBuilder builder;
    builder["collectComments"] = false;
    JSONCPP_STRING errs;
    if (!parseFromStream(builder, file, &root, &errs)) {
        std::cerr << "[CStreamSettings] Error parse json" << errs << std::endl;
        return false;
    }

    if (root.isMember("adc_streaming")){
        adc_config = root["adc_streaming"];
    }else{
        std::cerr << "[CStreamSettings] Error parse json. Invalid file" << std::endl;
        return false;
    }

    if (root.isMember("dac_streaming")){
        dac_config = root["dac_streaming"];
    }else{
        std::cerr << "[CStreamSettings] Error parse json. Invalid file" << std::endl;
        return false;
    }

    if (root.isMember("loopback")){
        loopback_config = root["loopback"];
    }else{
        std::cerr << "[CStreamSettings] Error parse json. Invalid file" << std::endl;
        return false;
    }

    if (adc_config.isMember("port"))
        setPort(adc_config["port"].asString());
    if (adc_config.isMember("protocol"))
        setProtocol(static_cast<Protocol>(adc_config["protocol"].asInt()));
    if (adc_config.isMember("samples"))
        setSamples(adc_config["samples"].asInt());
    if (adc_config.isMember("format"))
        setFormat(static_cast<DataFormat>(adc_config["format"].asInt()));
    if (adc_config.isMember("type"))
        setType(static_cast<DataType>(adc_config["type"].asInt()));
    if (adc_config.isMember("save_type"))
        setSaveType(static_cast<SaveType>(adc_config["save_type"].asInt()));
    if (adc_config.isMember("channels"))
        setChannels(static_cast<uint8_t>(adc_config["channels"].asInt()));
    if (adc_config.isMember("resolution"))
        setResolution(static_cast<Resolution>(adc_config["resolution"].asInt()));
    if (adc_config.isMember("decimation"))
        setDecimation(adc_config["decimation"].asUInt());
    if (adc_config.isMember("attenuator"))
        setAttenuator(static_cast<uint8_t>(adc_config["attenuator"].asInt()));
    if (adc_config.isMember("calibration"))
        setCalibration(adc_config["calibration"].asBool());
    if (adc_config.isMember("coupling"))
        setAC_DC(static_cast<uint8_t>(adc_config["coupling"].asInt()));


    if (dac_config.isMember("dac_file_type"))
        setDACFileType(static_cast<DataFormat>(dac_config["dac_file_type"].asInt()));
    if (dac_config.isMember("dac_gain"))
        setDACGain(static_cast<uint8_t>(dac_config["dac_gain"].asInt()));
    if (dac_config.isMember("dac_file"))
        setDACFile(dac_config["dac_file"].asString());
    if (dac_config.isMember("dac_mode"))
        setDACMode(static_cast<DACType>(dac_config["dac_mode"].asInt()));
    if (dac_config.isMember("dac_repeat"))
        setDACRepeat(static_cast<DACRepeat>(dac_config["dac_repeat"].asInt()));
    if (dac_config.isMember("dac_repeatCount"))
        setDACRepeatCount(static_cast<uint32_t>(dac_config["dac_repeatCount"].asInt()));
    if (dac_config.isMember("dac_port"))
        setDACPort(dac_config["dac_port"].asString());
    if (dac_config.isMember("dac_memoryUsage"))
        setDACMemoryUsage(dac_config["dac_memoryUsage"].asInt64());
    if (dac_config.isMember("dac_speed"))
        setDACHz(dac_config["dac_speed"].asInt());

    if (loopback_config.isMember("timeout"))
        setLoopbackTimeout(loopback_config["timeout"].asInt());
    if (loopback_config.isMember("dac_speed"))
        setLoopbackSpeed(loopback_config["dac_speed"].asInt());
    if (loopback_config.isMember("mode"))
        setLoopbackMode(static_cast<LOOPBACKMode>(loopback_config["mode"].asInt()));
    if (loopback_config.isMember("channels"))
        setLoopbackChannels(static_cast<LOOPBACKChannels>(loopback_config["channels"].asInt()));

    return isSetted();
}

void CStreamSettings::setPort(string _port){
    m_port  = _port;
    m_var_changed["m_port"] = true;
}

string CStreamSettings::getPort() const{
    return m_port;
}

void  CStreamSettings::setProtocol(CStreamSettings::Protocol _protocol){
    m_protocol  = _protocol;
    m_var_changed["m_protocol"] = true;
}

CStreamSettings::Protocol CStreamSettings::getProtocol() const{
    return m_protocol;
}

void CStreamSettings::setSamples(int32_t _samples){
    m_samples  = _samples;
    m_var_changed["m_samples"] = true;
}

int32_t CStreamSettings::getSamples() const{
    return  m_samples;
}

void CStreamSettings::setFormat(CStreamSettings::DataFormat _format){
    m_format = _format;
    m_var_changed["m_format"] = true;
}

CStreamSettings::DataFormat CStreamSettings::getFormat() const{
    return m_format;
}

void CStreamSettings::setType(DataType _type){
    m_type = _type;
    m_var_changed["m_type"] = true;
}

CStreamSettings::DataType CStreamSettings::getType() const{
    return m_type;
}

auto CStreamSettings::setSaveType(CStreamSettings::SaveType _type) -> void{
    m_saveType = _type;
    m_var_changed["m_saveType"] = true;
}

auto CStreamSettings::getSaveType() const -> CStreamSettings::SaveType{
    return m_saveType;
}

auto CStreamSettings::setChannels(uint8_t _value) -> void{
    m_channels = _value;
    m_var_changed["m_channels"] = true;
}

auto CStreamSettings::setChannels(Channel _channel,bool _enable) -> void{
    m_channels = (m_channels & ~_channel) | (_enable ? _channel : 0);
    m_var_changed["m_channels"] = true;
}

auto CStreamSettings::getChannels() const -> uint8_t{
    return m_channels;
}

auto CStreamSettings::getChannels(Channel _channel) const -> bool{
    return m_channels & _channel;
}

auto CStreamSettings::setResolution(Resolution _value) -> void{
    m_res = _value;
    m_var_changed["m_res"] = true;
}

auto CStreamSettings::getResolution() const -> Resolution{
    return m_res;
}

void CStreamSettings::setDecimation(uint32_t _decimation){
    m_decimation = _decimation;
    m_var_changed["m_decimation"] = true;
}

uint32_t CStreamSettings::getDecimation() const{
    return m_decimation;
}

auto CStreamSettings::setValue(std::string key,std::string value) -> bool{
    if (key == "port") {
        setPort(value);
        return true;
    }
    if (key == "dac_file") {
        setDACFile(value);
        return true;
    }
    if (key == "dac_port") {
        setDACPort(value);
        return true;
    }
    return false;
}

auto CStreamSettings::setValue(std::string key,int64_t value) -> bool{
    if (key == "protocol") {
        setProtocol(static_cast<Protocol>(value));
        return true;
    }

    if (key == "samples") {
        setSamples(value);
        return true;
    }

    if (key == "format") {
        setFormat(static_cast<DataFormat>(value));
        return true;
    }

    if (key == "type") {
        setType(static_cast<DataType>(value));
        return true;
    }

    if (key == "save_type") {
        setSaveType(static_cast<SaveType>(value));
        return true;
    }

    if (key == "channels") {
        setChannels(static_cast<uint8_t>(value));
        return true;
    }

    if (key == "resolution") {
        setResolution(static_cast<Resolution>(value));
        return true;
    }

    if (key == "decimation") {
        setDecimation(value);
        return true;
    }

    if (key == "attenuator") {
        setAttenuator(static_cast<uint8_t>(value));
        return true;
    }

    if (key == "calibration") {
        setCalibration(static_cast<bool>(value));
        return true;
    }

    if (key == "coupling") {
        setAC_DC(static_cast<uint8_t>(value));
        return true;
    }

    if (key == "dac_file_type") {
        setDACFileType(static_cast<DataFormat>(value));
        return true;
    }

    if (key == "dac_gain") {
        setDACGain(static_cast<uint8_t>(value));
        return true;
    }

    if (key == "dac_mode") {
        setDACMode(static_cast<DACType>(value));
        return true;
    }

    if (key == "dac_repeat") {
        setDACRepeat(static_cast<DACRepeat>(value));
        return true;
    }

    if (key == "dac_repeatCount") {
        setDACRepeatCount(static_cast<uint32_t>(value));
        return true;
    }

    if (key == "dac_memoryUsage") {
        setDACMemoryUsage(static_cast<int64_t>(value));
        return true;
    }

    if (key == "dac_speed") {
        setDACHz(static_cast<uint32_t>(value));
        return true;
    }

    if (key == "loopback_timeout") {
        setLoopbackTimeout(static_cast<uint32_t>(value));
        return true;
    }

    if (key == "loopback_speed") {
        setLoopbackSpeed(static_cast<int32_t>(value));
        return true;
    }

    if (key == "loopback_mode") {
        setLoopbackMode(static_cast<LOOPBACKMode>(value));
        return true;
    }

    if (key == "loopback_channels") {
        setLoopbackChannels(static_cast<LOOPBACKChannels>(value));
        return true;
    }

    return false;
}

auto CStreamSettings::setValue(std::string,double) -> bool{
    return false;
}

auto CStreamSettings::setAttenuator(uint8_t _value) -> void{
    m_attenuator = _value;
    m_var_changed["m_attenuator"] = true;
}

auto CStreamSettings::setAttenuator(Channel _channel,Attenuator _attenuator) -> void{
    m_attenuator = (m_attenuator & ~_channel) | (_attenuator == A_1_20 ? _channel : 0);
    m_var_changed["m_attenuator"] = true;
}

auto CStreamSettings::getAttenuator() const -> uint8_t{
    return m_attenuator;
}

auto CStreamSettings::getAttenuator(Channel _channel) const -> Attenuator{
    return m_attenuator & _channel ? A_1_20 : A_1_1;
}

auto CStreamSettings::setCalibration(bool _calibration) -> void{
    m_calib = _calibration;
    m_var_changed["m_calib"] = true;
}

auto CStreamSettings::getCalibration() const -> bool{
    return m_calib;
}

auto CStreamSettings::setAC_DC(uint8_t _value) -> void{
    m_ac_dc = _value;
    m_var_changed["m_ac_dc"] = true;
}

auto CStreamSettings::setAC_DC(Channel _channel,AC_DC _value) -> void{
    m_ac_dc = (m_ac_dc & ~_channel) | (_value == DC ? _channel : 0);
    m_var_changed["m_ac_dc"] = true;
}

auto CStreamSettings::getAC_DC() const -> uint8_t{
    return m_ac_dc;
}

auto CStreamSettings::getAC_DC(Channel _channel) const -> AC_DC{
    return m_ac_dc & _channel ? DC : AC;
}

auto CStreamSettings::setDACFile(std::string _value) -> void{
    m_dac_file = _value;
    m_var_changed["m_dac_file"] = true;
}

auto CStreamSettings::getDACFile() const -> std::string{
    return m_dac_file;
}

auto CStreamSettings::setDACFileType(CStreamSettings::DataFormat _value) -> void{
    if (_value == BIN) {
        m_dac_file_type = UNDEF;
    }else{
        m_dac_file_type = _value;
    }
    m_var_changed["m_dac_file_type"] = true;
}

auto CStreamSettings::getDACFileType() const -> CStreamSettings::DataFormat{
    return m_dac_file_type;
}

auto CStreamSettings::setDACGain(uint8_t _value) -> void{
    m_dac_gain = _value;
    m_var_changed["m_dac_gain"] = true;
}

auto CStreamSettings::setDACGain(Channel _channel,DACGain _value) -> void{
    m_dac_gain = (m_dac_gain & ~_channel) | (_value == X5 ? _channel : 0);
    m_var_changed["m_dac_gain"] = true;
}

auto CStreamSettings::getDACGain() const -> uint8_t{
    return m_dac_gain;
}

auto CStreamSettings::getDACGain(Channel _channel) const -> DACGain{
    return m_ac_dc & _channel ? X5 : X1;
}

auto CStreamSettings::setDACMode(CStreamSettings::DACType _value) -> void{
    m_dac_mode = _value;
    m_var_changed["m_dac_mode"] = true;
}

auto CStreamSettings::getDACMode() const -> CStreamSettings::DACType{
    return m_dac_mode;
}

auto CStreamSettings::setDACHz(uint32_t _value) -> void{
    m_dac_speed_Hz = _value;
    m_var_changed["m_dac_speed_Hz"] = true;
}

auto CStreamSettings::getDACHz() const -> uint32_t{
    return m_dac_speed_Hz;
}


auto CStreamSettings::setDACRepeat(DACRepeat _value) -> void{
    m_dac_repeat = _value;
    m_var_changed["m_dac_repeat"] = true;
}

auto CStreamSettings::getDACRepeat() const -> DACRepeat{
    return m_dac_repeat;
}

auto CStreamSettings::getDACPort() const -> std::string{
    return m_dac_port;
}

auto CStreamSettings::setDACPort(std::string _port) -> void{
    m_dac_port = _port;
    m_var_changed["m_dac_port"] = true;
}

auto CStreamSettings::getDACMemoryUsage() const -> int64_t{
    return m_dac_memoryUsage;
}

auto CStreamSettings::setDACMemoryUsage(int64_t _value) -> void{
    m_dac_memoryUsage = _value;
    m_var_changed["m_dac_memoryUsage"] = true;
}

auto CStreamSettings::setDACRepeatCount(uint32_t _value) -> void{
    m_dac_repeatCount = _value;
    m_var_changed["m_dac_repeatCount"] = true;
}

auto CStreamSettings:: getDACRepeatCount() const -> uint32_t{
    return m_dac_repeatCount;
}

auto CStreamSettings::getLoopbackTimeout() const -> uint32_t{
    return m_loopback_timeout;
}

auto CStreamSettings::setLoopbackTimeout(uint32_t value) -> void{
    m_loopback_timeout = value;
    m_var_changed["m_loopback_timeout"] = true;
}

auto CStreamSettings::getLoopbackSpeed() const -> int32_t{
    return m_loopback_speed_Hz;
}

auto CStreamSettings::setLoopbackSpeed(int32_t value) -> void{
    m_loopback_speed_Hz = value;
    m_var_changed["m_loopback_speed_Hz"] = true;
}

auto CStreamSettings::getLoopbackMode() const -> LOOPBACKMode{
    return m_loopback_mode;
}

auto CStreamSettings::setLoopbackMode(LOOPBACKMode mode) -> void{
    m_loopback_mode = mode;
    m_var_changed["m_loopback_mode"] = true;
}

auto CStreamSettings::getLoopbackChannels() const -> LOOPBACKChannels{
    return m_loopback_channels;
}

auto CStreamSettings::setLoopbackChannels(LOOPBACKChannels channels) -> void{
    m_loopback_channels = channels;
    m_var_changed["m_loopback_channels"] = true;
}

auto CStreamSettings::checkChannel(uint32_t _value, uint32_t _channel_index) -> bool{
    return _value & (uint32_t)pow(2,_channel_index);
}
