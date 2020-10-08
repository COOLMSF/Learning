.class public Lcom/eshard/crackme/fragments/AboutFragment;
.super Landroid/support/v4/app/Fragment;
.source "AboutFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 4
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 21
    const v2, 0x7f040019

    const/4 v3, 0x0

    invoke-virtual {p1, v2, p2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .line 24
    .local v1, "view":Landroid/view/View;
    const v2, 0x7f0c0053

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 25
    .local v0, "quitButton":Landroid/widget/Button;
    new-instance v2, Lcom/eshard/crackme/listeners/AboutFragmentOnClickListener;

    invoke-direct {v2}, Lcom/eshard/crackme/listeners/AboutFragmentOnClickListener;-><init>()V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 27
    return-object v1
.end method
