.class public Lcom/google/android/gms/common/api/zzg;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/api/zzj;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/common/api/zzg$zza;,
        Lcom/google/android/gms/common/api/zzg$zzd;,
        Lcom/google/android/gms/common/api/zzg$zzg;,
        Lcom/google/android/gms/common/api/zzg$zzb;,
        Lcom/google/android/gms/common/api/zzg$zzf;,
        Lcom/google/android/gms/common/api/zzg$zzc;,
        Lcom/google/android/gms/common/api/zzg$zzh;,
        Lcom/google/android/gms/common/api/zzg$zze;,
        Lcom/google/android/gms/common/api/zzg$zzi;
    }
.end annotation


# instance fields
.field private final mContext:Landroid/content/Context;

.field private zzZA:Lcom/google/android/gms/signin/zzd;

.field private zzZB:I

.field private zzZC:Z

.field private zzZD:Z

.field private zzZE:Lcom/google/android/gms/common/internal/zzp;

.field private zzZF:Z

.field private zzZG:Z

.field private final zzZH:Lcom/google/android/gms/common/internal/zzf;

.field private final zzZI:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/google/android/gms/common/api/Api",
            "<*>;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private zzZJ:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/concurrent/Future",
            "<*>;>;"
        }
    .end annotation
.end field

.field private final zzZi:Lcom/google/android/gms/common/GoogleApiAvailability;

.field private final zzZj:Lcom/google/android/gms/common/api/Api$zza;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/Api$zza",
            "<+",
            "Lcom/google/android/gms/signin/zzd;",
            "Lcom/google/android/gms/signin/zze;",
            ">;"
        }
    .end annotation
.end field

.field private final zzZq:Lcom/google/android/gms/common/api/zzi;

.field private final zzZs:Ljava/util/concurrent/locks/Lock;

.field private zzZt:Lcom/google/android/gms/common/ConnectionResult;

.field private zzZu:I

.field private zzZv:I

.field private zzZw:Z

.field private zzZx:I

.field private final zzZy:Landroid/os/Bundle;

.field private final zzZz:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/google/android/gms/common/api/Api$zzc;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/api/zzi;Lcom/google/android/gms/common/internal/zzf;Ljava/util/Map;Lcom/google/android/gms/common/GoogleApiAvailability;Lcom/google/android/gms/common/api/Api$zza;Ljava/util/concurrent/locks/Lock;Landroid/content/Context;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/zzi;",
            "Lcom/google/android/gms/common/internal/zzf;",
            "Ljava/util/Map",
            "<",
            "Lcom/google/android/gms/common/api/Api",
            "<*>;",
            "Ljava/lang/Integer;",
            ">;",
            "Lcom/google/android/gms/common/GoogleApiAvailability;",
            "Lcom/google/android/gms/common/api/Api$zza",
            "<+",
            "Lcom/google/android/gms/signin/zzd;",
            "Lcom/google/android/gms/signin/zze;",
            ">;",
            "Ljava/util/concurrent/locks/Lock;",
            "Landroid/content/Context;",
            ")V"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZv:I

    iput-boolean v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZw:Z

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZy:Landroid/os/Bundle;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZz:Ljava/util/Set;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZJ:Ljava/util/ArrayList;

    iput-object p1, p0, Lcom/google/android/gms/common/api/zzg;->zzZq:Lcom/google/android/gms/common/api/zzi;

    iput-object p2, p0, Lcom/google/android/gms/common/api/zzg;->zzZH:Lcom/google/android/gms/common/internal/zzf;

    iput-object p3, p0, Lcom/google/android/gms/common/api/zzg;->zzZI:Ljava/util/Map;

    iput-object p4, p0, Lcom/google/android/gms/common/api/zzg;->zzZi:Lcom/google/android/gms/common/GoogleApiAvailability;

    iput-object p5, p0, Lcom/google/android/gms/common/api/zzg;->zzZj:Lcom/google/android/gms/common/api/Api$zza;

    iput-object p6, p0, Lcom/google/android/gms/common/api/zzg;->zzZs:Ljava/util/concurrent/locks/Lock;

    iput-object p7, p0, Lcom/google/android/gms/common/api/zzg;->mContext:Landroid/content/Context;

    return-void
.end method

