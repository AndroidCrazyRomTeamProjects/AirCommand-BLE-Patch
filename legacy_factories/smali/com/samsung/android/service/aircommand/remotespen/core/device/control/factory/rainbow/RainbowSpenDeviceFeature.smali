.class public Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/RainbowSpenDeviceFeature;
.super Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/CanvasSpenDeviceFeature;
.source "RainbowSpenDeviceFeature.java"


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 8
    const-class v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/RainbowSpenDeviceFeature;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    # TAG moved; c3.b has no TAG field

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 6
    invoke-direct {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/CanvasSpenDeviceFeature;-><init>()V

    return-void
.end method


# virtual methods
.method public e()Ljava/lang/String;
    .locals 0

    const-string p0, "rainbow"

    return-object p0
.end method

.method public getPenTypeString()Ljava/lang/String;
    .locals 0

    const-string p0, "rainbow"

    return-object p0
.end method

.method public isSupportFmmConfigPolicy()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public isSupportStandbyMode()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method
