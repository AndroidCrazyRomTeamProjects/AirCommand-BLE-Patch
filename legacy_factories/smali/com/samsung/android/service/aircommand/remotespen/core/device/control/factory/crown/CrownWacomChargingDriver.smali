.class public Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/CrownWacomChargingDriver;
.super Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;
.source "CrownWacomChargingDriver.java"


# static fields
.field private static final CMD_DISABLE_CHARGER:Ljava/lang/String; = "0"

.field private static final CMD_ENABLE_CHARGER:Ljava/lang/String; = "1"

.field private static final CMD_FAST_CHARGE:Ljava/lang/String; = "3"

.field private static final CMD_RESET:Ljava/lang/String; = "2"

.field private static final CMD_SLOW_CHARGE:Ljava/lang/String; = "4"

.field private static final CMD_WACOM_DSP_RESET:Ljava/lang/String; = "7"

.field private static final DEFAULT_CHARGING_DURATION:I = 0xea60

.field private static final MIN_WACOM_DSP_RESET_DURATION:I = 0x190

.field private static final TAG:Ljava/lang/String; = "CrownWacomChargingDriver"

.field private static sInstance:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/CrownWacomChargingDriver;


# direct methods
.method public static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 6

    const-wide/16 v2, 0xc8

    const-wide/16 v4, 0x14

    move-object v0, p0

    move-object v1, p1

    .line 40
    invoke-direct/range {v0 .. v5}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;-><init>(Landroid/content/Context;JJ)V

    return-void
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/CrownWacomChargingDriver;
    .locals 2

    const-class v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/CrownWacomChargingDriver;

    monitor-enter v0

    .line 33
    :try_start_0
    sget-object v1, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/CrownWacomChargingDriver;->sInstance:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/CrownWacomChargingDriver;

    if-nez v1, :cond_0

    .line 34
    new-instance v1, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/CrownWacomChargingDriver;

    invoke-direct {v1, p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/CrownWacomChargingDriver;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/CrownWacomChargingDriver;->sInstance:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/CrownWacomChargingDriver;

    .line 36
    :cond_0
    sget-object p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/CrownWacomChargingDriver;->sInstance:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/CrownWacomChargingDriver;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method


# virtual methods
.method public resetSpen()V
    .locals 2

    .line 94
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/CrownWacomChargingDriver;->TAG:Ljava/lang/String;

    const-string v1, "resetSpen"

    invoke-static {v0, v1}, Lcom/samsung/android/service/aircommand/util/debug/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/CrownWacomChargingDriver;->turnOffWacomChargingModule()V

    .line 96
    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/CrownWacomChargingDriver;->turnOnWacomChargingModule()V

    .line 97
    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->ensureMinTransactionInterval()V

    const-string v0, "2"

    .line 98
    invoke-virtual {p0, v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->writeBleSpenCommand(Ljava/lang/String;)V

    .line 99
    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->markEndTransaction()V

    return-void
.end method

.method public resetWacomDsp(Z)I
    .locals 2

    .line 104
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/CrownWacomChargingDriver;->TAG:Ljava/lang/String;

    const-string v1, "resetWacomDsp"

    invoke-static {v0, v1}, Lcom/samsung/android/service/aircommand/util/debug/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->ensureMinTransactionInterval()V

    const-string v0, "7"

    .line 106
    invoke-virtual {p0, v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->writeBleSpenCommand(Ljava/lang/String;)V

    if-eqz p1, :cond_0

    const-wide/16 v0, 0x190

    .line 108
    invoke-static {v0, v1}, Lcom/samsung/android/service/aircommand/util/CommonUtils;->sleep(J)V

    .line 110
    :cond_0
    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->markEndTransaction()V

    const/16 p0, 0x190

    return p0
.end method

.method public startCharge()I
    .locals 2

    .line 61
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/CrownWacomChargingDriver;->TAG:Ljava/lang/String;

    const-string v1, "startCharge"

    invoke-static {v0, v1}, Lcom/samsung/android/service/aircommand/util/debug/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/CrownWacomChargingDriver;->turnOffWacomChargingModule()V

    .line 66
    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/CrownWacomChargingDriver;->turnOnWacomChargingModule()V

    .line 68
    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->ensureCommandWriteInterval()V

    const-string v0, "3"

    .line 69
    invoke-virtual {p0, v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->writeBleSpenCommand(Ljava/lang/String;)V

    .line 70
    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->markEndTransaction()V

    const p0, 0xea60

    return p0
.end method

.method public startContinuousCharge()Z
    .locals 2

    .line 76
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/CrownWacomChargingDriver;->TAG:Ljava/lang/String;

    const-string v1, "startContinuousCharge : Not supported operation"

    invoke-static {v0, v1}, Lcom/samsung/android/service/aircommand/util/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/CrownWacomChargingDriver;->startCharge()I

    const/4 p0, 0x0

    return p0
.end method

.method public stopCharge()V
    .locals 0

    .line 83
    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/CrownWacomChargingDriver;->turnOffWacomChargingModule()V

    return-void
.end method

.method public turnOffWacomChargingModule()V
    .locals 2

    .line 53
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/CrownWacomChargingDriver;->TAG:Ljava/lang/String;

    const-string v1, "turnOffWacomChargingModule"

    invoke-static {v0, v1}, Lcom/samsung/android/service/aircommand/util/debug/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->ensureMinTransactionInterval()V

    const-string v0, "0"

    .line 55
    invoke-virtual {p0, v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->writeBleSpenCommand(Ljava/lang/String;)V

    .line 56
    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->markEndTransaction()V

    return-void
.end method

.method public turnOnWacomChargingModule()V
    .locals 2

    .line 45
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/CrownWacomChargingDriver;->TAG:Ljava/lang/String;

    const-string v1, "turnOnWacomChargingModule"

    invoke-static {v0, v1}, Lcom/samsung/android/service/aircommand/util/debug/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 46
    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->ensureMinTransactionInterval()V

    const-string v0, "1"

    .line 47
    invoke-virtual {p0, v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->writeBleSpenCommand(Ljava/lang/String;)V

    .line 48
    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->markEndTransaction()V

    return-void
.end method
