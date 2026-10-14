.class public Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/BleSpenCrownDriver;
.super Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/shared/BleSpenGenericDriver;
.source "BleSpenCrownDriver.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "BleSpenCrownDriver"

.field public static final UUID_SPEN_SERVICE:Ljava/util/UUID;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    const-string v0, "edfec62e-9910-0bac-5241-d8bda6932a2f"

    .line 28
    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    sput-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/BleSpenCrownDriver;->UUID_SPEN_SERVICE:Ljava/util/UUID;

    return-void
.end method

.method public constructor <init>(Lcom/samsung/android/service/aircommand/util/features/SpenModelName;Lc3/b;LP6/b;LW2/a;)V
    .locals 0

    .line 31
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/shared/BleSpenGenericDriver;-><init>(Lcom/samsung/android/service/aircommand/util/features/SpenModelName;Lc3/b;LP6/b;LW2/a;)V

    return-void
.end method

.method public static synthetic access$000()Ljava/lang/String;
    .locals 1

    .line 26
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/BleSpenCrownDriver;->TAG:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public declared-synchronized getCurrentOperationMode()Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;
    .locals 1

    monitor-enter p0

    .line 191
    :try_start_0
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;->DEFAULT:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;
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

    .line 196
    sget-object p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/BleSpenCrownDriver;->UUID_SPEN_SERVICE:Ljava/util/UUID;

    return-object p0
.end method