.method private zzX(Z)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZA:Lcom/google/android/gms/signin/zzd;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZA:Lcom/google/android/gms/signin/zzd;

    invoke-interface {v0}, Lcom/google/android/gms/signin/zzd;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZA:Lcom/google/android/gms/signin/zzd;

    invoke-interface {v0}, Lcom/google/android/gms/signin/zzd;->zzzn()V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZA:Lcom/google/android/gms/signin/zzd;

    invoke-interface {v0}, Lcom/google/android/gms/signin/zzd;->disconnect()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZE:Lcom/google/android/gms/common/internal/zzp;

    :cond_1
    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/common/api/zzg;)Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic zza(Lcom/google/android/gms/common/api/zzg;Lcom/google/android/gms/common/ConnectionResult;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/common/api/zzg;->zzf(Lcom/google/android/gms/common/ConnectionResult;)V

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/common/api/zzg;Lcom/google/android/gms/common/ConnectionResult;Lcom/google/android/gms/common/api/Api;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/gms/common/api/zzg;->zzb(Lcom/google/android/gms/common/ConnectionResult;Lcom/google/android/gms/common/api/Api;I)V

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/common/api/zzg;Lcom/google/android/gms/common/internal/ResolveAccountResponse;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/common/api/zzg;->zza(Lcom/google/android/gms/common/internal/ResolveAccountResponse;)V

    return-void
.end method

.method private zza(Lcom/google/android/gms/common/internal/ResolveAccountResponse;)V
    .locals 2

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/google/android/gms/common/api/zzg;->zzbe(I)Z

    move-result v0

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/common/internal/ResolveAccountResponse;->zzoP()Lcom/google/android/gms/common/ConnectionResult;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/common/ConnectionResult;->isSuccess()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p1}, Lcom/google/android/gms/common/internal/ResolveAccountResponse;->zzoO()Lcom/google/android/gms/common/internal/zzp;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZE:Lcom/google/android/gms/common/internal/zzp;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZD:Z

    invoke-virtual {p1}, Lcom/google/android/gms/common/internal/ResolveAccountResponse;->zzoQ()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZF:Z

    invoke-virtual {p1}, Lcom/google/android/gms/common/internal/ResolveAccountResponse;->zzoR()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZG:Z

    invoke-direct {p0}, Lcom/google/android/gms/common/api/zzg;->zznp()V

    goto :goto_0

    :cond_1
    invoke-direct {p0, v0}, Lcom/google/android/gms/common/api/zzg;->zze(Lcom/google/android/gms/common/ConnectionResult;)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-direct {p0}, Lcom/google/android/gms/common/api/zzg;->zznu()V

    invoke-direct {p0}, Lcom/google/android/gms/common/api/zzg;->zznp()V

    goto :goto_0

    :cond_2
    invoke-direct {p0, v0}, Lcom/google/android/gms/common/api/zzg;->zzf(Lcom/google/android/gms/common/ConnectionResult;)V

    goto :goto_0
.end method

.method private zza(IILcom/google/android/gms/common/ConnectionResult;)Z
    .locals 3

    const/4 v1, 0x1

    const/4 v0, 0x0

    if-ne p2, v1, :cond_1

    invoke-direct {p0, p3}, Lcom/google/android/gms/common/api/zzg;->zzd(Lcom/google/android/gms/common/ConnectionResult;)Z

    move-result v2

    if-nez v2, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    iget-object v2, p0, Lcom/google/android/gms/common/api/zzg;->zzZt:Lcom/google/android/gms/common/ConnectionResult;

    if-eqz v2, :cond_2

    iget v2, p0, Lcom/google/android/gms/common/api/zzg;->zzZu:I

    if-ge p1, v2, :cond_0

    :cond_2
    move v0, v1

    goto :goto_0
.end method

.method static synthetic zza(Lcom/google/android/gms/common/api/zzg;I)Z
    .locals 1

    invoke-direct {p0, p1}, Lcom/google/android/gms/common/api/zzg;->zzbe(I)Z

    move-result v0

    return v0
.end method

.method static synthetic zzb(Lcom/google/android/gms/common/api/zzg;)Lcom/google/android/gms/common/GoogleApiAvailability;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZi:Lcom/google/android/gms/common/GoogleApiAvailability;

    return-object v0
.end method

.method private zzb(Lcom/google/android/gms/common/ConnectionResult;Lcom/google/android/gms/common/api/Api;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/ConnectionResult;",
            "Lcom/google/android/gms/common/api/Api",
            "<*>;I)V"
        }
    .end annotation

    const/4 v0, 0x2

    if-eq p3, v0, :cond_0

    invoke-virtual {p2}, Lcom/google/android/gms/common/api/Api;->zznb()Lcom/google/android/gms/common/api/Api$zza;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/Api$zza;->getPriority()I

    move-result v0

    invoke-direct {p0, v0, p3, p1}, Lcom/google/android/gms/common/api/zzg;->zza(IILcom/google/android/gms/common/ConnectionResult;)Z

    move-result v1

    if-eqz v1, :cond_0

    iput-object p1, p0, Lcom/google/android/gms/common/api/zzg;->zzZt:Lcom/google/android/gms/common/ConnectionResult;

    iput v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZu:I

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZq:Lcom/google/android/gms/common/api/zzi;

    iget-object v0, v0, Lcom/google/android/gms/common/api/zzi;->zzaag:Ljava/util/Map;

    invoke-virtual {p2}, Lcom/google/android/gms/common/api/Api;->zznd()Lcom/google/android/gms/common/api/Api$zzc;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method static synthetic zzb(Lcom/google/android/gms/common/api/zzg;Lcom/google/android/gms/common/ConnectionResult;)Z
    .locals 1

    invoke-direct {p0, p1}, Lcom/google/android/gms/common/api/zzg;->zze(Lcom/google/android/gms/common/ConnectionResult;)Z

    move-result v0

    return v0
