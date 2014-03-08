# 1 "kernels.cudafe1.gpu"
# 1 "/home/wakim/desenv/proggpu_cuda/MatrixProcessor/Debug//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "kernels.cudafe1.gpu"
typedef char __nv_bool;
struct __type_info;struct __fundamental_type_info;
# 1292 "/usr/local/cuda-5.0/bin/../include/driver_types.h"
struct CUstream_st;
# 208 "/usr/include/libio.h" 3
enum __codecvt_result {
# 210 "/usr/include/libio.h" 3
__codecvt_ok,
# 211 "/usr/include/libio.h" 3
__codecvt_partial,
# 212 "/usr/include/libio.h" 3
__codecvt_error,
# 213 "/usr/include/libio.h" 3
__codecvt_noconv};
# 273 "/usr/include/libio.h" 3
struct _IO_FILE;
# 204 "/usr/include/math.h" 3
enum _ZUt_ {
# 205 "/usr/include/math.h" 3
FP_NAN,
# 207 "/usr/include/math.h" 3
FP_INFINITE,
# 209 "/usr/include/math.h" 3
FP_ZERO,
# 211 "/usr/include/math.h" 3
FP_SUBNORMAL,
# 213 "/usr/include/math.h" 3
FP_NORMAL};
# 297 "/usr/include/math.h" 3
enum _LIB_VERSION_TYPE {
# 298 "/usr/include/math.h" 3
_IEEE_ = (-1),
# 299 "/usr/include/math.h" 3
_SVID_,
# 300 "/usr/include/math.h" 3
_XOPEN_,
# 301 "/usr/include/math.h" 3
_POSIX_,
# 302 "/usr/include/math.h" 3
_ISOC_};
# 26 "../src/cuda/kernels.cu"
struct _Z18SumReduceOperationIiE;
# 35 "../src/cuda/kernels.cu"
struct _Z23DFISharedPositionSetterIiE;
# 44 "../src/cuda/kernels.cu"
struct _Z27DefaultSharedPositionSetterIiE;
# 16 "../src/cuda/kernels.cu"
struct _Z18MaxReduceOperationIiE;
# 53 "../src/cuda/kernels.cu"
struct _Z31NonCastNormalizeMatrixOperationIifE;
# 65 "../src/cuda/kernels.cu"
struct _Z28CastNormalizeMatrixOperationIifE;
# 53 "../src/cuda/kernels.cu"
struct _Z31NonCastNormalizeMatrixOperationIidE;
# 65 "../src/cuda/kernels.cu"
struct _Z28CastNormalizeMatrixOperationIidE;
# 61 "/usr/include/c++/4.6/exception" 3
struct _ZSt9exception;
# 56 "/usr/include/c++/4.6/new" 3
struct _ZSt9bad_alloc;
# 129 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
enum _ZNSt9__is_voidIvEUt_E {
# 129 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
_ZNSt9__is_voidIvE7__valueE = 1};
# 149 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
enum _ZNSt12__is_integerIbEUt_E {
# 149 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
_ZNSt12__is_integerIbE7__valueE = 1};
# 156 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
enum _ZNSt12__is_integerIcEUt_E {
# 156 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
_ZNSt12__is_integerIcE7__valueE = 1};
# 163 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
enum _ZNSt12__is_integerIaEUt_E {
# 163 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
_ZNSt12__is_integerIaE7__valueE = 1};
# 170 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
enum _ZNSt12__is_integerIhEUt_E {
# 170 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
_ZNSt12__is_integerIhE7__valueE = 1};
# 178 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
enum _ZNSt12__is_integerIwEUt_E {
# 178 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
_ZNSt12__is_integerIwE7__valueE = 1};
# 202 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
enum _ZNSt12__is_integerIsEUt_E {
# 202 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
_ZNSt12__is_integerIsE7__valueE = 1};
# 209 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
enum _ZNSt12__is_integerItEUt_E {
# 209 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
_ZNSt12__is_integerItE7__valueE = 1};
# 216 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
enum _ZNSt12__is_integerIiEUt_E {
# 216 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
_ZNSt12__is_integerIiE7__valueE = 1};
# 223 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
enum _ZNSt12__is_integerIjEUt_E {
# 223 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
_ZNSt12__is_integerIjE7__valueE = 1};
# 230 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
enum _ZNSt12__is_integerIlEUt_E {
# 230 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
_ZNSt12__is_integerIlE7__valueE = 1};
# 237 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
enum _ZNSt12__is_integerImEUt_E {
# 237 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
_ZNSt12__is_integerImE7__valueE = 1};
# 244 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
enum _ZNSt12__is_integerIxEUt_E {
# 244 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
_ZNSt12__is_integerIxE7__valueE = 1};
# 251 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
enum _ZNSt12__is_integerIyEUt_E {
# 251 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
_ZNSt12__is_integerIyE7__valueE = 1};
# 269 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
enum _ZNSt13__is_floatingIfEUt_E {
# 269 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
_ZNSt13__is_floatingIfE7__valueE = 1};
# 276 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
enum _ZNSt13__is_floatingIdEUt_E {
# 276 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
_ZNSt13__is_floatingIdE7__valueE = 1};
# 283 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
enum _ZNSt13__is_floatingIeEUt_E {
# 283 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
_ZNSt13__is_floatingIeE7__valueE = 1};
# 359 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
enum _ZNSt9__is_charIcEUt_E {
# 359 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
_ZNSt9__is_charIcE7__valueE = 1};
# 367 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
enum _ZNSt9__is_charIwEUt_E {
# 367 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
_ZNSt9__is_charIwE7__valueE = 1};
# 382 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
enum _ZNSt9__is_byteIcEUt_E {
# 382 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
_ZNSt9__is_byteIcE7__valueE = 1};
# 389 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
enum _ZNSt9__is_byteIaEUt_E {
# 389 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
_ZNSt9__is_byteIaE7__valueE = 1};
# 396 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
enum _ZNSt9__is_byteIhEUt_E {
# 396 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
_ZNSt9__is_byteIhE7__valueE = 1};
# 139 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
enum _ZNSt12__is_integerIeEUt_E {
# 139 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
_ZNSt12__is_integerIeE7__valueE};
# 139 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
enum _ZNSt12__is_integerIdEUt_E {
# 139 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
_ZNSt12__is_integerIdE7__valueE};
# 139 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
enum _ZNSt12__is_integerIfEUt_E {
# 139 "/usr/include/c++/4.6/bits/cpp_type_traits.h" 3
_ZNSt12__is_integerIfE7__valueE};
# 91 "/usr/include/c++/4.6/typeinfo" 3
struct _ZSt9type_info;
# 212 "/usr/lib/gcc/x86_64-linux-gnu/4.6/include/stddef.h" 3
typedef unsigned long size_t;
# 1 "/usr/local/cuda-5.0/bin/../include/crt/device_runtime.h" 1 3
# 38 "/usr/local/cuda-5.0/bin/../include/crt/device_runtime.h" 3
# 1 "/usr/local/cuda-5.0/bin/../include/host_defines.h" 1 3
# 39 "/usr/local/cuda-5.0/bin/../include/crt/device_runtime.h" 2 3





typedef __attribute__((device_builtin_texture_type)) unsigned long long __texture_type__;
typedef __attribute__((device_builtin_surface_type)) unsigned long long __surface_type__;
# 134 "/usr/local/cuda-5.0/bin/../include/crt/device_runtime.h" 3
extern __attribute__((device)) void* malloc(size_t);
extern __attribute__((device)) void free(void*);

extern __attribute__((device)) void __assertfail(
  const void *message,
  const void *file,
  unsigned int line,
  const void *function,
  size_t charsize);
# 173 "/usr/local/cuda-5.0/bin/../include/crt/device_runtime.h" 3
static __attribute__((device)) void __assert_fail(
  const char *__assertion,
  const char *__file,
  unsigned int __line,
  const char *__function)
{
  __assertfail(
    (const void *)__assertion,
    (const void *)__file,
                  __line,
    (const void *)__function,
    sizeof(char));
}
# 203 "/usr/local/cuda-5.0/bin/../include/crt/device_runtime.h" 3
# 1 "/usr/local/cuda-5.0/bin/../include/builtin_types.h" 1 3
# 56 "/usr/local/cuda-5.0/bin/../include/builtin_types.h" 3
# 1 "/usr/local/cuda-5.0/bin/../include/device_types.h" 1 3
# 53 "/usr/local/cuda-5.0/bin/../include/device_types.h" 3
# 1 "/usr/local/cuda-5.0/bin/../include/host_defines.h" 1 3
# 54 "/usr/local/cuda-5.0/bin/../include/device_types.h" 2 3







enum __attribute__((device_builtin)) cudaRoundMode
{
    cudaRoundNearest,
    cudaRoundZero,
    cudaRoundPosInf,
    cudaRoundMinInf
};
# 57 "/usr/local/cuda-5.0/bin/../include/builtin_types.h" 2 3
# 1 "/usr/local/cuda-5.0/bin/../include/driver_types.h" 1 3
# 123 "/usr/local/cuda-5.0/bin/../include/driver_types.h" 3
enum __attribute__((device_builtin)) cudaError
{





    cudaSuccess = 0,





    cudaErrorMissingConfiguration = 1,





    cudaErrorMemoryAllocation = 2,





    cudaErrorInitializationError = 3,
# 158 "/usr/local/cuda-5.0/bin/../include/driver_types.h" 3
    cudaErrorLaunchFailure = 4,
# 167 "/usr/local/cuda-5.0/bin/../include/driver_types.h" 3
    cudaErrorPriorLaunchFailure = 5,
# 177 "/usr/local/cuda-5.0/bin/../include/driver_types.h" 3
    cudaErrorLaunchTimeout = 6,
# 186 "/usr/local/cuda-5.0/bin/../include/driver_types.h" 3
    cudaErrorLaunchOutOfResources = 7,





    cudaErrorInvalidDeviceFunction = 8,
# 201 "/usr/local/cuda-5.0/bin/../include/driver_types.h" 3
    cudaErrorInvalidConfiguration = 9,





    cudaErrorInvalidDevice = 10,





    cudaErrorInvalidValue = 11,





    cudaErrorInvalidPitchValue = 12,





    cudaErrorInvalidSymbol = 13,




    cudaErrorMapBufferObjectFailed = 14,




    cudaErrorUnmapBufferObjectFailed = 15,





    cudaErrorInvalidHostPointer = 16,





    cudaErrorInvalidDevicePointer = 17,





    cudaErrorInvalidTexture = 18,





    cudaErrorInvalidTextureBinding = 19,






    cudaErrorInvalidChannelDescriptor = 20,





    cudaErrorInvalidMemcpyDirection = 21,
# 282 "/usr/local/cuda-5.0/bin/../include/driver_types.h" 3
    cudaErrorAddressOfConstant = 22,
# 291 "/usr/local/cuda-5.0/bin/../include/driver_types.h" 3
    cudaErrorTextureFetchFailed = 23,
# 300 "/usr/local/cuda-5.0/bin/../include/driver_types.h" 3
    cudaErrorTextureNotBound = 24,
# 309 "/usr/local/cuda-5.0/bin/../include/driver_types.h" 3
    cudaErrorSynchronizationError = 25,





    cudaErrorInvalidFilterSetting = 26,





    cudaErrorInvalidNormSetting = 27,







    cudaErrorMixedDeviceExecution = 28,






    cudaErrorCudartUnloading = 29,




    cudaErrorUnknown = 30,







    cudaErrorNotYetImplemented = 31,
# 358 "/usr/local/cuda-5.0/bin/../include/driver_types.h" 3
    cudaErrorMemoryValueTooLarge = 32,






    cudaErrorInvalidResourceHandle = 33,







    cudaErrorNotReady = 34,






    cudaErrorInsufficientDriver = 35,
# 393 "/usr/local/cuda-5.0/bin/../include/driver_types.h" 3
    cudaErrorSetOnActiveProcess = 36,





    cudaErrorInvalidSurface = 37,





    cudaErrorNoDevice = 38,





    cudaErrorECCUncorrectable = 39,




    cudaErrorSharedObjectSymbolNotFound = 40,




    cudaErrorSharedObjectInitFailed = 41,





    cudaErrorUnsupportedLimit = 42,





    cudaErrorDuplicateVariableName = 43,





    cudaErrorDuplicateTextureName = 44,





    cudaErrorDuplicateSurfaceName = 45,
# 455 "/usr/local/cuda-5.0/bin/../include/driver_types.h" 3
    cudaErrorDevicesUnavailable = 46,




    cudaErrorInvalidKernelImage = 47,







    cudaErrorNoKernelImageForDevice = 48,
# 481 "/usr/local/cuda-5.0/bin/../include/driver_types.h" 3
    cudaErrorIncompatibleDriverContext = 49,






    cudaErrorPeerAccessAlreadyEnabled = 50,






    cudaErrorPeerAccessNotEnabled = 51,





    cudaErrorDeviceAlreadyInUse = 54,






    cudaErrorProfilerDisabled = 55,







    cudaErrorProfilerNotInitialized = 56,






    cudaErrorProfilerAlreadyStarted = 57,






     cudaErrorProfilerAlreadyStopped = 58,







