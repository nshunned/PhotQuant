#include "settings.h"

#include <vector>
#include <string>
#include <fstream>
#include <sstream>
#include <algorithm>
#include <istream>
#include <iterator>
#include <mutex>

#include <sys/sysinfo.h>
#include <unistd.h>
#include <pwd.h>
#include <sys/stat.h>

bool g_disableSaveSettings = false;
std::mutex g_mutex;

// Check the path is a directory.
auto isDirectory(const std::string &_path) -> bool {
    struct stat st;

    if (stat(_path.c_str(), &st) == 0) {
        return st.st_mode & S_IFDIR;
    }

    return false;
}

// Creates the directory and subdirectories if needed.
auto createDirectory(const std::string &_path) -> bool {
    size_t pos = 0;

    for (;;) {
        pos =  _path.find('/', pos);

        if (pos == std::string::npos) {
            // Create the last directory
            if (!isDirectory(_path.c_str())) {
                int mkdir_err = mkdir(_path.c_str(), S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH);
                return (mkdir_err == 0) || (mkdir_err == EEXIST);
            } else {
                return true;
            }
        } else {
            ++pos;
            std::string sub_path = _path.substr(0, pos);

            // Create subdirectory
            if (!isDirectory(sub_path.c_str())) {
                int mkdir_err = mkdir(sub_path.c_str(), S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH);

                if (!((mkdir_err == 0) || (mkdir_err == EEXIST))) {
                    return false;
                }
            }

            if (pos >= _path.size()) {
                return true;
            }
        }
    }

    return false;
}

auto deleteConfig(const std::string &_path) -> bool{
    std::lock_guard<std::mutex> lock(g_mutex);
    g_disableSaveSettings = true;
    return std::remove(_path.c_str()) == 0;
}


auto getHomeDirectory() -> std::string {
    // Use getpwuid
    char buf[1024];
    passwd pw;
    passwd *ppw = nullptr;

    if (getpwuid_r(getuid(), &pw, buf, sizeof(buf), &ppw) == 0) {
        std::cout << "getpwuid" << std::endl;
        return pw.pw_dir;
    }
    return "";
}

// Reads the configuration file
auto configGet(const std::string &_path) -> void {
    std::ifstream stream(_path.c_str(), std::ios_base::in | std::ios_base::binary);

    if (stream.is_open()) {
        std::stringstream buffer;
        buffer << stream.rdbuf();
        stream.close();

        try {
            JSONNode root_node = libjson::parse(buffer.str());

            for (const JSONNode &node : root_node) {
                switch (node.type()) {
                case JSON_STRING:{
                        auto par = CDataManager::GetInstance()->GetByName<CStringParameter>(node.name());
                        if (par!=nullptr){
                            par->Set(node.as_string());
                        }
                        break;
                }
                case JSON_BOOL:{
                    auto par = CDataManager::GetInstance()->GetByName<CBooleanParameter>(node.name());
                    if (par!=nullptr){
                        par->SendValue(node.as_bool());
                    }
                    break;
                }
                case JSON_NUMBER:{
                    auto par = CDataManager::GetInstance()->GetByName<CIntParameter>(node.name());
                    if (par!=nullptr){
                        par->SendValue(node.as_int());
                    }
                    auto parF = CDataManager::GetInstance()->GetByName<CFloatParameter>(node.name());
                    if (parF!=nullptr){
                        parF->SendValue(node.as_float());
                    }
                    auto parD = CDataManager::GetInstance()->GetByName<CDoubleParameter>(node.name());
                    if (parD!=nullptr){
                        parD->SendValue((double)node.as_float());
                    }
                    break;
                }
                default:
                    break;
                }
            }
        } catch (std::invalid_argument &) {
            // Parse error
            fprintf(stderr, "JSON parse error\n");
        }
    } else {
        fprintf(stderr, "Can not open \"%s\"\n", _path.c_str());
    }
}


