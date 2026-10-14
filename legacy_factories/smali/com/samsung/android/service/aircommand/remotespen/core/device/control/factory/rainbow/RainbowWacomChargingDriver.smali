.class Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/RainbowWacomChargingDriver;
.super Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver;
.source "RainbowWacomChargingDriver.java"


# direct methods
.method public static synthetic $r8$lambda$AG1vIHdNyLCe0BelUKkkLYtqbhI(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/RainbowWacomChargingDriver;)V
    .locals 0

    invoke-direct {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/RainbowWacomChargingDriver;->lambda$startContinuousCharge$1()V

    return-void
.end method

.method public static synthetic $r8$lambda$i1uWIR8JVpZ1NlTq2QtjQNPydnk(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/RainbowWacomChargingDriver;)V
    .locals 0

    invoke-direct {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/RainbowWacomChargingDriver;->lambda$resetSpen$0()V

    return-void
.end method

.method public static constructor <clinit>()V
    .locals 1

    .line 11
    const-class v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/RainbowWacomChargingDriver;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 6

    const-wide/16 v2, 0x1f4

    const-wide/16 v4, 0x1f4

    move-object v0, p0

    move-object v1, p1

    .line 15
    invoke-direct/range {v0 .. v5}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver;-><init>(Landroid/content/Context;JJ)V

    return-void
.end method

.method private synthetic lambda$resetSpen$0()V
    .locals 2

    .line 22
    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->ensureMinTransactionInterval()V

    const-string v0, "3"

    .line 23
    invoke-virtual {p0, v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->writeBleSpenCommand(Ljava/lang/String;)V

    const-wide/16 v0, 0x2bc

    .line 24
    invoke-static {v0, v1}, Lcom/samsung/android/service/aircommand/util/CommonUtils;->sleep(J)V

    const-string v0, "2"

    .line 25
    invoke-virtual {p0, v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->writeBleSpenCommand(Ljava/lang/String;)V

    .line 26
    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->markEndTransaction()V

    return-void
.end method

.method private synthetic lambda$startContinuousCharge$1()V
    .locals 2

    .line 34
    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->ensureMinTransactionInterval()V

    const-string v0, "3"

    .line 35
    invoke-virtual {p0, v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->writeBleSpenCommand(Ljava/lang/String;)V

    const-wide/16 v0, 0x1c2

    .line 36
    invoke-static {v0, v1}, Lcom/samsung/android/service/aircommand/util/CommonUtils;->sleep(J)V

    const-string v0, "8"

    .line 37
    invoke-virtual {p0, v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->writeBleSpenCommand(Ljava/lang/String;)V

    .line 38
    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->markEndTransaction()V

    return-void
.end method


# virtual methods
.method public resetSpen()V
    .locals 2

    .line 20
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver;->TAG:Ljava/lang/String;

    const-string v1, "resetSpen"

    invoke-static {v0, v1}, Lcom/samsung/android/service/aircommand/util/debug/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    new-instance v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/RainbowWacomChargingDriver$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/RainbowWacomChargingDriver$$ExternalSyntheticLambda1;-><init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/RainbowWacomChargingDriver;)V

    .line 28
    invoke-virtual {p0, v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->ensureNotMainThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public startContinuousCharge()Z
    .locals 2

    .line 32
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver;->TAG:Ljava/lang/String;

    const-string v1, "startContinuousCharge"

    invoke-static {v0, v1}, Lcom/samsung/android/service/aircommand/util/debug/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    new-instance v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/RainbowWacomChargingDriver$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/RainbowWacomChargingDriver$$ExternalSyntheticLambda0;-><init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/RainbowWacomChargingDriver;)V

    .line 40
    invoke-virtual {p0, v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;->ensureNotMainThread(Ljava/lang/Runnable;)V

    const/4 p0, 0x1

    return p0
.end method
