.class Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasFactory$1;
.super Ljava/lang/Object;
.source "BleSpenCanvasFactory.java"

# interfaces
.implements Lcom/samsung/android/service/aircommand/remotespen/core/device/util/operation/BleSpenAttachedPenAddrFinder$AdvertisementControlListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasFactory;->createAttachedPenAddrFinder(Landroid/content/Context;)Lcom/samsung/android/service/aircommand/remotespen/core/device/util/operation/BleSpenAttachedPenAddrFinder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field private mWacomChargingDriver:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/CanvasWacomChargingDriver;

.field public final synthetic this$0:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasFactory;

.field public final synthetic val$appContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasFactory;Landroid/content/Context;)V
    .locals 0

    .line 52
    iput-object p1, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasFactory$1;->this$0:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasFactory;

    iput-object p2, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasFactory$1;->val$appContext:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    invoke-virtual {p1, p2}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasFactory;->getWacomChargingDriver(Landroid/content/Context;)Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/WacomChargingDriver;

    move-result-object p1

    check-cast p1, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/CanvasWacomChargingDriver;

    iput-object p1, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasFactory$1;->mWacomChargingDriver:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/CanvasWacomChargingDriver;

    return-void
.end method


# virtual methods
.method public enableSpenAdvertisement(Z)V
    .locals 0

    if-eqz p1, :cond_0

    .line 57
    iget-object p0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasFactory$1;->mWacomChargingDriver:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/CanvasWacomChargingDriver;

    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver;->startCharge()I

    goto :goto_0

    .line 59
    :cond_0
    iget-object p0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasFactory$1;->mWacomChargingDriver:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/CanvasWacomChargingDriver;

    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver;->stopCharge()V

    :goto_0
    return-void
.end method

.method public onFinishTicToc()V
    .locals 0

    .line 78
    iget-object p0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasFactory$1;->mWacomChargingDriver:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/CanvasWacomChargingDriver;

    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver;->startCharge()I

    return-void
.end method

.method public onPrepareTicToc()V
    .locals 2

    .line 67
    invoke-static {}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasFactory;->access$000()Ljava/lang/String;

    move-result-object v0

    const-string v1, "onPrepareTicToc : perform reset before TicToc"

    invoke-static {v0, v1}, Lcom/samsung/android/service/aircommand/util/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    iget-object v0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasFactory$1;->mWacomChargingDriver:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/CanvasWacomChargingDriver;

    invoke-virtual {v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver;->stopCharge()V

    .line 69
    iget-object p0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasFactory$1;->mWacomChargingDriver:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/CanvasWacomChargingDriver;

    invoke-virtual {p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver;->resetSpen()V

    const-wide/16 v0, 0x1388

    .line 73
    invoke-static {v0, v1}, Lcom/samsung/android/service/aircommand/util/CommonUtils;->sleep(J)V

    return-void
.end method
