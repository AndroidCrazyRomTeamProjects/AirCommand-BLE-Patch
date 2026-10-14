.class public Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/CanvasWacomChargingDriver;
.super Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver;
.source "CanvasWacomChargingDriver.java"


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 9
    const-class v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/CanvasWacomChargingDriver;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 6

    const-wide/16 v2, 0xc8

    const-wide/16 v4, 0x14

    move-object v0, p0

    move-object v1, p1

    .line 13
    invoke-direct/range {v0 .. v5}, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/DavinciWacomChargingDriver;-><init>(Landroid/content/Context;JJ)V

    return-void
.end method
