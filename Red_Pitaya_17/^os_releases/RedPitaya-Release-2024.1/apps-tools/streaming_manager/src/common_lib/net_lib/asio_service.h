#ifndef NET_LIB_ASIO_SERVICE_H
#define NET_LIB_ASIO_SERVICE_H

#include <iostream>
#include <memory>

#include "asio.hpp"

using  namespace std;

namespace  net_lib {

class CAsioService {
public:

//    static auto instance() -> CAsioService*;
    auto getIO() -> asio::io_service&;

    CAsioService();
    ~CAsioService();

private:



    CAsioService(const CAsioService &) = delete;
    CAsioService(CAsioService &&) = delete;
    CAsioService& operator=(const CAsioService&) =delete;
    CAsioService& operator=(const CAsioService&&) =delete;

    asio::io_service m_Ios;
    asio::io_service::work m_Work;
    asio::thread *m_asio_th;
};

}

#endif
