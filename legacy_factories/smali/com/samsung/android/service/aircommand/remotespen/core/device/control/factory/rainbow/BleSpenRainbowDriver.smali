.class public Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/BleSpenRainbowDriver;
.super Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;
.source "BleSpenRainbowDriver.java"


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 17
    const-class v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/BleSpenRainbowDriver;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/samsung/android/service/aircommand/util/features/SpenModelName;Lc3/b;LP6/b;LW2/a;)V
    .locals 0

    .line 22
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;-><init>(Lcom/samsung/android/service/aircommand/util/features/SpenModelName;Lc3/b;LP6/b;LW2/a;)V

    return-void
.end method

.method public static synthetic access$000()Ljava/lang/String;
    .locals 1

    .line 15
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method public static synthetic access$102(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/BleSpenRainbowDriver;Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;)Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;
    .locals 0

    .line 15
    iput-object p1, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->mCurrentOperationMode:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;

    return-object p1
.end method

.method public static synthetic access$200(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/BleSpenRainbowDriver;)Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenBleDriver;
    .locals 0

    .line 15
    iget-object p0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->mBleDriver:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenBleDriver;

    return-object p0
.end method

.method public static synthetic access$300()Ljava/lang/String;
    .locals 1

    .line 15
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method public static synthetic access$400()Ljava/lang/String;
    .locals 1

    .line 15
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method public static synthetic access$500()Ljava/lang/String;
    .locals 1

    .line 15
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->TAG:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public declared-synchronized readFirmwareVersion(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V
    .locals 1

    monitor-enter p0

    .line 90
    :try_start_0
    new-instance v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/BleSpenRainbowDriver$2;

    invoke-direct {v0, p0, p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/BleSpenRainbowDriver$2;-><init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/BleSpenRainbowDriver;Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V

    invoke-super {p0, v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/shared/BleSpenGenericDriver;->readFirmwareVersion(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 116
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setSpenOperationMode(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V
    .locals 8

    monitor-enter p0

    const/4 v0, 0x1

    :try_start_0
    new-array v1, v0, [B

    const/4 v2, 0x0

    aput-byte v0, v1, v2

    new-array v3, v0, [B

    const/4 v4, 0x4

    aput-byte v4, v3, v2

    new-array v4, v0, [B

    const/16 v5, 0x10

    aput-byte v5, v4, v2

    new-array v5, v0, [B

    const/16 v6, 0x11

    aput-byte v6, v5, v2

    new-array v6, v0, [B

    const/4 v7, -0x4

    aput-byte v7, v6, v2

    new-array v0, v0, [B

    const/16 v7, -0xa

    aput-byte v7, v0, v2

    .line 37
    sget-object v2, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/BleSpenRainbowDriver$3;->$SwitchMap$com$samsung$android$service$aircommand$remotespen$core$device$data$BleSpenOperationMode:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v7

    aget v2, v2, v7

    packed-switch v2, :pswitch_data_0

    .line 57
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->TAG:Ljava/lang/String;

    goto :goto_1

    :pswitch_0
    move-object v1, v0

    goto :goto_0

    :pswitch_1
    move-object v1, v6

    goto :goto_0

    :pswitch_2
    move-object v1, v5

    goto :goto_0

    :pswitch_3
    move-object v1, v3

    goto :goto_0

    :pswitch_4
    move-object v1, v4

    .line 65
    :goto_0
    :pswitch_5
    new-instance v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/BleSpenRainbowDriver$1;

    invoke-direct {v0, p0, v1, p1, p2}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/BleSpenRainbowDriver$1;-><init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/BleSpenRainbowDriver;[BLcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V

    .line 85
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 86
    monitor-exit p0

    return-void

    .line 57
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

    .line 59
    new-instance p1, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;

    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;->NOT_SUPPORTED:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;

    invoke-direct {p1, v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;-><init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;)V

    const-wide/16 v0, 0x0

    invoke-interface {p2, p1, v0, v1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;->onFinish(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;J)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 61
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_5
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
