.class public Lcom/eshard/crackme/utils/cigital/safetynet/SafetyNetWrapper;
.super Ljava/lang/Object;
.source "SafetyNetWrapper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/eshard/crackme/utils/cigital/safetynet/SafetyNetWrapper$SafetyNetCallback;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getJws(Landroid/content/Context;[B)Ljava/lang/String;
    .locals 6
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "nonce"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/eshard/crackme/exceptions/AttestationFailedException;,
            Lcom/eshard/crackme/exceptions/GAPIClientFailedException;
        }
    .end annotation

    .prologue
    .line 39
    invoke-virtual {p0, p1}, Lcom/eshard/crackme/utils/cigital/safetynet/SafetyNetWrapper;->prepareGoogleApiClient(Landroid/content/Context;)Lcom/google/android/gms/common/api/GoogleApiClient;

    move-result-object v2

    .line 40
    .local v2, "gApiClient":Lcom/google/android/gms/common/api/GoogleApiClient;
    invoke-interface {v2}, Lcom/google/android/gms/common/api/GoogleApiClient;->blockingConnect()Lcom/google/android/gms/common/ConnectionResult;

    move-result-object v1

    .line 43
    .local v1, "cr":Lcom/google/android/gms/common/ConnectionResult;
    invoke-virtual {v1}, Lcom/google/android/gms/common/ConnectionResult;->isSuccess()Z

    move-result v4

    if-nez v4, :cond_0

    .line 44
    const-string v4, "snet"

    invoke-virtual {v1}, Lcom/google/android/gms/common/ConnectionResult;->getErrorCode()I

    move-result v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    new-instance v4, Lcom/eshard/crackme/exceptions/GAPIClientFailedException;

    invoke-direct {v4}, Lcom/eshard/crackme/exceptions/GAPIClientFailedException;-><init>()V

    throw v4

    .line 48
    :cond_0
    sget-object v4, Lcom/google/android/gms/safetynet/SafetyNet;->SafetyNetApi:Lcom/google/android/gms/safetynet/SafetyNetApi;

    .line 49
    invoke-interface {v4, v2, p2}, Lcom/google/android/gms/safetynet/SafetyNetApi;->attest(Lcom/google/android/gms/common/api/GoogleApiClient;[B)Lcom/google/android/gms/common/api/PendingResult;

    move-result-object v4

    invoke-interface {v4}, Lcom/google/android/gms/common/api/PendingResult;->await()Lcom/google/android/gms/common/api/Result;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/safetynet/SafetyNetApi$AttestationResult;

    .line 50
    .local v0, "attestationResult":Lcom/google/android/gms/safetynet/SafetyNetApi$AttestationResult;
    invoke-interface {v0}, Lcom/google/android/gms/safetynet/SafetyNetApi$AttestationResult;->getStatus()Lcom/google/android/gms/common/api/Status;

    move-result-object v3

    .line 51
    .local v3, "status":Lcom/google/android/gms/common/api/Status;
    invoke-virtual {v3}, Lcom/google/android/gms/common/api/Status;->isSuccess()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 52
    invoke-interface {v0}, Lcom/google/android/gms/safetynet/SafetyNetApi$AttestationResult;->getJwsResult()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 54
    :cond_1
    new-instance v4, Lcom/eshard/crackme/exceptions/AttestationFailedException;

    invoke-direct {v4}, Lcom/eshard/crackme/exceptions/AttestationFailedException;-><init>()V

    throw v4
.end method

.method protected prepareGoogleApiClient(Landroid/content/Context;)Lcom/google/android/gms/common/api/GoogleApiClient;
    .locals 3
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 27
    new-instance v0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;

    invoke-direct {v0, p1}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;-><init>(Landroid/content/Context;)V

    .line 29
    .local v0, "gacb":Lcom/google/android/gms/common/api/GoogleApiClient$Builder;
    sget-object v2, Lcom/google/android/gms/safetynet/SafetyNet;->API:Lcom/google/android/gms/common/api/Api;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->addApi(Lcom/google/android/gms/common/api/Api;)Lcom/google/android/gms/common/api/GoogleApiClient$Builder;

    move-result-object v1

    .line 32
    .local v1, "gacb2":Lcom/google/android/gms/common/api/GoogleApiClient$Builder;
    invoke-virtual {v1}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->build()Lcom/google/android/gms/common/api/GoogleApiClient;

    move-result-object v2

    return-object v2
.end method
