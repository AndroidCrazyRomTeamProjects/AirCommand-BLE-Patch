.class public Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver;
.super Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;
.source "DavinciWacomChargingDriver.java"


# static fields
.field public static final CMD_10MIN_CHARGE:Ljava/lang/String; = "8"

.field public static final CMD_CONTINUOUS_CHARGE:Ljava/lang/String; = "4"

.field public static final CMD_DISABLE_CHARGER:Ljava/lang/String; = "0"

.field public static final CMD_ENABLE_CHARGER:Ljava/lang/String; = "1"

.field public static final CMD_RESET:Ljava/lang/String; = "2"

.field public static final CMD_START_CHARGE:Ljava/lang/String; = "3"

.field public static final CMD_STOP_CHARGE:Ljava/lang/String; = "5"

.field public static final CMD_WACOM_DSP_RESET:Ljava/lang/String; = "7"

.field private static final DEFAULT_CHARGING_DURATION:I = 0xea60

.field public static final MIN_WACOM_COMMAND_PATTERN_SIGNAL_DURATION:I = 0x1c2

.field private static final MIN_WACOM_DSP_RESET_DURATION:I = 0x190

.field public static TAG:Ljava/lang/String; = "DavinciWacomChargingDriver"


# direct methods
.method public static synthetic $r8$lambda$EpGDtAlzdE7gGeJWxVYd-uODp7E(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver;->lambda$resetWacomDsp$3(Z)V

    return-void
.end method

.method public static synthetic $r8$lambda$GyONCxMhv6p-gNZemqcGqCm8Hpw(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver;)V
    .locals 0

    invoke-direct {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver;->lambda$startContinuousCharge$5()V

    return-void
.end method

.method public static synthetic $r8$lambda$HJNFpu9gE5SXPg1uQKZ9JKgRTvI(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver;)V
    .locals 0

    invoke-direct {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver;->lambda$turnOffWacomChargingModule$1()V

    return-void
.end method

.method public static synthetic $r8$lambda$R9Y0oUBrbrfIz4N3w4N21m0VjEQ(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver;)V
    .locals 0

    invoke-direct {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver;->lambda$turnOnWacomChargingModule$0()V

    return-void
.end method

.method public static synthetic $r8$lambda$RPgQ-ZoZMWLuHNZjterIwgUOfkI(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver;)V
    .locals 0

    invoke-direct {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver;->lambda$startCharge$4()V

    return-void
.end method

.method public static synthetic $r8$lambda$_HfdW5durykjSeBDZoy7qdqrQGA(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver;)V
    .locals 0

    invoke-direct {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver;->lambda$stopCharge$6()V

    return-void
.end method

.method public static synthetic $r8$lambda$pld4XQc2G7DUG7p969WXtd90Ko8(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver;)V
    .locals 0

    invoke-direct {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver;->lambda$resetSpen$2()V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 6

    const-wide/16 v2, 0xc8

    const-wide/16 v4, 0x14

    move-object v0, p0

    move-object v1, p1

    .line 36
    invoke-direct/range {v0 .. v5}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver;-><init>(Landroid/content/Context;JJ)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;JJ)V
    .locals 0

    .line 40
    invoke-direct/range {p0 .. p5}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;-><init>(Landroid/content/Context;JJ)V

    return-void
.end method

.method private synthetic lambda$resetSpen$2()V
    .locals 2

    .line 69
    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->ensureMinTransactionInterval()V

    const-string v0, "3"

    .line 70
    invoke-virtual {p0, v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->writeBleSpenCommand(Ljava/lang/String;)V

    const-wide/16 v0, 0x1c2

    .line 71
    invoke-static {v0, v1}, Lcom/samsung/android/service/aircommand/util/CommonUtils;->sleep(J)V

    const-string v0, "2"

    .line 72
    invoke-virtual {p0, v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->writeBleSpenCommand(Ljava/lang/String;)V

    .line 73
    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->markEndTransaction()V

    return-void
.end method

.method private synthetic lambda$resetWacomDsp$3(Z)V
    .locals 2

    .line 82
    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->ensureMinTransactionInterval()V

    const-string v0, "7"

    .line 83
    invoke-virtual {p0, v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->writeBleSpenCommand(Ljava/lang/String;)V

    if-eqz p1, :cond_0

    const-wide/16 v0, 0x190

    .line 85
    invoke-static {v0, v1}, Lcom/samsung/android/service/aircommand/util/CommonUtils;->sleep(J)V

    .line 87
    :cond_0
    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->markEndTransaction()V

    return-void
.end method

.method private synthetic lambda$startCharge$4()V
    .locals 1

    .line 97
    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->ensureMinTransactionInterval()V

    const-string v0, "3"

    .line 98
    invoke-virtual {p0, v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->writeBleSpenCommand(Ljava/lang/String;)V

    .line 99
    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->markEndTransaction()V

    return-void
.end method

.method private synthetic lambda$startContinuousCharge$5()V
    .locals 2

    .line 109
    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->ensureMinTransactionInterval()V

    const-string v0, "3"

    .line 110
    invoke-virtual {p0, v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->writeBleSpenCommand(Ljava/lang/String;)V

    const-wide/16 v0, 0x1c2

    .line 111
    invoke-static {v0, v1}, Lcom/samsung/android/service/aircommand/util/CommonUtils;->sleep(J)V

    const-string v0, "4"

    .line 112
    invoke-virtual {p0, v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->writeBleSpenCommand(Ljava/lang/String;)V

    .line 113
    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->markEndTransaction()V

    return-void
.end method

.method private synthetic lambda$stopCharge$6()V
    .locals 1

    .line 123
    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->ensureMinTransactionInterval()V

    const-string v0, "5"

    .line 124
    invoke-virtual {p0, v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->writeBleSpenCommand(Ljava/lang/String;)V

    .line 125
    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->markEndTransaction()V

    return-void
.end method

.method private synthetic lambda$turnOffWacomChargingModule$1()V
    .locals 1

    .line 58
    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->ensureMinTransactionInterval()V

    const-string v0, "0"

    .line 59
    invoke-virtual {p0, v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->writeBleSpenCommand(Ljava/lang/String;)V

    .line 60
    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->markEndTransaction()V

    return-void
.end method

.method private synthetic lambda$turnOnWacomChargingModule$0()V
    .locals 1

    .line 47
    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->ensureMinTransactionInterval()V

    const-string v0, "1"

    .line 48
    invoke-virtual {p0, v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->writeBleSpenCommand(Ljava/lang/String;)V

    .line 49
    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->markEndTransaction()V

    return-void
.end method


# virtual methods
.method public resetSpen()V
    .locals 2

    .line 67
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver;->TAG:Ljava/lang/String;

    const-string v1, "resetSpen"

    invoke-static {v0, v1}, Lcom/samsung/android/service/aircommand/util/debug/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    new-instance v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver$$ExternalSyntheticLambda5;

    invoke-direct {v0, p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver$$ExternalSyntheticLambda5;-><init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver;)V

    .line 75
    invoke-virtual {p0, v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->ensureNotMainThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public resetWacomDsp(Z)I
    .locals 2

    .line 80
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver;->TAG:Ljava/lang/String;

    const-string v1, "resetWacomDsp"

    invoke-static {v0, v1}, Lcom/samsung/android/service/aircommand/util/debug/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    new-instance v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver$$ExternalSyntheticLambda6;

    invoke-direct {v0, p0, p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver$$ExternalSyntheticLambda6;-><init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver;Z)V

    .line 89
    invoke-virtual {p0, v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->ensureNotMainThread(Ljava/lang/Runnable;)V

    const/16 p0, 0x190

    return p0
.end method

.method public startCharge()I
    .locals 2

    .line 95
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver;->TAG:Ljava/lang/String;

    const-string v1, "startCharge"

    invoke-static {v0, v1}, Lcom/samsung/android/service/aircommand/util/debug/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    new-instance v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver$$ExternalSyntheticLambda3;

    invoke-direct {v0, p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver$$ExternalSyntheticLambda3;-><init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver;)V

    .line 101
    invoke-virtual {p0, v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->ensureNotMainThread(Ljava/lang/Runnable;)V

    const p0, 0xea60

    return p0
.end method

.method public startContinuousCharge()Z
    .locals 2

    .line 107
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver;->TAG:Ljava/lang/String;

    const-string v1, "startContinuousCharge"

    invoke-static {v0, v1}, Lcom/samsung/android/service/aircommand/util/debug/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 108
    new-instance v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver$$ExternalSyntheticLambda0;-><init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver;)V

    .line 115
    invoke-virtual {p0, v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->ensureNotMainThread(Ljava/lang/Runnable;)V

    const/4 p0, 0x1

    return p0
.end method

.method public stopCharge()V
    .locals 2

    .line 121
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver;->TAG:Ljava/lang/String;

    const-string v1, "stopCharge"

    invoke-static {v0, v1}, Lcom/samsung/android/service/aircommand/util/debug/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 122
    new-instance v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver$$ExternalSyntheticLambda4;

    invoke-direct {v0, p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver$$ExternalSyntheticLambda4;-><init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver;)V

    .line 127
    invoke-virtual {p0, v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->ensureNotMainThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public turnOffWacomChargingModule()V
    .locals 2

    .line 56
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver;->TAG:Ljava/lang/String;

    const-string v1, "turnOffWacomChargingModule"

    invoke-static {v0, v1}, Lcom/samsung/android/service/aircommand/util/debug/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    new-instance v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver$$ExternalSyntheticLambda1;-><init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver;)V

    .line 62
    invoke-virtual {p0, v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->ensureNotMainThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public turnOnWacomChargingModule()V
    .locals 2

    .line 45
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver;->TAG:Ljava/lang/String;

    const-string v1, "turnOnWacomChargingModule"

    invoke-static {v0, v1}, Lcom/samsung/android/service/aircommand/util/debug/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 46
    new-instance v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver$$ExternalSyntheticLambda2;-><init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver;)V

    .line 51
    invoke-virtual {p0, v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->ensureNotMainThread(Ljava/lang/Runnable;)V

    return-void
.end method
