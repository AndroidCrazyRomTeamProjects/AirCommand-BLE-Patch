.class public Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciSpenDeviceFeature;
.super Lc3/b;
.source "DavinciSpenDeviceFeature.java"


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 6
    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lc3/b;-><init>(I)V

    return-void
.end method


# virtual methods
.method public e()Ljava/lang/String;
    .locals 0

    const-string p0, "davinci"

    return-object p0
.end method

.method public getMaxMotionMovementValue()I
    .locals 0

    const/16 p0, 0xa8c

    return p0
.end method

.method public getMinChargeDurationForSpenBoot(Z)I
    .locals 0

    const/16 p0, 0x7530

    return p0
.end method

.method public getMotionStayRangeThreshold()I
    .locals 0

    const/16 p0, 0x190

    return p0
.end method

.method public getPenTypeString()Ljava/lang/String;
    .locals 0

    const-string p0, "davinci"

    return-object p0
.end method

.method public getScanFilter()Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenScanFilter;
    .locals 1

    .line 102
    new-instance p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenScanFilter;

    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;->UUID_SPEN_SERVICE:Ljava/util/UUID;

    invoke-direct {p0, v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenScanFilter;-><init>(Ljava/util/UUID;)V

    return-object p0
.end method

.method public isBundleTypeSpen()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public isSupportAutoConnect()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public isSupportButtonDownUpEvent()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public isSupportChargeState()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public isSupportEasyConnect()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public isSupportFmmConfigPolicy()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public isSupportLed()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public isSupportLogExtraction()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public isSupportMotionSensor()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public isSupportPenColorCode()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public isSupportPenFrequencyChange()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public isSupportPenTipApproachDetection()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public isSupportSecondaryButton()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public isSupportSpenChargeNotification()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public isSupportStandbyMode()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public isSupportWacomCharger()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public shouldChangeSlaveLatencyOnLowBattery()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public shouldPerformWacomDspResetOnLinkLossAndLowBattery()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method