.method public onCharacteristicChanged(Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/abstraction/IBleGatt;Landroid/bluetooth/BluetoothGattCharacteristic;)V
    .locals 5

    .line 50
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    .line 51
    invoke-virtual {p2}, Landroid/bluetooth/BluetoothGattCharacteristic;->getUuid()Ljava/util/UUID;

    move-result-object v2

    .line 53
    sget-object v3, Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/constants/BleSpenUuid;->BUTTON_EVENT:Ljava/util/UUID;

    invoke-virtual {v3, v2}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 54
    invoke-interface {p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/abstraction/IBleGatt;->getDevice()Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/abstraction/IBleDevice;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 55
    invoke-interface {p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/abstraction/IBleDevice;->getAddress()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const-string p1, "NULL"

    .line 58
    :goto_0
    invoke-virtual {p2}, Landroid/bluetooth/BluetoothGattCharacteristic;->getValue()[B

    move-result-object p2

    if-eqz p2, :cond_4

    .line 59
    array-length v2, p2

    if-lez v2, :cond_4

    const/4 v2, 0x0

    .line 60
    aget-byte p2, p2, v2

    .line 61
    sget-object v2, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/BleSpenCrownDriver;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onCharacteristicChanged : Button:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/samsung/android/service/aircommand/util/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v3, 0x1

    if-eq p2, v3, :cond_2

    const/4 v3, 0x2

    if-eq p2, v3, :cond_1

    .line 81
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p1, "onCharacteristicChanged : Unrecognized button state : "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v2, p0}, Lcom/samsung/android/service/aircommand/util/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 71
    :cond_1
    iget-object p2, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mEventListener:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;

    if-eqz p2, :cond_4

    .line 73
    sget-object p2, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenButtonEvent$Action;->LONG_CLICK_STARTED:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenButtonEvent$Action;

    invoke-virtual {p0, p2, v0, v1, p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/shared/BleSpenGenericDriver;->createButtonEvent(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenButtonEvent$Action;JLjava/lang/String;)Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenButtonEvent;

    move-result-object p2

    .line 74
    iget-object v2, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mEventListener:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;

    invoke-virtual {v2, p2}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;->onSensorEvent(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSensorEvent;)V

    .line 75
    sget-object p2, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenButtonEvent$Action;->LONG_CLICK_FINISHED:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenButtonEvent$Action;

    invoke-virtual {p0, p2, v0, v1, p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/shared/BleSpenGenericDriver;->createButtonEvent(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenButtonEvent$Action;JLjava/lang/String;)Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenButtonEvent;

    move-result-object p1

    .line 76
    iget-object p0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mEventListener:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;

    invoke-virtual {p0, p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;->onSensorEvent(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSensorEvent;)V

    goto :goto_1

    .line 64
    :cond_2
    iget-object p2, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mEventListener:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;

    if-eqz p2, :cond_4

    .line 65
    sget-object p2, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenButtonEvent$Action;->SINGLE_CLICKED:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenButtonEvent$Action;

    invoke-virtual {p0, p2, v0, v1, p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/shared/BleSpenGenericDriver;->createButtonEvent(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenButtonEvent$Action;JLjava/lang/String;)Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenButtonEvent;

    move-result-object p1

    .line 66
    iget-object p0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mEventListener:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;

    invoke-virtual {p0, p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListenerWrapper;->onSensorEvent(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenSensorEvent;)V

    goto :goto_1

    .line 86
    :cond_3
    invoke-super {p0, p1, p2}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/shared/BleSpenGenericDriver;->onCharacteristicChanged(Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/abstraction/IBleGatt;Landroid/bluetooth/BluetoothGattCharacteristic;)V

    :cond_4
    :goto_1
    return-void
.end method

.method public declared-synchronized open(Ljava/lang/String;ZZLcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$EventListener;Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/abstraction/IBleGattCallback;)Z
    .locals 1

    monitor-enter p0

    .line 39
    :try_start_0
    iget-object v0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/CrownWacomChargingDriver;->getInstance(Landroid/content/Context;)Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/CrownWacomChargingDriver;

    move-result-object v0

    invoke-virtual {v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/CrownWacomChargingDriver;->startCharge()I

    .line 43
    iget-object v0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mContext:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/util/BleUtils;->writeBundledBleSpenAddressToEfs(Landroid/content/Context;Ljava/lang/String;)V

    .line 45
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

    .line 159
    :try_start_0
    iget-object v0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mBleDriver:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenBleDriver;

    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/BleSpenCrownDriver;->getSpenServiceUuid()Ljava/util/UUID;

    move-result-object v1

    sget-object v2, Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/constants/BleSpenUuid;->BATTERY_LEVEL_RAW:Ljava/util/UUID;

    new-instance v3, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/BleSpenCrownDriver$2;

    invoke-direct {v3, p0, p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/BleSpenCrownDriver$2;-><init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/BleSpenCrownDriver;Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V

    invoke-virtual {v0, v1, v2, v3}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenBleDriver;->readCharacteristic(Ljava/util/UUID;Ljava/util/UUID;Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 175
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized sendFastDischargeCommand(ILcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V
    .locals 2

    monitor-enter p0

    if-eqz p2, :cond_0

    .line 185
    :try_start_0
    new-instance p1, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;

    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;->NOT_SUPPORTED:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;

    invoke-direct {p1, v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;-><init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;)V

    const-wide/16 v0, 0x0

    invoke-interface {p2, p1, v0, v1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;->onFinish(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1

    .line 187
    :cond_0
    :goto_0
    monitor-exit p0

    return-void
.end method

.method public setConnectionInterval(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenConnectionInterval;Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V
    .locals 2

    if-eqz p2, :cond_0

    .line 135
    new-instance p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;

    sget-object p1, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;->NOT_SUPPORTED:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;

    invoke-direct {p0, p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;-><init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;)V

    const-wide/16 v0, 0x0

    invoke-interface {p2, p0, v0, v1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;->onFinish(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;J)V

    :cond_0
    return-void
.end method

.method public declared-synchronized setSlaveLatency(ILcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V
    .locals 8

    monitor-enter p0

    .line 92
    :try_start_0
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/BleSpenCrownDriver;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setSlaveLatency : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/samsung/android/service/aircommand/util/debug/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, 0x1

    new-array v2, v1, [B

    const/16 v3, 0x40

    const/4 v4, 0x0

    aput-byte v3, v2, v4

    new-array v3, v1, [B

    const/16 v5, 0x43

    aput-byte v5, v3, v4

    new-array v5, v1, [B

    const/16 v6, 0x42

    aput-byte v6, v5, v4

    new-array v6, v1, [B

    const/16 v7, 0x41

    aput-byte v7, v6, v4

    if-eq p1, v1, :cond_2

    const/4 v1, 0x3

    if-eq p1, v1, :cond_1

    const/4 v1, 0x6

    if-eq p1, v1, :cond_0

    const/16 v1, 0x9

    if-eq p1, v1, :cond_3

    .line 114
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setSlaveLatency : Unsupported slave latency value : "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/samsung/android/service/aircommand/util/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_0
    move-object v2, v3

    goto :goto_0

    :cond_1
    move-object v2, v5

    goto :goto_0

    :cond_2
    move-object v2, v6

    .line 118
    :cond_3
    :goto_0
    iget-object p1, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mBleDriver:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenBleDriver;

    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/BleSpenCrownDriver;->getSpenServiceUuid()Ljava/util/UUID;

    move-result-object v0

    sget-object v1, Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/constants/BleSpenUuid;->MODE:Ljava/util/UUID;

    new-instance v3, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/BleSpenCrownDriver$1;

    invoke-direct {v3, p0, p2}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/BleSpenCrownDriver$1;-><init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/BleSpenCrownDriver;Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V

    invoke-virtual {p1, v0, v1, v2, v3}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenBleDriver;->writeCharacteristic(Ljava/util/UUID;Ljava/util/UUID;[BLcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 129
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setSpenOperationMode(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V
    .locals 5

    monitor-enter p0

    .line 141
    :try_start_0
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/BleSpenCrownDriver$3;->$SwitchMap$com$samsung$android$service$aircommand$remotespen$core$device$data$BleSpenOperationMode:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    const-wide/16 v2, 0x0

    if-eq v0, v1, :cond_0

    .line 149
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/BleSpenCrownDriver;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "setSpenOperationMode : not supported mode="

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/samsung/android/service/aircommand/util/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz p2, :cond_1

    .line 151
    new-instance p1, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;

    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;->NOT_SUPPORTED:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;

    invoke-direct {p1, v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;-><init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;)V

    invoke-interface {p2, p1, v2, v3}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;->onFinish(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;J)V

    goto :goto_0

    :cond_0
    if-eqz p2, :cond_1

    .line 144
    new-instance p1, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;

    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;->SUCCESS:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;

    invoke-direct {p1, v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;-><init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;)V

    invoke-interface {p2, p1, v2, v3}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;->onFinish(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 155
    :cond_1
    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
