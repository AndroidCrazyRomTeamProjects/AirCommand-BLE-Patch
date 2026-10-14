.class public Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;
.super Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/shared/BleSpenGenericDriver;
.source "BleSpenDavinciDriver.java"


# static fields
.field private static final HID_CONNECT_TIMEOUT:I = 0xbb8

.field public static TAG:Ljava/lang/String; = "BleSpenDavinciDriver"

.field public static final UUID_SPEN_SERVICE:Ljava/util/UUID;


# instance fields
.field private mCurrentOperatingMode:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    const-string v0, "DC6BB0A8-202E-487C-8F1B-53B37CC837C6"

    .line 34
    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    sput-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->UUID_SPEN_SERVICE:Ljava/util/UUID;

    return-void
.end method

.method public constructor <init>(Lcom/samsung/android/service/aircommand/util/features/SpenModelName;Lc3/b;LP6/b;LW2/a;)V
    .locals 0

    .line 41
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/shared/BleSpenGenericDriver;-><init>(Lcom/samsung/android/service/aircommand/util/features/SpenModelName;Lc3/b;LP6/b;LW2/a;)V

    .line 38
    sget-object p1, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;->DEFAULT:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;

    iput-object p1, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->mCurrentOperatingMode:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;

    return-void
.end method

.method public static synthetic access$002(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;)Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;
    .locals 0

    .line 31
    iput-object p1, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->mCurrentOperatingMode:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;

    return-object p1
.end method

.method public static synthetic access$100(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;)Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenBleDriver;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mBleDriver:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenBleDriver;

    return-object p0
.end method

