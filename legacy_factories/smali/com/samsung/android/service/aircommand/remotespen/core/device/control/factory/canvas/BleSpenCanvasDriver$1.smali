.class Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver$1;
.super Ljava/lang/Object;
.source "BleSpenCanvasDriver.java"

# interfaces
.implements Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->discoverService(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V
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

    .line 62
    iput-object p1, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver$1;->this$0:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;

    iput-object p2, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver$1;->val$finishListener:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFinish(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;J)V
    .locals 2

    .line 66
    invoke-virtual {p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;->isSuccess()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 67
    iget-object v0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver$1;->this$0:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;

    invoke-virtual {v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver;->getGatt()Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/abstraction/IBleGatt;

    move-result-object v0

    .line 69
    invoke-static {}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->access$000()Ljava/util/UUID;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/abstraction/IBleGatt;->getService(Ljava/util/UUID;)Landroid/bluetooth/BluetoothGattService;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 70
    iget-object v0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver$1;->this$0:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;

    invoke-static {}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->access$000()Ljava/util/UUID;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->access$102(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;Ljava/util/UUID;)Ljava/util/UUID;

    goto :goto_0

    .line 71
    :cond_0
    invoke-static {}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->access$200()Ljava/util/UUID;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/abstraction/IBleGatt;->getService(Ljava/util/UUID;)Landroid/bluetooth/BluetoothGattService;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 72
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->TAG:Ljava/lang/String;

    const-string v1, "discoverService : legacy SPen service UUID"

    invoke-static {v0, v1}, Lcom/samsung/android/service/aircommand/util/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    iget-object v0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver$1;->this$0:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;

    invoke-static {}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->access$200()Ljava/util/UUID;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->access$102(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;Ljava/util/UUID;)Ljava/util/UUID;

    .line 77
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver$1;->this$0:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;

    invoke-static {v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->access$100(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;)Ljava/util/UUID;

    move-result-object v0

    if-nez v0, :cond_2

    .line 78
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->TAG:Ljava/lang/String;

    const-string v1, "discoverService : Failed to find the Spen service"

    invoke-static {v0, v1}, Lcom/samsung/android/service/aircommand/util/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;->SERVICE_DISCOVERY_FAIL:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;

    invoke-virtual {p1, v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;->setBleResultCode(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultCode;)V

    .line 83
    :cond_2
    iget-object p0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver$1;->val$finishListener:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;

    if-eqz p0, :cond_3

    .line 84
    invoke-interface {p0, p1, p2, p3}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;->onFinish(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;J)V

    :cond_3
    return-void
.end method