.end method

.method private zzbe(I)Z
    .locals 3

    iget v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZv:I

    if-eq v0, p1, :cond_0

    const-string v0, "GoogleApiClientConnecting"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "GoogleApiClient connecting is in step "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/google/android/gms/common/api/zzg;->zzZv:I

    invoke-direct {p0, v2}, Lcom/google/android/gms/common/api/zzg;->zzbf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " but received callback for step "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-direct {p0, p1}, Lcom/google/android/gms/common/api/zzg;->zzbf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Lcom/google/android/gms/common/ConnectionResult;

    const/16 v1, 0x8

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/common/ConnectionResult;-><init>(ILandroid/app/PendingIntent;)V

    invoke-direct {p0, v0}, Lcom/google/android/gms/common/api/zzg;->zzf(Lcom/google/android/gms/common/ConnectionResult;)V

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private zzbf(I)Ljava/lang/String;
    .locals 1

    packed-switch p1, :pswitch_data_0

    const-string v0, "UNKNOWN"

    :goto_0
    return-object v0

    :pswitch_0
    const-string v0, "STEP_GETTING_SERVICE_BINDINGS"

    goto :goto_0

    :pswitch_1
    const-string v0, "STEP_VALIDATING_ACCOUNT"

    goto :goto_0

    :pswitch_2
    const-string v0, "STEP_AUTHENTICATING"

    goto :goto_0

    :pswitch_3
    const-string v0, "STEP_GETTING_REMOTE_SERVICE"

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method static synthetic zzc(Lcom/google/android/gms/common/api/zzg;)Ljava/util/concurrent/locks/Lock;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZs:Ljava/util/concurrent/locks/Lock;

    return-object v0
.end method

