.class public Lcom/eshard/crackme/adaptors/CrackMePagerAdapter;
.super Landroid/support/v4/app/FragmentPagerAdapter;
.source "CrackMePagerAdapter.java"


# direct methods
.method public constructor <init>(Landroid/support/v4/app/FragmentManager;)V
    .locals 0
    .param p1, "fm"    # Landroid/support/v4/app/FragmentManager;

    .prologue
    .line 22
    invoke-direct {p0, p1}, Landroid/support/v4/app/FragmentPagerAdapter;-><init>(Landroid/support/v4/app/FragmentManager;)V

    .line 23
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 38
    const/4 v0, 0x3

    return v0
.end method

.method public getItem(I)Landroid/support/v4/app/Fragment;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 27
    packed-switch p1, :pswitch_data_0

    .line 32
    new-instance v0, Lcom/eshard/crackme/fragments/CrackMeFragment;

    invoke-direct {v0}, Lcom/eshard/crackme/fragments/CrackMeFragment;-><init>()V

    :goto_0
    return-object v0

    .line 29
    :pswitch_0
    new-instance v0, Lcom/eshard/crackme/fragments/CrackMeFragment;

    invoke-direct {v0}, Lcom/eshard/crackme/fragments/CrackMeFragment;-><init>()V

    goto :goto_0

    .line 31
    :pswitch_1
    new-instance v0, Lcom/eshard/crackme/fragments/HintFragment;

    invoke-direct {v0}, Lcom/eshard/crackme/fragments/HintFragment;-><init>()V

    goto :goto_0

    .line 27
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
