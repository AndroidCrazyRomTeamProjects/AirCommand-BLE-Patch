.class synthetic Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/BleSpenCrownDriver$3;
.super Ljava/lang/Object;
.source "BleSpenCrownDriver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/BleSpenCrownDriver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1009
    name = null
.end annotation


# static fields
.field public static final synthetic $SwitchMap$com$samsung$android$service$aircommand$remotespen$core$device$data$BleSpenOperationMode:[I


# direct methods
.method public static constructor <clinit>()V
    .locals 3

    .line 141
    invoke-static {}, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;->values()[Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/crown/BleSpenCrownDriver$3;->$SwitchMap$com$samsung$android$service$aircommand$remotespen$core$device$data$BleSpenOperationMode:[I

    :try_start_0
    sget-object v1, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;->DEFAULT:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method