    cudaErrorAssert = 59,






    cudaErrorTooManyPeers = 60,





    cudaErrorHostMemoryAlreadyRegistered = 61,





    cudaErrorHostMemoryNotRegistered = 62,




    cudaErrorOperatingSystem = 63,





    cudaErrorPeerAccessUnsupported = 64,






    cudaErrorLaunchMaxDepthExceeded = 65,







    cudaErrorLaunchFileScopedTex = 66,







    cudaErrorLaunchFileScopedSurf = 67,
# 606 "/usr/local/cuda-5.0/bin/../include/driver_types.h" 3
    cudaErrorSyncDepthExceeded = 68,
# 618 "/usr/local/cuda-5.0/bin/../include/driver_types.h" 3
    cudaErrorLaunchPendingCountExceeded = 69,




    cudaErrorNotPermitted = 70,





    cudaErrorNotSupported = 71,




    cudaErrorStartupFailure = 0x7f,







    cudaErrorApiFailureBase = 10000
};




enum __attribute__((device_builtin)) cudaChannelFormatKind
{
    cudaChannelFormatKindSigned = 0,
    cudaChannelFormatKindUnsigned = 1,
    cudaChannelFormatKindFloat = 2,
    cudaChannelFormatKindNone = 3
};




struct __attribute__((device_builtin)) cudaChannelFormatDesc
{
    int x;
    int y;
    int z;
    int w;
    enum cudaChannelFormatKind f;
};




typedef struct cudaArray *cudaArray_t;




typedef const struct cudaArray *cudaArray_const_t;

struct cudaArray;




typedef struct cudaMipmappedArray *cudaMipmappedArray_t;




typedef const struct cudaMipmappedArray *cudaMipmappedArray_const_t;

struct cudaMipmappedArray;




enum __attribute__((device_builtin)) cudaMemoryType
{
    cudaMemoryTypeHost = 1,
    cudaMemoryTypeDevice = 2
};




enum __attribute__((device_builtin)) cudaMemcpyKind
{
    cudaMemcpyHostToHost = 0,
    cudaMemcpyHostToDevice = 1,
    cudaMemcpyDeviceToHost = 2,
    cudaMemcpyDeviceToDevice = 3,
    cudaMemcpyDefault = 4
};





struct __attribute__((device_builtin)) cudaPitchedPtr
{
    void *ptr;
    size_t pitch;
    size_t xsize;
    size_t ysize;
};





struct __attribute__((device_builtin)) cudaExtent
{
    size_t width;
    size_t height;
    size_t depth;
};





struct __attribute__((device_builtin)) cudaPos
{
    size_t x;
    size_t y;
    size_t z;
};




struct __attribute__((device_builtin)) cudaMemcpy3DParms
{
    cudaArray_t srcArray;
    struct cudaPos srcPos;
    struct cudaPitchedPtr srcPtr;

    cudaArray_t dstArray;
    struct cudaPos dstPos;
    struct cudaPitchedPtr dstPtr;

    struct cudaExtent extent;
    enum cudaMemcpyKind kind;
};




struct __attribute__((device_builtin)) cudaMemcpy3DPeerParms
{
    cudaArray_t srcArray;
    struct cudaPos srcPos;
    struct cudaPitchedPtr srcPtr;
    int srcDevice;

    cudaArray_t dstArray;
    struct cudaPos dstPos;
    struct cudaPitchedPtr dstPtr;
    int dstDevice;

    struct cudaExtent extent;
};




struct cudaGraphicsResource;




enum __attribute__((device_builtin)) cudaGraphicsRegisterFlags
{
    cudaGraphicsRegisterFlagsNone = 0,
    cudaGraphicsRegisterFlagsReadOnly = 1,
    cudaGraphicsRegisterFlagsWriteDiscard = 2,
    cudaGraphicsRegisterFlagsSurfaceLoadStore = 4,
    cudaGraphicsRegisterFlagsTextureGather = 8
};




enum __attribute__((device_builtin)) cudaGraphicsMapFlags
{
    cudaGraphicsMapFlagsNone = 0,
    cudaGraphicsMapFlagsReadOnly = 1,
    cudaGraphicsMapFlagsWriteDiscard = 2
};




enum __attribute__((device_builtin)) cudaGraphicsCubeFace
{
    cudaGraphicsCubeFacePositiveX = 0x00,
    cudaGraphicsCubeFaceNegativeX = 0x01,
    cudaGraphicsCubeFacePositiveY = 0x02,
    cudaGraphicsCubeFaceNegativeY = 0x03,
    cudaGraphicsCubeFacePositiveZ = 0x04,
    cudaGraphicsCubeFaceNegativeZ = 0x05
};




enum __attribute__((device_builtin)) cudaResourceType
{
    cudaResourceTypeArray = 0x00,
    cudaResourceTypeMipmappedArray = 0x01,
    cudaResourceTypeLinear = 0x02,
    cudaResourceTypePitch2D = 0x03
};




enum __attribute__((device_builtin)) cudaResourceViewFormat
{
    cudaResViewFormatNone = 0x00,
    cudaResViewFormatUnsignedChar1 = 0x01,
    cudaResViewFormatUnsignedChar2 = 0x02,
    cudaResViewFormatUnsignedChar4 = 0x03,
    cudaResViewFormatSignedChar1 = 0x04,
    cudaResViewFormatSignedChar2 = 0x05,
    cudaResViewFormatSignedChar4 = 0x06,
    cudaResViewFormatUnsignedShort1 = 0x07,
    cudaResViewFormatUnsignedShort2 = 0x08,
    cudaResViewFormatUnsignedShort4 = 0x09,
    cudaResViewFormatSignedShort1 = 0x0a,
    cudaResViewFormatSignedShort2 = 0x0b,
    cudaResViewFormatSignedShort4 = 0x0c,
    cudaResViewFormatUnsignedInt1 = 0x0d,
    cudaResViewFormatUnsignedInt2 = 0x0e,
    cudaResViewFormatUnsignedInt4 = 0x0f,
    cudaResViewFormatSignedInt1 = 0x10,
    cudaResViewFormatSignedInt2 = 0x11,
    cudaResViewFormatSignedInt4 = 0x12,
    cudaResViewFormatHalf1 = 0x13,
    cudaResViewFormatHalf2 = 0x14,
    cudaResViewFormatHalf4 = 0x15,
    cudaResViewFormatFloat1 = 0x16,
    cudaResViewFormatFloat2 = 0x17,
    cudaResViewFormatFloat4 = 0x18,
    cudaResViewFormatUnsignedBlockCompressed1 = 0x19,
    cudaResViewFormatUnsignedBlockCompressed2 = 0x1a,
    cudaResViewFormatUnsignedBlockCompressed3 = 0x1b,
    cudaResViewFormatUnsignedBlockCompressed4 = 0x1c,
    cudaResViewFormatSignedBlockCompressed4 = 0x1d,
    cudaResViewFormatUnsignedBlockCompressed5 = 0x1e,
    cudaResViewFormatSignedBlockCompressed5 = 0x1f,
    cudaResViewFormatUnsignedBlockCompressed6H = 0x20,
    cudaResViewFormatSignedBlockCompressed6H = 0x21,
    cudaResViewFormatUnsignedBlockCompressed7 = 0x22
};




struct __attribute__((device_builtin)) cudaResourceDesc {
 enum cudaResourceType resType;

 union {
  struct {
   cudaArray_t array;
  } array;
        struct {
            cudaMipmappedArray_t mipmap;
        } mipmap;
  struct {
   void *devPtr;
   struct cudaChannelFormatDesc desc;
   size_t sizeInBytes;
  } linear;
  struct {
   void *devPtr;
   struct cudaChannelFormatDesc desc;
   size_t width;
   size_t height;
   size_t pitchInBytes;
  } pitch2D;
 } res;
};




struct __attribute__((device_builtin)) cudaResourceViewDesc
{
    enum cudaResourceViewFormat format;
    size_t width;
    size_t height;
    size_t depth;
    unsigned int firstMipmapLevel;
    unsigned int lastMipmapLevel;
    unsigned int firstLayer;
    unsigned int lastLayer;
};




struct __attribute__((device_builtin)) cudaPointerAttributes
{




    enum cudaMemoryType memoryType;
# 938 "/usr/local/cuda-5.0/bin/../include/driver_types.h" 3
    int device;





    void *devicePointer;





    void *hostPointer;
};




struct __attribute__((device_builtin)) cudaFuncAttributes
{





   size_t sharedSizeBytes;





   size_t constSizeBytes;




   size_t localSizeBytes;






   int maxThreadsPerBlock;




   int numRegs;






   int ptxVersion;






   int binaryVersion;
};




enum __attribute__((device_builtin)) cudaFuncCache
{
    cudaFuncCachePreferNone = 0,
    cudaFuncCachePreferShared = 1,
    cudaFuncCachePreferL1 = 2,
    cudaFuncCachePreferEqual = 3
};





enum __attribute__((device_builtin)) cudaSharedMemConfig
{
    cudaSharedMemBankSizeDefault = 0,
    cudaSharedMemBankSizeFourByte = 1,
    cudaSharedMemBankSizeEightByte = 2
};




enum __attribute__((device_builtin)) cudaComputeMode
{
    cudaComputeModeDefault = 0,
    cudaComputeModeExclusive = 1,
    cudaComputeModeProhibited = 2,
    cudaComputeModeExclusiveProcess = 3
};




enum __attribute__((device_builtin)) cudaLimit
{
    cudaLimitStackSize = 0x00,
    cudaLimitPrintfFifoSize = 0x01,
    cudaLimitMallocHeapSize = 0x02,
    cudaLimitDevRuntimeSyncDepth = 0x03,
    cudaLimitDevRuntimePendingLaunchCount = 0x04
};




enum __attribute__((device_builtin)) cudaOutputMode
{
    cudaKeyValuePair = 0x00,
    cudaCSV = 0x01
};




enum __attribute__((device_builtin)) cudaDeviceAttr
{
    cudaDevAttrMaxThreadsPerBlock = 1,
    cudaDevAttrMaxBlockDimX = 2,
    cudaDevAttrMaxBlockDimY = 3,
    cudaDevAttrMaxBlockDimZ = 4,
    cudaDevAttrMaxGridDimX = 5,
    cudaDevAttrMaxGridDimY = 6,
    cudaDevAttrMaxGridDimZ = 7,
    cudaDevAttrMaxSharedMemoryPerBlock = 8,
    cudaDevAttrTotalConstantMemory = 9,
    cudaDevAttrWarpSize = 10,
    cudaDevAttrMaxPitch = 11,
    cudaDevAttrMaxRegistersPerBlock = 12,
    cudaDevAttrClockRate = 13,
    cudaDevAttrTextureAlignment = 14,
    cudaDevAttrGpuOverlap = 15,
    cudaDevAttrMultiProcessorCount = 16,
    cudaDevAttrKernelExecTimeout = 17,
    cudaDevAttrIntegrated = 18,
    cudaDevAttrCanMapHostMemory = 19,
    cudaDevAttrComputeMode = 20,
    cudaDevAttrMaxTexture1DWidth = 21,
    cudaDevAttrMaxTexture2DWidth = 22,
    cudaDevAttrMaxTexture2DHeight = 23,
    cudaDevAttrMaxTexture3DWidth = 24,
    cudaDevAttrMaxTexture3DHeight = 25,
    cudaDevAttrMaxTexture3DDepth = 26,
    cudaDevAttrMaxTexture2DLayeredWidth = 27,
    cudaDevAttrMaxTexture2DLayeredHeight = 28,
    cudaDevAttrMaxTexture2DLayeredLayers = 29,
    cudaDevAttrSurfaceAlignment = 30,
    cudaDevAttrConcurrentKernels = 31,
    cudaDevAttrEccEnabled = 32,
    cudaDevAttrPciBusId = 33,
    cudaDevAttrPciDeviceId = 34,
    cudaDevAttrTccDriver = 35,
    cudaDevAttrMemoryClockRate = 36,
    cudaDevAttrGlobalMemoryBusWidth = 37,
    cudaDevAttrL2CacheSize = 38,
    cudaDevAttrMaxThreadsPerMultiProcessor = 39,
    cudaDevAttrAsyncEngineCount = 40,
    cudaDevAttrUnifiedAddressing = 41,
    cudaDevAttrMaxTexture1DLayeredWidth = 42,
    cudaDevAttrMaxTexture1DLayeredLayers = 43,
    cudaDevAttrMaxTexture2DGatherWidth = 45,
    cudaDevAttrMaxTexture2DGatherHeight = 46,
    cudaDevAttrMaxTexture3DWidthAlt = 47,
    cudaDevAttrMaxTexture3DHeightAlt = 48,
    cudaDevAttrMaxTexture3DDepthAlt = 49,
    cudaDevAttrPciDomainId = 50,
    cudaDevAttrTexturePitchAlignment = 51,
    cudaDevAttrMaxTextureCubemapWidth = 52,
    cudaDevAttrMaxTextureCubemapLayeredWidth = 53,
    cudaDevAttrMaxTextureCubemapLayeredLayers = 54,
    cudaDevAttrMaxSurface1DWidth = 55,
    cudaDevAttrMaxSurface2DWidth = 56,
    cudaDevAttrMaxSurface2DHeight = 57,
    cudaDevAttrMaxSurface3DWidth = 58,
    cudaDevAttrMaxSurface3DHeight = 59,
    cudaDevAttrMaxSurface3DDepth = 60,
    cudaDevAttrMaxSurface1DLayeredWidth = 61,
    cudaDevAttrMaxSurface1DLayeredLayers = 62,
    cudaDevAttrMaxSurface2DLayeredWidth = 63,
    cudaDevAttrMaxSurface2DLayeredHeight = 64,
    cudaDevAttrMaxSurface2DLayeredLayers = 65,
    cudaDevAttrMaxSurfaceCubemapWidth = 66,
    cudaDevAttrMaxSurfaceCubemapLayeredWidth = 67,
    cudaDevAttrMaxSurfaceCubemapLayeredLayers = 68,
    cudaDevAttrMaxTexture1DLinearWidth = 69,
    cudaDevAttrMaxTexture2DLinearWidth = 70,
    cudaDevAttrMaxTexture2DLinearHeight = 71,
    cudaDevAttrMaxTexture2DLinearPitch = 72,
    cudaDevAttrMaxTexture2DMipmappedWidth = 73,
    cudaDevAttrMaxTexture2DMipmappedHeight = 74,
    cudaDevAttrComputeCapabilityMajor = 75,
    cudaDevAttrComputeCapabilityMinor = 76,
    cudaDevAttrMaxTexture1DMipmappedWidth = 77
};




