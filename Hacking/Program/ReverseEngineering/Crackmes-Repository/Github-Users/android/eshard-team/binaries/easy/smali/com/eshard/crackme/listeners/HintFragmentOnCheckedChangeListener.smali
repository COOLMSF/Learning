.class public Lcom/eshard/crackme/listeners/HintFragmentOnCheckedChangeListener;
.super Ljava/lang/Object;
.source "HintFragmentOnCheckedChangeListener.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# instance fields
.field textHint:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/widget/TextView;)V
    .locals 0
    .param p1, "textHint"    # Landroid/widget/TextView;

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lcom/eshard/crackme/listeners/HintFragmentOnCheckedChangeListener;->textHint:Landroid/widget/TextView;

    .line 15
    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 2
    .param p1, "buttonView"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .prologue
    .line 19
    if-eqz p2, :cond_1

    const/4 v0, 0x0

    .line 20
    .local v0, "newVisibility":I
    :goto_0
    iget-object v1, p0, Lcom/eshard/crackme/listeners/HintFragmentOnCheckedChangeListener;->textHint:Landroid/widget/TextView;

    if-eqz v1, :cond_0

    .line 21
    iget-object v1, p0, Lcom/eshard/crackme/listeners/HintFragmentOnCheckedChangeListener;->textHint:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 23
    :cond_0
    return-void

    .line 19
    .end local v0    # "newVisibility":I
    :cond_1
    const/16 v0, 0x8

    goto :goto_0
.end method
