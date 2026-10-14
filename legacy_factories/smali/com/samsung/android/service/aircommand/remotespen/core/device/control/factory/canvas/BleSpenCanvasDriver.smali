.class public Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;
.super Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/shared/BleSpenGenericDriver;
.source "BleSpenCanvasDriver.java"


# static fields
.field public static TAG:Ljava/lang/String; = "BleSpenCanvasDriver"

.field private static final UUID_LEGACY_SPEN_SERVICE:Ljava/util/UUID;

.field private static final UUID_SPEN_SERVICE:Ljava/util/UUID;


# instance fields
.field public mCurrentOperationMode:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;

.field private mIsButtonPressed:Z

.field private mSpenServiceUuid:Ljava/util/UUID;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "DC6BB0A8-202E-487C-8F1B-53B37CC837C6"

    .line 34
    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    sput-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->UUID_LEGACY_SPEN_SERVICE:Ljava/util/UUID;

    const-string v0, "0000FD6C-0000-1000-8000-00805F9B34FB"

    .line 35
    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    sput-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->UUID_SPEN_SERVICE:Ljava/util/UUID;

    .line 44
    const-class v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/samsung/android/service/aircommand/util/features/SpenModelName;Lc3/b;LP6/b;LW2/a;)V
    .locals 0

    .line 48
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/shared/BleSpenGenericDriver;-><init>(Lcom/samsung/android/service/aircommand/util/features/SpenModelName;Lc3/b;LP6/b;LW2/a;)V

    const/4 p1, 0x0

    .line 38
    iput-boolean p1, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->mIsButtonPressed:Z

    .line 39
    sget-object p1, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;->DEFAULT:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;

    iput-object p1, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->mCurrentOperationMode:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;

    return-void
.end method

.method public static synthetic access$000()Ljava/util/UUID;
    .locals 1

    .line 31
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->UUID_SPEN_SERVICE:Ljava/util/UUID;

    return-object v0
.end method

.method public static synthetic access$100(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;)Ljava/util/UUID;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->mSpenServiceUuid:Ljava/util/UUID;

    return-object p0
.end method

.method public static synthetic access$102(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;Ljava/util/UUID;)Ljava/util/UUID;
    .locals 0

    .line 31
    iput-object p1, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->mSpenServiceUuid:Ljava/util/UUID;

    return-object p1
.end method

.method public static synthetic access$200()Ljava/util/UUID;
    .locals 1

    .line 31
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->UUID_LEGACY_SPEN_SERVICE:Ljava/util/UUID;

    return-object v0
.end method

.method public static synthetic access$300(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;)Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenBleDriver;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mBleDriver:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenBleDriver;

    return-object p0
.end method

