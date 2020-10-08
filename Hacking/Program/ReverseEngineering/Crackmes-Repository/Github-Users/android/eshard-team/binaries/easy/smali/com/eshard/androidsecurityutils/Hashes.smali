.class public Lcom/eshard/androidsecurityutils/Hashes;
.super Ljava/lang/Object;
.source "Hashes.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static md5sum(Ljava/lang/String;)Ljava/lang/String;
    .locals 10
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 14
    :try_start_0
    const-string v6, "MD5"

    invoke-static {v6}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 15
    .local v0, "digest":Ljava/security/MessageDigest;
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/security/MessageDigest;->update([B)V

    .line 16
    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v4

    .line 18
    .local v4, "messageDigest":[B
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 19
    .local v3, "hexString":Ljava/lang/StringBuilder;
    array-length v7, v4

    const/4 v6, 0x0

    :goto_0
    if-ge v6, v7, :cond_1

    aget-byte v5, v4, v6

    .line 20
    .local v5, "msg":B
    and-int/lit16 v8, v5, 0xff

    invoke-static {v8}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    .line 21
    .local v2, "h":Ljava/lang/String;
    :goto_1
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v8

    const/4 v9, 0x2

    if-ge v8, v9, :cond_0

    .line 22
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "0"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    .line 23
    :cond_0
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 25
    .end local v2    # "h":Ljava/lang/String;
    .end local v5    # "msg":B
    :cond_1
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    .line 30
    .end local v0    # "digest":Ljava/security/MessageDigest;
    .end local v3    # "hexString":Ljava/lang/StringBuilder;
    .end local v4    # "messageDigest":[B
    :goto_2
    return-object v6

    .line 26
    :catch_0
    move-exception v1

    .line 28
    .local v1, "e":Ljava/security/NoSuchAlgorithmException;
    invoke-virtual {v1}, Ljava/security/NoSuchAlgorithmException;->printStackTrace()V

    .line 30
    const-string v6, ""

    goto :goto_2
.end method
