.class public Lcom/eshard/androidsecurityutils/Cipher;
.super Ljava/lang/Object;
.source "Cipher.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static XOR(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 10
    .param p0, "msg"    # Ljava/lang/String;
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x0

    .line 11
    if-eqz p0, :cond_0

    if-nez p1, :cond_1

    :cond_0
    move-object v7, v8

    .line 29
    :goto_0
    return-object v7

    .line 13
    :cond_1
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v2

    .line 14
    .local v2, "keys":[C
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v5

    .line 16
    .local v5, "msgBytes":[C
    array-length v4, v5

    .line 17
    .local v4, "ml":I
    array-length v3, v2

    .line 18
    .local v3, "kl":I
    new-array v6, v4, [C

    .line 20
    .local v6, "result":[C
    const/4 v1, -0x1

    .line 21
    .local v1, "i":I
    :goto_1
    add-int/lit8 v1, v1, 0x1

    if-ge v1, v4, :cond_2

    .line 22
    aget-char v7, v5, v1

    rem-int v9, v1, v3

    aget-char v9, v2, v9

    xor-int/2addr v7, v9

    int-to-char v7, v7

    aput-char v7, v6, v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 27
    .end local v1    # "i":I
    .end local v2    # "keys":[C
    .end local v3    # "kl":I
    .end local v4    # "ml":I
    .end local v5    # "msgBytes":[C
    .end local v6    # "result":[C
    :catch_0
    move-exception v0

    .line 28
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    move-object v7, v8

    .line 29
    goto :goto_0

    .line 25
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v1    # "i":I
    .restart local v2    # "keys":[C
    .restart local v3    # "kl":I
    .restart local v4    # "ml":I
    .restart local v5    # "msgBytes":[C
    .restart local v6    # "result":[C
    :cond_2
    const/4 v2, 0x0

    move-object v5, v2

    .line 26
    .local v5, "msgBytes":Ljava/lang/Object;
    :try_start_1
    new-instance v7, Ljava/lang/String;

    invoke-direct {v7, v6}, Ljava/lang/String;-><init>([C)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method
