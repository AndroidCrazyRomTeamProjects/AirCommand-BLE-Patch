.class Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/BleSpenCrownFactory$1;
.super Ljava/lang/Object;
.source "BleSpenCrownFactory.java"

# interfaces
.implements Lcom/samsung/android/service/aircommand/remotespen/core/device/util/operation/BleSpenAttachedPenAddrFinder$AdvertisementControlListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/BleSpenCrownFactory;->createAttachedPenAddrFinder(Landroid/content/Context;)Lcom/samsung/android/service/aircommand/remotespen/core/device/util/operation/BleSpenAttachedPenAddrFinder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field private mWacomChargingDriver:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/CrownWacomChargingDriver;

.field public final synthetic this$0:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/BleSpenCrownFactory;

.field public final synthetic val$appContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/BleSpenCrownFactory;Landroid/content/Context;)V
    .locals 0

    .line 36
    iput-object p1, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/BleSpenCrownFactory$1;->this$0:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/BleSpenCrownFactory;

    iput-object p2, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/BleSpenCrownFactory$1;->val$appContext:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    invoke-virtual {p1, p2}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/BleSpenCrownFactory;->getWacomChargingDriver(Landroid/content/Context;)Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;

    move-result-object p1

    check-cast p1, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/CrownWacomChargingDriver;

    iput-object p1, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/BleSpenCrownFactory$1;->mWacomChargingDriver:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/CrownWacomChargingDriver;

    return-void
.end method


# virtual methods
.method public enableSpenAdvertisement(Z)V
    .locals 0

    if-eqz p1, :cond_0

    .line 41
    iget-object p0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/BleSpenCrownFactory$1;->mWacomChargingDriver:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/CrownWacomChargingDriver;

    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/CrownWacomChargingDriver;->turnOnWacomChargingModule()V

    goto :goto_0

    .line 43
    :cond_0
    iget-object p0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/BleSpenCrownFactory$1;->mWacomChargingDriver:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/CrownWacomChargingDriver;

    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/CrownWacomChargingDriver;->turnOffWacomChargingModule()V

    :goto_0
    return-void
.end method

.method public onFinishTicToc()V
    .locals 0

    .line 53
    iget-object p0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/BleSpenCrownFactory$1;->mWacomChargingDriver:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/CrownWacomChargingDriver;

    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/CrownWacomChargingDriver;->turnOnWacomChargingModule()V

    return-void
.end method

.method public onPrepareTicToc()V
    .locals 0

    return-void
.end method
