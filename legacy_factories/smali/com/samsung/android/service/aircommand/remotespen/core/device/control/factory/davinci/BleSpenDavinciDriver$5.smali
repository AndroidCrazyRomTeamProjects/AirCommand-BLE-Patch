.class synthetic Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver$5;
.super Ljava/lang/Object;
.source "BleSpenDavinciDriver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver;
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

    .line 138
    invoke-static {}, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;->values()[Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver$5;->$SwitchMap$com$samsung$android$service$aircommand$remotespen$core$device$data$BleSpenOperationMode:[I

    :try_start_0
    sget-object v1, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;->DEFAULT:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :try_start_1
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver$5;->$SwitchMap$com$samsung$android$service$aircommand$remotespen$core$device$data$BleSpenOperationMode:[I

    sget-object v1, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;->SENSOR_DEFAULT:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    :try_start_2
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver$5;->$SwitchMap$com$samsung$android$service$aircommand$remotespen$core$device$data$BleSpenOperationMode:[I

    sget-object v1, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;->AIR_MOUSE:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    :catch_2
    :try_start_3
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver$5;->$SwitchMap$com$samsung$android$service$aircommand$remotespen$core$device$data$BleSpenOperationMode:[I

    sget-object v1, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;->AIR_MOUSE_POWER_SAVING:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_3

    :catch_3
    :try_start_4
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver$5;->$SwitchMap$com$samsung$android$service$aircommand$remotespen$core$device$data$BleSpenOperationMode:[I

    sget-object v1, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;->POSTURE:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_4

    :catch_4
    :try_start_5
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver$5;->$SwitchMap$com$samsung$android$service$aircommand$remotespen$core$device$data$BleSpenOperationMode:[I

    sget-object v1, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;->SENSOR_ON:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_5

    :catch_5
    :try_start_6
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver$5;->$SwitchMap$com$samsung$android$service$aircommand$remotespen$core$device$data$BleSpenOperationMode:[I

    sget-object v1, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;->SENSOR_LOW_POWER_ON:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_6

    :catch_6
    :try_start_7
    sget-object v0, Lcom/samsung/android/service/aircommand/remotespen/core/device/control/factory/davinci/BleSpenDavinciDriver$5;->$SwitchMap$com$samsung$android$service$aircommand$remotespen$core$device$data$BleSpenOperationMode:[I

    sget-object v1, Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;->SENSOR_LOW_POWER_OFF:Lcom/samsung/android/service/aircommand/remotespen/core/device/data/BleSpenOperationMode;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/16 v2, 0x8

    aput v2, v0, v1
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_7

    :catch_7
    return-void
.end method
