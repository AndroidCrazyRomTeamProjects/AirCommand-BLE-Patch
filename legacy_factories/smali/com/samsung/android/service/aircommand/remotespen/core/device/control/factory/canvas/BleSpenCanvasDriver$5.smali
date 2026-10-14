.class Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver$5;
.super Ljava/lang/Object;
.source "BleSpenCanvasDriver.java"

# interfaces
.implements Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;->readRawBatteryLevel(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V
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

    .line 514
    iput-object p1, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver$5;->this$0:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;

    iput-object p2, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver$5;->val$finishListener:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFinish(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;J)V
    .locals 4

    .line 518
    invoke-virtual {p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;->getByteData()[B

    move-result-object v0

    if-eqz v0, :cond_2

    .line 519
    array-length v1, v0

    const/4 v2, 0x2

    if-lt v1, v2, :cond_2

    const/4 v1, 0x1

    .line 520
    aget-byte v1, v0, v1

    shl-int/lit8 v1, v1, 0x8

    const v2, 0xffff

    and-int/2addr v1, v2

    const/4 v2, 0x0

    aget-byte v0, v0, v2

    and-int/lit16 v0, v0, 0xff

    or-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 522
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/16 v3, 0x2e3

    if-lt v1, v3, :cond_0

    const/16 v0, 0x64

    .line 523
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0

    .line 524
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/16 v3, 0x28e

    if-ge v1, v3, :cond_1

    .line 525
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0

    .line 527
    :cond_1
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    sub-int/2addr v0, v3

    int-to-float v0, v0

    const/high16 v1, 0x42aa0000    # 85.0f

    div-float/2addr v0, v1

    const/high16 v1, 0x42c80000    # 100.0f

    mul-float/2addr v0, v1

    float-to-int v0, v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 529
    :goto_0
    invoke-virtual {p1, v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;->setRawBatteryLevel(Ljava/lang/Integer;)V

    .line 532
    :cond_2
    iget-object p0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver$5;->val$finishListener:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;

    if-eqz p0, :cond_3

    .line 533
    invoke-interface {p0, p1, p2, p3}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;->onFinish(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;J)V

    :cond_3
    return-void
.end method
