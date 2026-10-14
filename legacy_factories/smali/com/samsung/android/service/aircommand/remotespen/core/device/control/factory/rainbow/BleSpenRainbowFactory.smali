.class public Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/BleSpenRainbowFactory;
.super Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDeviceFactory;
.source "BleSpenRainbowFactory.java"


# static fields
.field private static final MAX_ALLOWABLE_RESPONSE_DELAY_FOR_RAINBOW:I = 0x2bc

.field private static final TAG:Ljava/lang/String; = "BleSpenRainbowFactory"

.field private static sApplicationFeature:Lc3/c;

.field private static sDeviceFeature:Lc3/b;


# instance fields
.field private mWacomChargingDriver:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/RainbowWacomChargingDriver;


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    .line 25
    new-instance v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/RainbowSpenDeviceFeature;

    invoke-direct {v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/RainbowSpenDeviceFeature;-><init>()V

    sput-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/BleSpenRainbowFactory;->sDeviceFeature:Lc3/b;

    .line 26
    new-instance v0, Lc3/c;

    invoke-direct {v0}, Lc3/c;-><init>()V

    const v1, 0x7f110191

    iput v1, v0, Lc3/c;->f:I

    const/4 v1, 0x1

    iput-boolean v1, v0, Lc3/c;->a:Z

    iput-boolean v1, v0, Lc3/c;->b:Z

    iput-boolean v1, v0, Lc3/c;->c:Z

    iput-boolean v1, v0, Lc3/c;->d:Z

    iput-boolean v1, v0, Lc3/c;->e:Z

    iput-boolean v1, v0, Lc3/c;->i:Z

    new-instance v1, Lc3/c;

    invoke-direct {v1, v0}, Lc3/c;-><init>(Lc3/c;)V

    sput-object v1, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/BleSpenRainbowFactory;->sApplicationFeature:Lc3/c;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 21
    invoke-direct {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDeviceFactory;-><init>()V

    return-void
.end method

.method public static synthetic access$000()Ljava/lang/String;
    .locals 1

    .line 21
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/BleSpenRainbowFactory;->TAG:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public createAttachedPenAddrFinder(Landroid/content/Context;)Lcom/samsung/android/service/aircommand/remotespen/core/device/util/operation/BleSpenAttachedPenAddrFinder;
    .locals 3

    .line 43
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 45
    new-instance v1, Lcom/samsung/android/service/aircommand/remotespen/core/device/util/operation/BleSpenAttachedPenAddrFinder;

    new-instance v2, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/BleSpenRainbowFactory$1;

    invoke-direct {v2, p0, v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/BleSpenRainbowFactory$1;-><init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/BleSpenRainbowFactory;Landroid/content/Context;)V

    invoke-direct {v1, p1, v2}, Lcom/samsung/android/service/aircommand/remotespen/core/device/util/operation/BleSpenAttachedPenAddrFinder;-><init>(Landroid/content/Context;Lcom/samsung/android/service/aircommand/remotespen/core/device/util/operation/BleSpenAttachedPenAddrFinder$AdvertisementControlListener;)V

    .line 76
    new-instance p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/util/operation/BleSpenAttachedPenAddrFinder$Options;

    invoke-direct {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/util/operation/BleSpenAttachedPenAddrFinder$Options;-><init>()V

    const/16 p1, 0x2bc

    .line 77
    iput p1, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/util/operation/BleSpenAttachedPenAddrFinder$Options;->mMaxAllowableResponseDelay:I

    .line 78
    invoke-virtual {v1, p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/util/operation/BleSpenAttachedPenAddrFinder;->setFinderOptions(Lcom/samsung/android/service/aircommand/remotespen/core/device/util/operation/BleSpenAttachedPenAddrFinder$Options;)V

    return-object v1
.end method

.method public a()LV2/i;
    .locals 4

    .line 94
    new-instance v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/BleSpenRainbowDriver;

    sget-object v1, Lcom/samsung/android/service/aircommand/util/features/SpenModelName;->RAINBOW:Lcom/samsung/android/service/aircommand/util/features/SpenModelName;

    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/BleSpenRainbowFactory;->d()Lc3/b;

    move-result-object p0

    new-instance v2, Lcom/samsung/android/service/aircommand/remotespen/core/device/fota/RainbowDialogFirmwareUpgradeDriver;

    invoke-direct {v2}, Lcom/samsung/android/service/aircommand/remotespen/core/device/fota/RainbowDialogFirmwareUpgradeDriver;-><init>()V

    const/4 v3, 0x0

    invoke-direct {v0, v1, p0, v3, v2}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/BleSpenRainbowDriver;-><init>(Lcom/samsung/android/service/aircommand/util/features/SpenModelName;Lc3/b;LP6/b;LW2/a;)V

    return-object v0
.end method

.method public createPenBehaviorPolicyManager(Landroid/content/Context;Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenInstanceId;Lcom/samsung/android/service/aircommand/remotespen/core/device/control/behavior/policy/AbsPenBehaviorPolicy$Callback;)Lcom/samsung/android/service/aircommand/remotespen/core/device/control/behavior/PenBehaviorPolicyManager;
    .locals 0

    .line 110
    new-instance p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/behavior/RainbowPenBehaviorPolicyManager;

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/behavior/RainbowPenBehaviorPolicyManager;-><init>(Landroid/content/Context;Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenInstanceId;Lcom/samsung/android/service/aircommand/remotespen/core/device/control/behavior/policy/AbsPenBehaviorPolicy$Callback;)V

    return-object p0
.end method

.method public b()Lc3/c;
    .locals 0

    .line 104
    sget-object p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/BleSpenRainbowFactory;->sApplicationFeature:Lc3/c;

    return-object p0
.end method

.method public d()Lc3/b;
    .locals 0

    .line 99
    sget-object p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/BleSpenRainbowFactory;->sDeviceFeature:Lc3/b;

    return-object p0
.end method

.method public getWacomChargingDriver(Landroid/content/Context;)Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;
    .locals 1

    .line 86
    iget-object v0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/BleSpenRainbowFactory;->mWacomChargingDriver:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/RainbowWacomChargingDriver;

    if-nez v0, :cond_0

    .line 87
    new-instance v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/RainbowWacomChargingDriver;

    invoke-direct {v0, p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/RainbowWacomChargingDriver;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/BleSpenRainbowFactory;->mWacomChargingDriver:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/RainbowWacomChargingDriver;

    .line 89
    :cond_0
    iget-object p0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/BleSpenRainbowFactory;->mWacomChargingDriver:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/RainbowWacomChargingDriver;

    return-object p0
.end method
