.class public Lcom/eshard/crackme/listeners/AboutFragmentOnClickListener;
.super Ljava/lang/Object;
.source "AboutFragmentOnClickListener.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/4 v1, 0x0

    .line 13
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 18
    :goto_0
    return-void

    .line 15
    :pswitch_0
    invoke-virtual {p1, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 16
    invoke-static {v1}, Ljava/lang/System;->exit(I)V

    goto :goto_0

    .line 13
    :pswitch_data_0
    .packed-switch 0x7f0c0053
        :pswitch_0
    .end packed-switch
.end method
