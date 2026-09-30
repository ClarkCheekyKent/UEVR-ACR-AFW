;
; Note: shader requires additional functionality:
;       Typed UAV Load Additional Formats
;
;
; Input signature:
;
; Name                 Index   Mask Register SysValue  Format   Used
; -------------------- ----- ------ -------- -------- ------- ------
; no parameters
;
; Output signature:
;
; Name                 Index   Mask Register SysValue  Format   Used
; -------------------- ----- ------ -------- -------- ------- ------
; no parameters
; shader hash: 3aa29daf2b187b6c409166e10b4bcddc
;
; Pipeline Runtime Information: 
;
;PSVRuntimeInfo:
; Compute Shader
; NumThreads=(16,16,1)
; MinimumExpectedWaveLaneCount: 0
; MaximumExpectedWaveLaneCount: 4294967295
; UsesViewID: false
; SigInputElements: 0
; SigOutputElements: 0
; SigPatchConstOrPrimElements: 0
; SigInputVectors: 0
; SigOutputVectors[0]: 0
; SigOutputVectors[1]: 0
; SigOutputVectors[2]: 0
; SigOutputVectors[3]: 0
; EntryFunctionName: main
;
;
; Buffer Definitions:
;
; cbuffer matrices
; {
;
;   struct hostlayout.matrices
;   {
;
;       column_major float4x4 _DestWorldToView;       ; Offset:    0
;       column_major float4x4 _DestViewToWorld;       ; Offset:   64
;       column_major float4x4 _DestViewToClip;        ; Offset:  128
;       column_major float4x4 _DestClipToView;        ; Offset:  192
;       column_major float4x4 _DestWorldToClip;       ; Offset:  256
;       column_major float4x4 _DestClipToWorld;       ; Offset:  320
;       column_major float4x4 _SrcWorldToView;        ; Offset:  384
;       column_major float4x4 _SrcViewToWorld;        ; Offset:  448
;       column_major float4x4 _SrcViewToClip;         ; Offset:  512
;       column_major float4x4 _SrcClipToView;         ; Offset:  576
;       column_major float4x4 _SrcWorldToClip;        ; Offset:  640
;       column_major float4x4 _SrcClipToWorld;        ; Offset:  704
;       column_major float4x4 _SrcWorldToViewPrev;    ; Offset:  768
;       column_major float4x4 _SrcViewToWorldPrev;    ; Offset:  832
;       column_major float4x4 _SrcViewToClipPrev;     ; Offset:  896
;       column_major float4x4 _SrcClipToViewPrev;     ; Offset:  960
;       column_major float4x4 _SrcWorldToClipPrev;    ; Offset: 1024
;       column_major float4x4 _SrcClipToWorldPrev;    ; Offset: 1088
;       column_major float4x4 _DestWorldToViewPrev;   ; Offset: 1152
;       column_major float4x4 _DestViewToWorldPrev;   ; Offset: 1216
;       column_major float4x4 _DestViewToClipPrev;    ; Offset: 1280
;       column_major float4x4 _DestClipToViewPrev;    ; Offset: 1344
;       column_major float4x4 _DestWorldToClipPrev;   ; Offset: 1408
;       column_major float4x4 _DestClipToWorldPrev;   ; Offset: 1472
;       column_major float4x4 _UIEyeWorldToView;      ; Offset: 1536
;       column_major float4x4 _UIEyeViewToWorld;      ; Offset: 1600
;       column_major float4x4 _UIEyeViewToClip;       ; Offset: 1664
;       column_major float4x4 _UIEyeClipToView;       ; Offset: 1728
;       column_major float4x4 _UIEyeWorldToClip;      ; Offset: 1792
;       column_major float4x4 _UIEyeClipToWorld;      ; Offset: 1856
;       column_major float4x4 _CamWorldToView;        ; Offset: 1920
;       column_major float4x4 _CamViewToWorld;        ; Offset: 1984
;       column_major float4x4 _CamViewToClip;         ; Offset: 2048
;       column_major float4x4 _CamClipToView;         ; Offset: 2112
;       column_major float4x4 _CamWorldToClip;        ; Offset: 2176
;       column_major float4x4 _CamClipToWorld;        ; Offset: 2240
;       float4 _UIQuadPosViewSpace;                   ; Offset: 2304
;       float2 _UIScale;                              ; Offset: 2320
;       float4 _MotionScale;                          ; Offset: 2336
;       float4 _RenderSizes;                          ; Offset: 2352
;       float4 _FoveatedArea;                         ; Offset: 2368
;       float _AspectRatio;                           ; Offset: 2384
;       float _IgnoreMotionThreshold;                 ; Offset: 2388
;       int _EyeIndex;                                ; Offset: 2392
;       int _SkipUIElements;                          ; Offset: 2396
;       int _UseMotionVectors;                        ; Offset: 2400
;       int _UseEyeMask;                              ; Offset: 2404
;       int _IsPreviousFrame;                         ; Offset: 2408
;       int _MotionVectorsType;                       ; Offset: 2412
;       int _Debug;                                   ; Offset: 2416
;       int _IsFoveated;                              ; Offset: 2420
;       int _IsMoving;                                ; Offset: 2424
;       int _IsRotating;                              ; Offset: 2428
;       uint _ShadingRate;                            ; Offset: 2432
;       int _IsUsingUEVelocity;                       ; Offset: 2436
;   
;   } matrices;                                       ; Offset:    0 Size:  2440
;
; }
;
;
; Resource Bindings:
;
; Name                                 Type  Format         Dim      ID      HLSL Bind  Count
; ------------------------------ ---------- ------- ----------- ------- -------------- ------
; matrices                          cbuffer      NA          NA     CB0            cb0     1
; pointSampler                      sampler      NA          NA      S0      s0,space1     1
; _SrcColorTex                      texture     f32          2d      T0             t0     1
; _SrcDepthTex                      texture     f32          2d      T1             t1     1
; _SrcEyeMaskTex                    texture     u32          2d      T2             t3     1
; _DestColorTex                         UAV     f32          2d      U0             u0     1
; _DestDepthTex                         UAV     u32          2d      U1             u1     1
; _OccludedMaskTex                      UAV     u32          2d      U2      u2,space1     1
; _MovingObjEyeMaskTex                  UAV     u32          2d      U3      u0,space2     1
;
target datalayout = "e-m:e-p:32:32-i1:32-i8:32-i16:32-i32:32-i64:64-f16:32-f32:32-f64:64-n8:16:32:64"
target triple = "dxil-ms-dx"

