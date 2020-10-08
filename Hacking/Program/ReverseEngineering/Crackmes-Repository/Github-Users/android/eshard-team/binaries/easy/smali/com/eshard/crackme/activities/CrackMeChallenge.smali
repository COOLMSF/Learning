.class public Lcom/eshard/crackme/activities/CrackMeChallenge;
.super Landroid/support/v4/app/FragmentActivity;
.source "CrackMeChallenge.java"

# interfaces
.implements Landroid/app/ActionBar$TabListener;


# static fields
.field public static TAG:Ljava/lang/String;

.field private static instance:Lcom/eshard/crackme/activities/CrackMeChallenge;

.field public static ready:Z


# instance fields
.field actionBar:Landroid/app/ActionBar;

.field private currentStep:I

.field idxs:[I

.field mChallengePagerAdapter:Lcom/eshard/crackme/adaptors/CrackMePagerAdapter;

.field mViewPager:Landroid/support/v4/view/ViewPager;

.field secureA:Ljava/lang/String;

.field secureB:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 46
    const/4 v0, 0x0

    sput-boolean v0, Lcom/eshard/crackme/activities/CrackMeChallenge;->ready:Z

    .line 47
    const-string v0, "CRACKME"

    sput-object v0, Lcom/eshard/crackme/activities/CrackMeChallenge;->TAG:Ljava/lang/String;

    .line 60
    const-string v0, "unprotectme01"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 61
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 44
    invoke-direct {p0}, Landroid/support/v4/app/FragmentActivity;-><init>()V

    .line 52
    const-string v0, "GVhciBpcy"

    iput-object v0, p0, Lcom/eshard/crackme/activities/CrackMeChallenge;->secureA:Ljava/lang/String;

    .line 53
    const-string v0, "BhIGJhZCBpZGVh"

    iput-object v0, p0, Lcom/eshard/crackme/activities/CrackMeChallenge;->secureB:Ljava/lang/String;

    .line 55
    const/4 v0, 0x0

    iput v0, p0, Lcom/eshard/crackme/activities/CrackMeChallenge;->currentStep:I

    .line 57
    const/16 v0, 0x8

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/eshard/crackme/activities/CrackMeChallenge;->idxs:[I

    return-void

    :array_0
    .array-data 4
        0x5
        0x0
        0x6
        0x3
        0x2
        0x4
        0x7
        0x1
    .end array-data
.end method

.method private ComputeFlagA()V
    .locals 3

    .prologue
    .line 215
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/eshard/crackme/activities/CrackMeChallenge;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f06003c

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/eshard/crackme/activities/CrackMeChallenge;->secureA:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/eshard/crackme/activities/CrackMeChallenge;->secureA:Ljava/lang/String;

    .line 216
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/eshard/crackme/activities/CrackMeChallenge;->secureA:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/eshard/crackme/activities/CrackMeChallenge;->secureB:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/eshard/crackme/activities/CrackMeChallenge;->secureA:Ljava/lang/String;

    .line 217
    return-void
.end method

.method private ComputeFlagB()V
    .locals 11

    .prologue
    const/4 v6, 0x0

    .line 229
    :try_start_0
    iget-object v7, p0, Lcom/eshard/crackme/activities/CrackMeChallenge;->secureA:Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/String;->getBytes()[B

    move-result-object v7

    const/4 v8, 0x0

    invoke-static {v7, v8}, Landroid/util/Base64;->decode([BI)[B

    move-result-object v0

    .line 230
    .local v0, "bs":[B
    const-string v7, "aTs oeyo"

    invoke-virtual {v7}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    .line 231
    .local v2, "flag":[B
    const/16 v7, 0x8

    new-array v5, v7, [B

    fill-array-data v5, :array_0

    .line 232
    .local v5, "res":[B
    const/4 v4, -0x1

    .line 233
    .local v4, "j":I
    iget-object v7, p0, Lcom/eshard/crackme/activities/CrackMeChallenge;->idxs:[I

    array-length v8, v7

    :goto_0
    if-ge v6, v8, :cond_0

    aget v3, v7, v6

    .line 234
    .local v3, "i":I
    add-int/lit8 v4, v4, 0x1

    aget-byte v9, v0, v3

    aget-byte v10, v2, v3

    xor-int/2addr v9, v10

    int-to-byte v9, v9

    aput-byte v9, v5, v4

    .line 233
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 236
    .end local v3    # "i":I
    :cond_0
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, p0, Lcom/eshard/crackme/activities/CrackMeChallenge;->secureA:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/eshard/crackme/activities/CrackMeChallenge;->secureA:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 242
    .end local v0    # "bs":[B
    .end local v2    # "flag":[B
    .end local v4    # "j":I
    .end local v5    # "res":[B
    :goto_1
    return-void

    .line 238
    :catch_0
    move-exception v1

    .line 240
    .local v1, "ex":Ljava/lang/IllegalArgumentException;
    goto :goto_1

    .line 231
    :array_0
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
    .end array-data
.end method

.method private ExtractAsset(Ljava/lang/String;)Ljava/io/File;
    .locals 4
    .param p1, "asset"    # Ljava/lang/String;

    .prologue
    .line 176
    :try_start_0
    invoke-virtual {p0}, Lcom/eshard/crackme/activities/CrackMeChallenge;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    invoke-virtual {v3, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    .line 177
    .local v2, "is":Ljava/io/InputStream;
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Lcom/eshard/crackme/activities/CrackMeChallenge;->getFilesDir()Ljava/io/File;

    move-result-object v3

    invoke-direct {v1, v3, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 178
    .local v1, "file":Ljava/io/File;
    invoke-static {v2, v1}, Lcom/eshard/crackme/utils/file/FileUtils;->createFileFromInputStream(Ljava/io/InputStream;Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 184
    .end local v1    # "file":Ljava/io/File;
    .end local v2    # "is":Ljava/io/InputStream;
    :goto_0
    return-object v1

    .line 180
    :catch_0
    move-exception v0

    .line 182
    .local v0, "ex":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 184
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private UnProtectMe01()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 189
    invoke-virtual {p0}, Lcom/eshard/crackme/activities/CrackMeChallenge;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f06003d

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 190
    .local v0, "asset":Ljava/lang/String;
    invoke-direct {p0, v0}, Lcom/eshard/crackme/activities/CrackMeChallenge;->ExtractAsset(Ljava/lang/String;)Ljava/io/File;

    move-result-object v3

    .line 191
    .local v3, "file":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/eshard/crackme/activities/CrackMeChallenge;->unprotectme01(Ljava/lang/String;)V

    .line 192
    invoke-virtual {p0}, Lcom/eshard/crackme/activities/CrackMeChallenge;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f060054

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 193
    new-instance v3, Ljava/io/File;

    .end local v3    # "file":Ljava/io/File;
    invoke-virtual {p0}, Lcom/eshard/crackme/activities/CrackMeChallenge;->getFilesDir()Ljava/io/File;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 194
    .restart local v3    # "file":Ljava/io/File;
    invoke-virtual {p0}, Lcom/eshard/crackme/activities/CrackMeChallenge;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {p0}, Lcom/eshard/crackme/activities/CrackMeChallenge;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f06003b

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v0, v3, v5}, Lcom/eshard/crackme/utils/dynamic/Dex;->LoadIt(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 196
    .local v1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<Ljava/lang/Object;>;"
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    move-result v2

    .line 198
    .local v2, "deleted":Z
    if-nez v2, :cond_0

    .line 200
    new-instance v4, Ljava/lang/Exception;

    const-string v5, ""

    invoke-direct {v4, v5}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v4

    .line 203
    :cond_0
    new-instance v3, Ljava/io/File;

    .end local v3    # "file":Ljava/io/File;
    invoke-virtual {p0}, Lcom/eshard/crackme/activities/CrackMeChallenge;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f060034

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 204
    .restart local v3    # "file":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    move-result v2

    .line 206
    if-nez v2, :cond_1

    new-instance v4, Ljava/lang/Exception;

    const-string v5, ""

    invoke-direct {v4, v5}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v4

    .line 208
    :cond_1
    invoke-virtual {p0}, Lcom/eshard/crackme/activities/CrackMeChallenge;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f06003e

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Lcom/eshard/crackme/utils/dynamic/Dex;->Invoke(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;

    .line 211
    return-void
.end method

.method public static getInstance()Lcom/eshard/crackme/activities/CrackMeChallenge;
    .locals 1

    .prologue
    .line 67
    sget-object v0, Lcom/eshard/crackme/activities/CrackMeChallenge;->instance:Lcom/eshard/crackme/activities/CrackMeChallenge;

    if-nez v0, :cond_0

    .line 69
    new-instance v0, Lcom/eshard/crackme/activities/CrackMeChallenge;

    invoke-direct {v0}, Lcom/eshard/crackme/activities/CrackMeChallenge;-><init>()V

    sput-object v0, Lcom/eshard/crackme/activities/CrackMeChallenge;->instance:Lcom/eshard/crackme/activities/CrackMeChallenge;

    .line 70
    sget-object v0, Lcom/eshard/crackme/activities/CrackMeChallenge;->instance:Lcom/eshard/crackme/activities/CrackMeChallenge;

    .line 74
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/eshard/crackme/activities/CrackMeChallenge;->instance:Lcom/eshard/crackme/activities/CrackMeChallenge;

    goto :goto_0
.end method

.method private proceed(Z)V
    .locals 7
    .param p1, "ready"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v6, 0x2

    .line 136
    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/eshard/crackme/activities/CrackMeChallenge;->getApplication()Landroid/app/Application;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3, p0}, Lcom/eshard/androidsecurityutils/AntiEmulator;->IsInsideEmulator(Landroid/content/Context;Landroid/app/Activity;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 137
    const v3, 0x7f040018

    invoke-virtual {p0, v3}, Lcom/eshard/crackme/activities/CrackMeChallenge;->setContentView(I)V

    .line 139
    new-instance v3, Lcom/eshard/crackme/adaptors/CrackMePagerAdapter;

    invoke-virtual {p0}, Lcom/eshard/crackme/activities/CrackMeChallenge;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/eshard/crackme/adaptors/CrackMePagerAdapter;-><init>(Landroid/support/v4/app/FragmentManager;)V

    iput-object v3, p0, Lcom/eshard/crackme/activities/CrackMeChallenge;->mChallengePagerAdapter:Lcom/eshard/crackme/adaptors/CrackMePagerAdapter;

    .line 140
    invoke-virtual {p0}, Lcom/eshard/crackme/activities/CrackMeChallenge;->getActionBar()Landroid/app/ActionBar;

    move-result-object v3

    iput-object v3, p0, Lcom/eshard/crackme/activities/CrackMeChallenge;->actionBar:Landroid/app/ActionBar;

    .line 143
    iget-object v3, p0, Lcom/eshard/crackme/activities/CrackMeChallenge;->actionBar:Landroid/app/ActionBar;

    invoke-virtual {v3, v6}, Landroid/app/ActionBar;->setNavigationMode(I)V

    .line 144
    iget-object v3, p0, Lcom/eshard/crackme/activities/CrackMeChallenge;->actionBar:Landroid/app/ActionBar;

    const/16 v4, 0x10

    invoke-virtual {v3, v4}, Landroid/app/ActionBar;->setDisplayOptions(I)V

    .line 147
    const v3, 0x7f0c004f

    invoke-virtual {p0, v3}, Lcom/eshard/crackme/activities/CrackMeChallenge;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/support/v4/view/ViewPager;

    iput-object v3, p0, Lcom/eshard/crackme/activities/CrackMeChallenge;->mViewPager:Landroid/support/v4/view/ViewPager;

    .line 148
    iget-object v3, p0, Lcom/eshard/crackme/activities/CrackMeChallenge;->mViewPager:Landroid/support/v4/view/ViewPager;

    iget-object v4, p0, Lcom/eshard/crackme/activities/CrackMeChallenge;->mChallengePagerAdapter:Lcom/eshard/crackme/adaptors/CrackMePagerAdapter;

    invoke-virtual {v3, v4}, Landroid/support/v4/view/ViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 149
    iget-object v3, p0, Lcom/eshard/crackme/activities/CrackMeChallenge;->mViewPager:Landroid/support/v4/view/ViewPager;

    new-instance v4, Lcom/eshard/crackme/listeners/CrackMeActivityOnPageChangeListener;

    iget-object v5, p0, Lcom/eshard/crackme/activities/CrackMeChallenge;->actionBar:Landroid/app/ActionBar;

    invoke-direct {v4, v5}, Lcom/eshard/crackme/listeners/CrackMeActivityOnPageChangeListener;-><init>(Landroid/app/ActionBar;)V

    invoke-virtual {v3, v4}, Landroid/support/v4/view/ViewPager;->setOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 152
    iget-object v3, p0, Lcom/eshard/crackme/activities/CrackMeChallenge;->actionBar:Landroid/app/ActionBar;

    iget-object v4, p0, Lcom/eshard/crackme/activities/CrackMeChallenge;->actionBar:Landroid/app/ActionBar;

    invoke-virtual {v4}, Landroid/app/ActionBar;->newTab()Landroid/app/ActionBar$Tab;

    move-result-object v4

    const-string v5, "Challenge"

    invoke-virtual {v4, v5}, Landroid/app/ActionBar$Tab;->setText(Ljava/lang/CharSequence;)Landroid/app/ActionBar$Tab;

    move-result-object v4

    invoke-virtual {v4, p0}, Landroid/app/ActionBar$Tab;->setTabListener(Landroid/app/ActionBar$TabListener;)Landroid/app/ActionBar$Tab;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/app/ActionBar;->addTab(Landroid/app/ActionBar$Tab;)V

    .line 153
    iget-object v3, p0, Lcom/eshard/crackme/activities/CrackMeChallenge;->actionBar:Landroid/app/ActionBar;

    iget-object v4, p0, Lcom/eshard/crackme/activities/CrackMeChallenge;->actionBar:Landroid/app/ActionBar;

    invoke-virtual {v4}, Landroid/app/ActionBar;->newTab()Landroid/app/ActionBar$Tab;

    move-result-object v4

    const-string v5, "Hint"

    invoke-virtual {v4, v5}, Landroid/app/ActionBar$Tab;->setText(Ljava/lang/CharSequence;)Landroid/app/ActionBar$Tab;

    move-result-object v4

    invoke-virtual {v4, p0}, Landroid/app/ActionBar$Tab;->setTabListener(Landroid/app/ActionBar$TabListener;)Landroid/app/ActionBar$Tab;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/app/ActionBar;->addTab(Landroid/app/ActionBar$Tab;)V

    .line 156
    invoke-virtual {p0}, Lcom/eshard/crackme/activities/CrackMeChallenge;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3, v6}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 158
    invoke-direct {p0}, Lcom/eshard/crackme/activities/CrackMeChallenge;->ComputeFlagA()V

    .line 160
    const-string v0, "classes.dex"

    .line 161
    .local v0, "asset":Ljava/lang/String;
    invoke-direct {p0, v0}, Lcom/eshard/crackme/activities/CrackMeChallenge;->ExtractAsset(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    .line 162
    .local v2, "file":Ljava/io/File;
    invoke-virtual {p0}, Lcom/eshard/crackme/activities/CrackMeChallenge;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {p0}, Lcom/eshard/crackme/activities/CrackMeChallenge;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f060038

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v0, v2, v4}, Lcom/eshard/crackme/utils/dynamic/Dex;->LoadIt(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 163
    .local v1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<Ljava/lang/Object;>;"
    invoke-virtual {p0}, Lcom/eshard/crackme/activities/CrackMeChallenge;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f060039

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/eshard/crackme/utils/dynamic/Dex;->Invoke(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;

    .line 165
    invoke-direct {p0}, Lcom/eshard/crackme/activities/CrackMeChallenge;->UnProtectMe01()V

    .line 170
    .end local v0    # "asset":Ljava/lang/String;
    .end local v1    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<Ljava/lang/Object;>;"
    .end local v2    # "file":Ljava/io/File;
    :goto_0
    return-void

    .line 168
    :cond_0
    invoke-virtual {p0}, Lcom/eshard/crackme/activities/CrackMeChallenge;->getApplication()Landroid/app/Application;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    const-string v4, "Nope!"

    const/4 v5, 0x1

    invoke-static {v3, v4, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method

.method private native unprotectme01(Ljava/lang/String;)V
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 79
    invoke-super {p0, p1}, Landroid/support/v4/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 81
    const/4 v1, 0x1

    .local v1, "CODE_PROCEED":I
    const/4 v0, 0x2

    .line 82
    .local v0, "CODE_ERROR":I
    new-instance v3, Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceAbstraction;

    const-string v4, "http://razaina.fr/safetynet/index.php"

    new-instance v5, Lcom/eshard/crackme/activities/CrackMeChallenge$1;

    invoke-direct {v5, p0}, Lcom/eshard/crackme/activities/CrackMeChallenge$1;-><init>(Lcom/eshard/crackme/activities/CrackMeChallenge;)V

    invoke-direct {v3, v4, v5}, Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceAbstraction;-><init>(Ljava/lang/String;Lcom/eshard/crackme/utils/cigital/safetynet/SafetyNetWrapper$SafetyNetCallback;)V

    .line 101
    .local v3, "webService":Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceAbstraction;
    :try_start_0
    invoke-virtual {v3, p0}, Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceAbstraction;->getDate(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 106
    :goto_0
    return-void

    .line 102
    :catch_0
    move-exception v2

    .line 103
    .local v2, "e":Ljava/io/IOException;
    const/4 v4, 0x0

    sput-boolean v4, Lcom/eshard/crackme/activities/CrackMeChallenge;->ready:Z

    .line 104
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method public onTabReselected(Landroid/app/ActionBar$Tab;Landroid/app/FragmentTransaction;)V
    .locals 0
    .param p1, "tab"    # Landroid/app/ActionBar$Tab;
    .param p2, "fragmentTransaction"    # Landroid/app/FragmentTransaction;

    .prologue
    .line 250
    invoke-direct {p0}, Lcom/eshard/crackme/activities/CrackMeChallenge;->ComputeFlagB()V

    .line 251
    return-void
.end method

.method public onTabSelected(Landroid/app/ActionBar$Tab;Landroid/app/FragmentTransaction;)V
    .locals 2
    .param p1, "tab"    # Landroid/app/ActionBar$Tab;
    .param p2, "fragmentTransaction"    # Landroid/app/FragmentTransaction;

    .prologue
    .line 221
    iget-object v0, p0, Lcom/eshard/crackme/activities/CrackMeChallenge;->mViewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {p1}, Landroid/app/ActionBar$Tab;->getPosition()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPager;->setCurrentItem(I)V

    .line 224
    return-void
.end method

.method public onTabUnselected(Landroid/app/ActionBar$Tab;Landroid/app/FragmentTransaction;)V
    .locals 0
    .param p1, "tab"    # Landroid/app/ActionBar$Tab;
    .param p2, "fragmentTransaction"    # Landroid/app/FragmentTransaction;

    .prologue
    .line 245
    return-void
.end method

.method protected updateProgress([Ljava/lang/String;)V
    .locals 3
    .param p1, "messages"    # [Ljava/lang/String;

    .prologue
    .line 111
    iget v1, p0, Lcom/eshard/crackme/activities/CrackMeChallenge;->currentStep:I

    packed-switch v1, :pswitch_data_0

    .line 131
    :goto_0
    iget v1, p0, Lcom/eshard/crackme/activities/CrackMeChallenge;->currentStep:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/eshard/crackme/activities/CrackMeChallenge;->currentStep:I

    .line 132
    return-void

    .line 113
    :pswitch_0
    sget-object v1, Lcom/eshard/crackme/activities/CrackMeChallenge;->TAG:Ljava/lang/String;

    const-string v2, "Requesting nonce..."

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 116
    :pswitch_1
    sget-object v1, Lcom/eshard/crackme/activities/CrackMeChallenge;->TAG:Ljava/lang/String;

    const-string v2, "Requesting JWS..."

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 119
    :pswitch_2
    sget-object v1, Lcom/eshard/crackme/activities/CrackMeChallenge;->TAG:Ljava/lang/String;

    const-string v2, "Requesting API..."

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 122
    :pswitch_3
    sget-object v1, Lcom/eshard/crackme/activities/CrackMeChallenge;->TAG:Ljava/lang/String;

    const-string v2, "Request succeeded."

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 124
    const/4 v1, 0x1

    :try_start_0
    invoke-direct {p0, v1}, Lcom/eshard/crackme/activities/CrackMeChallenge;->proceed(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 125
    :catch_0
    move-exception v0

    .line 127
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 111
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
