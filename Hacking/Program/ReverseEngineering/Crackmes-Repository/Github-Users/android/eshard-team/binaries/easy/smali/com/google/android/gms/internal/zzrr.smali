.class public abstract Lcom/google/android/gms/internal/zzrr;
.super Lcom/google/android/gms/internal/zzrx;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<M:",
        "Lcom/google/android/gms/internal/zzrr",
        "<TM;>;>",
        "Lcom/google/android/gms/internal/zzrx;"
    }
.end annotation


# instance fields
.field protected zzbca:Lcom/google/android/gms/internal/zzrt;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzrx;-><init>()V

    return-void
.end method


# virtual methods
.method public synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzrr;->zzDl()Lcom/google/android/gms/internal/zzrr;

    move-result-object v0

    return-object v0
.end method

.method protected zzB()I
    .locals 3

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzrr;->zzbca:Lcom/google/android/gms/internal/zzrt;

    if-eqz v1, :cond_0

    move v1, v0

    :goto_0
    iget-object v2, p0, Lcom/google/android/gms/internal/zzrr;->zzbca:Lcom/google/android/gms/internal/zzrt;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzrt;->size()I

    move-result v2

    if-ge v0, v2, :cond_1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzrr;->zzbca:Lcom/google/android/gms/internal/zzrt;

    invoke-virtual {v2, v0}, Lcom/google/android/gms/internal/zzrt;->zzlB(I)Lcom/google/android/gms/internal/zzru;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzru;->zzB()I

    move-result v2

    add-int/2addr v1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    move v1, v0

    :cond_1
    return v1
.end method

.method protected final zzDk()I
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzrr;->zzbca:Lcom/google/android/gms/internal/zzrt;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzrr;->zzbca:Lcom/google/android/gms/internal/zzrt;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzrt;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzrr;->zzbca:Lcom/google/android/gms/internal/zzrt;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzrt;->hashCode()I

    move-result v0

    goto :goto_0
.end method

.method public zzDl()Lcom/google/android/gms/internal/zzrr;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TM;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    invoke-super {p0}, Lcom/google/android/gms/internal/zzrx;->zzDm()Lcom/google/android/gms/internal/zzrx;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzrr;

    invoke-static {p0, v0}, Lcom/google/android/gms/internal/zzrv;->zza(Lcom/google/android/gms/internal/zzrr;Lcom/google/android/gms/internal/zzrr;)V

    return-object v0
.end method

.method public synthetic zzDm()Lcom/google/android/gms/internal/zzrx;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzrr;->zzDl()Lcom/google/android/gms/internal/zzrr;

    move-result-object v0

    return-object v0
.end method

.method public final zza(Lcom/google/android/gms/internal/zzrs;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/android/gms/internal/zzrs",
            "<TM;TT;>;)TT;"
        }
    .end annotation

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzrr;->zzbca:Lcom/google/android/gms/internal/zzrt;

    if-nez v1, :cond_1

    :cond_0
    :goto_0
    return-object v0

    :cond_1
    iget-object v1, p0, Lcom/google/android/gms/internal/zzrr;->zzbca:Lcom/google/android/gms/internal/zzrt;

    iget v2, p1, Lcom/google/android/gms/internal/zzrs;->tag:I

    invoke-static {v2}, Lcom/google/android/gms/internal/zzsa;->zzlE(I)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/zzrt;->zzlA(I)Lcom/google/android/gms/internal/zzru;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1, p1}, Lcom/google/android/gms/internal/zzru;->zzb(Lcom/google/android/gms/internal/zzrs;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method public zza(Lcom/google/android/gms/internal/zzrq;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzrr;->zzbca:Lcom/google/android/gms/internal/zzrt;

    if-nez v0, :cond_1

    :cond_0
    return-void

    :cond_1
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzrr;->zzbca:Lcom/google/android/gms/internal/zzrt;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzrt;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzrr;->zzbca:Lcom/google/android/gms/internal/zzrt;

    invoke-virtual {v1, v0}, Lcom/google/android/gms/internal/zzrt;->zzlB(I)Lcom/google/android/gms/internal/zzru;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/google/android/gms/internal/zzru;->zza(Lcom/google/android/gms/internal/zzrq;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method protected final zza(Lcom/google/android/gms/internal/zzrp;I)Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzrp;->getPosition()I

    move-result v0

    invoke-virtual {p1, p2}, Lcom/google/android/gms/internal/zzrp;->zzlj(I)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    invoke-static {p2}, Lcom/google/android/gms/internal/zzsa;->zzlE(I)I

    move-result v1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzrp;->getPosition()I

    move-result v2

    sub-int/2addr v2, v0

    invoke-virtual {p1, v0, v2}, Lcom/google/android/gms/internal/zzrp;->zzy(II)[B

    move-result-object v0

    new-instance v2, Lcom/google/android/gms/internal/zzrz;

    invoke-direct {v2, p2, v0}, Lcom/google/android/gms/internal/zzrz;-><init>(I[B)V

    const/4 v0, 0x0

    iget-object v3, p0, Lcom/google/android/gms/internal/zzrr;->zzbca:Lcom/google/android/gms/internal/zzrt;

    if-nez v3, :cond_2

    new-instance v3, Lcom/google/android/gms/internal/zzrt;

    invoke-direct {v3}, Lcom/google/android/gms/internal/zzrt;-><init>()V

    iput-object v3, p0, Lcom/google/android/gms/internal/zzrr;->zzbca:Lcom/google/android/gms/internal/zzrt;

    :goto_1
    if-nez v0, :cond_1

    new-instance v0, Lcom/google/android/gms/internal/zzru;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzru;-><init>()V

    iget-object v3, p0, Lcom/google/android/gms/internal/zzrr;->zzbca:Lcom/google/android/gms/internal/zzrt;

    invoke-virtual {v3, v1, v0}, Lcom/google/android/gms/internal/zzrt;->zza(ILcom/google/android/gms/internal/zzru;)V

    :cond_1
    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/zzru;->zza(Lcom/google/android/gms/internal/zzrz;)V

    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/zzrr;->zzbca:Lcom/google/android/gms/internal/zzrt;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzrt;->zzlA(I)Lcom/google/android/gms/internal/zzru;

    move-result-object v0

    goto :goto_1
.end method

.method protected final zza(Lcom/google/android/gms/internal/zzrr;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TM;)Z"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzrr;->zzbca:Lcom/google/android/gms/internal/zzrt;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzrr;->zzbca:Lcom/google/android/gms/internal/zzrt;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzrt;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3

    :cond_0
    iget-object v0, p1, Lcom/google/android/gms/internal/zzrr;->zzbca:Lcom/google/android/gms/internal/zzrt;

    if-eqz v0, :cond_1

    iget-object v0, p1, Lcom/google/android/gms/internal/zzrr;->zzbca:Lcom/google/android/gms/internal/zzrt;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzrt;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzrr;->zzbca:Lcom/google/android/gms/internal/zzrt;

    iget-object v1, p1, Lcom/google/android/gms/internal/zzrr;->zzbca:Lcom/google/android/gms/internal/zzrt;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzrt;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method
