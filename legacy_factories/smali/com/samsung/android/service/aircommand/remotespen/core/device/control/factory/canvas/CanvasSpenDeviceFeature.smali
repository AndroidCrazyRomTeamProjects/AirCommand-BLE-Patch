.class public Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/CanvasSpenDeviceFeature;
.super Lc3/b;
.source "CanvasSpenDeviceFeature.java"


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 9
    const/4 v0, 0x5

    invoke-direct {p0, v0}, Lc3/b;-><init>(I)V

    return-void
.end method


# virtual methods
.method public e()Ljava/lang/String;
    .locals 0

    const-string p0, "canvas"

    return-object p0
.end method

.method public getMaxMotionMovementValue()I
    .locals 0

    const/16 p0, 0x546

    return p0
.end method

.method public getMinChargeDurationForSpenBoot(Z)I
    .locals 0

    if-eqz p1, :cond_0

    const/16 p0, 0x7530

    return p0

    :cond_0
    const p0, 0xc350

    return p0
.end method

.method public getMotionStayRangeThreshold()I
    .locals 0

    const/16 p0, 0x190

    return p0
.end method

.method public getPenTypeString()Ljava/lang/String;
    .locals 0

    const-string p0, "canvas"

    return-object p0
.end method

.method public getScanFilter()Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenScanFilter;
    .locals 2

    .line 106
    new-instance v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenScanFilter;

    new-instance v1, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/CanvasSpenDeviceFeature$1;

    invoke-direct {v1, p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/CanvasSpenDeviceFeature$1;-><init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/CanvasSpenDeviceFeature;)V

    invoke-direct {v0, v1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenScanFilter;-><init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenScanFilter$FilterBuilder;)V

    return-object v0
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
