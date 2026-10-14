.class public Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciFactory;
.super Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDeviceFactory;
.source "BleSpenDavinciFactory.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "BleSpenDavinciFactory"

.field private static sApplicationFeature:Lc3/c;

.field private static sDeviceFeature:Lc3/b;


# instance fields
.field private mWacomChargingDriver:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver;


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    .line 23
    new-instance v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciSpenDeviceFeature;

    invoke-direct {v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciSpenDeviceFeature;-><init>()V

    sput-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciFactory;->sDeviceFeature:Lc3/b;

    .line 24
    new-instance v0, Lc3/c;

    invoke-direct {v0}, Lc3/c;-><init>()V

    const v1, 0x7f110191

    iput v1, v0, Lc3/c;->f:I

    const/4 v1, 0x1

    iput-boolean v1, v0, Lc3/c;->a:Z

    iput-boolean v1, v0, Lc3/c;->b:Z

    iput-boolean v1, v0, Lc3/c;->d:Z

    new-instance v1, Lc3/c;

    invoke-direct {v1, v0}, Lc3/c;-><init>(Lc3/c;)V

    sput-object v1, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciFactory;->sApplicationFeature:Lc3/c;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDeviceFactory;-><init>()V

    return-void
.end method

.method public static synthetic access$000()Ljava/lang/String;
    .locals 1

    .line 20
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciFactory;->TAG:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public createAttachedPenAddrFinder(Landroid/content/Context;)Lcom/samsung/android/service/aircommand/remotespen/core/device/util/operation/BleSpenAttachedPenAddrFinder;
    .locals 3

    .line 41
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 42
    new-instance v1, Lcom/samsung/android/service/aircommand/remotespen/core/device/util/operation/BleSpenAttachedPenAddrFinder;

    new-instance v2, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciFactory$1;

    invoke-direct {v2, p0, v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciFactory$1;-><init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciFactory;Landroid/content/Context;)V

    invoke-direct {v1, p1, v2}, Lcom/samsung/android/service/aircommand/remotespen/core/device/util/operation/BleSpenAttachedPenAddrFinder;-><init>(Landroid/content/Context;Lcom/samsung/android/service/aircommand/remotespen/core/device/util/operation/BleSpenAttachedPenAddrFinder$AdvertisementControlListener;)V

    return-object v1
.end method

.method public a()LV2/i;
    .locals 3

    .line 83
    new-instance v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;

    sget-object v1, Lcom/samsung/android/service/aircommand/util/features/SpenModelName;->DAVINCI:Lcom/samsung/android/service/aircommand/util/features/SpenModelName;

    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciFactory;->d()Lc3/b;

    move-result-object p0

    const/4 v2, 0x0

    invoke-direct {v0, v1, p0, v2, v2}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;-><init>(Lcom/samsung/android/service/aircommand/util/features/SpenModelName;Lc3/b;LP6/b;LW2/a;)V

    return-object v0
.end method

.method public createPenBehaviorPolicyManager(Landroid/content/Context;Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenInstanceId;Lcom/samsung/android/service/aircommand/remotespen/core/device/control/behavior/policy/AbsPenBehaviorPolicy$Callback;)Lcom/samsung/android/service/aircommand/remotespen/core/device/control/behavior/PenBehaviorPolicyManager;
    .locals 0

    .line 99
    new-instance p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/behavior/GenericPenBehaviorPolicyManager;

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/behavior/GenericPenBehaviorPolicyManager;-><init>(Landroid/content/Context;Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenInstanceId;Lcom/samsung/android/service/aircommand/remotespen/core/device/control/behavior/policy/AbsPenBehaviorPolicy$Callback;)V

    return-object p0
.end method

.method public b()Lc3/c;
    .locals 0

    .line 93
    sget-object p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciFactory;->sApplicationFeature:Lc3/c;

    return-object p0
.end method

.method public d()Lc3/b;
    .locals 0

    .line 88
    sget-object p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciFactory;->sDeviceFeature:Lc3/b;

    return-object p0
.end method

.method public getWacomChargingDriver(Landroid/content/Context;)Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;
    .locals 1

    .line 75
    iget-object v0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciFactory;->mWacomChargingDriver:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver;

    if-nez v0, :cond_0

    .line 76
    new-instance v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver;

    invoke-direct {v0, p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciFactory;->mWacomChargingDriver:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver;

    .line 78
    :cond_0
    iget-object p0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciFactory;->mWacomChargingDriver:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver;

    return-object p0
.end method