auto configSetWithList(const std::string &_directory, const std::string &_filename,const std::vector<std::string> &_parameters) -> bool {
    std::lock_guard<std::mutex> lock(g_mutex);
    if (g_disableSaveSettings) return false;

    if (createDirectory(_directory)) {
        std::ofstream stream(_directory + "/" + _filename, std::ios_base::out | std::ios_base::trunc | std::ios_base::binary);

        if (stream.is_open()) {
            JSONNode root_node(JSON_NODE);
            int out1Imp = NO_INIT;
            int out2Imp = NO_INIT;
            float out1A = NO_INIT;
            float out2A = NO_INIT;

            auto x = CDataManager::GetInstance()->GetParametersList();
            for(CBaseParameter* i : *x){
                if (!(std::find(_parameters.begin(), _parameters.end(), i->GetName()) != _parameters.end())) continue;

                CIntParameter* intPar = dynamic_cast<CIntParameter*>(i);
                if (intPar != nullptr && intPar->Tag() == CONFIG_VAR){

                    if (strcmp("SOUR1_IMPEDANCE",i ->GetName())==0){
                        out1Imp = intPar->Value();
                        continue;
                    }
                    if (strcmp("SOUR2_IMPEDANCE",i ->GetName())==0){
                        out2Imp = intPar->Value();
                        continue;
                    }
                    root_node.push_back(JSONNode(i->GetName(), intPar->Value()));
                }
                CFloatParameter* intParF = dynamic_cast<CFloatParameter*>(i);
                if (intParF != nullptr  && intParF->Tag() == CONFIG_VAR){

                    if (strcmp("SOUR1_VOLT",i ->GetName())==0){
                        out1A = intParF->Value();
                        continue;
                    }
                    if (strcmp("SOUR2_VOLT",i ->GetName())==0){
                        out2A = intParF->Value();
                        continue;
                    }
                    root_node.push_back(JSONNode(i->GetName(), intParF->Value()));
                }

                CDoubleParameter* intParD = dynamic_cast<CDoubleParameter*>(i);
                if (intParD != nullptr  && intParD->Tag() == CONFIG_VAR){
                    root_node.push_back(JSONNode(i->GetName(), (float)intParD->Value()));
                }

                CBooleanParameter* intParB = dynamic_cast<CBooleanParameter*>(i);
                if (intParB != nullptr  && intParB->Tag() == CONFIG_VAR){
                    root_node.push_back(JSONNode(i->GetName(), intParB->Value()));
                }
                CStringParameter* intParS = dynamic_cast<CStringParameter*>(i);
                if (intParS != nullptr  && intParS->Tag() == CONFIG_VAR){
                    root_node.push_back(JSONNode(i->GetName(), intParS->Value()));
                }
            }

            if (out1A != NO_INIT && out1Imp != NO_INIT){
                root_node.push_back(JSONNode("SOUR1_VOLT", out1A * (out1Imp == 1 ? 2.0 : 1.0)));
                root_node.push_back(JSONNode("SOUR1_IMPEDANCE", out1Imp));
            }else{
                root_node.push_back(JSONNode("SOUR1_VOLT", out1A));
            }

            if (out2A != NO_INIT && out2Imp != NO_INIT){
                root_node.push_back(JSONNode("SOUR2_VOLT", out2A * (out2Imp == 1 ? 2.0 : 1.0)));
                root_node.push_back(JSONNode("SOUR2_IMPEDANCE", out2Imp));
            }else{
                root_node.push_back(JSONNode("SOUR2_VOLT", out2A));
            }

            stream << root_node.write();
            stream.close();
            return true;
        }
    }
    return false;
}