%dx.types.Handle = type { i8* }
%dx.types.CBufRet.f32 = type { float, float, float, float }
%dx.types.CBufRet.i32 = type { i32, i32, i32, i32 }
%dx.types.ResRet.i32 = type { i32, i32, i32, i32, i32 }
%dx.types.ResRet.f32 = type { float, float, float, float, i32 }
%"class.Texture2D<vector<float, 4> >" = type { <4 x float>, %"class.Texture2D<vector<float, 4> >::mips_type" }
%"class.Texture2D<vector<float, 4> >::mips_type" = type { i32 }
%"class.Texture2D<float>" = type { float, %"class.Texture2D<float>::mips_type" }
%"class.Texture2D<float>::mips_type" = type { i32 }
%"class.Texture2D<unsigned int>" = type { i32, %"class.Texture2D<unsigned int>::mips_type" }
%"class.Texture2D<unsigned int>::mips_type" = type { i32 }
%"class.RWTexture2D<vector<float, 4> >" = type { <4 x float> }
%"class.RWTexture2D<unsigned int>" = type { i32 }
%hostlayout.matrices = type { [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], <4 x float>, <2 x float>, <4 x float>, <4 x float>, <4 x float>, float, float, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.SamplerState = type { i32 }

define void @main() {
  %1 = call %dx.types.Handle @dx.op.createHandle(i32 57, i8 1, i32 3, i32 0, i1 false)  ; CreateHandle(resourceClass,rangeId,index,nonUniformIndex)
  %2 = call %dx.types.Handle @dx.op.createHandle(i32 57, i8 1, i32 2, i32 2, i1 false)  ; CreateHandle(resourceClass,rangeId,index,nonUniformIndex)
  %3 = call %dx.types.Handle @dx.op.createHandle(i32 57, i8 1, i32 1, i32 1, i1 false)  ; CreateHandle(resourceClass,rangeId,index,nonUniformIndex)
  %4 = call %dx.types.Handle @dx.op.createHandle(i32 57, i8 1, i32 0, i32 0, i1 false)  ; CreateHandle(resourceClass,rangeId,index,nonUniformIndex)
  %5 = call %dx.types.Handle @dx.op.createHandle(i32 57, i8 0, i32 2, i32 3, i1 false)  ; CreateHandle(resourceClass,rangeId,index,nonUniformIndex)
  %6 = call %dx.types.Handle @dx.op.createHandle(i32 57, i8 0, i32 1, i32 1, i1 false)  ; CreateHandle(resourceClass,rangeId,index,nonUniformIndex)
  %7 = call %dx.types.Handle @dx.op.createHandle(i32 57, i8 0, i32 0, i32 0, i1 false)  ; CreateHandle(resourceClass,rangeId,index,nonUniformIndex)
  %8 = call %dx.types.Handle @dx.op.createHandle(i32 57, i8 3, i32 0, i32 0, i1 false)  ; CreateHandle(resourceClass,rangeId,index,nonUniformIndex)
  %9 = call %dx.types.Handle @dx.op.createHandle(i32 57, i8 2, i32 0, i32 0, i1 false)  ; CreateHandle(resourceClass,rangeId,index,nonUniformIndex)
  %10 = call i32 @dx.op.threadId.i32(i32 93, i32 0)  ; ThreadId(component)
  %11 = call i32 @dx.op.threadId.i32(i32 93, i32 1)  ; ThreadId(component)
  %12 = uitofp i32 %10 to float
  %13 = uitofp i32 %11 to float
  %14 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %9, i32 147)  ; CBufferLoadLegacy(handle,regIndex)
  %15 = extractvalue %dx.types.CBufRet.f32 %14, 0
  %16 = extractvalue %dx.types.CBufRet.f32 %14, 1
  %17 = fcmp fast oge float %12, %15
  %18 = fcmp fast oge float %13, %16
  %19 = or i1 %17, %18
  br i1 %19, label %349, label %20

; <label>:20                                      ; preds = %0
  %21 = fadd fast float %12, 5.000000e-01
  %22 = fadd fast float %13, 5.000000e-01
  %23 = extractvalue %dx.types.CBufRet.f32 %14, 2
  %24 = extractvalue %dx.types.CBufRet.f32 %14, 3
  %25 = fmul fast float %23, %21
  %26 = fmul fast float %24, %22
  %27 = call %dx.types.CBufRet.i32 @dx.op.cbufferLoadLegacy.i32(i32 59, %dx.types.Handle %9, i32 150)  ; CBufferLoadLegacy(handle,regIndex)
  %28 = extractvalue %dx.types.CBufRet.i32 %27, 1
  %29 = icmp sgt i32 %28, 0
  br i1 %29, label %30, label %34

; <label>:30                                      ; preds = %20
  %31 = call %dx.types.ResRet.i32 @dx.op.textureLoad.i32(i32 66, %dx.types.Handle %5, i32 0, i32 %10, i32 %11, i32 undef, i32 undef, i32 undef, i32 undef)  ; TextureLoad(srv,mipLevelOrSampleCount,coord0,coord1,coord2,offset0,offset1,offset2)
  %32 = extractvalue %dx.types.ResRet.i32 %31, 0
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %349, label %34

; <label>:34                                      ; preds = %30, %20
  %35 = phi i1 [ %29, %30 ], [ false, %20 ]
  br i1 %35, label %36, label %40

; <label>:36                                      ; preds = %34
  %37 = call %dx.types.ResRet.i32 @dx.op.textureLoad.i32(i32 66, %dx.types.Handle %5, i32 0, i32 %10, i32 %11, i32 undef, i32 undef, i32 undef, i32 undef)  ; TextureLoad(srv,mipLevelOrSampleCount,coord0,coord1,coord2,offset0,offset1,offset2)
  %38 = extractvalue %dx.types.ResRet.i32 %37, 0
  %39 = icmp eq i32 %38, 10
  br i1 %39, label %349, label %40

; <label>:40                                      ; preds = %36, %34
  %41 = call %dx.types.ResRet.f32 @dx.op.sampleLevel.f32(i32 62, %dx.types.Handle %6, %dx.types.Handle %8, float %25, float %26, float undef, float undef, i32 0, i32 0, i32 undef, float 0.000000e+00)  ; SampleLevel(srv,sampler,coord0,coord1,coord2,coord3,offset0,offset1,offset2,LOD)
  %42 = extractvalue %dx.types.ResRet.f32 %41, 0
  %43 = extractvalue %dx.types.CBufRet.i32 %27, 2
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %66, label %45

; <label>:45                                      ; preds = %40
  %46 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %9, i32 92)  ; CBufferLoadLegacy(handle,regIndex)
  %47 = extractvalue %dx.types.CBufRet.f32 %46, 0
  %48 = extractvalue %dx.types.CBufRet.f32 %46, 1
  %49 = extractvalue %dx.types.CBufRet.f32 %46, 2
  %50 = extractvalue %dx.types.CBufRet.f32 %46, 3
  %51 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %9, i32 93)  ; CBufferLoadLegacy(handle,regIndex)
  %52 = extractvalue %dx.types.CBufRet.f32 %51, 0
  %53 = extractvalue %dx.types.CBufRet.f32 %51, 1
  %54 = extractvalue %dx.types.CBufRet.f32 %51, 2
  %55 = extractvalue %dx.types.CBufRet.f32 %51, 3
  %56 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %9, i32 94)  ; CBufferLoadLegacy(handle,regIndex)
  %57 = extractvalue %dx.types.CBufRet.f32 %56, 0
  %58 = extractvalue %dx.types.CBufRet.f32 %56, 1
  %59 = extractvalue %dx.types.CBufRet.f32 %56, 2
  %60 = extractvalue %dx.types.CBufRet.f32 %56, 3
  %61 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %9, i32 95)  ; CBufferLoadLegacy(handle,regIndex)
  %62 = extractvalue %dx.types.CBufRet.f32 %61, 0
  %63 = extractvalue %dx.types.CBufRet.f32 %61, 1
  %64 = extractvalue %dx.types.CBufRet.f32 %61, 2
  %65 = extractvalue %dx.types.CBufRet.f32 %61, 3
  br label %87

