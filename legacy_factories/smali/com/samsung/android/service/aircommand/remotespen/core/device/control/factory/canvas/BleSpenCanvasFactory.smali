.class public Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasFactory;
.super Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDeviceFactory;
.source "BleSpenCanvasFactory.java"


# static fields
.field private static final MAX_ALLOWABLE_RESPONSE_DELAY_FOR_CANVAS:I = 0x2bc

.field private static final TAG:Ljava/lang/String; = "BleSpenCanvasFactory"

.field private static sApplicationFeature:Lc3/c;

.field private static sDeviceFeature:Lc3/b;


# instance fields
.field private mIsSupportFirmwareUpgrade:Z

.field private mWacomChargingDriver:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/CanvasWacomChargingDriver;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 26
    new-instance v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/CanvasSpenDeviceFeature;

    invoke-direct {v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/CanvasSpenDeviceFeature;-><init>()V

    sput-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasFactory;->sDeviceFeature:Lc3/b;

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 31
    invoke-direct {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDeviceFactory;-><init>()V

    .line 32
    invoke-static {}, Lcom/samsung/android/service/aircommand/util/CommonUtils;->isSupportFirmwareUpgradeForTablet()Z

    move-result v0

    iput-boolean v0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasFactory;->mIsSupportFirmwareUpgrade:Z

    .line 33
    new-instance v0, Lc3/c;

    invoke-direct {v0}, Lc3/c;-><init>()V

    const v1, 0x7f110191

    iput v1, v0, Lc3/c;->f:I

    const/4 v1, 0x1

    iput-boolean v1, v0, Lc3/c;->a:Z

    iput-boolean v1, v0, Lc3/c;->b:Z

    iput-boolean v1, v0, Lc3/c;->c:Z

    iput-boolean v1, v0, Lc3/c;->d:Z

    new-instance v1, Lc3/c;

    invoke-direct {v1, v0}, Lc3/c;-><init>(Lc3/c;)V

    sput-object v1, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasFactory;->sApplicationFeature:Lc3/c;

    return-void
.end method

.method public static synthetic access$000()Ljava/lang/String;
    .locals 1

    .line 21
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasFactory;->TAG:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public createAttachedPenAddrFinder(Landroid/content/Context;)Lcom/samsung/android/service/aircommand/remotespen/core/device/util/operation/BleSpenAttachedPenAddrFinder;
    .locals 3

    .line 49
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 51
    new-instance v1, Lcom/samsung/android/service/aircommand/remotespen/core/device/util/operation/BleSpenAttachedPenAddrFinder;

    new-instance v2, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasFactory$1;

    invoke-direct {v2, p0, v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasFactory$1;-><init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasFactory;Landroid/content/Context;)V

    invoke-direct {v1, p1, v2}, Lcom/samsung/android/service/aircommand/remotespen/core/device/util/operation/BleSpenAttachedPenAddrFinder;-><init>(Landroid/content/Context;Lcom/samsung/android/service/aircommand/remotespen/core/device/util/operation/BleSpenAttachedPenAddrFinder$AdvertisementControlListener;)V

    .line 82
    new-instance p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/util/operation/BleSpenAttachedPenAddrFinder$Options;

    invoke-direct {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/util/operation/BleSpenAttachedPenAddrFinder$Options;-><init>()V

    const/16 p1, 0x2bc

    .line 83
    iput p1, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/util/operation/BleSpenAttachedPenAddrFinder$Options;->mMaxAllowableResponseDelay:I

    .line 84
    invoke-virtual {v1, p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/util/operation/BleSpenAttachedPenAddrFinder;->setFinderOptions(Lcom/samsung/android/service/aircommand/remotespen/core/device/util/operation/BleSpenAttachedPenAddrFinder$Options;)V

    return-object v1
.end method

.method public a()LV2/i;
    .locals 4

    .line 99
    new-instance v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;

    sget-object v1, Lcom/samsung/android/service/aircommand/util/features/SpenModelName;->CANVAS:Lcom/samsung/android/service/aircommand/util/features/SpenModelName;

    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasFactory;->d()Lc3/b;

    move-result-object v2

    .line 100
    iget-boolean p0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasFactory;->mIsSupportFirmwareUpgrade:Z

    const/4 v3, 0x0

    if-eqz p0, :cond_0

    new-instance p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/fota/RainbowDialogFirmwareUpgradeDriver;

    invoke-direct {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/fota/RainbowDialogFirmwareUpgradeDriver;-><init>()V

    goto :goto_0

    :cond_0
    move-object p0, v3

    :goto_0
    invoke-direct {v0, v1, v2, v3, p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;-><init>(Lcom/samsung/android/service/aircommand/util/features/SpenModelName;Lc3/b;LP6/b;LW2/a;)V

    return-object v0
.end method

.method public createPenBehaviorPolicyManager(Landroid/content/Context;Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenInstanceId;Lcom/samsung/android/service/aircommand/remotespen/core/device/control/behavior/policy/AbsPenBehaviorPolicy$Callback;)Lcom/samsung/android/service/aircommand/remotespen/core/device/control/behavior/PenBehaviorPolicyManager;
    .locals 0

    .line 116
    new-instance p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/behavior/GenericPenBehaviorPolicyManager;

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/behavior/GenericPenBehaviorPolicyManager;-><init>(Landroid/content/Context;Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenInstanceId;Lcom/samsung/android/service/aircommand/remotespen/core/device/control/behavior/policy/AbsPenBehaviorPolicy$Callback;)V

    return-object p0
.end method

.method public b()Lc3/c;
    .locals 0

    .line 110
    sget-object p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasFactory;->sApplicationFeature:Lc3/c;

    return-object p0
.end method

.method public d()Lc3/b;
    .locals 0

    .line 105
    sget-object p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasFactory;->sDeviceFeature:Lc3/b;

    return-object p0
.end method

.method public getWacomChargingDriver(Landroid/content/Context;)Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;
    .locals 1

    .line 91
    iget-object v0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasFactory;->mWacomChargingDriver:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/CanvasWacomChargingDriver;

    if-nez v0, :cond_0

    .line 92
    new-instance v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/CanvasWacomChargingDriver;

    invoke-direct {v0, p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/CanvasWacomChargingDriver;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasFactory;->mWacomChargingDriver:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/CanvasWacomChargingDriver;

    .line 94
    :cond_0
    iget-object p0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasFactory;->mWacomChargingDriver:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/CanvasWacomChargingDriver;

    return-object p0
.end method