.method private dispatchButtonData([BIJLjava/lang/String;)I
    .locals 16

    move-object/from16 v7, p0

    move-object/from16 v0, p1

    move-wide/from16 v4, p3

    move-object/from16 v6, p5

    .line 292
    aget-byte v1, v0, p2

    const/16 v2, 0xff

    and-int/lit16 v8, v1, 0xff

    const/4 v1, 0x0

    const/4 v9, 0x6

    if-eqz v8, :cond_13

    const-string v3, ")"

    const/4 v10, 0x3

    const/4 v11, 0x1

    if-eq v8, v10, :cond_10

    if-eq v8, v2, :cond_8

    const/16 v10, 0xf

    const/16 v12, 0xe

    const/16 v13, 0x8f

    const/16 v14, 0x8e

    if-eq v8, v12, :cond_0

    if-eq v8, v10, :cond_0

    if-eq v8, v14, :cond_0

    if-eq v8, v13, :cond_0

    .line 424
    sget-object v1, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "dispatchButtonData : Unrecognized button header(0x"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v8}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/samsung/android/service/aircommand/util/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    .line 340
    :cond_0
    iget-object v3, v7, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->mCurrentOperationMode:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;

    sget-object v15, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;->SENSOR_ON:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;

    if-ne v3, v15, :cond_4

    .line 341
    iget-boolean v3, v7, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->mIsButtonPressed:Z

    if-eqz v3, :cond_2

    if-eq v8, v12, :cond_1

    if-ne v8, v14, :cond_2

    .line 342
    :cond_1
    sget-object v3, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->TAG:Ljava/lang/String;

    const-string v10, "dispatchButtonData : button up state detected"

    invoke-static {v3, v10}, Lcom/samsung/android/service/aircommand/util/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 343
    iput-boolean v1, v7, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->mIsButtonPressed:Z

    .line 344
    iget-object v1, v7, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mEventListener:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;

    if-eqz v1, :cond_4

    .line 345
    sget-object v1, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenButtonEvent$Action;->BUTTON_UP:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenButtonEvent$Action;

    invoke-virtual {v7, v1, v4, v5, v6}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/shared/BleSpenGenericDriver;->createButtonEvent(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenButtonEvent$Action;JLjava/lang/String;)Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenButtonEvent;

    move-result-object v1

    .line 346
    iget-object v3, v7, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mEventListener:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;

    invoke-virtual {v3, v1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;->onSensorEvent(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSensorEvent;)V

    goto :goto_0

    :cond_2
    if-nez v3, :cond_4

    if-eq v8, v10, :cond_3

    if-ne v8, v13, :cond_4

    .line 349
    :cond_3
    sget-object v1, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->TAG:Ljava/lang/String;

    const-string v3, "dispatchButtonData : button down state detected"

    invoke-static {v1, v3}, Lcom/samsung/android/service/aircommand/util/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 350
    iput-boolean v11, v7, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->mIsButtonPressed:Z

    .line 351
    iget-object v1, v7, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mEventListener:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;

    if-eqz v1, :cond_4

    .line 352
    sget-object v1, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenButtonEvent$Action;->BUTTON_DOWN:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenButtonEvent$Action;

    invoke-virtual {v7, v1, v4, v5, v6}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/shared/BleSpenGenericDriver;->createButtonEvent(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenButtonEvent$Action;JLjava/lang/String;)Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenButtonEvent;

    move-result-object v1

    .line 353
    iget-object v3, v7, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mEventListener:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;

    invoke-virtual {v3, v1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;->onSensorEvent(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSensorEvent;)V

    :cond_4
    :goto_0
    add-int/lit8 v1, p2, 0x1

    .line 357
    invoke-direct {v7, v0, v1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->extractShortValue([BI)S

    move-result v3

    add-int/lit8 v1, p2, 0x3

    .line 358
    invoke-direct {v7, v0, v1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->extractShortValue([BI)S

    move-result v10

    add-int/lit8 v1, p2, 0x5

    .line 359
    aget-byte v0, v0, v1

    and-int/2addr v0, v2

    .line 360
    sget-object v1, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "dispatchButtonData : Gesture("

    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v12, ") dx="

    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v12, ", dy="

    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v12, ", seq="

    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/samsung/android/service/aircommand/util/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 364
    iget-object v0, v7, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mEventListener:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;

    if-eqz v0, :cond_7

    .line 365
    sget-object v1, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenAirMotionEvent$Action;->MOVE:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenAirMotionEvent$Action;

    move-object/from16 v0, p0

    move v2, v3

    move v3, v10

    move-wide/from16 v4, p3

    move-object/from16 v6, p5

    invoke-virtual/range {v0 .. v6}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/shared/BleSpenGenericDriver;->createAirGestureEvent(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenAirMotionEvent$Action;IIJLjava/lang/String;)Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenAirMotionEvent;

    move-result-object v0

    if-eq v8, v14, :cond_5

    if-ne v8, v13, :cond_6

    .line 367
    :cond_5
    sget-object v1, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->TAG:Ljava/lang/String;

    const-string v2, "dispatchButtonData : Impurity motion data"

    invoke-static {v1, v2}, Lcom/samsung/android/service/aircommand/util/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 368
    invoke-virtual {v0, v11}, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenAirMotionEvent;->markAsImpurity(Z)V

    .line 370
    :cond_6
    iget-object v1, v7, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mEventListener:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;

    invoke-virtual {v1, v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;->onSensorEvent(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSensorEvent;)V

    :cond_7
    return v9

    :cond_8
    add-int/lit8 v1, p2, 0x1

    .line 376
    aget-byte v1, v0, v1

    and-int/2addr v1, v2

    if-eq v1, v11, :cond_d

    if-eq v1, v10, :cond_c

    const/4 v3, 0x4

    if-eq v1, v3, :cond_9

    .line 417
    sget-object v2, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "dispatchButtonData : unknown debug msg(0xFF) type : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/samsung/android/service/aircommand/util/debug/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    :cond_9
    add-int/lit8 v1, p2, 0x2

    .line 403
    aget-byte v1, v0, v1

    and-int/2addr v1, v2

    if-eqz v1, :cond_b

    if-eq v1, v11, :cond_a

    goto/16 :goto_1

    .line 410
    :cond_a
    iget-object v1, v7, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mEventListener:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;

    sget-object v2, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenBatteryState;->NOT_FULL:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenBatteryState;

    invoke-virtual {v1, v2}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;->onNotifyBatteryState(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenBatteryState;)V

    goto :goto_1

    .line 406
    :cond_b
    iget-object v1, v7, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mEventListener:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;

    sget-object v2, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenBatteryState;->FULL:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenBatteryState;

    invoke-virtual {v1, v2}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;->onNotifyBatteryState(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenBatteryState;)V

    goto :goto_1

    :cond_c
    add-int/lit8 v1, p2, 0x2

    .line 397
    aget-byte v1, v0, v1

    and-int/2addr v1, v2

    .line 398
    sget-object v2, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "dispatchButtonData : sensor state = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/samsung/android/service/aircommand/util/debug/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :cond_d
    add-int/lit8 v1, p2, 0x2

    .line 379
    aget-byte v1, v0, v1

    and-int/2addr v1, v2

    const/16 v3, 0xfe

    if-eq v1, v3, :cond_f

    if-eq v1, v2, :cond_e

    .line 390
    sget-object v2, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "dispatchButtonData : unknown calibration result : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/samsung/android/service/aircommand/util/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 386
    :cond_e
    sget-object v1, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->TAG:Ljava/lang/String;

    const-string v2, "dispatchButtonData : Motion sensor calibration success"

    invoke-static {v1, v2}, Lcom/samsung/android/service/aircommand/util/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 387
    new-instance v1, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;

    sget-object v2, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;->SUCCESS:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;

    invoke-direct {v1, v2}, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;-><init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;)V

    invoke-virtual {v7, v1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/shared/BleSpenGenericDriver;->invokeCalibrationFinishListener(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;)V

    goto :goto_1

    .line 382
    :cond_f
    sget-object v1, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->TAG:Ljava/lang/String;

    const-string v2, "dispatchButtonData : Motion sensor calibration failed"

    invoke-static {v1, v2}, Lcom/samsung/android/service/aircommand/util/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 383
    new-instance v1, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;

    sget-object v2, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;->CALIBRATION_FAIL:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;

    invoke-direct {v1, v2}, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;-><init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;)V

    invoke-virtual {v7, v1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/shared/BleSpenGenericDriver;->invokeCalibrationFinishListener(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;)V

    .line 427
    :goto_1
    array-length v0, v0

    sub-int v0, v0, p2

    return v0

    .line 314
    :cond_10
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "dispatchButtonData : Button Down("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/samsung/android/service/aircommand/util/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 315
    iget-boolean v0, v7, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->mIsButtonPressed:Z

    if-eqz v0, :cond_11

    .line 316
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->TAG:Ljava/lang/String;

    const-string v1, "dispatchButtonData : Button is already pressed state!"

    invoke-static {v0, v1}, Lcom/samsung/android/service/aircommand/util/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 317
    iget-object v0, v7, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mEventListener:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;

    if-eqz v0, :cond_11

    .line 318
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenButtonEvent$Action;->BUTTON_UP:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenButtonEvent$Action;

    invoke-virtual {v7, v0, v4, v5, v6}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/shared/BleSpenGenericDriver;->createButtonEvent(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenButtonEvent$Action;JLjava/lang/String;)Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenButtonEvent;

    move-result-object v0

    .line 319
    iget-object v1, v7, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mEventListener:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;

    invoke-virtual {v1, v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;->onSensorEvent(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSensorEvent;)V

    .line 323
    :cond_11
    iput-boolean v11, v7, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->mIsButtonPressed:Z

    .line 327
    iget-object v0, v7, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mEventListener:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;

    if-eqz v0, :cond_12

    .line 328
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenButtonEvent$Action;->BUTTON_DOWN:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenButtonEvent$Action;

    invoke-virtual {v7, v0, v4, v5, v6}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/shared/BleSpenGenericDriver;->createButtonEvent(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenButtonEvent$Action;JLjava/lang/String;)Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenButtonEvent;

    move-result-object v0

    .line 329
    iget-object v1, v7, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mEventListener:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;

    invoke-virtual {v1, v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;->onSensorEvent(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSensorEvent;)V

    :cond_12
    return v11

    .line 295
    :cond_13
    array-length v3, v0

    if-lt v3, v9, :cond_14

    add-int/lit8 v3, p2, 0x5

    aget-byte v0, v0, v3

    and-int/2addr v0, v2

    goto :goto_2

    :cond_14
    const/4 v0, -0x1

    .line 296
    :goto_2
    sget-object v2, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "dispatchButtonData : Button Up("

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v8, "), seq="

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/samsung/android/service/aircommand/util/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 297
    iget-boolean v0, v7, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->mIsButtonPressed:Z

    if-nez v0, :cond_15

    .line 298
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->TAG:Ljava/lang/String;

    const-string v2, "dispatchButtonData : Button is already released state!"

    invoke-static {v0, v2}, Lcom/samsung/android/service/aircommand/util/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 302
    :cond_15
    iput-boolean v1, v7, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->mIsButtonPressed:Z

    .line 306
    iget-object v0, v7, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mEventListener:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;

    if-eqz v0, :cond_16

    .line 307
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenButtonEvent$Action;->BUTTON_UP:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenButtonEvent$Action;

    invoke-virtual {v7, v0, v4, v5, v6}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/shared/BleSpenGenericDriver;->createButtonEvent(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenButtonEvent$Action;JLjava/lang/String;)Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenButtonEvent;

    move-result-object v0

    .line 308
    iget-object v1, v7, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mEventListener:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;

    invoke-virtual {v1, v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;->onSensorEvent(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSensorEvent;)V

    :cond_16
    return v9
.end method

.method private dispatchButtonData(Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/abstraction/IBleGatt;Landroid/bluetooth/BluetoothGattCharacteristic;)V
    .locals 11

    .line 254
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    .line 255
    invoke-interface {p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/abstraction/IBleGatt;->getDevice()Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/abstraction/IBleDevice;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 256
    invoke-interface {p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/abstraction/IBleDevice;->getAddress()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const-string p1, "NULL"

    .line 259
    :goto_0
    invoke-virtual {p2}, Landroid/bluetooth/BluetoothGattCharacteristic;->getValue()[B

    move-result-object p2

    if-eqz p2, :cond_5

    .line 260
    array-length v0, p2

    if-nez v0, :cond_1

    goto :goto_3

    :cond_1
    const/4 v0, 0x0

    .line 266
    aget-byte v1, p2, v0

    and-int/lit16 v1, v1, 0xff

    const/16 v2, 0xf0

    if-eq v1, v2, :cond_2

    const/4 v2, 0x0

    move-object v0, p0

    move-object v1, p2

    move-wide v3, v6

    move-object v5, p1

    .line 284
    invoke-direct/range {v0 .. v5}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->dispatchButtonData([BIJLjava/lang/String;)I

    goto :goto_2

    :cond_2
    const/4 v1, 0x1

    .line 270
    aget-byte v1, p2, v1

    and-int/lit16 v8, v1, 0xff

    const/4 v1, 0x2

    .line 272
    sget-object v2, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "dispatchButtonData : Multiple event format. count="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/samsung/android/service/aircommand/util/debug/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move v9, v0

    move v10, v1

    :goto_1
    if-ge v9, v8, :cond_4

    move-object v0, p0

    move-object v1, p2

    move v2, v10

    move-wide v3, v6

    move-object v5, p1

    .line 274
    invoke-direct/range {v0 .. v5}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->dispatchButtonData([BIJLjava/lang/String;)I

    move-result v0

    add-int/2addr v10, v0

    .line 275
    array-length v0, p2

    if-lt v10, v0, :cond_3

    goto :goto_2

    :cond_3
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    :cond_4
    :goto_2
    return-void

    .line 261
    :cond_5
    :goto_3
    sget-object p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->TAG:Ljava/lang/String;

    const-string p1, "dispatchButtonData : no characteristic data!"

    invoke-static {p0, p1}, Lcom/samsung/android/service/aircommand/util/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private dispatchRawSensorData(Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/abstraction/IBleGatt;Landroid/bluetooth/BluetoothGattCharacteristic;)V
    .locals 10

    .line 432
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v7

    .line 433
    invoke-virtual {p2}, Landroid/bluetooth/BluetoothGattCharacteristic;->getValue()[B

    move-result-object p2

    if-eqz p2, :cond_1

    .line 435
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "dispatchRawSensorData : Accelerometer & Gyroscope. len="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length v2, p2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/samsung/android/service/aircommand/util/debug/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 436
    array-length v0, p2

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mEventListener:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;

    if-eqz v0, :cond_1

    .line 437
    invoke-interface {p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/abstraction/IBleGatt;->getDevice()Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/abstraction/IBleDevice;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 438
    invoke-interface {p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/abstraction/IBleDevice;->getAddress()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const-string p1, "NULL"

    :goto_0
    move-object v9, p1

    const/4 p1, 0x1

    .line 439
    invoke-direct {p0, p2, p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->extractShortValue([BI)S

    move-result v1

    const/4 p1, 0x3

    .line 440
    invoke-direct {p0, p2, p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->extractShortValue([BI)S

    move-result v2

    const/4 p1, 0x5

    .line 441
    invoke-direct {p0, p2, p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->extractShortValue([BI)S

    move-result v3

    const/4 p1, 0x7

    .line 443
    invoke-direct {p0, p2, p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->extractShortValue([BI)S

    move-result v4

    const/16 p1, 0x9

    .line 444
    invoke-direct {p0, p2, p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->extractShortValue([BI)S

    move-result v5

    const/16 p1, 0xb

    .line 445
    invoke-direct {p0, p2, p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->extractShortValue([BI)S

    move-result v6

    .line 447
    sget-object p1, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "dispatchRawSensorData : accX="

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", accY="

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", accZ="

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", gyroX="

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", gyroY="

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", gyroZ="

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/samsung/android/service/aircommand/util/debug/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move-object v0, p0

    .line 448
    invoke-virtual/range {v0 .. v9}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/shared/BleSpenGenericDriver;->createAccGyroEvent(IIIIIIJLjava/lang/String;)Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenAccGyroEvent;

    move-result-object p1

    .line 449
    iget-object p0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mEventListener:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;

    invoke-virtual {p0, p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;->onSensorEvent(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSensorEvent;)V

    :cond_1
    return-void
.end method

.method private dispatchSelfTestResultData(Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/abstraction/IBleGatt;Landroid/bluetooth/BluetoothGattCharacteristic;)V
    .locals 8

    .line 458
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    .line 459
    invoke-virtual {p2}, Landroid/bluetooth/BluetoothGattCharacteristic;->getValue()[B

    move-result-object p2

    if-eqz p2, :cond_2

    .line 464
    sget-object v2, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "dispatchSelfTestResultData : Sensor self test. len="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length v4, p2

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/samsung/android/service/aircommand/util/debug/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 465
    array-length v2, p2

    if-lez v2, :cond_2

    iget-object v2, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mEventListener:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;

    if-eqz v2, :cond_2

    .line 466
    invoke-interface {p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/abstraction/IBleGatt;->getDevice()Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/abstraction/IBleDevice;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 467
    invoke-interface {p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/abstraction/IBleDevice;->getAddress()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const-string p1, "NULL"

    .line 469
    :goto_0
    array-length v2, p2

    const/16 v3, 0x24

    const/4 v4, 0x0

    if-lt v2, v3, :cond_1

    const/4 v2, 0x1

    goto :goto_1

    :cond_1
    move v2, v4

    :goto_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unexpected data length. len="

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length v5, p2

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/samsung/android/service/aircommand/util/debug/Assert;->e(ZLjava/lang/String;)V

    .line 471
    new-instance v2, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$SelfTestData;

    invoke-direct {v2}, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$SelfTestData;-><init>()V

    .line 473
    new-instance v3, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$XYZ;

    .line 474
    invoke-direct {p0, p2, v4}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->extractShortValue([BI)S

    move-result v4

    int-to-float v4, v4

    const/4 v5, 0x2

    .line 475
    invoke-direct {p0, p2, v5}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->extractShortValue([BI)S

    move-result v5

    int-to-float v5, v5

    const/4 v6, 0x4

    .line 476
    invoke-direct {p0, p2, v6}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->extractShortValue([BI)S

    move-result v6

    int-to-float v6, v6

    invoke-direct {v3, v4, v5, v6}, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$XYZ;-><init>(FFF)V

    iput-object v3, v2, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$SelfTestData;->accRaw:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$XYZ;

    .line 478
    new-instance v3, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$XYZ;

    const/4 v4, 0x6

    .line 479
    invoke-direct {p0, p2, v4}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->extractShortValue([BI)S

    move-result v4

    int-to-float v4, v4

    const/high16 v5, 0x3dfa0000

    mul-float/2addr v4, v5

    const/16 v6, 0x8

    .line 480
    invoke-direct {p0, p2, v6}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->extractShortValue([BI)S

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v6, v5

    const/16 v7, 0xa

    .line 481
    invoke-direct {p0, p2, v7}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->extractShortValue([BI)S

    move-result v7

    int-to-float v7, v7

    mul-float/2addr v7, v5

    invoke-direct {v3, v4, v6, v7}, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$XYZ;-><init>(FFF)V

    iput-object v3, v2, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$SelfTestData;->accSelfPlus:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$XYZ;

    .line 483
    new-instance v3, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$XYZ;

    const/16 v4, 0x18

    .line 484
    invoke-direct {p0, p2, v4}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->extractShortValue([BI)S

    move-result v4

    int-to-float v4, v4

    mul-float/2addr v4, v5

    const/16 v6, 0x1a

    .line 485
    invoke-direct {p0, p2, v6}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->extractShortValue([BI)S

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v6, v5

    const/16 v7, 0x1c

    .line 486
    invoke-direct {p0, p2, v7}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->extractShortValue([BI)S

    move-result v7

    int-to-float v7, v7

    mul-float/2addr v7, v5

    invoke-direct {v3, v4, v6, v7}, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$XYZ;-><init>(FFF)V

    iput-object v3, v2, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$SelfTestData;->accSelfMinus:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$XYZ;

    .line 488
    new-instance v3, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$XYZ;

    const/16 v4, 0x1e

    .line 489
    invoke-direct {p0, p2, v4}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->extractShortValue([BI)S

    move-result v4

    int-to-float v4, v4

    const v5, 0x3d8f5c29    # 0.07f

    mul-float/2addr v4, v5

    const/16 v6, 0x20

    .line 490
    invoke-direct {p0, p2, v6}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->extractShortValue([BI)S

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v6, v5

    const/16 v7, 0x22

    .line 491
    invoke-direct {p0, p2, v7}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->extractShortValue([BI)S

    move-result v7

    int-to-float v7, v7

    mul-float/2addr v7, v5

    invoke-direct {v3, v4, v6, v7}, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$XYZ;-><init>(FFF)V

    iput-object v3, v2, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$SelfTestData;->gyroZro:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$XYZ;

    .line 493
    new-instance v3, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$XYZ;

    const/16 v4, 0xc

    .line 494
    invoke-direct {p0, p2, v4}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->extractShortValue([BI)S

    move-result v4

    int-to-float v4, v4

    mul-float/2addr v4, v5

    const/16 v6, 0xe

    .line 495
    invoke-direct {p0, p2, v6}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->extractShortValue([BI)S

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v6, v5

    const/16 v7, 0x10

    .line 496
    invoke-direct {p0, p2, v7}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->extractShortValue([BI)S

    move-result v7

    int-to-float v7, v7

    mul-float/2addr v7, v5

    invoke-direct {v3, v4, v6, v7}, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$XYZ;-><init>(FFF)V

    iput-object v3, v2, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$SelfTestData;->gyroSelf:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$XYZ;

    .line 498
    new-instance v3, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$XYZ;

    const/16 v4, 0x12

    .line 499
    invoke-direct {p0, p2, v4}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->extractShortValue([BI)S

    move-result v4

    int-to-float v4, v4

    mul-float/2addr v4, v5

    const/16 v6, 0x14

    .line 500
    invoke-direct {p0, p2, v6}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->extractShortValue([BI)S

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v6, v5

    const/16 v7, 0x16

    .line 501
    invoke-direct {p0, p2, v7}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->extractShortValue([BI)S

    move-result p2

    int-to-float p2, p2

    mul-float/2addr p2, v5

    invoke-direct {v3, v4, v6, p2}, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$XYZ;-><init>(FFF)V

    iput-object v3, v2, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$SelfTestData;->gyroSelfBias:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$XYZ;

    .line 504
    sget-object p2, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "dispatchSelfTestResultData : \n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {p2, v3}, Lcom/samsung/android/service/aircommand/util/debug/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 506
    invoke-virtual {p0, v2, v0, v1, p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/shared/BleSpenGenericDriver;->createSelfTestResultEvent(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$SelfTestData;JLjava/lang/String;)Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent;

    move-result-object p1

    .line 507
    iget-object p0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mEventListener:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;

    invoke-virtual {p0, p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;->onSensorEvent(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSensorEvent;)V

    :cond_2
    return-void
.end method

.method private extractShortValue([BI)S
    .locals 0

    add-int/lit8 p0, p2, 0x1

    .line 545
    aget-byte p0, p1, p0

    and-int/lit16 p0, p0, 0xff

    shl-int/lit8 p0, p0, 0x8

    aget-byte p1, p1, p2

    and-int/lit16 p1, p1, 0xff

    or-int/2addr p0, p1

    int-to-short p0, p0

    return p0
.end method


# virtual methods
.method public declared-synchronized discoverService(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V
    .locals 1

    monitor-enter p0

    .line 62
    :try_start_0
    new-instance v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver$1;

    invoke-direct {v0, p0, p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver$1;-><init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V

    invoke-super {p0, v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/shared/BleSpenGenericDriver;->discoverService(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 88
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized getCurrentOperationMode()Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;
    .locals 1

    monitor-enter p0

    .line 245
    :try_start_0
    iget-object v0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->mCurrentOperationMode:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getSpenServiceUuid()Ljava/util/UUID;
    .locals 0

    .line 250
    iget-object p0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->mSpenServiceUuid:Ljava/util/UUID;

    return-object p0
.end method

.method public onCharacteristicChanged(Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/abstraction/IBleGatt;Landroid/bluetooth/BluetoothGattCharacteristic;)V
    .locals 2

    .line 92
    invoke-virtual {p2}, Landroid/bluetooth/BluetoothGattCharacteristic;->getUuid()Ljava/util/UUID;

    move-result-object v0

    .line 96
    sget-object v1, Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/constants/BleSpenUuid;->BUTTON_EVENT:Ljava/util/UUID;

    invoke-virtual {v1, v0}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 97
    invoke-direct {p0, p1, p2}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->dispatchButtonData(Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/abstraction/IBleGatt;Landroid/bluetooth/BluetoothGattCharacteristic;)V

    goto :goto_0

    .line 98
    :cond_0
    sget-object v1, Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/constants/BleSpenUuid;->RAW_SENSOR_DATA:Ljava/util/UUID;

    invoke-virtual {v1, v0}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 99
    invoke-direct {p0, p1, p2}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->dispatchRawSensorData(Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/abstraction/IBleGatt;Landroid/bluetooth/BluetoothGattCharacteristic;)V

    goto :goto_0

    .line 100
    :cond_1
    sget-object v1, Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/constants/BleSpenUuid;->SELF_TEST:Ljava/util/UUID;

    invoke-virtual {v1, v0}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 101
    invoke-direct {p0, p1, p2}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->dispatchSelfTestResultData(Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/abstraction/IBleGatt;Landroid/bluetooth/BluetoothGattCharacteristic;)V

    goto :goto_0

    .line 103
    :cond_2
    invoke-super {p0, p1, p2}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/shared/BleSpenGenericDriver;->onCharacteristicChanged(Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/abstraction/IBleGatt;Landroid/bluetooth/BluetoothGattCharacteristic;)V

    :goto_0
    return-void
.end method

.method public declared-synchronized open(Ljava/lang/String;ZZLcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListener;Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/abstraction/IBleGattCallback;)Z
    .locals 1

    monitor-enter p0

    .line 55
    :try_start_0
    iget-object v0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mContext:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/util/BleUtils;->writeBundledBleSpenAddressToEfs(Landroid/content/Context;Ljava/lang/String;)V

    .line 57
    invoke-super/range {p0 .. p6}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->open(Ljava/lang/String;ZZLcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListener;Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/abstraction/IBleGattCallback;)Z

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public readChargingState(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V
    .locals 0

    return-void
.end method

.method public declared-synchronized readRawBatteryLevel(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V
    .locals 4

    monitor-enter p0

    .line 514
    :try_start_0
    iget-object v0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mBleDriver:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenBleDriver;

    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->getSpenServiceUuid()Ljava/util/UUID;

    move-result-object v1

    sget-object v2, Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/constants/BleSpenUuid;->BATTERY_LEVEL_RAW:Ljava/util/UUID;

    new-instance v3, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver$5;

    invoke-direct {v3, p0, p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver$5;-><init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V

    invoke-virtual {v0, v1, v2, v3}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenBleDriver;->readCharacteristic(Ljava/util/UUID;Ljava/util/UUID;Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 537
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized sendFastDischargeCommand(ILcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V
    .locals 4

    monitor-enter p0

    if-ltz p1, :cond_1

    const/16 v0, 0xf

    if-le p1, v0, :cond_0

    goto :goto_0

    .line 228
    :cond_0
    :try_start_0
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "sendFastDischargeCommand : cmd="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/samsung/android/service/aircommand/util/debug/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x1

    new-array v0, v0, [B

    const/4 v1, 0x0

    add-int/lit8 p1, p1, 0x50

    int-to-byte p1, p1

    aput-byte p1, v0, v1

    .line 231
    iget-object p1, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mBleDriver:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenBleDriver;

    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->getSpenServiceUuid()Ljava/util/UUID;

    move-result-object v1

    sget-object v2, Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/constants/BleSpenUuid;->MODE:Ljava/util/UUID;

    new-instance v3, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver$4;

    invoke-direct {v3, p0, p2}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver$4;-><init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V

    invoke-virtual {p1, v1, v2, v0, v3}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenBleDriver;->writeCharacteristic(Ljava/util/UUID;Ljava/util/UUID;[BLcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 241
    monitor-exit p0

    return-void

    .line 221
    :cond_1
    :goto_0
    :try_start_1
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "sendFastDischargeCommand : incorrect command : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/samsung/android/service/aircommand/util/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz p2, :cond_2

    .line 223
    new-instance p1, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;

    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;->NOT_SUPPORTED:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;

    invoke-direct {p1, v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;-><init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;)V

    const-wide/16 v0, 0x0

    invoke-interface {p2, p1, v0, v1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;->onFinish(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;J)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 225
    :cond_2
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public setConnectionInterval(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenConnectionInterval;Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V
    .locals 5

    const/4 v0, 0x1

    new-array v1, v0, [B

    const/16 v2, 0x22

    const/4 v3, 0x0

    aput-byte v2, v1, v3

    new-array v2, v0, [B

    const/16 v4, 0x23

    aput-byte v4, v2, v3

    .line 126
    sget-object v3, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver$6;->$SwitchMap$com$samsung$android$service$aircommand$remotespen$core$device$data$BleSpenConnectionInterval:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v4

    aget v3, v3, v4

    if-eq v3, v0, :cond_2

    const/4 v0, 0x2

    if-eq v3, v0, :cond_1

    .line 134
    sget-object p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setConnectionInterval : Unsupported interval : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/samsung/android/service/aircommand/util/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz p2, :cond_0

    .line 136
    new-instance p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;

    sget-object p1, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;->NOT_SUPPORTED:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;

    invoke-direct {p0, p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;-><init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;)V

    const-wide/16 v0, 0x0

    invoke-interface {p2, p0, v0, v1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;->onFinish(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;J)V

    :cond_0
    return-void

    :cond_1
    move-object v1, v2

    .line 142
    :cond_2
    iget-object p1, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mBleDriver:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenBleDriver;

    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->getSpenServiceUuid()Ljava/util/UUID;

    move-result-object v0

    sget-object v2, Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/constants/BleSpenUuid;->MODE:Ljava/util/UUID;

    new-instance v3, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver$2;

    invoke-direct {v3, p0, p2}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver$2;-><init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V

    invoke-virtual {p1, v0, v2, v1, v3}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenBleDriver;->writeCharacteristic(Ljava/util/UUID;Ljava/util/UUID;[BLcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V

    return-void
.end method

.method public declared-synchronized setSlaveLatency(ILcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V
    .locals 3

    monitor-enter p0

    .line 112
    :try_start_0
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setSlaveLatency : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " - not supported"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/samsung/android/service/aircommand/util/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz p2, :cond_0

    .line 114
    new-instance p1, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;

    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;->NOT_SUPPORTED:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;

    invoke-direct {p1, v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;-><init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;)V

    const-wide/16 v0, 0x0

    invoke-interface {p2, p1, v0, v1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;->onFinish(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 116
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setSpenOperationMode(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V
    .locals 7

    monitor-enter p0

    const/4 v0, 0x1

    :try_start_0
    new-array v1, v0, [B

    const/4 v2, 0x0

    aput-byte v0, v1, v2

    new-array v3, v0, [B

    const/4 v4, 0x3

    aput-byte v4, v3, v2

    new-array v4, v0, [B

    const/4 v5, 0x4

    aput-byte v5, v4, v2

    new-array v5, v0, [B

    const/4 v6, -0x4

    aput-byte v6, v5, v2

    new-array v0, v0, [B

    const/16 v6, -0xa

    aput-byte v6, v0, v2

    .line 165
    sget-object v2, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver$6;->$SwitchMap$com$samsung$android$service$aircommand$remotespen$core$device$data$BleSpenOperationMode:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v6

    aget v2, v2, v6

    packed-switch v2, :pswitch_data_0

    .line 183
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->TAG:Ljava/lang/String;

    goto :goto_1

    :pswitch_0
    move-object v1, v0

    goto :goto_0

    :pswitch_1
    move-object v1, v5

    goto :goto_0

    :pswitch_2
    move-object v1, v4

    goto :goto_0

    :pswitch_3
    move-object v1, v3

    .line 191
    :goto_0
    :pswitch_4
    new-instance v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver$3;

    invoke-direct {v0, p0, v1, p1, p2}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver$3;-><init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;[BLcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V

    .line 211
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 212
    monitor-exit p0

    return-void

    .line 183
    :goto_1
    :try_start_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setSpenOperationMode : Unsupported mode : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/samsung/android/service/aircommand/util/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz p2, :cond_0

    .line 185
    new-instance p1, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;

    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;->NOT_SUPPORTED:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;

    invoke-direct {p1, v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;-><init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;)V

    const-wide/16 v0, 0x0

    invoke-interface {p2, p1, v0, v1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;->onFinish(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;J)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 187
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