; <label>:66                                      ; preds = %40
  %67 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %9, i32 44)  ; CBufferLoadLegacy(handle,regIndex)
  %68 = extractvalue %dx.types.CBufRet.f32 %67, 0
  %69 = extractvalue %dx.types.CBufRet.f32 %67, 1
  %70 = extractvalue %dx.types.CBufRet.f32 %67, 2
  %71 = extractvalue %dx.types.CBufRet.f32 %67, 3
  %72 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %9, i32 45)  ; CBufferLoadLegacy(handle,regIndex)
  %73 = extractvalue %dx.types.CBufRet.f32 %72, 0
  %74 = extractvalue %dx.types.CBufRet.f32 %72, 1
  %75 = extractvalue %dx.types.CBufRet.f32 %72, 2
  %76 = extractvalue %dx.types.CBufRet.f32 %72, 3
  %77 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %9, i32 46)  ; CBufferLoadLegacy(handle,regIndex)
  %78 = extractvalue %dx.types.CBufRet.f32 %77, 0
  %79 = extractvalue %dx.types.CBufRet.f32 %77, 1
  %80 = extractvalue %dx.types.CBufRet.f32 %77, 2
  %81 = extractvalue %dx.types.CBufRet.f32 %77, 3
  %82 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %9, i32 47)  ; CBufferLoadLegacy(handle,regIndex)
  %83 = extractvalue %dx.types.CBufRet.f32 %82, 0
  %84 = extractvalue %dx.types.CBufRet.f32 %82, 1
  %85 = extractvalue %dx.types.CBufRet.f32 %82, 2
  %86 = extractvalue %dx.types.CBufRet.f32 %82, 3
  br label %87

