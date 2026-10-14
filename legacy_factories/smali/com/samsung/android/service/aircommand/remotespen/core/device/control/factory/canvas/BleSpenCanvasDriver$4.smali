.class Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver$4;
.super Ljava/lang/Object;
.source "BleSpenCanvasDriver.java"

# interfaces
.implements Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->sendFastDischargeCommand(ILcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;

.field public final synthetic val$finishListener:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;


# direct methods
.method public constructor <init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V
    .locals 0

    .line 231
    iput-object p1, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver$4;->this$0:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;

    iput-object p2, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver$4;->val$finishListener:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFinish(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;J)V
    .locals 4

    .line 234
    invoke-virtual {p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;->getResultCode()Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;

    move-result-object v0

    .line 235
    sget-object v1, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "sendFastDischargeCommand : result = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " elapsed="

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/samsung/android/service/aircommand/util/debug/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 236
    iget-object p0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver$4;->val$finishListener:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;

    if-eqz p0, :cond_0

    .line 237
    invoke-interface {p0, p1, p2, p3}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;->onFinish(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;J)V

    :cond_0
    return-void
.end method