.method private dispatchButtonData(Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/abstraction/IBleGatt;Landroid/bluetooth/BluetoothGattCharacteristic;)V
    .locals 10

    .line 232
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    .line 233
    invoke-interface {p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/abstraction/IBleGatt;->getDevice()Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/abstraction/IBleDevice;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 234
    invoke-interface {p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/abstraction/IBleDevice;->getAddress()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const-string p1, "NULL"

    :goto_0
    move-object v6, p1

    .line 237
    invoke-virtual {p2}, Landroid/bluetooth/BluetoothGattCharacteristic;->getValue()[B

    move-result-object p1

    if-eqz p1, :cond_a

    .line 238
    array-length p2, p1

    if-nez p2, :cond_1

    goto/16 :goto_3

    :cond_1
    const/4 p2, 0x0

    .line 244
    aget-byte p2, p1, p2

    const/16 v0, 0xff

    and-int/2addr p2, v0

    .line 245
    array-length v1, p1

    const/4 v2, 0x6

    if-lt v1, v2, :cond_2

    const/4 v1, 0x5

    aget-byte v1, p1, v1

    and-int/2addr v1, v0

    goto :goto_1

    :cond_2
    const/4 v1, -0x1

    :goto_1
    const-string v2, "), seq="

    if-eqz p2, :cond_8

    const/4 v3, 0x3

    if-eq p2, v3, :cond_7

    const/16 v7, 0x8f

    if-eq p2, v7, :cond_5

    const/16 v8, 0xe

    if-eq p2, v8, :cond_5

    const/16 v8, 0xf

    if-eq p2, v8, :cond_5

    const/16 p1, 0xfe

    if-eq p2, p1, :cond_4

    if-eq p2, v0, :cond_3

    .line 290
    sget-object p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->TAG:Ljava/lang/String;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "dispatchButtonData : Unrecognized("

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/samsung/android/service/aircommand/util/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    .line 285
    :cond_3
    sget-object p1, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->TAG:Ljava/lang/String;

    const-string p2, "dispatchButtonData : Motion sensor calibration success"

    invoke-static {p1, p2}, Lcom/samsung/android/service/aircommand/util/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 286
    new-instance p1, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;

    sget-object p2, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;->SUCCESS:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;

    invoke-direct {p1, p2}, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;-><init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;)V

    invoke-virtual {p0, p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/shared/BleSpenGenericDriver;->invokeCalibrationFinishListener(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;)V

    goto/16 :goto_2

    .line 280
    :cond_4
    sget-object p1, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->TAG:Ljava/lang/String;

    const-string p2, "dispatchButtonData : Motion sensor calibration failed"

    invoke-static {p1, p2}, Lcom/samsung/android/service/aircommand/util/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 281
    new-instance p1, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;

    sget-object p2, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;->CALIBRATION_FAIL:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;

    invoke-direct {p1, p2}, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;-><init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;)V

    invoke-virtual {p0, p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/shared/BleSpenGenericDriver;->invokeCalibrationFinishListener(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;)V

    goto/16 :goto_2

    :cond_5
    const/4 v8, 0x1

    .line 266
    invoke-direct {p0, p1, v8}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->extractShortValue([BI)S

    move-result v2

    .line 267
    invoke-direct {p0, p1, v3}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->extractShortValue([BI)S

    move-result v3

    .line 268
    sget-object p1, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "dispatchButtonData : Gesture("

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v9, ") dx="

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v9, ", dy="

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v9, ", seq="

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/samsung/android/service/aircommand/util/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 269
    iget-object p1, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mEventListener:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;

    if-eqz p1, :cond_9

    .line 270
    sget-object v1, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenAirMotionEvent$Action;->MOVE:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenAirMotionEvent$Action;

    move-object v0, p0

    invoke-virtual/range {v0 .. v6}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/shared/BleSpenGenericDriver;->createAirGestureEvent(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenAirMotionEvent$Action;IIJLjava/lang/String;)Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenAirMotionEvent;

    move-result-object p1

    if-ne p2, v7, :cond_6

    .line 272
    sget-object p2, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->TAG:Ljava/lang/String;

    const-string v0, "dispatchButtonData : Impurity motion data"

    invoke-static {p2, v0}, Lcom/samsung/android/service/aircommand/util/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 273
    invoke-virtual {p1, v8}, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenAirMotionEvent;->markAsImpurity(Z)V

    .line 275
    :cond_6
    iget-object p0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mEventListener:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;

    invoke-virtual {p0, p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;->onSensorEvent(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSensorEvent;)V

    goto :goto_2

    .line 256
    :cond_7
    sget-object p1, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "dispatchButtonData : Button Down("

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/samsung/android/service/aircommand/util/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 257
    iget-object p1, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mEventListener:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;

    if-eqz p1, :cond_9

    .line 258
    sget-object p1, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenButtonEvent$Action;->BUTTON_DOWN:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenButtonEvent$Action;

    invoke-virtual {p0, p1, v4, v5, v6}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/shared/BleSpenGenericDriver;->createButtonEvent(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenButtonEvent$Action;JLjava/lang/String;)Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenButtonEvent;

    move-result-object p1

    .line 259
    iget-object p0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mEventListener:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;

    invoke-virtual {p0, p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;->onSensorEvent(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSensorEvent;)V

    goto :goto_2

    .line 248
    :cond_8
    sget-object p1, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "dispatchButtonData : Button Up("

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/samsung/android/service/aircommand/util/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 249
    iget-object p1, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mEventListener:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;

    if-eqz p1, :cond_9

    .line 250
    sget-object p1, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenButtonEvent$Action;->BUTTON_UP:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenButtonEvent$Action;

    invoke-virtual {p0, p1, v4, v5, v6}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/shared/BleSpenGenericDriver;->createButtonEvent(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenButtonEvent$Action;JLjava/lang/String;)Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenButtonEvent;

    move-result-object p1

    .line 251
    iget-object p0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mEventListener:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;

    invoke-virtual {p0, p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;->onSensorEvent(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSensorEvent;)V

    :cond_9
    :goto_2
    return-void

    .line 239
    :cond_a
    :goto_3
    sget-object p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->TAG:Ljava/lang/String;

    const-string p1, "dispatchButtonData : no characteristic data!"

    invoke-static {p0, p1}, Lcom/samsung/android/service/aircommand/util/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private dispatchRawSensorData(Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/abstraction/IBleGatt;Landroid/bluetooth/BluetoothGattCharacteristic;)V
    .locals 10

    .line 296
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v7

    .line 297
    invoke-virtual {p2}, Landroid/bluetooth/BluetoothGattCharacteristic;->getValue()[B

    move-result-object p2

    if-eqz p2, :cond_1

    .line 299
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "dispatchRawSensorData : Accelerometer & Gyroscope. len="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length v2, p2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/samsung/android/service/aircommand/util/debug/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 300
    array-length v0, p2

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mEventListener:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;

    if-eqz v0, :cond_1

    .line 301
    invoke-interface {p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/abstraction/IBleGatt;->getDevice()Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/abstraction/IBleDevice;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 302
    invoke-interface {p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/abstraction/IBleDevice;->getAddress()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const-string p1, "NULL"

    :goto_0
    move-object v9, p1

    const/4 p1, 0x1

    .line 303
    invoke-direct {p0, p2, p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->extractShortValue([BI)S

    move-result v1

    const/4 p1, 0x3

    .line 304
    invoke-direct {p0, p2, p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->extractShortValue([BI)S

    move-result v2

    const/4 p1, 0x5

    .line 305
    invoke-direct {p0, p2, p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->extractShortValue([BI)S

    move-result v3

    const/4 p1, 0x7

    .line 307
    invoke-direct {p0, p2, p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->extractShortValue([BI)S

    move-result v4

    const/16 p1, 0x9

    .line 308
    invoke-direct {p0, p2, p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->extractShortValue([BI)S

    move-result v5

    const/16 p1, 0xb

    .line 309
    invoke-direct {p0, p2, p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->extractShortValue([BI)S

    move-result v6

    .line 311
    sget-object p1, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->TAG:Ljava/lang/String;

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

    .line 312
    invoke-virtual/range {v0 .. v9}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/shared/BleSpenGenericDriver;->createAccGyroEvent(IIIIIIJLjava/lang/String;)Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenAccGyroEvent;

    move-result-object p1

    .line 313
    iget-object p0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mEventListener:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;

    invoke-virtual {p0, p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;->onSensorEvent(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSensorEvent;)V

    :cond_1
    return-void
.end method

.method private dispatchSelfTestResultData(Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/abstraction/IBleGatt;Landroid/bluetooth/BluetoothGattCharacteristic;)V
    .locals 8

    .line 353
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    .line 354
    invoke-virtual {p2}, Landroid/bluetooth/BluetoothGattCharacteristic;->getValue()[B

    move-result-object p2

    if-eqz p2, :cond_2

    .line 359
    sget-object v2, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "dispatchSelfTestResultData : Sensor self test. len="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length v4, p2

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/samsung/android/service/aircommand/util/debug/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 360
    array-length v2, p2

    if-lez v2, :cond_2

    iget-object v2, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mEventListener:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;

    if-eqz v2, :cond_2

    .line 361
    invoke-interface {p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/abstraction/IBleGatt;->getDevice()Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/abstraction/IBleDevice;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 362
    invoke-interface {p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/abstraction/IBleDevice;->getAddress()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const-string p1, "NULL"

    .line 364
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

    .line 366
    new-instance v2, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$SelfTestData;

    invoke-direct {v2}, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$SelfTestData;-><init>()V

    .line 368
    new-instance v3, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$XYZ;

    .line 369
    invoke-direct {p0, p2, v4}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->extractShortValue([BI)S

    move-result v4

    int-to-float v4, v4

    const/4 v5, 0x2

    .line 370
    invoke-direct {p0, p2, v5}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->extractShortValue([BI)S

    move-result v5

    int-to-float v5, v5

    const/4 v6, 0x4

    .line 371
    invoke-direct {p0, p2, v6}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->extractShortValue([BI)S

    move-result v6

    int-to-float v6, v6

    invoke-direct {v3, v4, v5, v6}, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$XYZ;-><init>(FFF)V

    iput-object v3, v2, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$SelfTestData;->accRaw:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$XYZ;

    .line 373
    new-instance v3, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$XYZ;

    const/4 v4, 0x6

    .line 374
    invoke-direct {p0, p2, v4}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->extractShortValue([BI)S

    move-result v4

    int-to-float v4, v4

    const/high16 v5, 0x3dfa0000

    mul-float/2addr v4, v5

    const/16 v6, 0x8

    .line 375
    invoke-direct {p0, p2, v6}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->extractShortValue([BI)S

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v6, v5

    const/16 v7, 0xa

    .line 376
    invoke-direct {p0, p2, v7}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->extractShortValue([BI)S

    move-result v7

    int-to-float v7, v7

    mul-float/2addr v7, v5

    invoke-direct {v3, v4, v6, v7}, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$XYZ;-><init>(FFF)V

    iput-object v3, v2, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$SelfTestData;->accSelfPlus:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$XYZ;

    .line 378
    new-instance v3, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$XYZ;

    const/16 v4, 0x18

    .line 379
    invoke-direct {p0, p2, v4}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->extractShortValue([BI)S

    move-result v4

    int-to-float v4, v4

    mul-float/2addr v4, v5

    const/16 v6, 0x1a

    .line 380
    invoke-direct {p0, p2, v6}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->extractShortValue([BI)S

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v6, v5

    const/16 v7, 0x1c

    .line 381
    invoke-direct {p0, p2, v7}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->extractShortValue([BI)S

    move-result v7

    int-to-float v7, v7

    mul-float/2addr v7, v5

    invoke-direct {v3, v4, v6, v7}, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$XYZ;-><init>(FFF)V

    iput-object v3, v2, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$SelfTestData;->accSelfMinus:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$XYZ;

    .line 383
    new-instance v3, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$XYZ;

    const/16 v4, 0x1e

    .line 384
    invoke-direct {p0, p2, v4}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->extractShortValue([BI)S

    move-result v4

    int-to-float v4, v4

    const v5, 0x3d8f5c29    # 0.07f

    mul-float/2addr v4, v5

    const/16 v6, 0x20

    .line 385
    invoke-direct {p0, p2, v6}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->extractShortValue([BI)S

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v6, v5

    const/16 v7, 0x22

    .line 386
    invoke-direct {p0, p2, v7}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->extractShortValue([BI)S

    move-result v7

    int-to-float v7, v7

    mul-float/2addr v7, v5

    invoke-direct {v3, v4, v6, v7}, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$XYZ;-><init>(FFF)V

    iput-object v3, v2, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$SelfTestData;->gyroZro:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$XYZ;

    .line 388
    new-instance v3, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$XYZ;

    const/16 v4, 0xc

    .line 389
    invoke-direct {p0, p2, v4}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->extractShortValue([BI)S

    move-result v4

    int-to-float v4, v4

    mul-float/2addr v4, v5

    const/16 v6, 0xe

    .line 390
    invoke-direct {p0, p2, v6}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->extractShortValue([BI)S

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v6, v5

    const/16 v7, 0x10

    .line 391
    invoke-direct {p0, p2, v7}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->extractShortValue([BI)S

    move-result v7

    int-to-float v7, v7

    mul-float/2addr v7, v5

    invoke-direct {v3, v4, v6, v7}, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$XYZ;-><init>(FFF)V

    iput-object v3, v2, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$SelfTestData;->gyroSelf:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$XYZ;

    .line 393
    new-instance v3, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$XYZ;

    const/16 v4, 0x12

    .line 394
    invoke-direct {p0, p2, v4}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->extractShortValue([BI)S

    move-result v4

    int-to-float v4, v4

    mul-float/2addr v4, v5

    const/16 v6, 0x14

    .line 395
    invoke-direct {p0, p2, v6}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->extractShortValue([BI)S

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v6, v5

    const/16 v7, 0x16

    .line 396
    invoke-direct {p0, p2, v7}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->extractShortValue([BI)S

    move-result p2

    int-to-float p2, p2

    mul-float/2addr p2, v5

    invoke-direct {v3, v4, v6, p2}, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$XYZ;-><init>(FFF)V

    iput-object v3, v2, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$SelfTestData;->gyroSelfBias:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$XYZ;

    .line 399
    sget-object p2, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "dispatchSelfTestResultData : \n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {p2, v3}, Lcom/samsung/android/service/aircommand/util/debug/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 401
    invoke-virtual {p0, v2, v0, v1, p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/shared/BleSpenGenericDriver;->createSelfTestResultEvent(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent$SelfTestData;JLjava/lang/String;)Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSelfTestResultEvent;

    move-result-object p1

    .line 402
    iget-object p0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mEventListener:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;

    invoke-virtual {p0, p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;->onSensorEvent(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSensorEvent;)V

    :cond_2
    return-void
.end method

.method private extractShortValue([BI)S
    .locals 0

    add-int/lit8 p0, p2, 0x1

    .line 408
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
.method public declared-synchronized close(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V
    .locals 0

    monitor-enter p0

    .line 60
    :try_start_0
    invoke-super {p0, p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/shared/BleSpenGenericDriver;->close(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 61
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized disconnect(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V
    .locals 0

    monitor-enter p0

    .line 55
    :try_start_0
    invoke-super {p0, p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->disconnect(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 56
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

    .line 224
    :try_start_0
    iget-object v0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->mCurrentOperatingMode:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;
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

    .line 229
    sget-object p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->UUID_SPEN_SERVICE:Ljava/util/UUID;

    return-object p0
.end method

.method public onCharacteristicChanged(Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/abstraction/IBleGatt;Landroid/bluetooth/BluetoothGattCharacteristic;)V
    .locals 2

    .line 74
    invoke-virtual {p2}, Landroid/bluetooth/BluetoothGattCharacteristic;->getUuid()Ljava/util/UUID;

    move-result-object v0

    .line 76
    sget-object v1, Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/constants/BleSpenUuid;->BUTTON_EVENT:Ljava/util/UUID;

    invoke-virtual {v1, v0}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 77
    invoke-direct {p0, p1, p2}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->dispatchButtonData(Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/abstraction/IBleGatt;Landroid/bluetooth/BluetoothGattCharacteristic;)V

    goto :goto_0

    .line 78
    :cond_0
    sget-object v1, Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/constants/BleSpenUuid;->RAW_SENSOR_DATA:Ljava/util/UUID;

    invoke-virtual {v1, v0}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 79
    invoke-direct {p0, p1, p2}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->dispatchRawSensorData(Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/abstraction/IBleGatt;Landroid/bluetooth/BluetoothGattCharacteristic;)V

    goto :goto_0

    .line 80
    :cond_1
    sget-object v1, Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/constants/BleSpenUuid;->SELF_TEST:Ljava/util/UUID;

    invoke-virtual {v1, v0}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 81
    invoke-direct {p0, p1, p2}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->dispatchSelfTestResultData(Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/abstraction/IBleGatt;Landroid/bluetooth/BluetoothGattCharacteristic;)V

    goto :goto_0

    .line 83
    :cond_2
    invoke-super {p0, p1, p2}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/shared/BleSpenGenericDriver;->onCharacteristicChanged(Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/abstraction/IBleGatt;Landroid/bluetooth/BluetoothGattCharacteristic;)V

    :goto_0
    return-void
.end method

.method public onConnectionStateChanged(Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/abstraction/IBleGatt;II)V
    .locals 0

    .line 65
    invoke-super {p0, p1, p2, p3}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/shared/BleSpenGenericDriver;->onConnectionStateChanged(Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/abstraction/IBleGatt;II)V

    if-nez p3, :cond_0

    .line 68
    sget-object p1, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;->DEFAULT:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;

    iput-object p1, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->mCurrentOperatingMode:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;

    :cond_0
    return-void
.end method

.method public declared-synchronized open(Ljava/lang/String;ZZLcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListener;Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/abstraction/IBleGattCallback;)Z
    .locals 1

    monitor-enter p0

    .line 48
    :try_start_0
    iget-object v0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mContext:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/util/BleUtils;->writeBundledBleSpenAddressToEfs(Landroid/content/Context;Ljava/lang/String;)V

    .line 50
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

    .line 320
    :try_start_0
    iget-object v0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mBleDriver:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenBleDriver;

    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->getSpenServiceUuid()Ljava/util/UUID;

    move-result-object v1

    sget-object v2, Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/constants/BleSpenUuid;->BATTERY_LEVEL_RAW:Ljava/util/UUID;

    new-instance v3, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver$4;

    invoke-direct {v3, p0, p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver$4;-><init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V

    invoke-virtual {v0, v1, v2, v3}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenBleDriver;->readCharacteristic(Ljava/util/UUID;Ljava/util/UUID;Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 343
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

    .line 207
    :cond_0
    :try_start_0
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->TAG:Ljava/lang/String;

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

    .line 210
    iget-object p1, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mBleDriver:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenBleDriver;

    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->getSpenServiceUuid()Ljava/util/UUID;

    move-result-object v1

    sget-object v2, Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/constants/BleSpenUuid;->MODE:Ljava/util/UUID;

    new-instance v3, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver$3;

    invoke-direct {v3, p0, p2}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver$3;-><init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V

    invoke-virtual {p1, v1, v2, v0, v3}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenBleDriver;->writeCharacteristic(Ljava/util/UUID;Ljava/util/UUID;[BLcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 220
    monitor-exit p0

    return-void

    .line 200
    :cond_1
    :goto_0
    :try_start_1
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "sendFastDischargeCommand : incorrect command : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/samsung/android/service/aircommand/util/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz p2, :cond_2

    .line 202
    new-instance p1, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;

    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;->NOT_SUPPORTED:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;

    invoke-direct {p1, v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;-><init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;)V

    const-wide/16 v0, 0x0

    invoke-interface {p2, p1, v0, v1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;->onFinish(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;J)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 204
    :cond_2
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public setConnectionInterval(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenConnectionInterval;Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V
    .locals 2

    if-eqz p2, :cond_0

    .line 121
    new-instance p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;

    sget-object p1, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;->NOT_SUPPORTED:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;

    invoke-direct {p0, p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;-><init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;)V

    const-wide/16 v0, 0x0

    invoke-interface {p2, p0, v0, v1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;->onFinish(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;J)V

    :cond_0
    return-void
.end method

.method public declared-synchronized setSlaveLatency(ILcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V
    .locals 5

    monitor-enter p0

    .line 92
    :try_start_0
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setSlaveLatency : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/samsung/android/service/aircommand/util/debug/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x1

    new-array v1, v0, [B

    const/16 v2, 0x10

    const/4 v3, 0x0

    aput-byte v2, v1, v3

    const/16 v4, 0x9

    if-ne p1, v4, :cond_0

    aput-byte v2, v1, v3

    goto :goto_0

    :cond_0
    if-gt v0, p1, :cond_1

    const/16 v0, 0x8

    if-gt p1, v0, :cond_1

    or-int/2addr p1, v2

    int-to-byte p1, p1

    aput-byte p1, v1, v3

    goto :goto_0

    .line 101
    :cond_1
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setSlaveLatency : Unsupported slave latency value : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/samsung/android/service/aircommand/util/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    :goto_0
    iget-object p1, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mBleDriver:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenBleDriver;

    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->getSpenServiceUuid()Ljava/util/UUID;

    move-result-object v0

    sget-object v2, Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/constants/BleSpenUuid;->MODE:Ljava/util/UUID;

    new-instance v3, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver$1;

    invoke-direct {v3, p0, p2}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver$1;-><init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V

    invoke-virtual {p1, v0, v2, v1, v3}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenBleDriver;->writeCharacteristic(Ljava/util/UUID;Ljava/util/UUID;[BLcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 115
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setSpenOperationMode(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V
    .locals 9

    monitor-enter p0

    .line 127
    :try_start_0
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setSpenOperationMode : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/samsung/android/service/aircommand/util/debug/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x1

    new-array v1, v0, [B

    const/4 v2, 0x0

    aput-byte v0, v1, v2

    new-array v3, v0, [B

    const/4 v4, 0x2

    aput-byte v4, v3, v2

    new-array v4, v0, [B

    const/4 v5, 0x3

    aput-byte v5, v4, v2

    new-array v5, v0, [B

    const/4 v6, 0x4

    aput-byte v6, v5, v2

    new-array v6, v0, [B

    const/4 v7, -0x4

    aput-byte v7, v6, v2

    new-array v7, v0, [B

    const/16 v8, -0xa

    aput-byte v8, v7, v2

    new-array v0, v0, [B

    const/4 v8, 0x5

    aput-byte v8, v0, v2

    .line 138
    sget-object v2, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver$5;->$SwitchMap$com$samsung$android$service$aircommand$remotespen$core$device$data$BleSpenOperationMode:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v8

    aget v2, v2, v8

    packed-switch v2, :pswitch_data_0

    .line 162
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->TAG:Ljava/lang/String;

    goto :goto_1

    :pswitch_0
    move-object v1, v7

    goto :goto_0

    :pswitch_1
    move-object v1, v6

    goto :goto_0

    :pswitch_2
    move-object v1, v5

    goto :goto_0

    :pswitch_3
    move-object v1, v4

    goto :goto_0

    :pswitch_4
    move-object v1, v0

    goto :goto_0

    :pswitch_5
    move-object v1, v3

    .line 170
    :goto_0
    :pswitch_6
    new-instance v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver$2;

    invoke-direct {v0, p0, v1, p1, p2}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver$2;-><init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;[BLcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V

    .line 190
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 191
    monitor-exit p0

    return-void

    .line 162
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

    .line 164
    new-instance p1, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;

    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;->NOT_SUPPORTED:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;

    invoke-direct {p1, v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;-><init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;)V

    const-wide/16 v0, 0x0

    invoke-interface {p2, p1, v0, v1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;->onFinish(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;J)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 166
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