; <label>:87                                      ; preds = %66, %45
  %88 = phi float [ %47, %45 ], [ %68, %66 ]
  %89 = phi float [ %48, %45 ], [ %69, %66 ]
  %90 = phi float [ %49, %45 ], [ %70, %66 ]
  %91 = phi float [ %50, %45 ], [ %71, %66 ]
  %92 = phi float [ %52, %45 ], [ %73, %66 ]
  %93 = phi float [ %53, %45 ], [ %74, %66 ]
  %94 = phi float [ %54, %45 ], [ %75, %66 ]
  %95 = phi float [ %55, %45 ], [ %76, %66 ]
  %96 = phi float [ %57, %45 ], [ %78, %66 ]
  %97 = phi float [ %58, %45 ], [ %79, %66 ]
  %98 = phi float [ %59, %45 ], [ %80, %66 ]
  %99 = phi float [ %60, %45 ], [ %81, %66 ]
  %100 = phi float [ %62, %45 ], [ %83, %66 ]
  %101 = phi float [ %63, %45 ], [ %84, %66 ]
  %102 = phi float [ %64, %45 ], [ %85, %66 ]
  %103 = phi float [ %65, %45 ], [ %86, %66 ]
  %104 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %9, i32 16)  ; CBufferLoadLegacy(handle,regIndex)
  %105 = extractvalue %dx.types.CBufRet.f32 %104, 0
  %106 = extractvalue %dx.types.CBufRet.f32 %104, 1
  %107 = extractvalue %dx.types.CBufRet.f32 %104, 2
  %108 = extractvalue %dx.types.CBufRet.f32 %104, 3
  %109 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %9, i32 17)  ; CBufferLoadLegacy(handle,regIndex)
  %110 = extractvalue %dx.types.CBufRet.f32 %109, 0
  %111 = extractvalue %dx.types.CBufRet.f32 %109, 1
  %112 = extractvalue %dx.types.CBufRet.f32 %109, 2
  %113 = extractvalue %dx.types.CBufRet.f32 %109, 3
  %114 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %9, i32 18)  ; CBufferLoadLegacy(handle,regIndex)
  %115 = extractvalue %dx.types.CBufRet.f32 %114, 0
  %116 = extractvalue %dx.types.CBufRet.f32 %114, 1
  %117 = extractvalue %dx.types.CBufRet.f32 %114, 2
  %118 = extractvalue %dx.types.CBufRet.f32 %114, 3
  %119 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %9, i32 19)  ; CBufferLoadLegacy(handle,regIndex)
  %120 = extractvalue %dx.types.CBufRet.f32 %119, 0
  %121 = extractvalue %dx.types.CBufRet.f32 %119, 1
  %122 = extractvalue %dx.types.CBufRet.f32 %119, 2
  %123 = extractvalue %dx.types.CBufRet.f32 %119, 3
  br i1 %44, label %242, label %124

; <label>:124                                     ; preds = %87
  %125 = icmp eq i32 %28, 0
  br i1 %125, label %130, label %126

; <label>:126                                     ; preds = %124
  %127 = call %dx.types.ResRet.i32 @dx.op.textureLoad.i32(i32 66, %dx.types.Handle %5, i32 0, i32 %10, i32 %11, i32 undef, i32 undef, i32 undef, i32 undef)  ; TextureLoad(srv,mipLevelOrSampleCount,coord0,coord1,coord2,offset0,offset1,offset2)
  %128 = extractvalue %dx.types.ResRet.i32 %127, 0
  %129 = icmp eq i32 %128, 10
  br i1 %129, label %130, label %242

; <label>:130                                     ; preds = %126, %124
  %131 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %9, i32 35)  ; CBufferLoadLegacy(handle,regIndex)
  %132 = extractvalue %dx.types.CBufRet.f32 %131, 2
  %133 = fadd fast float %42, 0x3EB0C6F7A0000000
  %134 = fdiv fast float %132, %133
  %135 = fcmp fast olt float %134, 1.000000e+00
  br i1 %135, label %136, label %242

