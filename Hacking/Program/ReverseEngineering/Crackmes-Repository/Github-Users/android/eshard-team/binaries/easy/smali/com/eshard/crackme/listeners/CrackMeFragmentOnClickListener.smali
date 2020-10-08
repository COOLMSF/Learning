.class public Lcom/eshard/crackme/listeners/CrackMeFragmentOnClickListener;
.super Ljava/lang/Object;
.source "CrackMeFragmentOnClickListener.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private Level1Flag:Ljava/lang/String;

.field private Level2Flag:[B

.field private Level3Flag:Ljava/lang/String;

.field private XORKey:[B

.field private activity:Landroid/app/Activity;

.field private hashes:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 21
    const-string v0, "crackmelib"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 22
    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;)V
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "b2f787919a7feb10afc86d3dcf51c93a"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "77ea21bb71ed09d81e09d3a3a0a46396"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "dfc07f021b65133205b5cbd54b74f1af"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "4072b97b4fcd9a07a89ac63fee384b12"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "8b31b0cc107cbdd80ddad0843c20601d"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "629ba4ca89634d975b451121b58d75c8"

    aput-object v2, v0, v1

    iput-object v0, p0, Lcom/eshard/crackme/listeners/CrackMeFragmentOnClickListener;->hashes:[Ljava/lang/String;

    .line 33
    const-string v0, "NIC3Y0UG0T1T!"

    iput-object v0, p0, Lcom/eshard/crackme/listeners/CrackMeFragmentOnClickListener;->Level1Flag:Ljava/lang/String;

    .line 34
    const/16 v0, 0x14

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/eshard/crackme/listeners/CrackMeFragmentOnClickListener;->Level2Flag:[B

    .line 38
    const/16 v0, 0xd

    new-array v0, v0, [B

    fill-array-data v0, :array_1

    iput-object v0, p0, Lcom/eshard/crackme/listeners/CrackMeFragmentOnClickListener;->XORKey:[B

    .line 41
    const-string v0, "//xDG$orez$orez$aox$re09$xS7a$3uJQ$Bn00$Qw7z$N788$;)$0kZE$45S$H_Jsx$Kw1$_Kej$J$!xD//"

    iput-object v0, p0, Lcom/eshard/crackme/listeners/CrackMeFragmentOnClickListener;->Level3Flag:Ljava/lang/String;

    .line 45
    iput-object p1, p0, Lcom/eshard/crackme/listeners/CrackMeFragmentOnClickListener;->activity:Landroid/app/Activity;

    .line 46
    return-void

    .line 34
    nop

    :array_0
    .array-data 1
        0x4t
        0x35t
        0x36t
        0x33t
        0x32t
        0x2t
        0x30t
        0x1ct
        0x32t
        0x38t
        0x20t
        0x28t
        0x66t
        0xbt
        0x3bt
        0x32t
        0x2ct
        0x25t
        0x8t
        0x44t
    .end array-data

    .line 38
    :array_1
    .array-data 1
        0x43t
        0x72t
        0x61t
        0x63t
        0x6bt
        0x4dt
        0x65t
        0x4ct
        0x65t
        0x76t
        0x65t
        0x6ct
        0x32t
    .end array-data
.end method

.method private native VerifyLevel3(Ljava/lang/String;Ljava/lang/String;)Z
.end method

.method private native VerifyLevel4(Ljava/lang/String;)Z
.end method

.method private hurray(Landroid/view/View;)V
    .locals 4
    .param p1, "parent"    # Landroid/view/View;

    .prologue
    .line 98
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "vibrator"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Vibrator;

    .line 99
    .local v0, "vibrator":Landroid/os/Vibrator;
    const-wide/16 v2, 0x258

    invoke-virtual {v0, v2, v3}, Landroid/os/Vibrator;->vibrate(J)V

    .line 100
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "You\'ve retrieved one of the flags! Good job!"

    const/4 v3, 0x1

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 101
    return-void
.end method


# virtual methods
.method public VerifyLevel2(Ljava/lang/String;)Z
    .locals 4
    .param p1, "flag"    # Ljava/lang/String;

    .prologue
    .line 105
    new-instance v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/eshard/crackme/listeners/CrackMeFragmentOnClickListener;->Level2Flag:[B

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>([B)V

    new-instance v2, Ljava/lang/String;

    iget-object v3, p0, Lcom/eshard/crackme/listeners/CrackMeFragmentOnClickListener;->XORKey:[B

    invoke-direct {v2, v3}, Ljava/lang/String;-><init>([B)V

    invoke-static {v1, v2}, Lcom/eshard/androidsecurityutils/Cipher;->XOR(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 106
    .local v0, "decrypt":Ljava/lang/String;
    invoke-static {p1}, Lcom/eshard/androidsecurityutils/Hashes;->md5sum(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/eshard/crackme/listeners/CrackMeFragmentOnClickListener;->hashes:[Ljava/lang/String;

    const/4 v3, 0x1

    aget-object v2, v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method

.method public onClick(Landroid/view/View;)V
    .locals 9
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/4 v5, 0x0

    .line 63
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    invoke-interface {v4}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    .line 65
    .local v2, "parent":Landroid/view/View;
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v4

    packed-switch v4, :pswitch_data_0

    .line 94
    :cond_0
    :goto_0
    return-void

    .line 70
    :pswitch_0
    if-eqz v2, :cond_0

    .line 71
    const v4, 0x7f0c0055

    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    .line 72
    .local v3, "textGuess":Landroid/widget/EditText;
    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 74
    .local v0, "flag":Ljava/lang/String;
    const-string v4, ""

    invoke-virtual {v0, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 75
    iget-object v6, p0, Lcom/eshard/crackme/listeners/CrackMeFragmentOnClickListener;->hashes:[Ljava/lang/String;

    array-length v7, v6

    move v4, v5

    :goto_1
    if-ge v4, v7, :cond_1

    aget-object v1, v6, v4

    .line 76
    .local v1, "hsh":Ljava/lang/String;
    invoke-static {v0}, Lcom/eshard/androidsecurityutils/Hashes;->md5sum(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 77
    invoke-direct {p0, v2}, Lcom/eshard/crackme/listeners/CrackMeFragmentOnClickListener;->hurray(Landroid/view/View;)V

    .line 82
    .end local v1    # "hsh":Ljava/lang/String;
    :cond_1
    invoke-virtual {p0, v0}, Lcom/eshard/crackme/listeners/CrackMeFragmentOnClickListener;->VerifyLevel2(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2

    iget-object v4, p0, Lcom/eshard/crackme/listeners/CrackMeFragmentOnClickListener;->Level3Flag:Ljava/lang/String;

    .line 83
    invoke-direct {p0, v0, v4}, Lcom/eshard/crackme/listeners/CrackMeFragmentOnClickListener;->VerifyLevel3(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 84
    invoke-direct {p0, v0}, Lcom/eshard/crackme/listeners/CrackMeFragmentOnClickListener;->VerifyLevel4(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 86
    :cond_2
    invoke-direct {p0, v2}, Lcom/eshard/crackme/listeners/CrackMeFragmentOnClickListener;->hurray(Landroid/view/View;)V

    goto :goto_0

    .line 75
    .restart local v1    # "hsh":Ljava/lang/String;
    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 88
    .end local v1    # "hsh":Ljava/lang/String;
    :cond_4
    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    const-string v6, "Sorry, that\'s not right.."

    invoke-static {v4, v6, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 65
    :pswitch_data_0
    .packed-switch 0x7f0c0056
        :pswitch_0
    .end packed-switch
.end method
