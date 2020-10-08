.class public Lcom/eshard/crackme/utils/dynamic/Dex;
.super Ljava/lang/Object;
.source "Dex.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static Invoke(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;
    .locals 4
    .param p1, "method"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 18
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<Ljava/lang/Object;>;"
    if-eqz p0, :cond_0

    .line 20
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    .line 21
    .local v2, "inst":Ljava/lang/Object;
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Class;

    invoke-virtual {p0, p1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 23
    .local v0, "doIt":Ljava/lang/reflect/Method;
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v0, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_3

    move-result-object v3

    .line 39
    .end local v0    # "doIt":Ljava/lang/reflect/Method;
    .end local v2    # "inst":Ljava/lang/Object;
    :goto_0
    return-object v3

    .line 25
    :catch_0
    move-exception v1

    .line 27
    .local v1, "ex":Ljava/lang/InstantiationException;
    invoke-virtual {v1}, Ljava/lang/InstantiationException;->printStackTrace()V

    .line 39
    .end local v1    # "ex":Ljava/lang/InstantiationException;
    :cond_0
    :goto_1
    const/4 v3, 0x0

    goto :goto_0

    .line 28
    :catch_1
    move-exception v1

    .line 30
    .local v1, "ex":Ljava/lang/IllegalAccessException;
    invoke-virtual {v1}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_1

    .line 31
    .end local v1    # "ex":Ljava/lang/IllegalAccessException;
    :catch_2
    move-exception v1

    .line 33
    .local v1, "ex":Ljava/lang/NoSuchMethodException;
    invoke-virtual {v1}, Ljava/lang/NoSuchMethodException;->printStackTrace()V

    goto :goto_1

    .line 34
    .end local v1    # "ex":Ljava/lang/NoSuchMethodException;
    :catch_3
    move-exception v1

    .line 36
    .local v1, "ex":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v1}, Ljava/lang/reflect/InvocationTargetException;->printStackTrace()V

    goto :goto_1
.end method

.method public static LoadIt(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;Ljava/lang/String;)Ljava/lang/Class;
    .locals 8
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "dex"    # Ljava/lang/String;
    .param p2, "file"    # Ljava/io/File;
    .param p3, "classname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/io/File;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Class",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 44
    :try_start_0
    const-string v4, "dex"

    const/4 v5, 0x0

    invoke-virtual {p0, v4, v5}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v3

    .line 45
    .local v3, "tmpDir":Ljava/io/File;
    new-instance v0, Ldalvik/system/DexClassLoader;

    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v7

    invoke-direct {v0, v4, v5, v6, v7}, Ldalvik/system/DexClassLoader;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/ClassLoader;)V

    .line 46
    .local v0, "classLoader":Ldalvik/system/DexClassLoader;
    invoke-virtual {v0, p3}, Ldalvik/system/DexClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 55
    .end local v0    # "classLoader":Ldalvik/system/DexClassLoader;
    .end local v3    # "tmpDir":Ljava/io/File;
    :goto_0
    return-object v1

    .line 50
    :catch_0
    move-exception v2

    .line 52
    .local v2, "ex":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
