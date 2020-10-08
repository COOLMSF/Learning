.class public Lcom/eshard/crackme/utils/file/FileUtils;
.super Ljava/lang/Object;
.source "FileUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createFileFromInputStream(Ljava/io/InputStream;Ljava/io/File;)V
    .locals 5
    .param p0, "inputStream"    # Ljava/io/InputStream;
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 17
    :try_start_0
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 18
    .local v3, "os":Ljava/io/OutputStream;
    const/16 v4, 0x400

    new-array v0, v4, [B

    .line 19
    .local v0, "buffer":[B
    const/4 v2, 0x0

    .line 21
    .local v2, "len":I
    :goto_0
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v2

    if-lez v2, :cond_0

    .line 23
    const/4 v4, 0x0

    invoke-virtual {v3, v0, v4, v2}, Ljava/io/OutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 29
    .end local v0    # "buffer":[B
    .end local v2    # "len":I
    .end local v3    # "os":Ljava/io/OutputStream;
    :catch_0
    move-exception v1

    .line 31
    .local v1, "ex":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 34
    .end local v1    # "ex":Ljava/lang/Exception;
    :goto_1
    return-void

    .line 26
    .restart local v0    # "buffer":[B
    .restart local v2    # "len":I
    .restart local v3    # "os":Ljava/io/OutputStream;
    :cond_0
    :try_start_1
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V

    .line 27
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method