struct __attribute__((device_builtin)) cudaDeviceProp
{
    char name[256];
    size_t totalGlobalMem;
    size_t sharedMemPerBlock;
    int regsPerBlock;
    int warpSize;
    size_t memPitch;
    int maxThreadsPerBlock;
    int maxThreadsDim[3];
    int maxGridSize[3];
    int clockRate;
    size_t totalConstMem;
    int major;
    int minor;
    size_t textureAlignment;
    size_t texturePitchAlignment;
    int deviceOverlap;
    int multiProcessorCount;
    int kernelExecTimeoutEnabled;
    int integrated;
    int canMapHostMemory;
    int computeMode;
    int maxTexture1D;
    int maxTexture1DMipmap;
    int maxTexture1DLinear;
    int maxTexture2D[2];
    int maxTexture2DMipmap[2];
    int maxTexture2DLinear[3];
    int maxTexture2DGather[2];
    int maxTexture3D[3];
    int maxTextureCubemap;
    int maxTexture1DLayered[2];
    int maxTexture2DLayered[3];
    int maxTextureCubemapLayered[2];
    int maxSurface1D;
    int maxSurface2D[2];
    int maxSurface3D[3];
    int maxSurface1DLayered[2];
    int maxSurface2DLayered[3];
    int maxSurfaceCubemap;
    int maxSurfaceCubemapLayered[2];
    size_t surfaceAlignment;
    int concurrentKernels;
    int ECCEnabled;
    int pciBusID;
    int pciDeviceID;
    int pciDomainID;
    int tccDriver;
    int asyncEngineCount;
    int unifiedAddressing;
    int memoryClockRate;
    int memoryBusWidth;
    int l2CacheSize;
    int maxThreadsPerMultiProcessor;
};
# 1265 "/usr/local/cuda-5.0/bin/../include/driver_types.h" 3
typedef __attribute__((device_builtin)) struct __attribute__((device_builtin)) cudaIpcEventHandle_st
{
    char reserved[64];
}cudaIpcEventHandle_t;




typedef __attribute__((device_builtin)) struct __attribute__((device_builtin)) cudaIpcMemHandle_st
{
    char reserved[64];
}cudaIpcMemHandle_t;
# 1287 "/usr/local/cuda-5.0/bin/../include/driver_types.h" 3
typedef __attribute__((device_builtin)) enum cudaError cudaError_t;




typedef __attribute__((device_builtin)) struct CUstream_st *cudaStream_t;




typedef __attribute__((device_builtin)) struct CUevent_st *cudaEvent_t;




typedef __attribute__((device_builtin)) struct cudaGraphicsResource *cudaGraphicsResource_t;




typedef __attribute__((device_builtin)) struct CUuuid_st cudaUUID_t;




typedef __attribute__((device_builtin)) enum cudaOutputMode cudaOutputMode_t;
# 58 "/usr/local/cuda-5.0/bin/../include/builtin_types.h" 2 3
# 1 "/usr/local/cuda-5.0/bin/../include/surface_types.h" 1 3
# 84 "/usr/local/cuda-5.0/bin/../include/surface_types.h" 3
enum __attribute__((device_builtin)) cudaSurfaceBoundaryMode
{
    cudaBoundaryModeZero = 0,
    cudaBoundaryModeClamp = 1,
    cudaBoundaryModeTrap = 2
};




enum __attribute__((device_builtin)) cudaSurfaceFormatMode
{
    cudaFormatModeForced = 0,
    cudaFormatModeAuto = 1
};




struct __attribute__((device_builtin)) surfaceReference
{



    struct cudaChannelFormatDesc channelDesc;
};




typedef __attribute__((device_builtin)) unsigned long long cudaSurfaceObject_t;
# 59 "/usr/local/cuda-5.0/bin/../include/builtin_types.h" 2 3
# 1 "/usr/local/cuda-5.0/bin/../include/texture_types.h" 1 3
# 84 "/usr/local/cuda-5.0/bin/../include/texture_types.h" 3
enum __attribute__((device_builtin)) cudaTextureAddressMode
{
    cudaAddressModeWrap = 0,
    cudaAddressModeClamp = 1,
    cudaAddressModeMirror = 2,
    cudaAddressModeBorder = 3
};




enum __attribute__((device_builtin)) cudaTextureFilterMode
{
    cudaFilterModePoint = 0,
    cudaFilterModeLinear = 1
};




enum __attribute__((device_builtin)) cudaTextureReadMode
{
    cudaReadModeElementType = 0,
    cudaReadModeNormalizedFloat = 1
};




struct __attribute__((device_builtin)) textureReference
{



    int normalized;



    enum cudaTextureFilterMode filterMode;



    enum cudaTextureAddressMode addressMode[3];



    struct cudaChannelFormatDesc channelDesc;



    int sRGB;



    unsigned int maxAnisotropy;



    enum cudaTextureFilterMode mipmapFilterMode;



    float mipmapLevelBias;



    float minMipmapLevelClamp;



    float maxMipmapLevelClamp;
    int __cudaReserved[15];
};




struct __attribute__((device_builtin)) cudaTextureDesc
{



    enum cudaTextureAddressMode addressMode[3];



    enum cudaTextureFilterMode filterMode;



    enum cudaTextureReadMode readMode;



    int sRGB;



    int normalizedCoords;



    unsigned int maxAnisotropy;



    enum cudaTextureFilterMode mipmapFilterMode;



    float mipmapLevelBias;



    float minMipmapLevelClamp;



    float maxMipmapLevelClamp;
};




typedef __attribute__((device_builtin)) unsigned long long cudaTextureObject_t;
# 60 "/usr/local/cuda-5.0/bin/../include/builtin_types.h" 2 3
# 1 "/usr/local/cuda-5.0/bin/../include/vector_types.h" 1 3
# 59 "/usr/local/cuda-5.0/bin/../include/vector_types.h" 3
# 1 "/usr/local/cuda-5.0/bin/../include/builtin_types.h" 1 3
# 60 "/usr/local/cuda-5.0/bin/../include/builtin_types.h" 3
# 1 "/usr/local/cuda-5.0/bin/../include/vector_types.h" 1 3
# 60 "/usr/local/cuda-5.0/bin/../include/builtin_types.h" 2 3
# 60 "/usr/local/cuda-5.0/bin/../include/vector_types.h" 2 3
# 94 "/usr/local/cuda-5.0/bin/../include/vector_types.h" 3
struct __attribute__((device_builtin)) char1
{
    signed char x;
};

struct __attribute__((device_builtin)) uchar1
{
    unsigned char x;
};


struct __attribute__((device_builtin)) __attribute__((aligned(2))) char2
{
    signed char x, y;
};

struct __attribute__((device_builtin)) __attribute__((aligned(2))) uchar2
{
    unsigned char x, y;
};

struct __attribute__((device_builtin)) char3
{
    signed char x, y, z;
};

struct __attribute__((device_builtin)) uchar3
{
    unsigned char x, y, z;
};

struct __attribute__((device_builtin)) __attribute__((aligned(4))) char4
{
    signed char x, y, z, w;
};

struct __attribute__((device_builtin)) __attribute__((aligned(4))) uchar4
{
    unsigned char x, y, z, w;
};

struct __attribute__((device_builtin)) short1
{
    short x;
};

struct __attribute__((device_builtin)) ushort1
{
    unsigned short x;
};

struct __attribute__((device_builtin)) __attribute__((aligned(4))) short2
{
    short x, y;
};

struct __attribute__((device_builtin)) __attribute__((aligned(4))) ushort2
{
    unsigned short x, y;
};

struct __attribute__((device_builtin)) short3
{
    short x, y, z;
};

struct __attribute__((device_builtin)) ushort3
{
    unsigned short x, y, z;
};

struct __attribute__((device_builtin)) __attribute__((aligned(8))) short4 { short x; short y; short z; short w; };
struct __attribute__((device_builtin)) __attribute__((aligned(8))) ushort4 { unsigned short x; unsigned short y; unsigned short z; unsigned short w; };

struct __attribute__((device_builtin)) int1
{
    int x;
};

struct __attribute__((device_builtin)) uint1
{
    unsigned int x;
};

struct __attribute__((device_builtin)) __attribute__((aligned(8))) int2 { int x; int y; };
struct __attribute__((device_builtin)) __attribute__((aligned(8))) uint2 { unsigned int x; unsigned int y; };

struct __attribute__((device_builtin)) int3
{
    int x, y, z;
};

struct __attribute__((device_builtin)) uint3
{
    unsigned int x, y, z;
};

struct __attribute__((device_builtin)) __attribute__((aligned(16))) int4
{
    int x, y, z, w;
};

struct __attribute__((device_builtin)) __attribute__((aligned(16))) uint4
{
    unsigned int x, y, z, w;
};

struct __attribute__((device_builtin)) long1
{
    long int x;
};

struct __attribute__((device_builtin)) ulong1
{
    unsigned long x;
};






struct __attribute__((device_builtin)) __attribute__((aligned(2*sizeof(long int)))) long2
{
    long int x, y;
};

struct __attribute__((device_builtin)) __attribute__((aligned(2*sizeof(unsigned long int)))) ulong2
{
    unsigned long int x, y;
};



struct __attribute__((device_builtin)) long3
{
    long int x, y, z;
};

struct __attribute__((device_builtin)) ulong3
{
    unsigned long int x, y, z;
};

struct __attribute__((device_builtin)) __attribute__((aligned(16))) long4
{
    long int x, y, z, w;
};

struct __attribute__((device_builtin)) __attribute__((aligned(16))) ulong4
{
    unsigned long int x, y, z, w;
};

struct __attribute__((device_builtin)) float1
{
    float x;
};

struct __attribute__((device_builtin)) __attribute__((aligned(8))) float2 { float x; float y; };

struct __attribute__((device_builtin)) float3
{
    float x, y, z;
};

struct __attribute__((device_builtin)) __attribute__((aligned(16))) float4
{
    float x, y, z, w;
};

struct __attribute__((device_builtin)) longlong1
{
    long long int x;
};

struct __attribute__((device_builtin)) ulonglong1
{
    unsigned long long int x;
};

struct __attribute__((device_builtin)) __attribute__((aligned(16))) longlong2
{
    long long int x, y;
};

struct __attribute__((device_builtin)) __attribute__((aligned(16))) ulonglong2
{
    unsigned long long int x, y;
};

struct __attribute__((device_builtin)) longlong3
{
    long long int x, y, z;
};

struct __attribute__((device_builtin)) ulonglong3
{
    unsigned long long int x, y, z;
};

struct __attribute__((device_builtin)) __attribute__((aligned(16))) longlong4
{
    long long int x, y, z ,w;
};

struct __attribute__((device_builtin)) __attribute__((aligned(16))) ulonglong4
{
    unsigned long long int x, y, z, w;
};

struct __attribute__((device_builtin)) double1
{
    double x;
};

struct __attribute__((device_builtin)) __attribute__((aligned(16))) double2
{
    double x, y;
};

struct __attribute__((device_builtin)) double3
{
    double x, y, z;
};