; <label>:136                                     ; preds = %130
  %137 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %9, i32 76)  ; CBufferLoadLegacy(handle,regIndex)
  %138 = extractvalue %dx.types.CBufRet.f32 %137, 0
  %139 = extractvalue %dx.types.CBufRet.f32 %137, 1
  %140 = extractvalue %dx.types.CBufRet.f32 %137, 2
  %141 = extractvalue %dx.types.CBufRet.f32 %137, 3
  %142 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %9, i32 77)  ; CBufferLoadLegacy(handle,regIndex)
  %143 = extractvalue %dx.types.CBufRet.f32 %142, 0
  %144 = extractvalue %dx.types.CBufRet.f32 %142, 1
  %145 = extractvalue %dx.types.CBufRet.f32 %142, 2
  %146 = extractvalue %dx.types.CBufRet.f32 %142, 3
  %147 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %9, i32 78)  ; CBufferLoadLegacy(handle,regIndex)
  %148 = extractvalue %dx.types.CBufRet.f32 %147, 0
  %149 = extractvalue %dx.types.CBufRet.f32 %147, 1
  %150 = extractvalue %dx.types.CBufRet.f32 %147, 2
  %151 = extractvalue %dx.types.CBufRet.f32 %147, 3
  %152 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %9, i32 79)  ; CBufferLoadLegacy(handle,regIndex)
  %153 = extractvalue %dx.types.CBufRet.f32 %152, 3
  %154 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %9, i32 7)  ; CBufferLoadLegacy(handle,regIndex)
  %155 = extractvalue %dx.types.CBufRet.f32 %154, 0
  %156 = extractvalue %dx.types.CBufRet.f32 %154, 1
  %157 = extractvalue %dx.types.CBufRet.f32 %154, 2
  %158 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %9, i32 84)  ; CBufferLoadLegacy(handle,regIndex)
  %159 = extractvalue %dx.types.CBufRet.f32 %158, 0
  %160 = extractvalue %dx.types.CBufRet.f32 %158, 1
  %161 = extractvalue %dx.types.CBufRet.f32 %158, 2
  %162 = extractvalue %dx.types.CBufRet.f32 %158, 3
  %163 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %9, i32 85)  ; CBufferLoadLegacy(handle,regIndex)
  %164 = extractvalue %dx.types.CBufRet.f32 %163, 0
  %165 = extractvalue %dx.types.CBufRet.f32 %163, 1
  %166 = extractvalue %dx.types.CBufRet.f32 %163, 2
  %167 = extractvalue %dx.types.CBufRet.f32 %163, 3
  %168 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %9, i32 86)  ; CBufferLoadLegacy(handle,regIndex)
  %169 = extractvalue %dx.types.CBufRet.f32 %168, 0
  %170 = extractvalue %dx.types.CBufRet.f32 %168, 1
  %171 = extractvalue %dx.types.CBufRet.f32 %168, 2
  %172 = extractvalue %dx.types.CBufRet.f32 %168, 3
  %173 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %9, i32 87)  ; CBufferLoadLegacy(handle,regIndex)
  %174 = extractvalue %dx.types.CBufRet.f32 %173, 0
  %175 = extractvalue %dx.types.CBufRet.f32 %173, 1
  %176 = extractvalue %dx.types.CBufRet.f32 %173, 2
  %177 = extractvalue %dx.types.CBufRet.f32 %173, 3
  %178 = fmul fast float %159, %138
  %179 = call float @dx.op.tertiary.f32(i32 46, float %143, float %160, float %178)  ; FMad(a,b,c)
  %180 = call float @dx.op.tertiary.f32(i32 46, float %148, float %161, float %179)  ; FMad(a,b,c)
  %181 = call float @dx.op.tertiary.f32(i32 46, float %155, float %162, float %180)  ; FMad(a,b,c)
  %182 = fmul fast float %164, %138
  %183 = call float @dx.op.tertiary.f32(i32 46, float %143, float %165, float %182)  ; FMad(a,b,c)
  %184 = call float @dx.op.tertiary.f32(i32 46, float %148, float %166, float %183)  ; FMad(a,b,c)
  %185 = call float @dx.op.tertiary.f32(i32 46, float %155, float %167, float %184)  ; FMad(a,b,c)
  %186 = fmul fast float %169, %138
  %187 = call float @dx.op.tertiary.f32(i32 46, float %143, float %170, float %186)  ; FMad(a,b,c)
  %188 = call float @dx.op.tertiary.f32(i32 46, float %148, float %171, float %187)  ; FMad(a,b,c)
  %189 = call float @dx.op.tertiary.f32(i32 46, float %155, float %172, float %188)  ; FMad(a,b,c)
  %190 = fmul fast float %174, %138
  %191 = call float @dx.op.tertiary.f32(i32 46, float %143, float %175, float %190)  ; FMad(a,b,c)
  %192 = call float @dx.op.tertiary.f32(i32 46, float %148, float %176, float %191)  ; FMad(a,b,c)
  %193 = call float @dx.op.tertiary.f32(i32 46, float %155, float %177, float %192)  ; FMad(a,b,c)
  %194 = fmul fast float %159, %139
  %195 = call float @dx.op.tertiary.f32(i32 46, float %144, float %160, float %194)  ; FMad(a,b,c)
  %196 = call float @dx.op.tertiary.f32(i32 46, float %149, float %161, float %195)  ; FMad(a,b,c)
  %197 = call float @dx.op.tertiary.f32(i32 46, float %156, float %162, float %196)  ; FMad(a,b,c)
  %198 = fmul fast float %164, %139
  %199 = call float @dx.op.tertiary.f32(i32 46, float %144, float %165, float %198)  ; FMad(a,b,c)
  %200 = call float @dx.op.tertiary.f32(i32 46, float %149, float %166, float %199)  ; FMad(a,b,c)
  %201 = call float @dx.op.tertiary.f32(i32 46, float %156, float %167, float %200)  ; FMad(a,b,c)
  %202 = fmul fast float %169, %139
  %203 = call float @dx.op.tertiary.f32(i32 46, float %144, float %170, float %202)  ; FMad(a,b,c)
  %204 = call float @dx.op.tertiary.f32(i32 46, float %149, float %171, float %203)  ; FMad(a,b,c)
  %205 = call float @dx.op.tertiary.f32(i32 46, float %156, float %172, float %204)  ; FMad(a,b,c)
  %206 = fmul fast float %174, %139
  %207 = call float @dx.op.tertiary.f32(i32 46, float %144, float %175, float %206)  ; FMad(a,b,c)
  %208 = call float @dx.op.tertiary.f32(i32 46, float %149, float %176, float %207)  ; FMad(a,b,c)
  %209 = call float @dx.op.tertiary.f32(i32 46, float %156, float %177, float %208)  ; FMad(a,b,c)
  %210 = fmul fast float %159, %140
  %211 = call float @dx.op.tertiary.f32(i32 46, float %145, float %160, float %210)  ; FMad(a,b,c)
  %212 = call float @dx.op.tertiary.f32(i32 46, float %150, float %161, float %211)  ; FMad(a,b,c)
  %213 = call float @dx.op.tertiary.f32(i32 46, float %157, float %162, float %212)  ; FMad(a,b,c)
  %214 = fmul fast float %164, %140
  %215 = call float @dx.op.tertiary.f32(i32 46, float %145, float %165, float %214)  ; FMad(a,b,c)
  %216 = call float @dx.op.tertiary.f32(i32 46, float %150, float %166, float %215)  ; FMad(a,b,c)
  %217 = call float @dx.op.tertiary.f32(i32 46, float %157, float %167, float %216)  ; FMad(a,b,c)
  %218 = fmul fast float %169, %140
  %219 = call float @dx.op.tertiary.f32(i32 46, float %145, float %170, float %218)  ; FMad(a,b,c)
  %220 = call float @dx.op.tertiary.f32(i32 46, float %150, float %171, float %219)  ; FMad(a,b,c)
  %221 = call float @dx.op.tertiary.f32(i32 46, float %157, float %172, float %220)  ; FMad(a,b,c)
  %222 = fmul fast float %174, %140
  %223 = call float @dx.op.tertiary.f32(i32 46, float %145, float %175, float %222)  ; FMad(a,b,c)
  %224 = call float @dx.op.tertiary.f32(i32 46, float %150, float %176, float %223)  ; FMad(a,b,c)
  %225 = call float @dx.op.tertiary.f32(i32 46, float %157, float %177, float %224)  ; FMad(a,b,c)
  %226 = fmul fast float %159, %141
  %227 = call float @dx.op.tertiary.f32(i32 46, float %146, float %160, float %226)  ; FMad(a,b,c)
  %228 = call float @dx.op.tertiary.f32(i32 46, float %151, float %161, float %227)  ; FMad(a,b,c)
  %229 = call float @dx.op.tertiary.f32(i32 46, float %153, float %162, float %228)  ; FMad(a,b,c)
  %230 = fmul fast float %164, %141
  %231 = call float @dx.op.tertiary.f32(i32 46, float %146, float %165, float %230)  ; FMad(a,b,c)
  %232 = call float @dx.op.tertiary.f32(i32 46, float %151, float %166, float %231)  ; FMad(a,b,c)
  %233 = call float @dx.op.tertiary.f32(i32 46, float %153, float %167, float %232)  ; FMad(a,b,c)
  %234 = fmul fast float %169, %141
  %235 = call float @dx.op.tertiary.f32(i32 46, float %146, float %170, float %234)  ; FMad(a,b,c)
  %236 = call float @dx.op.tertiary.f32(i32 46, float %151, float %171, float %235)  ; FMad(a,b,c)
  %237 = call float @dx.op.tertiary.f32(i32 46, float %153, float %172, float %236)  ; FMad(a,b,c)
  %238 = fmul fast float %174, %141
  %239 = call float @dx.op.tertiary.f32(i32 46, float %146, float %175, float %238)  ; FMad(a,b,c)
  %240 = call float @dx.op.tertiary.f32(i32 46, float %151, float %176, float %239)  ; FMad(a,b,c)
  %241 = call float @dx.op.tertiary.f32(i32 46, float %153, float %177, float %240)  ; FMad(a,b,c)
  br label %242

