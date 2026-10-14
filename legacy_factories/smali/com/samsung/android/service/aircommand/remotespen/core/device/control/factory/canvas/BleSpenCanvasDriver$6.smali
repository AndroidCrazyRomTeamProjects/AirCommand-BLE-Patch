.class synthetic Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver$6;
.super Ljava/lang/Object;
.source "BleSpenCanvasDriver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1009
    name = null
.end annotation


# static fields
.field public static final synthetic $SwitchMap$com$samsung$android$service$aircommand$remotespen$core$device$data$BleSpenConnectionInterval:[I

.field public static final synthetic $SwitchMap$com$samsung$android$service$aircommand$remotespen$core$device$data$BleSpenOperationMode:[I


# direct methods
.method public static constructor <clinit>()V
    .locals 5

    .line 165
    invoke-static {}, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;->values()[Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver$6;->$SwitchMap$com$samsung$android$service$aircommand$remotespen$core$device$data$BleSpenOperationMode:[I

    const/4 v1, 0x1

    :try_start_0
    sget-object v2, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;->DEFAULT:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    aput v1, v0, v2
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    const/4 v0, 0x2

    :try_start_1
    sget-object v2, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver$6;->$SwitchMap$com$samsung$android$service$aircommand$remotespen$core$device$data$BleSpenOperationMode:[I

    sget-object v3, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;->SENSOR_DEFAULT:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;

    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    aput v0, v2, v3
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    :try_start_2
    sget-object v2, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver$6;->$SwitchMap$com$samsung$android$service$aircommand$remotespen$core$device$data$BleSpenOperationMode:[I

    sget-object v3, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;->POSTURE:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;

    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    const/4 v4, 0x3

    aput v4, v2, v3
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    :catch_2
    :try_start_3
    sget-object v2, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver$6;->$SwitchMap$com$samsung$android$service$aircommand$remotespen$core$device$data$BleSpenOperationMode:[I

    sget-object v3, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;->SENSOR_ON:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;

    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    const/4 v4, 0x4

    aput v4, v2, v3
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_3

    :catch_3
    :try_start_4
    sget-object v2, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver$6;->$SwitchMap$com$samsung$android$service$aircommand$remotespen$core$device$data$BleSpenOperationMode:[I

    sget-object v3, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;->SENSOR_LOW_POWER_ON:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;

    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    const/4 v4, 0x5

    aput v4, v2, v3
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_4

    :catch_4
    :try_start_5
    sget-object v2, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver$6;->$SwitchMap$com$samsung$android$service$aircommand$remotespen$core$device$data$BleSpenOperationMode:[I

    sget-object v3, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;->SENSOR_LOW_POWER_OFF:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;

    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    const/4 v4, 0x6

    aput v4, v2, v3
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_5

    .line 126
    :catch_5
    invoke-static {}, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenConnectionInterval;->values()[Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenConnectionInterval;

    move-result-object v2

    array-length v2, v2

    new-array v2, v2, [I

    sput-object v2, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver$6;->$SwitchMap$com$samsung$android$service$aircommand$remotespen$core$device$data$BleSpenConnectionInterval:[I

    :try_start_6
    sget-object v3, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenConnectionInterval;->DEFAULT:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenConnectionInterval;

    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    aput v1, v2, v3
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_6

    :catch_6
    :try_start_7
    sget-object v1, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/canvas/BleSpenCanvasDriver$6;->$SwitchMap$com$samsung$android$service$aircommand$remotespen$core$device$data$BleSpenConnectionInterval:[I

    sget-object v2, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenConnectionInterval;->MINIMUM:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenConnectionInterval;

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    aput v0, v1, v2
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_7

    :catch_7
    return-void
.end method
