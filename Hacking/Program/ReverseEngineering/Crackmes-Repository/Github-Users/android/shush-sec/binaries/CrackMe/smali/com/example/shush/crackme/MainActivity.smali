.class public Lcom/example/shush/crackme/MainActivity;
.super Landroid/support/v7/app/AppCompatActivity;
.source "MainActivity.java"


# instance fields
.field editText:Landroid/widget/EditText;

.field sn:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 13
    const-string v0, "native-lib"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 14
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 9
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    .line 17
    const-string v0, ""

    iput-object v0, p0, Lcom/example/shush/crackme/MainActivity;->sn:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public check(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 31
    iget-object v1, p0, Lcom/example/shush/crackme/MainActivity;->editText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/example/shush/crackme/MainActivity;->sn:Ljava/lang/String;

    .line 32
    iget-object v1, p0, Lcom/example/shush/crackme/MainActivity;->sn:Ljava/lang/String;

    invoke-virtual {p0, v1}, Lcom/example/shush/crackme/MainActivity;->resultFromJNI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 33
    .local v0, "result":Ljava/lang/String;
    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 34
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 20
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 21
    const v0, 0x7f04001b

    invoke-virtual {p0, v0}, Lcom/example/shush/crackme/MainActivity;->setContentView(I)V

    .line 22
    const v0, 0x7f0b005e

    invoke-virtual {p0, v0}, Lcom/example/shush/crackme/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/example/shush/crackme/MainActivity;->editText:Landroid/widget/EditText;

    .line 23
    return-void
.end method

.method public native resultFromJNI(Ljava/lang/String;)Ljava/lang/String;
.end method
