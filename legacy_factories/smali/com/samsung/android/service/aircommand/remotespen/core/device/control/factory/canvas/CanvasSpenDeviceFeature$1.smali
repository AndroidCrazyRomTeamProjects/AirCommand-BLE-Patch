.class Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/CanvasSpenDeviceFeature$1;
.super Ljava/lang/Object;
.source "CanvasSpenDeviceFeature.java"

# interfaces
.implements Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenScanFilter$FilterBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/CanvasSpenDeviceFeature;->getScanFilter()Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenScanFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/CanvasSpenDeviceFeature;


# direct methods
.method public constructor <init>(Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/CanvasSpenDeviceFeature;)V
    .locals 0

    .line 106
    iput-object p1, p0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/CanvasSpenDeviceFeature$1;->this$0:Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/CanvasSpenDeviceFeature;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public applyFilter(Landroid/bluetooth/le/ScanFilter$Builder;)V
    .locals 1

    const/4 p0, 0x7

    new-array p0, p0, [B

    .line 115
    fill-array-data p0, :array_0

    .line 116
    invoke-static {}, Lcom/samsung/android/service/aircommand/remotespen/core/device/util/BleUtils;->getSamsungManufacturerId()I

    move-result v0

    invoke-virtual {p1, v0, p0}, Landroid/bluetooth/le/ScanFilter$Builder;->setManufacturerData(I[B)Landroid/bluetooth/le/ScanFilter$Builder;

    return-void

    :array_0
    .array-data 1
        0x1t
        0x53t
        0x50t
        0x45t
        0x4et
        0x30t
        0x32t
    .end array-data
.end method
