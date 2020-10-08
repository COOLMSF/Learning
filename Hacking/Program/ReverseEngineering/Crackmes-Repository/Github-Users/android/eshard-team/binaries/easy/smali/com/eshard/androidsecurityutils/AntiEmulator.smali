.class public Lcom/eshard/androidsecurityutils/AntiEmulator;
.super Ljava/lang/Object;
.source "AntiEmulator.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static IsBuildBrandGeneric()Z
    .locals 2

    .prologue
    .line 49
    sget-object v0, Landroid/os/Build;->BRAND:Ljava/lang/String;

    const-string v1, "generic"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Landroid/os/Build;->BRAND:Ljava/lang/String;

    const-string v1, "generic"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static IsBuildFingerprintGeneric()Z
    .locals 2

    .prologue
    .line 39
    sget-object v0, Landroid/os/Build;->FINGERPRINT:Ljava/lang/String;

    const-string v1, "generic"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    return v0
.end method

.method public static IsDeviceIDZero(Landroid/app/Activity;)Z
    .locals 8
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    const/4 v3, 0x0

    .line 54
    const-string v4, "phone"

    invoke-virtual {p0, v4}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 55
    .local v2, "telMngr":Landroid/telephony/TelephonyManager;
    invoke-virtual {v2}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v0

    .line 57
    .local v0, "deviceID":Ljava/lang/String;
    :try_start_0
    invoke-static {v0}, Ljava/lang/Integer;->decode(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->longValue()J
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-nez v4, :cond_0

    const/4 v3, 0x1

    .line 60
    :cond_0
    :goto_0
    return v3

    .line 58
    :catch_0
    move-exception v1

    .line 60
    .local v1, "ex":Ljava/lang/NumberFormatException;
    goto :goto_0
.end method

.method public static IsInsideEmulator(Landroid/content/Context;Landroid/app/Activity;)Z
    .locals 1
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 66
    invoke-static {}, Lcom/eshard/androidsecurityutils/AntiEmulator;->IsOSBuildModelGoogleSDK()Z

    move-result v0

    if-nez v0, :cond_0

    .line 67
    invoke-static {p0}, Lcom/eshard/androidsecurityutils/AntiEmulator;->IsSensorListEmpty(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 68
    invoke-static {}, Lcom/eshard/androidsecurityutils/AntiEmulator;->IsROKernelQemuSet()Z

    move-result v0

    if-nez v0, :cond_0

    .line 69
    invoke-static {}, Lcom/eshard/androidsecurityutils/AntiEmulator;->IsBuildFingerprintGeneric()Z

    move-result v0

    if-nez v0, :cond_0

    .line 70
    invoke-static {}, Lcom/eshard/androidsecurityutils/AntiEmulator;->IsUserAMonkey()Z

    move-result v0

    if-nez v0, :cond_0

    .line 71
    invoke-static {}, Lcom/eshard/androidsecurityutils/AntiEmulator;->IsBuildBrandGeneric()Z

    move-result v0

    if-nez v0, :cond_0

    .line 72
    invoke-static {p1}, Lcom/eshard/androidsecurityutils/AntiEmulator;->IsDeviceIDZero(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    .line 66
    :goto_0
    return v0

    .line 72
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static IsOSBuildModelGoogleSDK()Z
    .locals 2

    .prologue
    .line 23
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v1, "google_sdk"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static IsROKernelQemuSet()Z
    .locals 2

    .prologue
    .line 34
    const-string v0, "1"

    const-string v1, "ro.kernel.qemu"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static IsSensorListEmpty(Landroid/content/Context;)Z
    .locals 2
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 28
    const-string v1, "sensor"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/SensorManager;

    .line 29
    .local v0, "manager":Landroid/hardware/SensorManager;
    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->getSensorList(I)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    return v1
.end method

.method public static IsUserAMonkey()Z
    .locals 1

    .prologue
    .line 44
    invoke-static {}, Landroid/app/ActivityManager;->isUserAMonkey()Z

    move-result v0

    return v0
.end method