// Writes the configuration file
auto configSet(const std::string &_directory, const std::string &_filename) -> bool {
    std::lock_guard<std::mutex> lock(g_mutex);
    if (g_disableSaveSettings) return false;

    if (createDirectory(_directory)) {
        std::ofstream stream(_directory + "/" + _filename, std::ios_base::out | std::ios_base::trunc | std::ios_base::binary);

        if (stream.is_open()) {
            JSONNode root_node(JSON_NODE);
            int out1Imp = NO_INIT;
            int out2Imp = NO_INIT;
            float out1A = NO_INIT;
            float out2A = NO_INIT;

            auto x = CDataManager::GetInstance()->GetParametersList();
            for(CBaseParameter* i : *x){
                    CIntParameter* intPar = dynamic_cast<CIntParameter*>(i);
                    if (intPar != nullptr && intPar->Tag() == CONFIG_VAR){

                        if (strcmp("SOUR1_IMPEDANCE",i ->GetName())==0){
                            out1Imp = intPar->Value();
                            continue;
                        }
                        if (strcmp("SOUR2_IMPEDANCE",i ->GetName())==0){
                            out2Imp = intPar->Value();
                            continue;
                        }
                        root_node.push_back(JSONNode(i->GetName(), intPar->Value()));
                    }
                    CFloatParameter* intParF = dynamic_cast<CFloatParameter*>(i);
                    if (intParF != nullptr  && intParF->Tag() == CONFIG_VAR){

                        if (strcmp("SOUR1_VOLT",i ->GetName())==0){
                            out1A = intParF->Value();
                            continue;
                        }
                        if (strcmp("SOUR2_VOLT",i ->GetName())==0){
                            out2A = intParF->Value();
                            continue;
                        }
                        root_node.push_back(JSONNode(i->GetName(), intParF->Value()));
                    }

                    CDoubleParameter* intParD = dynamic_cast<CDoubleParameter*>(i);
                    if (intParD != nullptr  && intParD->Tag() == CONFIG_VAR){
                        root_node.push_back(JSONNode(i->GetName(), (float)intParD->Value()));
                    }

                    CBooleanParameter* intParB = dynamic_cast<CBooleanParameter*>(i);
                    if (intParB != nullptr  && intParB->Tag() == CONFIG_VAR){
                        root_node.push_back(JSONNode(i->GetName(), intParB->Value()));
                    }
                    CStringParameter* intParS = dynamic_cast<CStringParameter*>(i);
                    if (intParS != nullptr  && intParS->Tag() == CONFIG_VAR){
                        root_node.push_back(JSONNode(i->GetName(), intParS->Value()));
                    }
            }

            if (out1A != NO_INIT && out1Imp != NO_INIT){
                root_node.push_back(JSONNode("SOUR1_VOLT", out1A * (out1Imp == 1 ? 2.0 : 1.0)));
                root_node.push_back(JSONNode("SOUR1_IMPEDANCE", out1Imp));
            }else{
                root_node.push_back(JSONNode("SOUR1_VOLT", out1A));
            }

            if (out2A != NO_INIT && out2Imp != NO_INIT){
                root_node.push_back(JSONNode("SOUR2_VOLT", out2A * (out2Imp == 1 ? 2.0 : 1.0)));
                root_node.push_back(JSONNode("SOUR2_IMPEDANCE", out2Imp));
            }else{
                root_node.push_back(JSONNode("SOUR2_VOLT", out2A));
            }

            stream << root_node.write();
            stream.close();
            return true;
        }
    }
    return false;
}

auto isChanged() -> bool {
    auto x = CDataManager::GetInstance()->GetParametersList();
    for(CBaseParameter* i : *x){
        CIntParameter* intPar = dynamic_cast<CIntParameter*>(i);
        if (intPar != nullptr && intPar->Tag() == CONFIG_VAR && intPar->IsNewValue()){
            return true;
        }
        CFloatParameter* intParF = dynamic_cast<CFloatParameter*>(i);
        if (intParF != nullptr  && intParF->Tag() == CONFIG_VAR && intParF->IsNewValue()){
            return true;
        }
        CDoubleParameter* intParD = dynamic_cast<CDoubleParameter*>(i);
        if (intParD != nullptr  && intParD->Tag() == CONFIG_VAR && intParD->IsNewValue()){
            return true;
        }
        CBooleanParameter* intParB = dynamic_cast<CBooleanParameter*>(i);
        if (intParB != nullptr  && intParB->Tag() == CONFIG_VAR && intParB->IsNewValue()){
            return true;
        }
        CStringParameter* intParS = dynamic_cast<CStringParameter*>(i);
        if (intParS != nullptr  && intParS->Tag() == CONFIG_VAR && intParS->IsNewValue()){
            return true;
        }
    }
    return false;
}