struct __attribute__((device_builtin)) __attribute__((aligned(16))) double4
{
    double x, y, z, w;
};
# 338 "/usr/local/cuda-5.0/bin/../include/vector_types.h" 3
typedef __attribute__((device_builtin)) struct char1 char1;
typedef __attribute__((device_builtin)) struct uchar1 uchar1;
typedef __attribute__((device_builtin)) struct char2 char2;
typedef __attribute__((device_builtin)) struct uchar2 uchar2;
typedef __attribute__((device_builtin)) struct char3 char3;
typedef __attribute__((device_builtin)) struct uchar3 uchar3;
typedef __attribute__((device_builtin)) struct char4 char4;
typedef __attribute__((device_builtin)) struct uchar4 uchar4;
typedef __attribute__((device_builtin)) struct short1 short1;
typedef __attribute__((device_builtin)) struct ushort1 ushort1;
typedef __attribute__((device_builtin)) struct short2 short2;
typedef __attribute__((device_builtin)) struct ushort2 ushort2;
typedef __attribute__((device_builtin)) struct short3 short3;
typedef __attribute__((device_builtin)) struct ushort3 ushort3;
typedef __attribute__((device_builtin)) struct short4 short4;
typedef __attribute__((device_builtin)) struct ushort4 ushort4;
typedef __attribute__((device_builtin)) struct int1 int1;
typedef __attribute__((device_builtin)) struct uint1 uint1;
typedef __attribute__((device_builtin)) struct int2 int2;
typedef __attribute__((device_builtin)) struct uint2 uint2;
typedef __attribute__((device_builtin)) struct int3 int3;
typedef __attribute__((device_builtin)) struct uint3 uint3;
typedef __attribute__((device_builtin)) struct int4 int4;
typedef __attribute__((device_builtin)) struct uint4 uint4;
typedef __attribute__((device_builtin)) struct long1 long1;
typedef __attribute__((device_builtin)) struct ulong1 ulong1;
typedef __attribute__((device_builtin)) struct long2 long2;
typedef __attribute__((device_builtin)) struct ulong2 ulong2;
typedef __attribute__((device_builtin)) struct long3 long3;
typedef __attribute__((device_builtin)) struct ulong3 ulong3;
typedef __attribute__((device_builtin)) struct long4 long4;
typedef __attribute__((device_builtin)) struct ulong4 ulong4;
typedef __attribute__((device_builtin)) struct float1 float1;
typedef __attribute__((device_builtin)) struct float2 float2;
typedef __attribute__((device_builtin)) struct float3 float3;
typedef __attribute__((device_builtin)) struct float4 float4;
typedef __attribute__((device_builtin)) struct longlong1 longlong1;
typedef __attribute__((device_builtin)) struct ulonglong1 ulonglong1;
typedef __attribute__((device_builtin)) struct longlong2 longlong2;
typedef __attribute__((device_builtin)) struct ulonglong2 ulonglong2;
typedef __attribute__((device_builtin)) struct longlong3 longlong3;
typedef __attribute__((device_builtin)) struct ulonglong3 ulonglong3;
typedef __attribute__((device_builtin)) struct longlong4 longlong4;
typedef __attribute__((device_builtin)) struct ulonglong4 ulonglong4;
typedef __attribute__((device_builtin)) struct double1 double1;
typedef __attribute__((device_builtin)) struct double2 double2;
typedef __attribute__((device_builtin)) struct double3 double3;
typedef __attribute__((device_builtin)) struct double4 double4;







struct __attribute__((device_builtin)) dim3
{
    unsigned int x, y, z;





};

typedef __attribute__((device_builtin)) struct dim3 dim3;
# 60 "/usr/local/cuda-5.0/bin/../include/builtin_types.h" 2 3
# 204 "/usr/local/cuda-5.0/bin/../include/crt/device_runtime.h" 2 3
# 1 "/usr/local/cuda-5.0/bin/../include/device_launch_parameters.h" 1 3
# 66 "/usr/local/cuda-5.0/bin/../include/device_launch_parameters.h" 3
uint3 __attribute__((device_builtin)) extern const threadIdx;
uint3 __attribute__((device_builtin)) extern const blockIdx;
dim3 __attribute__((device_builtin)) extern const blockDim;
dim3 __attribute__((device_builtin)) extern const gridDim;
int __attribute__((device_builtin)) extern const warpSize;
# 205 "/usr/local/cuda-5.0/bin/../include/crt/device_runtime.h" 2 3
# 1 "/usr/local/cuda-5.0/bin/../include/crt/storage_class.h" 1 3
# 205 "/usr/local/cuda-5.0/bin/../include/crt/device_runtime.h" 2 3
# 214 "/usr/lib/gcc/x86_64-linux-gnu/4.6/include/stddef.h" 2 3
struct __type_info { const long *__vptr; const char *__name;}; struct __fundamental_type_info { struct __type_info base;};
# 49 "/usr/include/stdio.h" 3
typedef struct _IO_FILE FILE;
# 26 "../src/cuda/kernels.cu"
struct _Z18SumReduceOperationIiE {char __nv_no_debug_dummy_end_padding_0;};
# 35 "../src/cuda/kernels.cu"
struct _Z23DFISharedPositionSetterIiE {char __nv_no_debug_dummy_end_padding_0;};
# 44 "../src/cuda/kernels.cu"
struct _Z27DefaultSharedPositionSetterIiE {char __nv_no_debug_dummy_end_padding_0;};
# 16 "../src/cuda/kernels.cu"
struct _Z18MaxReduceOperationIiE {char __nv_no_debug_dummy_end_padding_0;};
# 53 "../src/cuda/kernels.cu"
struct _Z31NonCastNormalizeMatrixOperationIifE {char __nv_no_debug_dummy_end_padding_0;};
# 65 "../src/cuda/kernels.cu"
struct _Z28CastNormalizeMatrixOperationIifE {char __nv_no_debug_dummy_end_padding_0;};
# 53 "../src/cuda/kernels.cu"
struct _Z31NonCastNormalizeMatrixOperationIidE {char __nv_no_debug_dummy_end_padding_0;};
# 65 "../src/cuda/kernels.cu"
struct _Z28CastNormalizeMatrixOperationIidE {char __nv_no_debug_dummy_end_padding_0;};
# 155 "/usr/include/c++/4.6/x86_64-linux-gnu/./bits/c++config.h" 3
typedef unsigned long _ZSt6size_t;
# 61 "/usr/include/c++/4.6/exception" 3
struct _ZSt9exception { const long *__vptr;};
# 56 "/usr/include/c++/4.6/new" 3
struct _ZSt9bad_alloc { struct _ZSt9exception __b_St9exception;};
# 91 "/usr/include/c++/4.6/typeinfo" 3
struct _ZSt9type_info { const long *__vptr;
# 174 "/usr/include/c++/4.6/typeinfo" 3
const char *__name;};
# 140 "/usr/local/cuda-5.0/bin/../include/common_functions.h"
extern __attribute__((device)) __attribute__((visibility("default"))) void free(void *);
# 139 "/usr/local/cuda-5.0/bin/../include/common_functions.h"
extern __attribute__((device)) __attribute__((visibility("default"))) void *malloc(_ZSt6size_t);
# 102 "/usr/local/cuda-5.0/bin/../include/common_functions.h"
 __attribute__((device_builtin)) extern __attribute__((device)) int fprintf(FILE *__restrict__, const char *__restrict__, ...);
# 101 "/usr/local/cuda-5.0/bin/../include/common_functions.h"
 __attribute__((device_builtin)) extern __attribute__((device)) int printf(const char *__restrict__, ...);
# 131 "/usr/local/cuda-5.0/bin/../include/device_functions.h"
 __attribute__((device_builtin)) extern __attribute__((device)) void __syncthreads(void);
