#include <iostream>
#include <string>
#include <fcntl.h>
#include <unistd.h>
#include "generator.h"
#include <stdio.h>
#include <string.h>

using namespace uio_lib;

auto CGenerator::create(const UioT &, bool _channel1Enable, bool _channel2Enable,uint32_t dacHz,uint32_t maxDacHz) -> CGenerator::Ptr{
    return std::make_shared<CGenerator>(_channel1Enable,_channel2Enable, 0, nullptr, 0, nullptr, 0, 0,dacHz,maxDacHz);
}

CGenerator::CGenerator(bool _channel1Enable, bool _channel2Enable, int _fd, void *_regset, size_t _regsetSize, void *_buffer, size_t _bufferSize, uintptr_t _bufferPhysAddr,uint32_t dacHz,uint32_t maxDacHz) :
    m_Channel1(_channel1Enable),
    m_Channel2(_channel2Enable),
    m_Fd(_fd),
    m_Regset(_regset),
    m_RegsetSize(_regsetSize),
    m_Buffer(_buffer),
    m_BufferSize(_bufferSize),
    m_BufferPhysAddr(_bufferPhysAddr),
    m_Map(nullptr),
    m_Buffer1(nullptr),
    m_Buffer2(nullptr),
    m_waitLock(),
    m_maxDacSpeedHz(maxDacHz),
    m_dacSpeedHz(dacHz)
{}

CGenerator::~CGenerator()
{}

auto CGenerator::getDacHz() -> uint32_t{
    return m_dacSpeedHz;
}

auto CGenerator::setDacHz(uint32_t hz) -> bool{
    if (((double)hz / (double)m_maxDacSpeedHz) * (1<<16) < 1) return false;
    m_dacSpeedHz = hz;
    return true;
}

auto CGenerator::setReg(volatile GeneratorMapT *) -> void{}

auto CGenerator::prepare() -> void {}

auto CGenerator::setCalibration(int32_t ,float , int32_t , float ) -> void{}

auto CGenerator::initFirst(uint8_t *_buffer1,uint8_t *_buffer2, size_t, size_t) -> bool {
    const std::lock_guard<std::mutex> lock(m_waitLock);
    bool ret = true;
    if (_buffer1){
        ret = true;
    }

    if (_buffer2){
        ret = true;
    }
    return ret;
}

auto CGenerator::initSecond(uint8_t *_buffer1,uint8_t *_buffer2, size_t, size_t) -> bool {
    const std::lock_guard<std::mutex> lock(m_waitLock);
    bool ret = false;
    if (_buffer1){
        ret = true;
    }

    if (_buffer2){
        ret = true;
    }
    return ret;
}

auto CGenerator::write(uint8_t *,uint8_t *, size_t, size_t) -> bool {
    bool ret = false;
    const std::lock_guard<std::mutex> lock(m_waitLock);
    if (m_BufferNumber[0] == 0){
        m_BufferNumber[0] = 1;
        ret = true;
    }else{
        m_BufferNumber[0] = 0;
        ret = true;
    }
    return ret;
}


auto CGenerator::start() -> void {}

auto CGenerator::stop() -> void {}

auto CGenerator::printReg() -> void {}
