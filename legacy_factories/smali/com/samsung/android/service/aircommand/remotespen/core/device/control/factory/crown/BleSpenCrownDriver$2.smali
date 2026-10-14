.class Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/BleSpenCrownDriver$2;
.super Ljava/lang/Object;
.source "BleSpenCrownDriver.java"

# interfaces
.implements Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/BleSpenCrownDriver;->readRawBatteryLevel(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/BleSpenCrownDriver;

.field public final synthetic val$finishListener:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;


# direct methods
.method public constructor <init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/BleSpenCrownDriver;Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;)V
    .locals 0

    .line 159
    iput-object p1, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/BleSpenCrownDriver$2;->this$0:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/BleSpenCrownDriver;

    iput-object p2, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/BleSpenCrownDriver$2;->val$finishListener:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFinish(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;J)V
    .locals 3

    .line 163
    invoke-virtual {p1}, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;->getByteData()[B

    move-result-object v0

    if-eqz v0, :cond_0

    .line 164
    array-length v1, v0

    const/4 v2, 0x2

    if-lt v1, v2, :cond_0

    const/4 v1, 0x1

    .line 165
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

    .line 166
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    int-to-float v0, v0

    const v1, 0x43aa8000    # 341.0f

    sub-float/2addr v0, v1

    const/high16 v1, 0x43c00000    # 384.0f

    div-float/2addr v0, v1

    const/high16 v1, 0x42c80000    # 100.0f

    mul-float/2addr v0, v1

    float-to-int v0, v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 167
    invoke-virtual {p1, v0}, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;->setRawBatteryLevel(Ljava/lang/Integer;)V

    .line 170
    :cond_0
    iget-object p0, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/BleSpenCrownDriver$2;->val$finishListener:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;

    if-eqz p0, :cond_1

    .line 171
    invoke-interface {p0, p1, p2, p3}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/BleSpenDriver$OperationFinishListener;->onFinish(Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleOpResultData;J)V

    :cond_1
    return-void
.end method