; <label>:242                                     ; preds = %136, %130, %126, %87
  %243 = phi float [ %181, %136 ], [ %88, %130 ], [ %88, %126 ], [ %88, %87 ]
  %244 = phi float [ %197, %136 ], [ %89, %130 ], [ %89, %126 ], [ %89, %87 ]
  %245 = phi float [ %213, %136 ], [ %90, %130 ], [ %90, %126 ], [ %90, %87 ]
  %246 = phi float [ %229, %136 ], [ %91, %130 ], [ %91, %126 ], [ %91, %87 ]
  %247 = phi float [ %185, %136 ], [ %92, %130 ], [ %92, %126 ], [ %92, %87 ]
  %248 = phi float [ %201, %136 ], [ %93, %130 ], [ %93, %126 ], [ %93, %87 ]
  %249 = phi float [ %217, %136 ], [ %94, %130 ], [ %94, %126 ], [ %94, %87 ]
  %250 = phi float [ %233, %136 ], [ %95, %130 ], [ %95, %126 ], [ %95, %87 ]
  %251 = phi float [ %189, %136 ], [ %96, %130 ], [ %96, %126 ], [ %96, %87 ]
  %252 = phi float [ %205, %136 ], [ %97, %130 ], [ %97, %126 ], [ %97, %87 ]
  %253 = phi float [ %221, %136 ], [ %98, %130 ], [ %98, %126 ], [ %98, %87 ]
  %254 = phi float [ %237, %136 ], [ %99, %130 ], [ %99, %126 ], [ %99, %87 ]
  %255 = phi float [ %193, %136 ], [ %100, %130 ], [ %100, %126 ], [ %100, %87 ]
  %256 = phi float [ %209, %136 ], [ %101, %130 ], [ %101, %126 ], [ %101, %87 ]
  %257 = phi float [ %225, %136 ], [ %102, %130 ], [ %102, %126 ], [ %102, %87 ]
  %258 = phi float [ %241, %136 ], [ %103, %130 ], [ %103, %126 ], [ %103, %87 ]
  %259 = fsub fast float 1.000000e+00, %26
  %260 = fmul fast float %25, 2.000000e+00
  %261 = fmul fast float %259, 2.000000e+00
  %262 = fadd fast float %260, -1.000000e+00
  %263 = fadd fast float %261, -1.000000e+00
  %264 = fmul fast float %243, %262
  %265 = call float @dx.op.tertiary.f32(i32 46, float %247, float %263, float %264)  ; FMad(a,b,c)
  %266 = call float @dx.op.tertiary.f32(i32 46, float %251, float %42, float %265)  ; FMad(a,b,c)
  %267 = fadd fast float %266, %255
  %268 = fmul fast float %244, %262
  %269 = call float @dx.op.tertiary.f32(i32 46, float %248, float %263, float %268)  ; FMad(a,b,c)
  %270 = call float @dx.op.tertiary.f32(i32 46, float %252, float %42, float %269)  ; FMad(a,b,c)
  %271 = fadd fast float %270, %256
  %272 = fmul fast float %245, %262
  %273 = call float @dx.op.tertiary.f32(i32 46, float %249, float %263, float %272)  ; FMad(a,b,c)
  %274 = call float @dx.op.tertiary.f32(i32 46, float %253, float %42, float %273)  ; FMad(a,b,c)
  %275 = fadd fast float %274, %257
  %276 = fmul fast float %246, %262
  %277 = call float @dx.op.tertiary.f32(i32 46, float %250, float %263, float %276)  ; FMad(a,b,c)
  %278 = call float @dx.op.tertiary.f32(i32 46, float %254, float %42, float %277)  ; FMad(a,b,c)
  %279 = fadd fast float %278, %258
  %280 = fmul fast float %267, %105
  %281 = call float @dx.op.tertiary.f32(i32 46, float %110, float %271, float %280)  ; FMad(a,b,c)
  %282 = call float @dx.op.tertiary.f32(i32 46, float %115, float %275, float %281)  ; FMad(a,b,c)
  %283 = call float @dx.op.tertiary.f32(i32 46, float %120, float %279, float %282)  ; FMad(a,b,c)
  %284 = fmul fast float %267, %106
  %285 = call float @dx.op.tertiary.f32(i32 46, float %111, float %271, float %284)  ; FMad(a,b,c)
  %286 = call float @dx.op.tertiary.f32(i32 46, float %116, float %275, float %285)  ; FMad(a,b,c)
  %287 = call float @dx.op.tertiary.f32(i32 46, float %121, float %279, float %286)  ; FMad(a,b,c)
  %288 = fmul fast float %267, %107
  %289 = call float @dx.op.tertiary.f32(i32 46, float %112, float %271, float %288)  ; FMad(a,b,c)
  %290 = call float @dx.op.tertiary.f32(i32 46, float %117, float %275, float %289)  ; FMad(a,b,c)
  %291 = call float @dx.op.tertiary.f32(i32 46, float %122, float %279, float %290)  ; FMad(a,b,c)
  %292 = fmul fast float %267, %108
  %293 = call float @dx.op.tertiary.f32(i32 46, float %113, float %271, float %292)  ; FMad(a,b,c)
  %294 = call float @dx.op.tertiary.f32(i32 46, float %118, float %275, float %293)  ; FMad(a,b,c)
  %295 = call float @dx.op.tertiary.f32(i32 46, float %123, float %279, float %294)  ; FMad(a,b,c)
  %296 = fdiv fast float %283, %295
  %297 = fdiv fast float %287, %295
  %298 = fadd fast float %296, 1.000000e+00
  %299 = fadd fast float %297, 1.000000e+00
  %300 = fmul fast float %298, 5.000000e-01
  %301 = fmul fast float %299, 5.000000e-01
  %302 = fsub fast float 1.000000e+00, %301
  %303 = fdiv fast float %291, %295
  %304 = call float @dx.op.binary.f32(i32 35, float %303, float 0.000000e+00)  ; FMax(a,b)
  %305 = fcmp fast olt float %300, 0.000000e+00
  %306 = fcmp fast olt float %302, 0.000000e+00
  %307 = or i1 %305, %306
  %308 = fcmp fast oge float %300, 1.000000e+00
  %309 = or i1 %308, %307
  %310 = fcmp fast oge float %302, 1.000000e+00
  %311 = or i1 %310, %309
  br i1 %311, label %349, label %312

