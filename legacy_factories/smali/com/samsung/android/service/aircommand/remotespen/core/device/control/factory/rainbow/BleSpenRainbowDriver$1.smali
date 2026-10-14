.class Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/BleSpenRainbowDriver$1;
.super Ljava/lang/Object;
.source "BleSpenRainbowDriver.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/BleSpenRainbowDriver;->setSpenOperationMode(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/BleSpenRainbowDriver;

.field public final synthetic val$dataToWrite:[B

.field public final synthetic val$finishListener:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;

.field public final synthetic val$opMode:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;


# direct methods
.method public constructor <init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/BleSpenRainbowDriver;[BLcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V
    .locals 0

    .line 65
    iput-object p1, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/BleSpenRainbowDriver$1;->this$0:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/BleSpenRainbowDriver;

    iput-object p2, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/BleSpenRainbowDriver$1;->val$dataToWrite:[B

    iput-object p3, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/BleSpenRainbowDriver$1;->val$opMode:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;

    iput-object p4, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/BleSpenRainbowDriver$1;->val$finishListener:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 68
    iget-object v0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/BleSpenRainbowDriver$1;->this$0:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/BleSpenRainbowDriver;

    invoke-static {v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/BleSpenRainbowDriver;->access$200(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/BleSpenRainbowDriver;)Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenBleDriver;

    move-result-object v0

    iget-object v1, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/BleSpenRainbowDriver$1;->this$0:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/BleSpenRainbowDriver;

    invoke-virtual {v1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->getSpenServiceUuid()Ljava/util/UUID;

    move-result-object v1

    sget-object v2, Lcom/samsung/android/service/aircommand/remotespen/core/device/ble/constants/BleSpenUuid;->MODE:Ljava/util/UUID;

    iget-object v3, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/BleSpenRainbowDriver$1;->val$dataToWrite:[B

    new-instance v4, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/BleSpenRainbowDriver$1$1;

    invoke-direct {v4, p0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/BleSpenRainbowDriver$1$1;-><init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/rainbow/BleSpenRainbowDriver$1;)V

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenBleDriver;->writeCharacteristic(Ljava/util/UUID;Ljava/util/UUID;[BLcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V

    return-void
.end method
