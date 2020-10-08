.class public Lcom/eshard/crackme/fragments/HintFragment;
.super Landroid/support/v4/app/Fragment;
.source "HintFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
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
    .line 20
    const v2, 0x7f04001b

    const/4 v3, 0x0

    invoke-virtual {p1, v2, p2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .line 21
    .local v1, "view":Landroid/view/View;
    const v2, 0x7f0c0057

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ToggleButton;

    .line 22
    .local v0, "switchShowHint":Landroid/widget/ToggleButton;
    new-instance v3, Lcom/eshard/crackme/listeners/HintFragmentOnCheckedChangeListener;

    const v2, 0x7f0c0058

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    invoke-direct {v3, v2}, Lcom/eshard/crackme/listeners/HintFragmentOnCheckedChangeListener;-><init>(Landroid/widget/TextView;)V

    invoke-virtual {v0, v3}, Landroid/widget/ToggleButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 23
    return-object v1
.end method