; <label>:312                                     ; preds = %242
  %313 = fmul fast float %300, %15
  %314 = fadd fast float %313, -5.000000e-01
  %315 = call float @dx.op.unary.f32(i32 26, float %314)  ; Round_ne(value)
  %316 = fptoui float %315 to i32
  %317 = fmul fast float %302, %16
  %318 = fadd fast float %317, -5.000000e-01
  %319 = call float @dx.op.unary.f32(i32 26, float %318)  ; Round_ne(value)
  %320 = fptoui float %319 to i32
  %321 = extractvalue %dx.types.CBufRet.i32 %27, 0
  %322 = icmp eq i32 %321, 0
  br i1 %322, label %327, label %323

; <label>:323                                     ; preds = %312
  %324 = call %dx.types.ResRet.i32 @dx.op.textureLoad.i32(i32 66, %dx.types.Handle %1, i32 undef, i32 %10, i32 %11, i32 undef, i32 undef, i32 undef, i32 undef)  ; TextureLoad(srv,mipLevelOrSampleCount,coord0,coord1,coord2,offset0,offset1,offset2)
  %325 = extractvalue %dx.types.ResRet.i32 %324, 0
  %326 = icmp eq i32 %325, 10
  br label %327

; <label>:327                                     ; preds = %323, %312
  %328 = phi i1 [ false, %312 ], [ %326, %323 ]
  %329 = call %dx.types.ResRet.i32 @dx.op.textureLoad.i32(i32 66, %dx.types.Handle %3, i32 undef, i32 %316, i32 %320, i32 undef, i32 undef, i32 undef, i32 undef)  ; TextureLoad(srv,mipLevelOrSampleCount,coord0,coord1,coord2,offset0,offset1,offset2)
  %330 = extractvalue %dx.types.ResRet.i32 %329, 0
  %331 = bitcast float %304 to i32
  %332 = icmp eq i32 %330, %331
  br i1 %332, label %333, label %349

; <label>:333                                     ; preds = %327
  br i1 %328, label %334, label %335

; <label>:334                                     ; preds = %333
  call void @dx.op.textureStore.i32(i32 67, %dx.types.Handle %2, i32 %316, i32 %320, i32 undef, i32 10, i32 10, i32 10, i32 10, i8 15)  ; TextureStore(srv,coord0,coord1,coord2,value0,value1,value2,value3,mask)
  br label %335

; <label>:335                                     ; preds = %334, %333
  %336 = call %dx.types.CBufRet.i32 @dx.op.cbufferLoadLegacy.i32(i32 59, %dx.types.Handle %9, i32 152)  ; CBufferLoadLegacy(handle,regIndex)
  %337 = extractvalue %dx.types.CBufRet.i32 %336, 0
  %338 = icmp ugt i32 %337, 9
  br i1 %338, label %339, label %343, !dx.controlflow.hints !23

; <label>:339                                     ; preds = %335
  %340 = call %dx.types.ResRet.f32 @dx.op.textureLoad.f32(i32 66, %dx.types.Handle %4, i32 undef, i32 %316, i32 %320, i32 undef, i32 undef, i32 undef, i32 undef)  ; TextureLoad(srv,mipLevelOrSampleCount,coord0,coord1,coord2,offset0,offset1,offset2)
  %341 = extractvalue %dx.types.ResRet.f32 %340, 2
  %342 = extractvalue %dx.types.ResRet.f32 %340, 3
  call void @dx.op.textureStore.f32(i32 67, %dx.types.Handle %4, i32 %316, i32 %320, i32 undef, float %25, float %26, float %341, float %342, i8 15)  ; TextureStore(srv,coord0,coord1,coord2,value0,value1,value2,value3,mask)
  br label %349