.method private zzc(Lcom/google/android/gms/common/ConnectionResult;)V
    .locals 1

    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/google/android/gms/common/api/zzg;->zzbe(I)Z

    move-result v0

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/common/ConnectionResult;->isSuccess()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/google/android/gms/common/api/zzg;->zzns()V

    goto :goto_0

    :cond_1
    invoke-direct {p0, p1}, Lcom/google/android/gms/common/api/zzg;->zze(Lcom/google/android/gms/common/ConnectionResult;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-direct {p0}, Lcom/google/android/gms/common/api/zzg;->zznu()V

    invoke-direct {p0}, Lcom/google/android/gms/common/api/zzg;->zzns()V

    goto :goto_0

    :cond_2
    invoke-direct {p0, p1}, Lcom/google/android/gms/common/api/zzg;->zzf(Lcom/google/android/gms/common/ConnectionResult;)V

    goto :goto_0
.end method

.method static synthetic zzc(Lcom/google/android/gms/common/api/zzg;Lcom/google/android/gms/common/ConnectionResult;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/common/api/zzg;->zzc(Lcom/google/android/gms/common/ConnectionResult;)V

    return-void
.end method

.method static synthetic zzd(Lcom/google/android/gms/common/api/zzg;)Lcom/google/android/gms/common/api/zzi;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZq:Lcom/google/android/gms/common/api/zzi;

    return-object v0
.end method

.method private zzd(Lcom/google/android/gms/common/ConnectionResult;)Z
    .locals 3

    const/4 v0, 0x1

    invoke-virtual {p1}, Lcom/google/android/gms/common/ConnectionResult;->hasResolution()Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    iget-object v1, p0, Lcom/google/android/gms/common/api/zzg;->zzZi:Lcom/google/android/gms/common/GoogleApiAvailability;

    invoke-virtual {p1}, Lcom/google/android/gms/common/ConnectionResult;->getErrorCode()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/google/android/gms/common/GoogleApiAvailability;->zzbb(I)Landroid/content/Intent;

    move-result-object v1

    if-nez v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0
.end method

.method private zze(Lcom/google/android/gms/common/ConnectionResult;)Z
    .locals 3

    const/4 v0, 0x1

    iget v1, p0, Lcom/google/android/gms/common/api/zzg;->zzZB:I

    const/4 v2, 0x2

    if-eq v1, v2, :cond_0

    iget v1, p0, Lcom/google/android/gms/common/api/zzg;->zzZB:I

    if-ne v1, v0, :cond_1

    invoke-virtual {p1}, Lcom/google/android/gms/common/ConnectionResult;->hasResolution()Z

    move-result v1

    if-nez v1, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static synthetic zze(Lcom/google/android/gms/common/api/zzg;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZC:Z

    return v0
.end method

.method static synthetic zzf(Lcom/google/android/gms/common/api/zzg;)Lcom/google/android/gms/signin/zzd;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZA:Lcom/google/android/gms/signin/zzd;

    return-object v0
.end method

.method private zzf(Lcom/google/android/gms/common/ConnectionResult;)V
    .locals 3

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZw:Z

    invoke-direct {p0}, Lcom/google/android/gms/common/api/zzg;->zznv()V

    invoke-virtual {p1}, Lcom/google/android/gms/common/ConnectionResult;->hasResolution()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    invoke-direct {p0, v0}, Lcom/google/android/gms/common/api/zzg;->zzX(Z)V

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZq:Lcom/google/android/gms/common/api/zzi;

    iget-object v0, v0, Lcom/google/android/gms/common/api/zzi;->zzaag:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZq:Lcom/google/android/gms/common/api/zzi;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/common/api/zzi;->zzg(Lcom/google/android/gms/common/ConnectionResult;)V

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZq:Lcom/google/android/gms/common/api/zzi;

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/zzi;->zznB()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZi:Lcom/google/android/gms/common/GoogleApiAvailability;

    iget-object v1, p0, Lcom/google/android/gms/common/api/zzg;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Lcom/google/android/gms/common/ConnectionResult;->getErrorCode()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/common/GoogleApiAvailability;->zzd(Landroid/content/Context;I)Z

    move-result v0

    if-nez v0, :cond_2

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZq:Lcom/google/android/gms/common/api/zzi;

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/zzi;->zznE()Z

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZq:Lcom/google/android/gms/common/api/zzi;

    iget-object v0, v0, Lcom/google/android/gms/common/api/zzi;->zzZY:Lcom/google/android/gms/common/internal/zzk;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/common/internal/zzk;->zzj(Lcom/google/android/gms/common/ConnectionResult;)V

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZq:Lcom/google/android/gms/common/api/zzi;

    iget-object v0, v0, Lcom/google/android/gms/common/api/zzi;->zzZY:Lcom/google/android/gms/common/internal/zzk;

    invoke-virtual {v0}, Lcom/google/android/gms/common/internal/zzk;->zzoI()V

    return-void
.end method

.method static synthetic zzg(Lcom/google/android/gms/common/api/zzg;)Lcom/google/android/gms/common/internal/zzp;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZE:Lcom/google/android/gms/common/internal/zzp;

    return-object v0
.end method

.method static synthetic zzh(Lcom/google/android/gms/common/api/zzg;)Ljava/util/Set;
    .locals 1

    invoke-direct {p0}, Lcom/google/android/gms/common/api/zzg;->zznw()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method static synthetic zzi(Lcom/google/android/gms/common/api/zzg;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/common/api/zzg;->zznu()V

    return-void
.end method

.method static synthetic zzj(Lcom/google/android/gms/common/api/zzg;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/common/api/zzg;->zzns()V

    return-void
.end method

.method static synthetic zzk(Lcom/google/android/gms/common/api/zzg;)Z
    .locals 1

    invoke-direct {p0}, Lcom/google/android/gms/common/api/zzg;->zzno()Z

    move-result v0

    return v0
.end method

.method static synthetic zzl(Lcom/google/android/gms/common/api/zzg;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/common/api/zzg;->zznp()V

    return-void
.end method

.method static synthetic zzm(Lcom/google/android/gms/common/api/zzg;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/common/api/zzg;->zznr()V

    return-void
.end method

.method private zzno()Z
    .locals 4

    const/4 v0, 0x0

    iget v1, p0, Lcom/google/android/gms/common/api/zzg;->zzZx:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/google/android/gms/common/api/zzg;->zzZx:I

    iget v1, p0, Lcom/google/android/gms/common/api/zzg;->zzZx:I

    if-lez v1, :cond_0

    :goto_0
    return v0

    :cond_0
    iget v1, p0, Lcom/google/android/gms/common/api/zzg;->zzZx:I

    if-gez v1, :cond_1

    const-string v1, "GoogleApiClientConnecting"

    const-string v2, "GoogleApiClient received too many callbacks for the given step. Clients may be in an unexpected state; GoogleApiClient will now disconnect."

    invoke-static {v1, v2}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v1, Lcom/google/android/gms/common/ConnectionResult;

    const/16 v2, 0x8

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Lcom/google/android/gms/common/ConnectionResult;-><init>(ILandroid/app/PendingIntent;)V

    invoke-direct {p0, v1}, Lcom/google/android/gms/common/api/zzg;->zzf(Lcom/google/android/gms/common/ConnectionResult;)V

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/google/android/gms/common/api/zzg;->zzZt:Lcom/google/android/gms/common/ConnectionResult;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/google/android/gms/common/api/zzg;->zzZt:Lcom/google/android/gms/common/ConnectionResult;

    invoke-direct {p0, v1}, Lcom/google/android/gms/common/api/zzg;->zzf(Lcom/google/android/gms/common/ConnectionResult;)V

    goto :goto_0

    :cond_2
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private zznp()V
    .locals 1

    iget v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZx:I

    if-eqz v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-boolean v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZC:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZD:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/google/android/gms/common/api/zzg;->zznq()V

    goto :goto_0

    :cond_2
    invoke-direct {p0}, Lcom/google/android/gms/common/api/zzg;->zzns()V

    goto :goto_0
.end method

.method private zznq()V
    .locals 4

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const/4 v0, 0x1

    iput v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZv:I

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZq:Lcom/google/android/gms/common/api/zzi;

    iget-object v0, v0, Lcom/google/android/gms/common/api/zzi;->zzaaf:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZx:I

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZq:Lcom/google/android/gms/common/api/zzi;

    iget-object v0, v0, Lcom/google/android/gms/common/api/zzi;->zzaaf:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/Api$zzc;

    iget-object v3, p0, Lcom/google/android/gms/common/api/zzg;->zzZq:Lcom/google/android/gms/common/api/zzi;

    iget-object v3, v3, Lcom/google/android/gms/common/api/zzi;->zzaag:Ljava/util/Map;

    invoke-interface {v3, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-direct {p0}, Lcom/google/android/gms/common/api/zzg;->zzno()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/google/android/gms/common/api/zzg;->zznr()V

    goto :goto_0

    :cond_1
    iget-object v3, p0, Lcom/google/android/gms/common/api/zzg;->zzZq:Lcom/google/android/gms/common/api/zzi;

    iget-object v3, v3, Lcom/google/android/gms/common/api/zzi;->zzaaf:Ljava/util/Map;

    invoke-interface {v3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZJ:Ljava/util/ArrayList;

    invoke-static {}, Lcom/google/android/gms/common/api/zzk;->zznF()Ljava/util/concurrent/ExecutorService;

    move-result-object v2

    new-instance v3, Lcom/google/android/gms/common/api/zzg$zzh;

    invoke-direct {v3, p0, v1}, Lcom/google/android/gms/common/api/zzg$zzh;-><init>(Lcom/google/android/gms/common/api/zzg;Ljava/util/ArrayList;)V

    invoke-interface {v2, v3}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_3
    return-void
.end method

.method private zznr()V
    .locals 4

    const/4 v0, 0x2

    iput v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZv:I

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZq:Lcom/google/android/gms/common/api/zzi;

    invoke-direct {p0}, Lcom/google/android/gms/common/api/zzg;->zznw()Ljava/util/Set;

    move-result-object v1

    iput-object v1, v0, Lcom/google/android/gms/common/api/zzi;->zzaah:Ljava/util/Set;

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZJ:Ljava/util/ArrayList;

    invoke-static {}, Lcom/google/android/gms/common/api/zzk;->zznF()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    new-instance v2, Lcom/google/android/gms/common/api/zzg$zzc;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/google/android/gms/common/api/zzg$zzc;-><init>(Lcom/google/android/gms/common/api/zzg;Lcom/google/android/gms/common/api/zzg$1;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private zzns()V
    .locals 4

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const/4 v0, 0x3

    iput v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZv:I

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZq:Lcom/google/android/gms/common/api/zzi;

    iget-object v0, v0, Lcom/google/android/gms/common/api/zzi;->zzaaf:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZx:I

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZq:Lcom/google/android/gms/common/api/zzi;

    iget-object v0, v0, Lcom/google/android/gms/common/api/zzi;->zzaaf:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/Api$zzc;

    iget-object v3, p0, Lcom/google/android/gms/common/api/zzg;->zzZq:Lcom/google/android/gms/common/api/zzi;

    iget-object v3, v3, Lcom/google/android/gms/common/api/zzi;->zzaag:Ljava/util/Map;

    invoke-interface {v3, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-direct {p0}, Lcom/google/android/gms/common/api/zzg;->zzno()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/google/android/gms/common/api/zzg;->zznt()V

    goto :goto_0

    :cond_1
    iget-object v3, p0, Lcom/google/android/gms/common/api/zzg;->zzZq:Lcom/google/android/gms/common/api/zzi;

    iget-object v3, v3, Lcom/google/android/gms/common/api/zzi;->zzaaf:Ljava/util/Map;

    invoke-interface {v3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZJ:Ljava/util/ArrayList;

    invoke-static {}, Lcom/google/android/gms/common/api/zzk;->zznF()Ljava/util/concurrent/ExecutorService;

    move-result-object v2

    new-instance v3, Lcom/google/android/gms/common/api/zzg$zzf;

    invoke-direct {v3, p0, v1}, Lcom/google/android/gms/common/api/zzg$zzf;-><init>(Lcom/google/android/gms/common/api/zzg;Ljava/util/ArrayList;)V

    invoke-interface {v2, v3}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_3
    return-void
.end method

.method private zznt()V
    .locals 4

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZq:Lcom/google/android/gms/common/api/zzi;

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/zzi;->zznA()V

    invoke-static {}, Lcom/google/android/gms/common/api/zzk;->zznF()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/common/api/zzg$1;

    invoke-direct {v1, p0}, Lcom/google/android/gms/common/api/zzg$1;-><init>(Lcom/google/android/gms/common/api/zzg;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZA:Lcom/google/android/gms/signin/zzd;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZF:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZA:Lcom/google/android/gms/signin/zzd;

    iget-object v1, p0, Lcom/google/android/gms/common/api/zzg;->zzZE:Lcom/google/android/gms/common/internal/zzp;

    iget-boolean v2, p0, Lcom/google/android/gms/common/api/zzg;->zzZG:Z

    invoke-interface {v0, v1, v2}, Lcom/google/android/gms/signin/zzd;->zza(Lcom/google/android/gms/common/internal/zzp;Z)V

    :cond_0
    invoke-direct {p0, v3}, Lcom/google/android/gms/common/api/zzg;->zzX(Z)V

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZq:Lcom/google/android/gms/common/api/zzi;

    iget-object v0, v0, Lcom/google/android/gms/common/api/zzi;->zzaag:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/Api$zzc;

    iget-object v2, p0, Lcom/google/android/gms/common/api/zzg;->zzZq:Lcom/google/android/gms/common/api/zzi;

    iget-object v2, v2, Lcom/google/android/gms/common/api/zzi;->zzaaf:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/Api$zzb;

    invoke-interface {v0}, Lcom/google/android/gms/common/api/Api$zzb;->disconnect()V

    goto :goto_0

    :cond_2
    iget-boolean v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZw:Z

    if-eqz v0, :cond_3

    iput-boolean v3, p0, Lcom/google/android/gms/common/api/zzg;->zzZw:Z

    invoke-virtual {p0}, Lcom/google/android/gms/common/api/zzg;->disconnect()V

    :goto_1
    return-void

    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZy:Landroid/os/Bundle;

    invoke-virtual {v0}, Landroid/os/Bundle;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_4

    const/4 v0, 0x0

    :goto_2
    iget-object v1, p0, Lcom/google/android/gms/common/api/zzg;->zzZq:Lcom/google/android/gms/common/api/zzi;

    iget-object v1, v1, Lcom/google/android/gms/common/api/zzi;->zzZY:Lcom/google/android/gms/common/internal/zzk;

    invoke-virtual {v1, v0}, Lcom/google/android/gms/common/internal/zzk;->zzh(Landroid/os/Bundle;)V

    goto :goto_1

    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZy:Landroid/os/Bundle;

    goto :goto_2
.end method

.method private zznu()V
    .locals 6

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZC:Z

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZq:Lcom/google/android/gms/common/api/zzi;

    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v1

    iput-object v1, v0, Lcom/google/android/gms/common/api/zzi;->zzaah:Ljava/util/Set;

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZz:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/Api$zzc;

    iget-object v2, p0, Lcom/google/android/gms/common/api/zzg;->zzZq:Lcom/google/android/gms/common/api/zzi;

    iget-object v2, v2, Lcom/google/android/gms/common/api/zzi;->zzaag:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/google/android/gms/common/api/zzg;->zzZq:Lcom/google/android/gms/common/api/zzi;

    iget-object v2, v2, Lcom/google/android/gms/common/api/zzi;->zzaag:Ljava/util/Map;

    new-instance v3, Lcom/google/android/gms/common/ConnectionResult;

    const/16 v4, 0x11

    const/4 v5, 0x0

    invoke-direct {v3, v4, v5}, Lcom/google/android/gms/common/ConnectionResult;-><init>(ILandroid/app/PendingIntent;)V

    invoke-interface {v2, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_1
    return-void
.end method

.method private zznv()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZJ:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/Future;

    const/4 v2, 0x1

    invoke-interface {v0, v2}, Ljava/util/concurrent/Future;->cancel(Z)Z

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZJ:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    return-void
.end method

.method private zznw()Ljava/util/Set;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lcom/google/android/gms/common/api/Scope;",
            ">;"
        }
    .end annotation

    new-instance v1, Ljava/util/HashSet;

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZH:Lcom/google/android/gms/common/internal/zzf;

    invoke-virtual {v0}, Lcom/google/android/gms/common/internal/zzf;->zzoi()Ljava/util/Set;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZH:Lcom/google/android/gms/common/internal/zzf;

    invoke-virtual {v0}, Lcom/google/android/gms/common/internal/zzf;->zzok()Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/Api;

    iget-object v4, p0, Lcom/google/android/gms/common/api/zzg;->zzZq:Lcom/google/android/gms/common/api/zzi;

    iget-object v4, v4, Lcom/google/android/gms/common/api/zzi;->zzaag:Ljava/util/Map;

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/Api;->zznd()Lcom/google/android/gms/common/api/Api$zzc;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/internal/zzf$zza;

    iget-object v0, v0, Lcom/google/android/gms/common/internal/zzf$zza;->zzZp:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    :cond_1
    return-object v1
.end method


# virtual methods
.method public begin()V
    .locals 11

    const/4 v10, 0x0

    const/4 v5, 0x1

    const/4 v4, 0x0

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZq:Lcom/google/android/gms/common/api/zzi;

    iget-object v0, v0, Lcom/google/android/gms/common/api/zzi;->zzZY:Lcom/google/android/gms/common/internal/zzk;

    invoke-virtual {v0}, Lcom/google/android/gms/common/internal/zzk;->zzoJ()V

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZq:Lcom/google/android/gms/common/api/zzi;

    iget-object v0, v0, Lcom/google/android/gms/common/api/zzi;->zzaag:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    iput-boolean v4, p0, Lcom/google/android/gms/common/api/zzg;->zzZw:Z

    iput-boolean v4, p0, Lcom/google/android/gms/common/api/zzg;->zzZC:Z

    iput-object v10, p0, Lcom/google/android/gms/common/api/zzg;->zzZt:Lcom/google/android/gms/common/ConnectionResult;

    iput v4, p0, Lcom/google/android/gms/common/api/zzg;->zzZv:I

    const/4 v0, 0x2

    iput v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZB:I

    iput-boolean v4, p0, Lcom/google/android/gms/common/api/zzg;->zzZD:Z

    iput-boolean v4, p0, Lcom/google/android/gms/common/api/zzg;->zzZF:Z

    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZI:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    move v3, v4

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/Api;

    iget-object v1, p0, Lcom/google/android/gms/common/api/zzg;->zzZq:Lcom/google/android/gms/common/api/zzi;

    iget-object v1, v1, Lcom/google/android/gms/common/api/zzi;->zzaaf:Ljava/util/Map;

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/Api;->zznd()Lcom/google/android/gms/common/api/Api$zzc;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/common/api/Api$zzb;

    iget-object v2, p0, Lcom/google/android/gms/common/api/zzg;->zzZI:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v8

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/Api;->zznb()Lcom/google/android/gms/common/api/Api$zza;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/common/api/Api$zza;->getPriority()I

    move-result v2

    if-ne v2, v5, :cond_2

    move v2, v5

    :goto_1
    or-int/2addr v2, v3

    invoke-interface {v1}, Lcom/google/android/gms/common/api/Api$zzb;->zzlm()Z

    move-result v3

    if-eqz v3, :cond_1

    iput-boolean v5, p0, Lcom/google/android/gms/common/api/zzg;->zzZC:Z

    iget v3, p0, Lcom/google/android/gms/common/api/zzg;->zzZB:I

    if-ge v8, v3, :cond_0

    iput v8, p0, Lcom/google/android/gms/common/api/zzg;->zzZB:I

    :cond_0
    if-eqz v8, :cond_1

    iget-object v3, p0, Lcom/google/android/gms/common/api/zzg;->zzZz:Ljava/util/Set;

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/Api;->zznd()Lcom/google/android/gms/common/api/Api$zzc;

    move-result-object v9

    invoke-interface {v3, v9}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :cond_1
    new-instance v3, Lcom/google/android/gms/common/api/zzg$zzd;

    invoke-direct {v3, p0, v0, v8}, Lcom/google/android/gms/common/api/zzg$zzd;-><init>(Lcom/google/android/gms/common/api/zzg;Lcom/google/android/gms/common/api/Api;I)V

    invoke-interface {v7, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move v3, v2

    goto :goto_0

    :cond_2
    move v2, v4

    goto :goto_1

    :cond_3
    if-eqz v3, :cond_4

    iput-boolean v4, p0, Lcom/google/android/gms/common/api/zzg;->zzZC:Z

    :cond_4
    iget-boolean v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZC:Z

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZH:Lcom/google/android/gms/common/internal/zzf;

    iget-object v1, p0, Lcom/google/android/gms/common/api/zzg;->zzZq:Lcom/google/android/gms/common/api/zzi;

    invoke-virtual {v1}, Lcom/google/android/gms/common/api/zzi;->getSessionId()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/common/internal/zzf;->zza(Ljava/lang/Integer;)V

    new-instance v5, Lcom/google/android/gms/common/api/zzg$zzg;

    invoke-direct {v5, p0, v10}, Lcom/google/android/gms/common/api/zzg$zzg;-><init>(Lcom/google/android/gms/common/api/zzg;Lcom/google/android/gms/common/api/zzg$1;)V

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZj:Lcom/google/android/gms/common/api/Api$zza;

    iget-object v1, p0, Lcom/google/android/gms/common/api/zzg;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/common/api/zzg;->zzZq:Lcom/google/android/gms/common/api/zzi;

    invoke-virtual {v2}, Lcom/google/android/gms/common/api/zzi;->getLooper()Landroid/os/Looper;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/common/api/zzg;->zzZH:Lcom/google/android/gms/common/internal/zzf;

    iget-object v4, p0, Lcom/google/android/gms/common/api/zzg;->zzZH:Lcom/google/android/gms/common/internal/zzf;

    invoke-virtual {v4}, Lcom/google/android/gms/common/internal/zzf;->zzoo()Lcom/google/android/gms/signin/zze;

    move-result-object v4

    move-object v6, v5

    invoke-virtual/range {v0 .. v6}, Lcom/google/android/gms/common/api/Api$zza;->zza(Landroid/content/Context;Landroid/os/Looper;Lcom/google/android/gms/common/internal/zzf;Ljava/lang/Object;Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)Lcom/google/android/gms/common/api/Api$zzb;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/signin/zzd;

    iput-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZA:Lcom/google/android/gms/signin/zzd;

    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZq:Lcom/google/android/gms/common/api/zzi;

    iget-object v0, v0, Lcom/google/android/gms/common/api/zzi;->zzaaf:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZx:I

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZJ:Ljava/util/ArrayList;

    invoke-static {}, Lcom/google/android/gms/common/api/zzk;->zznF()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    new-instance v2, Lcom/google/android/gms/common/api/zzg$zze;

    invoke-direct {v2, p0, v7}, Lcom/google/android/gms/common/api/zzg$zze;-><init>(Lcom/google/android/gms/common/api/zzg;Ljava/util/Map;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public connect()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZw:Z

    return-void
.end method

.method public disconnect()V
    .locals 4

    const/4 v3, 0x1

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZq:Lcom/google/android/gms/common/api/zzi;

    iget-object v0, v0, Lcom/google/android/gms/common/api/zzi;->zzZZ:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/zzi$zze;

    invoke-interface {v0}, Lcom/google/android/gms/common/api/zzi$zze;->zzng()I

    move-result v2

    if-eq v2, v3, :cond_0

    invoke-interface {v0}, Lcom/google/android/gms/common/api/zzi$zze;->cancel()V

    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZq:Lcom/google/android/gms/common/api/zzi;

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/zzi;->zznx()V

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZt:Lcom/google/android/gms/common/ConnectionResult;

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZq:Lcom/google/android/gms/common/api/zzi;

    iget-object v0, v0, Lcom/google/android/gms/common/api/zzi;->zzZZ:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    iput-boolean v3, p0, Lcom/google/android/gms/common/api/zzg;->zzZw:Z

    :goto_1
    return-void

    :cond_2
    invoke-direct {p0}, Lcom/google/android/gms/common/api/zzg;->zznv()V

    invoke-direct {p0, v3}, Lcom/google/android/gms/common/api/zzg;->zzX(Z)V

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZq:Lcom/google/android/gms/common/api/zzi;

    iget-object v0, v0, Lcom/google/android/gms/common/api/zzi;->zzaag:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZq:Lcom/google/android/gms/common/api/zzi;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/gms/common/api/zzi;->zzg(Lcom/google/android/gms/common/ConnectionResult;)V

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZq:Lcom/google/android/gms/common/api/zzi;

    iget-object v0, v0, Lcom/google/android/gms/common/api/zzi;->zzZY:Lcom/google/android/gms/common/internal/zzk;

    invoke-virtual {v0}, Lcom/google/android/gms/common/internal/zzk;->zzoI()V

    goto :goto_1
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    const-string v0, "CONNECTING"

    return-object v0
.end method

.method public onConnected(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "connectionHint"    # Landroid/os/Bundle;

    .prologue
    const/4 v0, 0x3

    invoke-direct {p0, v0}, Lcom/google/android/gms/common/api/zzg;->zzbe(I)Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    if-eqz p1, :cond_2

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZy:Landroid/os/Bundle;

    invoke-virtual {v0, p1}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    :cond_2
    invoke-direct {p0}, Lcom/google/android/gms/common/api/zzg;->zzno()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/google/android/gms/common/api/zzg;->zznt()V

    goto :goto_0
.end method

.method public onConnectionSuspended(I)V
    .locals 3
    .param p1, "cause"    # I

    .prologue
    new-instance v0, Lcom/google/android/gms/common/ConnectionResult;

    const/16 v1, 0x8

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/common/ConnectionResult;-><init>(ILandroid/app/PendingIntent;)V

    invoke-direct {p0, v0}, Lcom/google/android/gms/common/api/zzg;->zzf(Lcom/google/android/gms/common/ConnectionResult;)V

    return-void
.end method

.method public zza(Lcom/google/android/gms/common/api/zzc$zza;)Lcom/google/android/gms/common/api/zzc$zza;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<A::",
            "Lcom/google/android/gms/common/api/Api$zzb;",
            "R::",
            "Lcom/google/android/gms/common/api/Result;",
            "T:",
            "Lcom/google/android/gms/common/api/zzc$zza",
            "<TR;TA;>;>(TT;)TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg;->zzZq:Lcom/google/android/gms/common/api/zzi;

    iget-object v0, v0, Lcom/google/android/gms/common/api/zzi;->zzZZ:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    return-object p1
.end method

.method public zza(Lcom/google/android/gms/common/ConnectionResult;Lcom/google/android/gms/common/api/Api;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/ConnectionResult;",
            "Lcom/google/android/gms/common/api/Api",
            "<*>;I)V"
        }
    .end annotation

    const/4 v0, 0x3

    invoke-direct {p0, v0}, Lcom/google/android/gms/common/api/zzg;->zzbe(I)Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/gms/common/api/zzg;->zzb(Lcom/google/android/gms/common/ConnectionResult;Lcom/google/android/gms/common/api/Api;I)V

    invoke-direct {p0}, Lcom/google/android/gms/common/api/zzg;->zzno()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/google/android/gms/common/api/zzg;->zznt()V

    goto :goto_0
.end method

.method public zzb(Lcom/google/android/gms/common/api/zzc$zza;)Lcom/google/android/gms/common/api/zzc$zza;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<A::",
            "Lcom/google/android/gms/common/api/Api$zzb;",
            "T:",
            "Lcom/google/android/gms/common/api/zzc$zza",
            "<+",
            "Lcom/google/android/gms/common/api/Result;",
            "TA;>;>(TT;)TT;"
        }
    .end annotation

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "GoogleApiClient is not connected yet."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