# 124 "../src/cuda/kernels.cu"
__attribute__((global)) extern void _Z15multiple_reduceIi18SumReduceOperationIiE23DFISharedPositionSetterIiEEvPT_S5_iiT0_T1_(int *, int *, int, int, struct _Z18SumReduceOperationIiE, struct _Z23DFISharedPositionSetterIiE);
# 81 "../src/cuda/kernels.cu"
__attribute__((global)) extern void _Z17multiple_reduce_2Ii18SumReduceOperationIiE27DefaultSharedPositionSetterIiEEvPT_iiT0_T1_(int *, int, int, struct _Z18SumReduceOperationIiE, struct _Z27DefaultSharedPositionSetterIiE);
# 124 "../src/cuda/kernels.cu"
__attribute__((global)) extern void _Z15multiple_reduceIi18MaxReduceOperationIiE27DefaultSharedPositionSetterIiEEvPT_S5_iiT0_T1_(int *, int *, int, int, struct _Z18MaxReduceOperationIiE, struct _Z27DefaultSharedPositionSetterIiE);
# 81 "../src/cuda/kernels.cu"
__attribute__((global)) extern void _Z17multiple_reduce_2Ii18MaxReduceOperationIiE27DefaultSharedPositionSetterIiEEvPT_iiT0_T1_(int *, int, int, struct _Z18MaxReduceOperationIiE, struct _Z27DefaultSharedPositionSetterIiE);
# 170 "../src/cuda/kernels.cu"
__attribute__((global)) extern void _Z18multiple_normalizeIif31NonCastNormalizeMatrixOperationIifEEvPT0_PT_S5_iiiT1_(float *, int *, int *, int, int, int, struct _Z31NonCastNormalizeMatrixOperationIifE);
# 170 "../src/cuda/kernels.cu"
__attribute__((global)) extern void _Z18multiple_normalizeIif28CastNormalizeMatrixOperationIifEEvPT0_PT_S5_iiiT1_(float *, int *, int *, int, int, int, struct _Z28CastNormalizeMatrixOperationIifE);
# 170 "../src/cuda/kernels.cu"
__attribute__((global)) extern void _Z18multiple_normalizeIid31NonCastNormalizeMatrixOperationIidEEvPT0_PT_S5_iiiT1_(double *, int *, int *, int, int, int, struct _Z31NonCastNormalizeMatrixOperationIidE);
# 170 "../src/cuda/kernels.cu"
__attribute__((global)) extern void _Z18multiple_normalizeIid28CastNormalizeMatrixOperationIidEEvPT0_PT_S5_iiiT1_(double *, int *, int *, int, int, int, struct _Z28CastNormalizeMatrixOperationIidE);
# 28 "../src/cuda/kernels.cu"
extern __attribute__((device)) __inline__ void _ZN18SumReduceOperationIiEclEiPij(struct _Z18SumReduceOperationIiE *const, int, int *, unsigned);
# 37 "../src/cuda/kernels.cu"
extern __attribute__((device)) __inline__ void _ZN23DFISharedPositionSetterIiEclEPijS1_j(struct _Z23DFISharedPositionSetterIiE *const, int *, unsigned, int *, unsigned);
# 46 "../src/cuda/kernels.cu"
extern __attribute__((device)) __inline__ void _ZN27DefaultSharedPositionSetterIiEclEPijS1_j(struct _Z27DefaultSharedPositionSetterIiE *const, int *, unsigned, int *, unsigned);
# 18 "../src/cuda/kernels.cu"
extern __attribute__((device)) __inline__ void _ZN18MaxReduceOperationIiEclEiPij(struct _Z18MaxReduceOperationIiE *const, int, int *, unsigned);
# 55 "../src/cuda/kernels.cu"
extern __attribute__((device)) __inline__ void _ZN31NonCastNormalizeMatrixOperationIifEclEPfPiii(struct _Z31NonCastNormalizeMatrixOperationIifE *const, float *, int *, int, int);
# 67 "../src/cuda/kernels.cu"
extern __attribute__((device)) __inline__ void _ZN28CastNormalizeMatrixOperationIifEclEPfPiii(struct _Z28CastNormalizeMatrixOperationIifE *const, float *, int *, int, int);
# 55 "../src/cuda/kernels.cu"
extern __attribute__((device)) __inline__ void _ZN31NonCastNormalizeMatrixOperationIidEclEPdPiii(struct _Z31NonCastNormalizeMatrixOperationIidE *const, double *, int *, int, int);
# 67 "../src/cuda/kernels.cu"
extern __attribute__((device)) __inline__ void _ZN28CastNormalizeMatrixOperationIidEclEPdPiii(struct _Z28CastNormalizeMatrixOperationIidE *const, double *, int *, int, int);
# 138 "../src/cuda/kernels.cu"
extern __attribute__((shared)) int shared_array[];
# 1 "/usr/local/cuda-5.0/bin/../include/common_functions.h" 1
# 162 "/usr/local/cuda-5.0/bin/../include/common_functions.h"
# 1 "/usr/local/cuda-5.0/bin/../include/math_functions.h" 1 3
# 13152 "/usr/local/cuda-5.0/bin/../include/math_functions.h" 3
# 1 "/usr/local/cuda-5.0/bin/../include/math_functions_dbl_ptx3.h" 1 3
# 13153 "/usr/local/cuda-5.0/bin/../include/math_functions.h" 2 3
# 163 "/usr/local/cuda-5.0/bin/../include/common_functions.h" 2
# 140 "../src/cuda/kernels.cu" 2
# 124 "../src/cuda/kernels.cu"
__attribute__((global)) void _Z15multiple_reduceIi18SumReduceOperationIiE23DFISharedPositionSetterIiEEvPT_S5_iiT0_T1_(
# 124 "../src/cuda/kernels.cu"
int *matrix,
# 124 "../src/cuda/kernels.cu"
int *block_matrix,
# 124 "../src/cuda/kernels.cu"
int rows,
# 124 "../src/cuda/kernels.cu"
int cols,
# 125 "../src/cuda/kernels.cu"
struct _Z18SumReduceOperationIiE op,
# 125 "../src/cuda/kernels.cu"
struct _Z23DFISharedPositionSetterIiE setter){;;
# 125 "../src/cuda/kernels.cu"
{
# 127 "../src/cuda/kernels.cu"
 unsigned __cuda_local_var_33989_15_non_const_tx;
# 127 "../src/cuda/kernels.cu"
 unsigned __cuda_local_var_33989_33_non_const_ty;
# 128 "../src/cuda/kernels.cu"
 unsigned __cuda_local_var_33990_15_non_const_bx;
# 128 "../src/cuda/kernels.cu"
 unsigned __cuda_local_var_33990_32_non_const_by;
# 129 "../src/cuda/kernels.cu"
 unsigned __cuda_local_var_33991_15_non_const_bdx;
# 129 "../src/cuda/kernels.cu"
 unsigned __cuda_local_var_33991_33_non_const_bdy;
# 130 "../src/cuda/kernels.cu"
 unsigned __cuda_local_var_33992_15_non_const_col;
# 131 "../src/cuda/kernels.cu"
 unsigned __cuda_local_var_33993_15_non_const_row;
# 132 "../src/cuda/kernels.cu"
 unsigned __cuda_local_var_33994_15_non_const_offset;
# 133 "../src/cuda/kernels.cu"
 unsigned __cuda_local_var_33995_15_non_const_matrix_pos;
# 133 "../src/cuda/kernels.cu"
 unsigned __cuda_local_var_33995_46_non_const_shared_pos;
# 134 "../src/cuda/kernels.cu"
 __nv_bool __cuda_local_var_33996_7_non_const_in_bounds;
# 135 "../src/cuda/kernels.cu"
 int __cuda_local_var_33997_6_non_const_local_aux;
# 127 "../src/cuda/kernels.cu"
__cuda_local_var_33989_15_non_const_tx = (threadIdx.x);
# 127 "../src/cuda/kernels.cu"
__cuda_local_var_33989_33_non_const_ty = (threadIdx.y);
# 128 "../src/cuda/kernels.cu"
__cuda_local_var_33990_15_non_const_bx = (blockIdx.x);
# 128 "../src/cuda/kernels.cu"
__cuda_local_var_33990_32_non_const_by = (blockIdx.y);
# 129 "../src/cuda/kernels.cu"
__cuda_local_var_33991_15_non_const_bdx = (blockDim.x);
# 129 "../src/cuda/kernels.cu"
__cuda_local_var_33991_33_non_const_bdy = (blockDim.y);
# 130 "../src/cuda/kernels.cu"
__cuda_local_var_33992_15_non_const_col = ((__cuda_local_var_33990_15_non_const_bx * __cuda_local_var_33991_15_non_const_bdx) + __cuda_local_var_33989_15_non_const_tx);
# 131 "../src/cuda/kernels.cu"
__cuda_local_var_33993_15_non_const_row = ((__cuda_local_var_33990_32_non_const_by * __cuda_local_var_33991_33_non_const_bdy) + __cuda_local_var_33989_33_non_const_ty);
# 132 "../src/cuda/kernels.cu"
__cuda_local_var_33994_15_non_const_offset = 1U;
# 133 "../src/cuda/kernels.cu"
__cuda_local_var_33995_15_non_const_matrix_pos = ((__cuda_local_var_33993_15_non_const_row * ((unsigned)cols)) + __cuda_local_var_33992_15_non_const_col);
# 133 "../src/cuda/kernels.cu"
__cuda_local_var_33995_46_non_const_shared_pos = ((__cuda_local_var_33989_33_non_const_ty * __cuda_local_var_33991_15_non_const_bdx) + __cuda_local_var_33989_15_non_const_tx);
# 134 "../src/cuda/kernels.cu"
__cuda_local_var_33996_7_non_const_in_bounds = ((__nv_bool)((__cuda_local_var_33993_15_non_const_row < ((unsigned)rows)) && (__cuda_local_var_33992_15_non_const_col < ((unsigned)cols))));
# 135 "../src/cuda/kernels.cu"
__cuda_local_var_33997_6_non_const_local_aux = (-1);
# 140 "../src/cuda/kernels.cu"
if (__cuda_local_var_33996_7_non_const_in_bounds)
# 140 "../src/cuda/kernels.cu"
{
# 141 "../src/cuda/kernels.cu"
_ZN23DFISharedPositionSetterIiEclEPijS1_j((&setter), shared_array, __cuda_local_var_33995_46_non_const_shared_pos, matrix, __cuda_local_var_33995_15_non_const_matrix_pos);
# 142 "../src/cuda/kernels.cu"
}
# 144 "../src/cuda/kernels.cu"
__syncthreads();
# 147 "../src/cuda/kernels.cu"
for (__cuda_local_var_33994_15_non_const_offset = 1U; (__cuda_local_var_33994_15_non_const_offset < __cuda_local_var_33991_15_non_const_bdx); __cuda_local_var_33994_15_non_const_offset <<= 1)
# 147 "../src/cuda/kernels.cu"
{
# 149 "../src/cuda/kernels.cu"
if ((__cuda_local_var_33996_7_non_const_in_bounds) && (__cuda_local_var_33989_15_non_const_tx >= __cuda_local_var_33994_15_non_const_offset))
# 149 "../src/cuda/kernels.cu"
{
# 150 "../src/cuda/kernels.cu"
__cuda_local_var_33997_6_non_const_local_aux = ((shared_array)[(__cuda_local_var_33995_46_non_const_shared_pos - __cuda_local_var_33994_15_non_const_offset)]);
# 151 "../src/cuda/kernels.cu"
}
# 153 "../src/cuda/kernels.cu"
__syncthreads();
# 155 "../src/cuda/kernels.cu"
if ((__cuda_local_var_33996_7_non_const_in_bounds) && (__cuda_local_var_33989_15_non_const_tx >= __cuda_local_var_33994_15_non_const_offset))
# 155 "../src/cuda/kernels.cu"
{
# 156 "../src/cuda/kernels.cu"
_ZN18SumReduceOperationIiEclEiPij((&op), __cuda_local_var_33997_6_non_const_local_aux, shared_array, __cuda_local_var_33995_46_non_const_shared_pos);
# 157 "../src/cuda/kernels.cu"
}
# 159 "../src/cuda/kernels.cu"
__syncthreads();
# 160 "../src/cuda/kernels.cu"
}
# 162 "../src/cuda/kernels.cu"
if ((__cuda_local_var_33996_7_non_const_in_bounds) && ((__cuda_local_var_33989_15_non_const_tx == (__cuda_local_var_33991_15_non_const_bdx - 1U)) || (__cuda_local_var_33992_15_non_const_col == ((unsigned)(cols - 1)))))
# 162 "../src/cuda/kernels.cu"
{
# 163 "../src/cuda/kernels.cu"
 unsigned __cuda_local_var_34025_16_non_const_v;
# 163 "../src/cuda/kernels.cu"
__cuda_local_var_34025_16_non_const_v = ((__cuda_local_var_33993_15_non_const_row * (gridDim.x)) + __cuda_local_var_33990_15_non_const_bx);
# 165 "../src/cuda/kernels.cu"
(block_matrix[__cuda_local_var_34025_16_non_const_v]) = ((shared_array)[__cuda_local_var_33995_46_non_const_shared_pos]);
# 166 "../src/cuda/kernels.cu"
}
# 167 "../src/cuda/kernels.cu"
}}
# 81 "../src/cuda/kernels.cu"
__attribute__((global)) void _Z17multiple_reduce_2Ii18SumReduceOperationIiE27DefaultSharedPositionSetterIiEEvPT_iiT0_T1_(
# 81 "../src/cuda/kernels.cu"
int *block_matrix,
# 81 "../src/cuda/kernels.cu"
int rows,
# 81 "../src/cuda/kernels.cu"
int cols,
# 82 "../src/cuda/kernels.cu"
struct _Z18SumReduceOperationIiE op,
# 82 "../src/cuda/kernels.cu"
struct _Z27DefaultSharedPositionSetterIiE setter){;;
# 82 "../src/cuda/kernels.cu"
{
# 84 "../src/cuda/kernels.cu"
 unsigned __cuda_local_var_33954_15_non_const_ti;
# 84 "../src/cuda/kernels.cu"
 unsigned __cuda_local_var_33954_33_non_const_bx;
# 85 "../src/cuda/kernels.cu"
 int __cuda_local_var_33955_6_non_const_offset;
# 85 "../src/cuda/kernels.cu"
 int __cuda_local_var_33955_18_non_const_block_limit;
# 86 "../src/cuda/kernels.cu"
 unsigned __cuda_local_var_33956_15_non_const_matrix_pos;
# 87 "../src/cuda/kernels.cu"
 __nv_bool __cuda_local_var_33957_7_non_const_in_bounds;
# 88 "../src/cuda/kernels.cu"
 int __cuda_local_var_33958_6_non_const_local_aux;
# 84 "../src/cuda/kernels.cu"
__cuda_local_var_33954_15_non_const_ti = (threadIdx.x);
# 84 "../src/cuda/kernels.cu"
__cuda_local_var_33954_33_non_const_bx = (blockIdx.x);
# 85 "../src/cuda/kernels.cu"
__cuda_local_var_33955_6_non_const_offset = 1;
# 85 "../src/cuda/kernels.cu"
__cuda_local_var_33955_18_non_const_block_limit = cols;
# 86 "../src/cuda/kernels.cu"
__cuda_local_var_33956_15_non_const_matrix_pos = ((__cuda_local_var_33954_33_non_const_bx * ((unsigned)cols)) + __cuda_local_var_33954_15_non_const_ti);
# 87 "../src/cuda/kernels.cu"
__cuda_local_var_33957_7_non_const_in_bounds = ((__nv_bool)((__cuda_local_var_33954_33_non_const_bx < ((unsigned)rows)) && (__cuda_local_var_33954_15_non_const_ti < ((unsigned)cols))));
# 88 "../src/cuda/kernels.cu"
__cuda_local_var_33958_6_non_const_local_aux = 0;
# 92 "../src/cuda/kernels.cu"
if (__cuda_local_var_33957_7_non_const_in_bounds)
# 92 "../src/cuda/kernels.cu"
{
# 93 "../src/cuda/kernels.cu"
_ZN27DefaultSharedPositionSetterIiEclEPijS1_j((&setter), shared_array, __cuda_local_var_33954_15_non_const_ti, block_matrix, __cuda_local_var_33956_15_non_const_matrix_pos);
# 94 "../src/cuda/kernels.cu"
}
# 96 "../src/cuda/kernels.cu"
for (__cuda_local_var_33955_6_non_const_offset = 1; (__cuda_local_var_33955_6_non_const_offset < __cuda_local_var_33955_18_non_const_block_limit); __cuda_local_var_33955_6_non_const_offset <<= 1)
# 96 "../src/cuda/kernels.cu"
{
# 97 "../src/cuda/kernels.cu"
if ((__cuda_local_var_33957_7_non_const_in_bounds) && (__cuda_local_var_33954_15_non_const_ti >= ((unsigned)__cuda_local_var_33955_6_non_const_offset)))
# 97 "../src/cuda/kernels.cu"
{
# 98 "../src/cuda/kernels.cu"
__cuda_local_var_33958_6_non_const_local_aux = ((shared_array)[(__cuda_local_var_33954_15_non_const_ti - ((unsigned)__cuda_local_var_33955_6_non_const_offset))]);
# 99 "../src/cuda/kernels.cu"
}
# 101 "../src/cuda/kernels.cu"
__syncthreads();
# 103 "../src/cuda/kernels.cu"
if ((__cuda_local_var_33957_7_non_const_in_bounds) && (__cuda_local_var_33954_15_non_const_ti >= ((unsigned)__cuda_local_var_33955_6_non_const_offset)))
# 103 "../src/cuda/kernels.cu"
{
# 104 "../src/cuda/kernels.cu"
_ZN18SumReduceOperationIiEclEiPij((&op), __cuda_local_var_33958_6_non_const_local_aux, shared_array, __cuda_local_var_33954_15_non_const_ti);
# 105 "../src/cuda/kernels.cu"
}
# 107 "../src/cuda/kernels.cu"
__syncthreads();
# 108 "../src/cuda/kernels.cu"
}
# 110 "../src/cuda/kernels.cu"
if (__cuda_local_var_33957_7_non_const_in_bounds)
# 110 "../src/cuda/kernels.cu"
{
# 111 "../src/cuda/kernels.cu"
(block_matrix[__cuda_local_var_33956_15_non_const_matrix_pos]) = ((shared_array)[__cuda_local_var_33954_15_non_const_ti]);
# 112 "../src/cuda/kernels.cu"
}
# 113 "../src/cuda/kernels.cu"
}}
# 124 "../src/cuda/kernels.cu"
__attribute__((global)) void _Z15multiple_reduceIi18MaxReduceOperationIiE27DefaultSharedPositionSetterIiEEvPT_S5_iiT0_T1_(
# 124 "../src/cuda/kernels.cu"
int *matrix,
# 124 "../src/cuda/kernels.cu"
int *block_matrix,
# 124 "../src/cuda/kernels.cu"
int rows,
# 124 "../src/cuda/kernels.cu"
int cols,
# 125 "../src/cuda/kernels.cu"
struct _Z18MaxReduceOperationIiE op,
# 125 "../src/cuda/kernels.cu"
struct _Z27DefaultSharedPositionSetterIiE setter){;;
# 125 "../src/cuda/kernels.cu"
{
# 127 "../src/cuda/kernels.cu"
 unsigned __cuda_local_var_33989_15_non_const_tx;
# 127 "../src/cuda/kernels.cu"
 unsigned __cuda_local_var_33989_33_non_const_ty;
# 128 "../src/cuda/kernels.cu"
 unsigned __cuda_local_var_33990_15_non_const_bx;
# 128 "../src/cuda/kernels.cu"
 unsigned __cuda_local_var_33990_32_non_const_by;
# 129 "../src/cuda/kernels.cu"
 unsigned __cuda_local_var_33991_15_non_const_bdx;
# 129 "../src/cuda/kernels.cu"
 unsigned __cuda_local_var_33991_33_non_const_bdy;
# 130 "../src/cuda/kernels.cu"
 unsigned __cuda_local_var_33992_15_non_const_col;
# 131 "../src/cuda/kernels.cu"
 unsigned __cuda_local_var_33993_15_non_const_row;
# 132 "../src/cuda/kernels.cu"
 unsigned __cuda_local_var_33994_15_non_const_offset;
# 133 "../src/cuda/kernels.cu"
 unsigned __cuda_local_var_33995_15_non_const_matrix_pos;
# 133 "../src/cuda/kernels.cu"
 unsigned __cuda_local_var_33995_46_non_const_shared_pos;
# 134 "../src/cuda/kernels.cu"
 __nv_bool __cuda_local_var_33996_7_non_const_in_bounds;
# 135 "../src/cuda/kernels.cu"
 int __cuda_local_var_33997_6_non_const_local_aux;
# 127 "../src/cuda/kernels.cu"
__cuda_local_var_33989_15_non_const_tx = (threadIdx.x);
# 127 "../src/cuda/kernels.cu"
__cuda_local_var_33989_33_non_const_ty = (threadIdx.y);
# 128 "../src/cuda/kernels.cu"
__cuda_local_var_33990_15_non_const_bx = (blockIdx.x);
# 128 "../src/cuda/kernels.cu"
__cuda_local_var_33990_32_non_const_by = (blockIdx.y);
# 129 "../src/cuda/kernels.cu"
__cuda_local_var_33991_15_non_const_bdx = (blockDim.x);
# 129 "../src/cuda/kernels.cu"
__cuda_local_var_33991_33_non_const_bdy = (blockDim.y);
# 130 "../src/cuda/kernels.cu"
__cuda_local_var_33992_15_non_const_col = ((__cuda_local_var_33990_15_non_const_bx * __cuda_local_var_33991_15_non_const_bdx) + __cuda_local_var_33989_15_non_const_tx);
# 131 "../src/cuda/kernels.cu"
__cuda_local_var_33993_15_non_const_row = ((__cuda_local_var_33990_32_non_const_by * __cuda_local_var_33991_33_non_const_bdy) + __cuda_local_var_33989_33_non_const_ty);
# 132 "../src/cuda/kernels.cu"
__cuda_local_var_33994_15_non_const_offset = 1U;
# 133 "../src/cuda/kernels.cu"
__cuda_local_var_33995_15_non_const_matrix_pos = ((__cuda_local_var_33993_15_non_const_row * ((unsigned)cols)) + __cuda_local_var_33992_15_non_const_col);
# 133 "../src/cuda/kernels.cu"
__cuda_local_var_33995_46_non_const_shared_pos = ((__cuda_local_var_33989_33_non_const_ty * __cuda_local_var_33991_15_non_const_bdx) + __cuda_local_var_33989_15_non_const_tx);
# 134 "../src/cuda/kernels.cu"
__cuda_local_var_33996_7_non_const_in_bounds = ((__nv_bool)((__cuda_local_var_33993_15_non_const_row < ((unsigned)rows)) && (__cuda_local_var_33992_15_non_const_col < ((unsigned)cols))));
# 135 "../src/cuda/kernels.cu"
__cuda_local_var_33997_6_non_const_local_aux = (-1);
# 140 "../src/cuda/kernels.cu"
if (__cuda_local_var_33996_7_non_const_in_bounds)
# 140 "../src/cuda/kernels.cu"
{
# 141 "../src/cuda/kernels.cu"
_ZN27DefaultSharedPositionSetterIiEclEPijS1_j((&setter), shared_array, __cuda_local_var_33995_46_non_const_shared_pos, matrix, __cuda_local_var_33995_15_non_const_matrix_pos);
# 142 "../src/cuda/kernels.cu"
}
# 144 "../src/cuda/kernels.cu"
__syncthreads();
# 147 "../src/cuda/kernels.cu"
for (__cuda_local_var_33994_15_non_const_offset = 1U; (__cuda_local_var_33994_15_non_const_offset < __cuda_local_var_33991_15_non_const_bdx); __cuda_local_var_33994_15_non_const_offset <<= 1)
# 147 "../src/cuda/kernels.cu"
{
# 149 "../src/cuda/kernels.cu"
if ((__cuda_local_var_33996_7_non_const_in_bounds) && (__cuda_local_var_33989_15_non_const_tx >= __cuda_local_var_33994_15_non_const_offset))
# 149 "../src/cuda/kernels.cu"
{
# 150 "../src/cuda/kernels.cu"
__cuda_local_var_33997_6_non_const_local_aux = ((shared_array)[(__cuda_local_var_33995_46_non_const_shared_pos - __cuda_local_var_33994_15_non_const_offset)]);
# 151 "../src/cuda/kernels.cu"
}
# 153 "../src/cuda/kernels.cu"
__syncthreads();
# 155 "../src/cuda/kernels.cu"
if ((__cuda_local_var_33996_7_non_const_in_bounds) && (__cuda_local_var_33989_15_non_const_tx >= __cuda_local_var_33994_15_non_const_offset))
# 155 "../src/cuda/kernels.cu"
{
# 156 "../src/cuda/kernels.cu"
_ZN18MaxReduceOperationIiEclEiPij((&op), __cuda_local_var_33997_6_non_const_local_aux, shared_array, __cuda_local_var_33995_46_non_const_shared_pos);
# 157 "../src/cuda/kernels.cu"
}
# 159 "../src/cuda/kernels.cu"
__syncthreads();
# 160 "../src/cuda/kernels.cu"
}
# 162 "../src/cuda/kernels.cu"
if ((__cuda_local_var_33996_7_non_const_in_bounds) && ((__cuda_local_var_33989_15_non_const_tx == (__cuda_local_var_33991_15_non_const_bdx - 1U)) || (__cuda_local_var_33992_15_non_const_col == ((unsigned)(cols - 1)))))
# 162 "../src/cuda/kernels.cu"
{
# 163 "../src/cuda/kernels.cu"
 unsigned __cuda_local_var_34025_16_non_const_v;
# 163 "../src/cuda/kernels.cu"
__cuda_local_var_34025_16_non_const_v = ((__cuda_local_var_33993_15_non_const_row * (gridDim.x)) + __cuda_local_var_33990_15_non_const_bx);
# 165 "../src/cuda/kernels.cu"
(block_matrix[__cuda_local_var_34025_16_non_const_v]) = ((shared_array)[__cuda_local_var_33995_46_non_const_shared_pos]);
# 166 "../src/cuda/kernels.cu"
}
# 167 "../src/cuda/kernels.cu"
}}
# 81 "../src/cuda/kernels.cu"
__attribute__((global)) void _Z17multiple_reduce_2Ii18MaxReduceOperationIiE27DefaultSharedPositionSetterIiEEvPT_iiT0_T1_(
# 81 "../src/cuda/kernels.cu"
int *block_matrix,
# 81 "../src/cuda/kernels.cu"
int rows,
# 81 "../src/cuda/kernels.cu"
int cols,
# 82 "../src/cuda/kernels.cu"
struct _Z18MaxReduceOperationIiE op,
# 82 "../src/cuda/kernels.cu"
struct _Z27DefaultSharedPositionSetterIiE setter){;;
# 82 "../src/cuda/kernels.cu"
{
# 84 "../src/cuda/kernels.cu"
 unsigned __cuda_local_var_33954_15_non_const_ti;
# 84 "../src/cuda/kernels.cu"
 unsigned __cuda_local_var_33954_33_non_const_bx;
# 85 "../src/cuda/kernels.cu"
 int __cuda_local_var_33955_6_non_const_offset;
# 85 "../src/cuda/kernels.cu"
 int __cuda_local_var_33955_18_non_const_block_limit;
# 86 "../src/cuda/kernels.cu"
 unsigned __cuda_local_var_33956_15_non_const_matrix_pos;
# 87 "../src/cuda/kernels.cu"
 __nv_bool __cuda_local_var_33957_7_non_const_in_bounds;
# 88 "../src/cuda/kernels.cu"
 int __cuda_local_var_33958_6_non_const_local_aux;
# 84 "../src/cuda/kernels.cu"
__cuda_local_var_33954_15_non_const_ti = (threadIdx.x);
# 84 "../src/cuda/kernels.cu"
__cuda_local_var_33954_33_non_const_bx = (blockIdx.x);
# 85 "../src/cuda/kernels.cu"
__cuda_local_var_33955_6_non_const_offset = 1;
# 85 "../src/cuda/kernels.cu"
__cuda_local_var_33955_18_non_const_block_limit = cols;
# 86 "../src/cuda/kernels.cu"
__cuda_local_var_33956_15_non_const_matrix_pos = ((__cuda_local_var_33954_33_non_const_bx * ((unsigned)cols)) + __cuda_local_var_33954_15_non_const_ti);
# 87 "../src/cuda/kernels.cu"
__cuda_local_var_33957_7_non_const_in_bounds = ((__nv_bool)((__cuda_local_var_33954_33_non_const_bx < ((unsigned)rows)) && (__cuda_local_var_33954_15_non_const_ti < ((unsigned)cols))));
# 88 "../src/cuda/kernels.cu"
__cuda_local_var_33958_6_non_const_local_aux = 0;
# 92 "../src/cuda/kernels.cu"
if (__cuda_local_var_33957_7_non_const_in_bounds)
# 92 "../src/cuda/kernels.cu"
{
# 93 "../src/cuda/kernels.cu"
_ZN27DefaultSharedPositionSetterIiEclEPijS1_j((&setter), shared_array, __cuda_local_var_33954_15_non_const_ti, block_matrix, __cuda_local_var_33956_15_non_const_matrix_pos);
# 94 "../src/cuda/kernels.cu"
}
# 96 "../src/cuda/kernels.cu"
for (__cuda_local_var_33955_6_non_const_offset = 1; (__cuda_local_var_33955_6_non_const_offset < __cuda_local_var_33955_18_non_const_block_limit); __cuda_local_var_33955_6_non_const_offset <<= 1)
# 96 "../src/cuda/kernels.cu"
{
# 97 "../src/cuda/kernels.cu"
if ((__cuda_local_var_33957_7_non_const_in_bounds) && (__cuda_local_var_33954_15_non_const_ti >= ((unsigned)__cuda_local_var_33955_6_non_const_offset)))
# 97 "../src/cuda/kernels.cu"
{
# 98 "../src/cuda/kernels.cu"
__cuda_local_var_33958_6_non_const_local_aux = ((shared_array)[(__cuda_local_var_33954_15_non_const_ti - ((unsigned)__cuda_local_var_33955_6_non_const_offset))]);
# 99 "../src/cuda/kernels.cu"
}
# 101 "../src/cuda/kernels.cu"
__syncthreads();
# 103 "../src/cuda/kernels.cu"
if ((__cuda_local_var_33957_7_non_const_in_bounds) && (__cuda_local_var_33954_15_non_const_ti >= ((unsigned)__cuda_local_var_33955_6_non_const_offset)))
# 103 "../src/cuda/kernels.cu"
{
# 104 "../src/cuda/kernels.cu"
_ZN18MaxReduceOperationIiEclEiPij((&op), __cuda_local_var_33958_6_non_const_local_aux, shared_array, __cuda_local_var_33954_15_non_const_ti);
# 105 "../src/cuda/kernels.cu"
}
# 107 "../src/cuda/kernels.cu"
__syncthreads();
# 108 "../src/cuda/kernels.cu"
}
# 110 "../src/cuda/kernels.cu"
if (__cuda_local_var_33957_7_non_const_in_bounds)
# 110 "../src/cuda/kernels.cu"
{
# 111 "../src/cuda/kernels.cu"
(block_matrix[__cuda_local_var_33956_15_non_const_matrix_pos]) = ((shared_array)[__cuda_local_var_33954_15_non_const_ti]);
# 112 "../src/cuda/kernels.cu"
}
# 113 "../src/cuda/kernels.cu"
}}
# 170 "../src/cuda/kernels.cu"
__attribute__((global)) void _Z18multiple_normalizeIif31NonCastNormalizeMatrixOperationIifEEvPT0_PT_S5_iiiT1_(
# 170 "../src/cuda/kernels.cu"
float *output_matrix,
# 170 "../src/cuda/kernels.cu"
int *input_matrix,
# 170 "../src/cuda/kernels.cu"
int *max_block_matrix,
# 170 "../src/cuda/kernels.cu"
int rows,
# 170 "../src/cuda/kernels.cu"
int cols,
# 171 "../src/cuda/kernels.cu"
int block_matrix_cols,
# 171 "../src/cuda/kernels.cu"
struct _Z31NonCastNormalizeMatrixOperationIifE op){;
# 171 "../src/cuda/kernels.cu"
{
# 173 "../src/cuda/kernels.cu"
 int __cuda_local_var_34035_6_non_const_tx;
# 173 "../src/cuda/kernels.cu"
 int __cuda_local_var_34035_24_non_const_ty;
# 174 "../src/cuda/kernels.cu"
 int __cuda_local_var_34036_6_non_const_bx;
# 174 "../src/cuda/kernels.cu"
 int __cuda_local_var_34036_23_non_const_by;
# 175 "../src/cuda/kernels.cu"
 int __cuda_local_var_34037_6_non_const_bdx;
# 175 "../src/cuda/kernels.cu"
 int __cuda_local_var_34037_24_non_const_bdy;
# 176 "../src/cuda/kernels.cu"
 int __cuda_local_var_34038_6_non_const_col;
# 177 "../src/cuda/kernels.cu"
 int __cuda_local_var_34039_6_non_const_row;
# 178 "../src/cuda/kernels.cu"
 int __cuda_local_var_34040_6_non_const_matrix_pos;
# 179 "../src/cuda/kernels.cu"
 __nv_bool __cuda_local_var_34041_7_non_const_in_bounds;
# 173 "../src/cuda/kernels.cu"
__cuda_local_var_34035_6_non_const_tx = ((int)(threadIdx.x));
# 173 "../src/cuda/kernels.cu"
__cuda_local_var_34035_24_non_const_ty = ((int)(threadIdx.y));
# 174 "../src/cuda/kernels.cu"
__cuda_local_var_34036_6_non_const_bx = ((int)(blockIdx.x));
# 174 "../src/cuda/kernels.cu"
__cuda_local_var_34036_23_non_const_by = ((int)(blockIdx.y));
# 175 "../src/cuda/kernels.cu"
__cuda_local_var_34037_6_non_const_bdx = ((int)(blockDim.x));
# 175 "../src/cuda/kernels.cu"
__cuda_local_var_34037_24_non_const_bdy = ((int)(blockDim.y));
# 176 "../src/cuda/kernels.cu"
__cuda_local_var_34038_6_non_const_col = ((__cuda_local_var_34036_6_non_const_bx * __cuda_local_var_34037_6_non_const_bdx) + __cuda_local_var_34035_6_non_const_tx);
# 177 "../src/cuda/kernels.cu"
__cuda_local_var_34039_6_non_const_row = ((__cuda_local_var_34036_23_non_const_by * __cuda_local_var_34037_24_non_const_bdy) + __cuda_local_var_34035_24_non_const_ty);
# 178 "../src/cuda/kernels.cu"
__cuda_local_var_34040_6_non_const_matrix_pos = ((__cuda_local_var_34039_6_non_const_row * cols) + __cuda_local_var_34038_6_non_const_col);
# 179 "../src/cuda/kernels.cu"
__cuda_local_var_34041_7_non_const_in_bounds = ((__nv_bool)((__cuda_local_var_34039_6_non_const_row < rows) && (__cuda_local_var_34038_6_non_const_col < cols)));
# 181 "../src/cuda/kernels.cu"
if (__cuda_local_var_34041_7_non_const_in_bounds)
# 181 "../src/cuda/kernels.cu"
{
# 182 "../src/cuda/kernels.cu"
 int __cuda_local_var_34044_7_non_const_block_matrix_pos;
# 182 "../src/cuda/kernels.cu"
__cuda_local_var_34044_7_non_const_block_matrix_pos = ((__cuda_local_var_34039_6_non_const_row * block_matrix_cols) + (block_matrix_cols - 1));
# 183 "../src/cuda/kernels.cu"
_ZN31NonCastNormalizeMatrixOperationIifEclEPfPiii((&op), output_matrix, input_matrix, (max_block_matrix[__cuda_local_var_34044_7_non_const_block_matrix_pos]), __cuda_local_var_34040_6_non_const_matrix_pos);
# 184 "../src/cuda/kernels.cu"
}
# 185 "../src/cuda/kernels.cu"
}}
# 170 "../src/cuda/kernels.cu"
__attribute__((global)) void _Z18multiple_normalizeIif28CastNormalizeMatrixOperationIifEEvPT0_PT_S5_iiiT1_(
# 170 "../src/cuda/kernels.cu"
float *output_matrix,
# 170 "../src/cuda/kernels.cu"
int *input_matrix,
# 170 "../src/cuda/kernels.cu"
int *max_block_matrix,
# 170 "../src/cuda/kernels.cu"
int rows,
# 170 "../src/cuda/kernels.cu"
int cols,
# 171 "../src/cuda/kernels.cu"
int block_matrix_cols,
# 171 "../src/cuda/kernels.cu"
struct _Z28CastNormalizeMatrixOperationIifE op){;
# 171 "../src/cuda/kernels.cu"
{
# 173 "../src/cuda/kernels.cu"
 int __cuda_local_var_34035_6_non_const_tx;
# 173 "../src/cuda/kernels.cu"
 int __cuda_local_var_34035_24_non_const_ty;
# 174 "../src/cuda/kernels.cu"
 int __cuda_local_var_34036_6_non_const_bx;
# 174 "../src/cuda/kernels.cu"
 int __cuda_local_var_34036_23_non_const_by;
# 175 "../src/cuda/kernels.cu"
 int __cuda_local_var_34037_6_non_const_bdx;
# 175 "../src/cuda/kernels.cu"
 int __cuda_local_var_34037_24_non_const_bdy;
# 176 "../src/cuda/kernels.cu"
 int __cuda_local_var_34038_6_non_const_col;
# 177 "../src/cuda/kernels.cu"
 int __cuda_local_var_34039_6_non_const_row;
# 178 "../src/cuda/kernels.cu"
 int __cuda_local_var_34040_6_non_const_matrix_pos;
# 179 "../src/cuda/kernels.cu"
 __nv_bool __cuda_local_var_34041_7_non_const_in_bounds;
# 173 "../src/cuda/kernels.cu"
__cuda_local_var_34035_6_non_const_tx = ((int)(threadIdx.x));
# 173 "../src/cuda/kernels.cu"
__cuda_local_var_34035_24_non_const_ty = ((int)(threadIdx.y));
# 174 "../src/cuda/kernels.cu"
__cuda_local_var_34036_6_non_const_bx = ((int)(blockIdx.x));
# 174 "../src/cuda/kernels.cu"
__cuda_local_var_34036_23_non_const_by = ((int)(blockIdx.y));
# 175 "../src/cuda/kernels.cu"
__cuda_local_var_34037_6_non_const_bdx = ((int)(blockDim.x));
# 175 "../src/cuda/kernels.cu"
__cuda_local_var_34037_24_non_const_bdy = ((int)(blockDim.y));
# 176 "../src/cuda/kernels.cu"
__cuda_local_var_34038_6_non_const_col = ((__cuda_local_var_34036_6_non_const_bx * __cuda_local_var_34037_6_non_const_bdx) + __cuda_local_var_34035_6_non_const_tx);
# 177 "../src/cuda/kernels.cu"
__cuda_local_var_34039_6_non_const_row = ((__cuda_local_var_34036_23_non_const_by * __cuda_local_var_34037_24_non_const_bdy) + __cuda_local_var_34035_24_non_const_ty);
# 178 "../src/cuda/kernels.cu"
__cuda_local_var_34040_6_non_const_matrix_pos = ((__cuda_local_var_34039_6_non_const_row * cols) + __cuda_local_var_34038_6_non_const_col);
# 179 "../src/cuda/kernels.cu"
__cuda_local_var_34041_7_non_const_in_bounds = ((__nv_bool)((__cuda_local_var_34039_6_non_const_row < rows) && (__cuda_local_var_34038_6_non_const_col < cols)));
# 181 "../src/cuda/kernels.cu"
if (__cuda_local_var_34041_7_non_const_in_bounds)
# 181 "../src/cuda/kernels.cu"
{
# 182 "../src/cuda/kernels.cu"
 int __cuda_local_var_34044_7_non_const_block_matrix_pos;
# 182 "../src/cuda/kernels.cu"
__cuda_local_var_34044_7_non_const_block_matrix_pos = ((__cuda_local_var_34039_6_non_const_row * block_matrix_cols) + (block_matrix_cols - 1));
# 183 "../src/cuda/kernels.cu"
_ZN28CastNormalizeMatrixOperationIifEclEPfPiii((&op), output_matrix, input_matrix, (max_block_matrix[__cuda_local_var_34044_7_non_const_block_matrix_pos]), __cuda_local_var_34040_6_non_const_matrix_pos);
# 184 "../src/cuda/kernels.cu"
}
# 185 "../src/cuda/kernels.cu"
}}
# 170 "../src/cuda/kernels.cu"
__attribute__((global)) void _Z18multiple_normalizeIid31NonCastNormalizeMatrixOperationIidEEvPT0_PT_S5_iiiT1_(
# 170 "../src/cuda/kernels.cu"
double *output_matrix,
# 170 "../src/cuda/kernels.cu"
int *input_matrix,
# 170 "../src/cuda/kernels.cu"
int *max_block_matrix,
# 170 "../src/cuda/kernels.cu"
int rows,
# 170 "../src/cuda/kernels.cu"
int cols,
# 171 "../src/cuda/kernels.cu"
int block_matrix_cols,
# 171 "../src/cuda/kernels.cu"
struct _Z31NonCastNormalizeMatrixOperationIidE op){;
# 171 "../src/cuda/kernels.cu"
{
# 173 "../src/cuda/kernels.cu"
 int __cuda_local_var_34035_6_non_const_tx;
# 173 "../src/cuda/kernels.cu"
 int __cuda_local_var_34035_24_non_const_ty;
# 174 "../src/cuda/kernels.cu"
 int __cuda_local_var_34036_6_non_const_bx;
# 174 "../src/cuda/kernels.cu"
 int __cuda_local_var_34036_23_non_const_by;
# 175 "../src/cuda/kernels.cu"
 int __cuda_local_var_34037_6_non_const_bdx;
# 175 "../src/cuda/kernels.cu"
 int __cuda_local_var_34037_24_non_const_bdy;
# 176 "../src/cuda/kernels.cu"
 int __cuda_local_var_34038_6_non_const_col;
# 177 "../src/cuda/kernels.cu"
 int __cuda_local_var_34039_6_non_const_row;
# 178 "../src/cuda/kernels.cu"
 int __cuda_local_var_34040_6_non_const_matrix_pos;
# 179 "../src/cuda/kernels.cu"
 __nv_bool __cuda_local_var_34041_7_non_const_in_bounds;
# 173 "../src/cuda/kernels.cu"
__cuda_local_var_34035_6_non_const_tx = ((int)(threadIdx.x));
# 173 "../src/cuda/kernels.cu"
__cuda_local_var_34035_24_non_const_ty = ((int)(threadIdx.y));
# 174 "../src/cuda/kernels.cu"
__cuda_local_var_34036_6_non_const_bx = ((int)(blockIdx.x));
# 174 "../src/cuda/kernels.cu"
__cuda_local_var_34036_23_non_const_by = ((int)(blockIdx.y));
# 175 "../src/cuda/kernels.cu"
__cuda_local_var_34037_6_non_const_bdx = ((int)(blockDim.x));
# 175 "../src/cuda/kernels.cu"
__cuda_local_var_34037_24_non_const_bdy = ((int)(blockDim.y));
# 176 "../src/cuda/kernels.cu"
__cuda_local_var_34038_6_non_const_col = ((__cuda_local_var_34036_6_non_const_bx * __cuda_local_var_34037_6_non_const_bdx) + __cuda_local_var_34035_6_non_const_tx);
# 177 "../src/cuda/kernels.cu"
__cuda_local_var_34039_6_non_const_row = ((__cuda_local_var_34036_23_non_const_by * __cuda_local_var_34037_24_non_const_bdy) + __cuda_local_var_34035_24_non_const_ty);
# 178 "../src/cuda/kernels.cu"
__cuda_local_var_34040_6_non_const_matrix_pos = ((__cuda_local_var_34039_6_non_const_row * cols) + __cuda_local_var_34038_6_non_const_col);
# 179 "../src/cuda/kernels.cu"
__cuda_local_var_34041_7_non_const_in_bounds = ((__nv_bool)((__cuda_local_var_34039_6_non_const_row < rows) && (__cuda_local_var_34038_6_non_const_col < cols)));
# 181 "../src/cuda/kernels.cu"
if (__cuda_local_var_34041_7_non_const_in_bounds)
# 181 "../src/cuda/kernels.cu"
{
# 182 "../src/cuda/kernels.cu"
 int __cuda_local_var_34044_7_non_const_block_matrix_pos;
# 182 "../src/cuda/kernels.cu"
__cuda_local_var_34044_7_non_const_block_matrix_pos = ((__cuda_local_var_34039_6_non_const_row * block_matrix_cols) + (block_matrix_cols - 1));
# 183 "../src/cuda/kernels.cu"
_ZN31NonCastNormalizeMatrixOperationIidEclEPdPiii((&op), output_matrix, input_matrix, (max_block_matrix[__cuda_local_var_34044_7_non_const_block_matrix_pos]), __cuda_local_var_34040_6_non_const_matrix_pos);
# 184 "../src/cuda/kernels.cu"
}
# 185 "../src/cuda/kernels.cu"
}}
# 170 "../src/cuda/kernels.cu"
__attribute__((global)) void _Z18multiple_normalizeIid28CastNormalizeMatrixOperationIidEEvPT0_PT_S5_iiiT1_(
# 170 "../src/cuda/kernels.cu"
double *output_matrix,
# 170 "../src/cuda/kernels.cu"
int *input_matrix,
# 170 "../src/cuda/kernels.cu"
int *max_block_matrix,
# 170 "../src/cuda/kernels.cu"
int rows,
# 170 "../src/cuda/kernels.cu"
int cols,
# 171 "../src/cuda/kernels.cu"
int block_matrix_cols,
# 171 "../src/cuda/kernels.cu"
struct _Z28CastNormalizeMatrixOperationIidE op){;
# 171 "../src/cuda/kernels.cu"
{
# 173 "../src/cuda/kernels.cu"
 int __cuda_local_var_34035_6_non_const_tx;
# 173 "../src/cuda/kernels.cu"
 int __cuda_local_var_34035_24_non_const_ty;
# 174 "../src/cuda/kernels.cu"
 int __cuda_local_var_34036_6_non_const_bx;
# 174 "../src/cuda/kernels.cu"
 int __cuda_local_var_34036_23_non_const_by;
# 175 "../src/cuda/kernels.cu"
 int __cuda_local_var_34037_6_non_const_bdx;
# 175 "../src/cuda/kernels.cu"
 int __cuda_local_var_34037_24_non_const_bdy;
# 176 "../src/cuda/kernels.cu"
 int __cuda_local_var_34038_6_non_const_col;
# 177 "../src/cuda/kernels.cu"
 int __cuda_local_var_34039_6_non_const_row;
# 178 "../src/cuda/kernels.cu"
 int __cuda_local_var_34040_6_non_const_matrix_pos;
# 179 "../src/cuda/kernels.cu"
 __nv_bool __cuda_local_var_34041_7_non_const_in_bounds;
# 173 "../src/cuda/kernels.cu"
__cuda_local_var_34035_6_non_const_tx = ((int)(threadIdx.x));
# 173 "../src/cuda/kernels.cu"
__cuda_local_var_34035_24_non_const_ty = ((int)(threadIdx.y));
# 174 "../src/cuda/kernels.cu"
__cuda_local_var_34036_6_non_const_bx = ((int)(blockIdx.x));
# 174 "../src/cuda/kernels.cu"
__cuda_local_var_34036_23_non_const_by = ((int)(blockIdx.y));
# 175 "../src/cuda/kernels.cu"
__cuda_local_var_34037_6_non_const_bdx = ((int)(blockDim.x));
# 175 "../src/cuda/kernels.cu"
__cuda_local_var_34037_24_non_const_bdy = ((int)(blockDim.y));
# 176 "../src/cuda/kernels.cu"
__cuda_local_var_34038_6_non_const_col = ((__cuda_local_var_34036_6_non_const_bx * __cuda_local_var_34037_6_non_const_bdx) + __cuda_local_var_34035_6_non_const_tx);
# 177 "../src/cuda/kernels.cu"
__cuda_local_var_34039_6_non_const_row = ((__cuda_local_var_34036_23_non_const_by * __cuda_local_var_34037_24_non_const_bdy) + __cuda_local_var_34035_24_non_const_ty);
# 178 "../src/cuda/kernels.cu"
__cuda_local_var_34040_6_non_const_matrix_pos = ((__cuda_local_var_34039_6_non_const_row * cols) + __cuda_local_var_34038_6_non_const_col);
# 179 "../src/cuda/kernels.cu"
__cuda_local_var_34041_7_non_const_in_bounds = ((__nv_bool)((__cuda_local_var_34039_6_non_const_row < rows) && (__cuda_local_var_34038_6_non_const_col < cols)));
# 181 "../src/cuda/kernels.cu"
if (__cuda_local_var_34041_7_non_const_in_bounds)
# 181 "../src/cuda/kernels.cu"
{
# 182 "../src/cuda/kernels.cu"
 int __cuda_local_var_34044_7_non_const_block_matrix_pos;
# 182 "../src/cuda/kernels.cu"
__cuda_local_var_34044_7_non_const_block_matrix_pos = ((__cuda_local_var_34039_6_non_const_row * block_matrix_cols) + (block_matrix_cols - 1));
# 183 "../src/cuda/kernels.cu"
_ZN28CastNormalizeMatrixOperationIidEclEPdPiii((&op), output_matrix, input_matrix, (max_block_matrix[__cuda_local_var_34044_7_non_const_block_matrix_pos]), __cuda_local_var_34040_6_non_const_matrix_pos);
# 184 "../src/cuda/kernels.cu"
}
# 185 "../src/cuda/kernels.cu"
}}
__asm__(".align 2");
# 28 "../src/cuda/kernels.cu"
 __attribute__((device)) __inline__ void _ZN18SumReduceOperationIiEclEiPij( struct _Z18SumReduceOperationIiE *const this,
# 28 "../src/cuda/kernels.cu"
int local_aux,
# 28 "../src/cuda/kernels.cu"
int *array,
# 28 "../src/cuda/kernels.cu"
unsigned pos){
# 28 "../src/cuda/kernels.cu"
{ int __T214;
# 29 "../src/cuda/kernels.cu"
(array[pos]) += local_aux; { if (!(this)) { __T214 = 0; } }
# 30 "../src/cuda/kernels.cu"
}}
__asm__(".align 2");
# 37 "../src/cuda/kernels.cu"
 __attribute__((device)) __inline__ void _ZN23DFISharedPositionSetterIiEclEPijS1_j( struct _Z23DFISharedPositionSetterIiE *const this,
# 37 "../src/cuda/kernels.cu"
int *shared_matrix,
# 37 "../src/cuda/kernels.cu"
unsigned shared_pos,
# 38 "../src/cuda/kernels.cu"
int *global_matrix,
# 38 "../src/cuda/kernels.cu"
unsigned matrix_pos){
# 38 "../src/cuda/kernels.cu"
{ int __T215;
# 39 "../src/cuda/kernels.cu"
(shared_matrix[shared_pos]) = ((int)(!(!(global_matrix[matrix_pos])))); { if (!(this)) { __T215 = 0; } }
# 40 "../src/cuda/kernels.cu"
}}
__asm__(".align 2");
# 46 "../src/cuda/kernels.cu"
 __attribute__((device)) __inline__ void _ZN27DefaultSharedPositionSetterIiEclEPijS1_j( struct _Z27DefaultSharedPositionSetterIiE *const this,
# 46 "../src/cuda/kernels.cu"
int *shared_matrix,
# 46 "../src/cuda/kernels.cu"
unsigned shared_pos,
# 47 "../src/cuda/kernels.cu"
int *global_matrix,
# 47 "../src/cuda/kernels.cu"
unsigned matrix_pos){
# 47 "../src/cuda/kernels.cu"
{ int __T216;
# 48 "../src/cuda/kernels.cu"
(shared_matrix[shared_pos]) = (global_matrix[matrix_pos]); { if (!(this)) { __T216 = 0; } }
# 49 "../src/cuda/kernels.cu"
}}
__asm__(".align 2");
# 18 "../src/cuda/kernels.cu"
 __attribute__((device)) __inline__ void _ZN18MaxReduceOperationIiEclEiPij( struct _Z18MaxReduceOperationIiE *const this,
# 18 "../src/cuda/kernels.cu"
int local_aux,
# 18 "../src/cuda/kernels.cu"
int *array,
# 18 "../src/cuda/kernels.cu"
unsigned pos){
# 18 "../src/cuda/kernels.cu"
{ int __T217;
# 19 "../src/cuda/kernels.cu"
if (local_aux > (array[pos]))
# 19 "../src/cuda/kernels.cu"
{
# 20 "../src/cuda/kernels.cu"
(array[pos]) = local_aux;
# 21 "../src/cuda/kernels.cu"
} { if (!(this)) { __T217 = 0; } }
# 22 "../src/cuda/kernels.cu"
}}
__asm__(".align 2");
# 55 "../src/cuda/kernels.cu"
 __attribute__((device)) __inline__ void _ZN31NonCastNormalizeMatrixOperationIifEclEPfPiii( struct _Z31NonCastNormalizeMatrixOperationIifE *const this,
# 55 "../src/cuda/kernels.cu"
float *dest,
# 55 "../src/cuda/kernels.cu"
int *src,
# 55 "../src/cuda/kernels.cu"
int value,
# 55 "../src/cuda/kernels.cu"
int pos){
# 55 "../src/cuda/kernels.cu"
{ int __T218;
# 56 "../src/cuda/kernels.cu"
if (value != 0)
# 56 "../src/cuda/kernels.cu"
{
# 57 "../src/cuda/kernels.cu"
(dest[pos]) = ((float)((src[pos]) / value));
# 58 "../src/cuda/kernels.cu"
}
# 58 "../src/cuda/kernels.cu"
else
# 58 "../src/cuda/kernels.cu"
{
# 59 "../src/cuda/kernels.cu"
(dest[pos]) = (0.0F);
# 60 "../src/cuda/kernels.cu"
} { if (!(this)) { __T218 = 0; } }
# 61 "../src/cuda/kernels.cu"
}}
__asm__(".align 2");
# 67 "../src/cuda/kernels.cu"
 __attribute__((device)) __inline__ void _ZN28CastNormalizeMatrixOperationIifEclEPfPiii( struct _Z28CastNormalizeMatrixOperationIifE *const this,
# 67 "../src/cuda/kernels.cu"
float *dest,
# 67 "../src/cuda/kernels.cu"
int *src,
# 67 "../src/cuda/kernels.cu"
int value,
# 67 "../src/cuda/kernels.cu"
int pos){
# 67 "../src/cuda/kernels.cu"
{ int __T219;
# 68 "../src/cuda/kernels.cu"
if (value != 0)
# 68 "../src/cuda/kernels.cu"
{
# 69 "../src/cuda/kernels.cu"
(dest[pos]) = ( fdividef(((float)(src[pos])) , ((float)value)));
# 70 "../src/cuda/kernels.cu"
}
# 70 "../src/cuda/kernels.cu"
else
# 70 "../src/cuda/kernels.cu"
{
# 71 "../src/cuda/kernels.cu"
(dest[pos]) = (0.0F);
# 72 "../src/cuda/kernels.cu"
} { if (!(this)) { __T219 = 0; } }
# 73 "../src/cuda/kernels.cu"
}}
__asm__(".align 2");
# 55 "../src/cuda/kernels.cu"
 __attribute__((device)) __inline__ void _ZN31NonCastNormalizeMatrixOperationIidEclEPdPiii( struct _Z31NonCastNormalizeMatrixOperationIidE *const this,
# 55 "../src/cuda/kernels.cu"
double *dest,
# 55 "../src/cuda/kernels.cu"
int *src,
# 55 "../src/cuda/kernels.cu"
int value,
# 55 "../src/cuda/kernels.cu"
int pos){
# 55 "../src/cuda/kernels.cu"
{ int __T220;
# 56 "../src/cuda/kernels.cu"
if (value != 0)
# 56 "../src/cuda/kernels.cu"
{
# 57 "../src/cuda/kernels.cu"
(dest[pos]) = ((double)((src[pos]) / value));
# 58 "../src/cuda/kernels.cu"
}
# 58 "../src/cuda/kernels.cu"
else
# 58 "../src/cuda/kernels.cu"
{
# 59 "../src/cuda/kernels.cu"
(dest[pos]) = (0.0);
# 60 "../src/cuda/kernels.cu"
} { if (!(this)) { __T220 = 0; } }
# 61 "../src/cuda/kernels.cu"
}}
__asm__(".align 2");
# 67 "../src/cuda/kernels.cu"
 __attribute__((device)) __inline__ void _ZN28CastNormalizeMatrixOperationIidEclEPdPiii( struct _Z28CastNormalizeMatrixOperationIidE *const this,
# 67 "../src/cuda/kernels.cu"
double *dest,
# 67 "../src/cuda/kernels.cu"
int *src,
# 67 "../src/cuda/kernels.cu"
int value,
# 67 "../src/cuda/kernels.cu"
int pos){
# 67 "../src/cuda/kernels.cu"
{ int __T221;
# 68 "../src/cuda/kernels.cu"
if (value != 0)
# 68 "../src/cuda/kernels.cu"
{
# 69 "../src/cuda/kernels.cu"
(dest[pos]) = ( fdivide(((double)(src[pos])) , ((double)value)));
# 70 "../src/cuda/kernels.cu"
}
# 70 "../src/cuda/kernels.cu"
else
# 70 "../src/cuda/kernels.cu"
{
# 71 "../src/cuda/kernels.cu"
(dest[pos]) = (0.0);
# 72 "../src/cuda/kernels.cu"
} { if (!(this)) { __T221 = 0; } }
# 73 "../src/cuda/kernels.cu"
}}