; <label>:343                                     ; preds = %335
  %344 = call %dx.types.ResRet.f32 @dx.op.textureLoad.f32(i32 66, %dx.types.Handle %7, i32 0, i32 %10, i32 %11, i32 undef, i32 undef, i32 undef, i32 undef)  ; TextureLoad(srv,mipLevelOrSampleCount,coord0,coord1,coord2,offset0,offset1,offset2)
  %345 = extractvalue %dx.types.ResRet.f32 %344, 0
  %346 = extractvalue %dx.types.ResRet.f32 %344, 1
  %347 = extractvalue %dx.types.ResRet.f32 %344, 2
  %348 = extractvalue %dx.types.ResRet.f32 %344, 3
  call void @dx.op.textureStore.f32(i32 67, %dx.types.Handle %4, i32 %316, i32 %320, i32 undef, float %345, float %346, float %347, float %348, i8 15)  ; TextureStore(srv,coord0,coord1,coord2,value0,value1,value2,value3,mask)
  br label %349

; <label>:349                                     ; preds = %343, %339, %327, %242, %36, %30, %0
  ret void
}

; Function Attrs: nounwind readnone
declare i32 @dx.op.threadId.i32(i32, i32) #0

; Function Attrs: nounwind readonly
declare %dx.types.ResRet.i32 @dx.op.textureLoad.i32(i32, %dx.types.Handle, i32, i32, i32, i32, i32, i32, i32) #1

; Function Attrs: nounwind
declare void @dx.op.textureStore.i32(i32, %dx.types.Handle, i32, i32, i32, i32, i32, i32, i32, i8) #2

; Function Attrs: nounwind readonly
declare %dx.types.ResRet.f32 @dx.op.sampleLevel.f32(i32, %dx.types.Handle, %dx.types.Handle, float, float, float, float, i32, i32, i32, float) #1

; Function Attrs: nounwind readnone
declare float @dx.op.binary.f32(i32, float, float) #0

; Function Attrs: nounwind readnone
declare float @dx.op.unary.f32(i32, float) #0

; Function Attrs: nounwind readonly
declare %dx.types.ResRet.f32 @dx.op.textureLoad.f32(i32, %dx.types.Handle, i32, i32, i32, i32, i32, i32, i32) #1

; Function Attrs: nounwind
declare void @dx.op.textureStore.f32(i32, %dx.types.Handle, i32, i32, i32, float, float, float, float, i8) #2

; Function Attrs: nounwind readonly
declare %dx.types.CBufRet.i32 @dx.op.cbufferLoadLegacy.i32(i32, %dx.types.Handle, i32) #1

; Function Attrs: nounwind readonly
declare %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32, %dx.types.Handle, i32) #1

; Function Attrs: nounwind readnone
declare float @dx.op.tertiary.f32(i32, float, float, float) #0

; Function Attrs: nounwind readonly
declare %dx.types.Handle @dx.op.createHandle(i32, i8, i32, i32, i1) #1

attributes #0 = { nounwind readnone }
attributes #1 = { nounwind readonly }
attributes #2 = { nounwind }

!llvm.ident = !{!0}
!dx.version = !{!1}
!dx.valver = !{!2}
!dx.shaderModel = !{!3}
!dx.resources = !{!4}
!dx.entryPoints = !{!20}

!0 = !{!"dxcoob 1.8.2502.11 (239921522)"}
!1 = !{i32 1, i32 1}
!2 = !{i32 1, i32 8}
!3 = !{!"cs", i32 6, i32 1}
!4 = !{!5, !11, !16, !18}
!5 = !{!6, !8, !9}
!6 = !{i32 0, %"class.Texture2D<vector<float, 4> >"* undef, !"", i32 0, i32 0, i32 1, i32 2, i32 0, !7}
!7 = !{i32 0, i32 9}
!8 = !{i32 1, %"class.Texture2D<float>"* undef, !"", i32 0, i32 1, i32 1, i32 2, i32 0, !7}
!9 = !{i32 2, %"class.Texture2D<unsigned int>"* undef, !"", i32 0, i32 3, i32 1, i32 2, i32 0, !10}
!10 = !{i32 0, i32 5}
!11 = !{!12, !13, !14, !15}
!12 = !{i32 0, %"class.RWTexture2D<vector<float, 4> >"* undef, !"", i32 0, i32 0, i32 1, i32 2, i1 false, i1 false, i1 false, !7}
!13 = !{i32 1, %"class.RWTexture2D<unsigned int>"* undef, !"", i32 0, i32 1, i32 1, i32 2, i1 false, i1 false, i1 false, !10}
!14 = !{i32 2, %"class.RWTexture2D<unsigned int>"* undef, !"", i32 1, i32 2, i32 1, i32 2, i1 false, i1 false, i1 false, !10}
!15 = !{i32 3, %"class.RWTexture2D<unsigned int>"* undef, !"", i32 2, i32 0, i32 1, i32 2, i1 false, i1 false, i1 false, !10}
!16 = !{!17}
!17 = !{i32 0, %hostlayout.matrices* undef, !"", i32 0, i32 0, i32 1, i32 2440, null}
!18 = !{!19}
!19 = !{i32 0, %struct.SamplerState* undef, !"", i32 1, i32 0, i32 1, i32 0, null}
!20 = !{void ()* @main, !"main", null, !4, !21}
!21 = !{i32 0, i64 8192, i32 4, !22}
!22 = !{i32 16, i32 16, i32 1}
!23 = distinct !{!23, !"dx.controlflow.hints", i32 1}
