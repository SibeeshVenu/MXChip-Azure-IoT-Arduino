//
// ELL header for module mfcc
//

#pragma once

#include <stdint.h>

#if defined(__cplusplus)
extern "C"
{
#endif // defined(__cplusplus)

#if !defined(SWIG)
//
// Types
//

#if !defined(ELL_TensorShape)
#define ELL_TensorShape

typedef struct TensorShape
{
    int32_t rows;
    int32_t columns;
    int32_t channels;
} TensorShape;

#endif // !defined(ELL_TensorShape)

#endif // !defined(SWIG)

//
// Functions
//

// Input size: 512
// Output size: 80
void mfcc_Filter(void* context, float* input0, float* output0);

void mfcc_Reset();

int32_t mfcc_GetInputSize(int32_t index);

int32_t mfcc_GetOutputSize(int32_t index);

int32_t mfcc_GetNumNodes();

void mfcc_GetInputShape(int32_t index, TensorShape* shape);

void mfcc_GetOutputShape(int32_t index, TensorShape* shape);

char* mfcc_GetMetadata(char* key);

#if defined(__cplusplus)
} // extern "C"
#endif // defined(__cplusplus)


#if !defined(MFCC_WRAPPER_DEFINED)
#define MFCC_WRAPPER_DEFINED

#if defined(__cplusplus)

#include <cstring> // memcpy
#include <vector>

#ifndef HIGH_RESOLUTION_TIMER
#define HIGH_RESOLUTION_TIMER
// This is a default implementation of HighResolutionTimer using C++ <chrono> library.  The
// GetMilliseconds function is used in the steppable version of the Predict method.  
// If your platform requires a different implementation then define HIGH_RESOLUTION_TIMER 
// before including this header.
#include <chrono>

class HighResolutionTimer
{
public:
    void Reset()
    {
        _started = false;
    }

    /// <summary> Return high precision number of seconds since first call to Predict. </summary>
    double GetMilliseconds() 
    {    
        if (!_started)
        {
            _start = std::chrono::high_resolution_clock::now();
            _started = true;
        }
        auto now = std::chrono::high_resolution_clock::now();
        auto us = std::chrono::duration_cast<std::chrono::microseconds>(now - _start);
        return static_cast<double>(us.count()) / 1000.0;
    }
private:
    std::chrono::high_resolution_clock::time_point _start;
    bool _started = false;
};
#endif

// This class wraps the "C" interface and provides handy virtual methods you can override to
// intercept any callbacks.  It also wraps the low level float buffers with std::vectors.
// This class can then be wrapped by SWIG which will give you an interface to work with from
// other languages (like Python) where you can easily override those virtual methods.
class MfccWrapper
{
public:
    MfccWrapper()
    {
        _output0.resize(GetOutputSize(0));

    }

    virtual ~MfccWrapper() = default;

    TensorShape GetInputShape(int index = 0) const
    {    
        TensorShape inputShape;
        mfcc_GetInputShape(index, &inputShape);
        return inputShape;
    }

    int GetInputSize(int index = 0) const
    {
        return mfcc_GetInputSize(index);
    }
    
    TensorShape GetOutputShape(int index = 0) const
    {
        TensorShape outputShape;
        mfcc_GetOutputShape(index, &outputShape);
        return outputShape;
    }

    int GetOutputSize(int index = 0) const
    {
        return mfcc_GetOutputSize(index);
    }
    
    void Reset()
    {
        mfcc_Reset();

    }

    bool IsSteppable() const 
    {
        return false;
    }

    const char* GetMetadata(const char* name) const
    {
        return mfcc_GetMetadata((char*)name);
    }

    std::vector<float>& Filter(std::vector<float>& input0)
    {
        mfcc_Filter(this, input0.data(), _output0.data());
        return _output0;
    }


private:
    std::vector<float> _output0;
      
};


#if !defined(MFCCWRAPPER_CDECLS)
#define MFCCWRAPPER_CDECLS

extern "C"
{

}

#endif // !defined(MFCCWRAPPER_CDECLS)
#endif // defined(__cplusplus)
#endif // !defined(MFCC_WRAPPER_DEFINED)
