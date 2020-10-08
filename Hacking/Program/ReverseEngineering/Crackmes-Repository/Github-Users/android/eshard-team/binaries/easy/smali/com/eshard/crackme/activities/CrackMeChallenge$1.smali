.class Lcom/eshard/crackme/activities/CrackMeChallenge$1;
.super Ljava/lang/Object;
.source "CrackMeChallenge.java"

# interfaces
.implements Lcom/eshard/crackme/utils/cigital/safetynet/SafetyNetWrapper$SafetyNetCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/eshard/crackme/activities/CrackMeChallenge;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/eshard/crackme/activities/CrackMeChallenge;


# direct methods
.method constructor <init>(Lcom/eshard/crackme/activities/CrackMeChallenge;)V
    .locals 0
    .param p1, "this$0"    # Lcom/eshard/crackme/activities/CrackMeChallenge;

    .prologue
    .line 85
    iput-object p1, p0, Lcom/eshard/crackme/activities/CrackMeChallenge$1;->this$0:Lcom/eshard/crackme/activities/CrackMeChallenge;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleCallback(I[Ljava/lang/String;)V
    .locals 1
    .param p1, "code"    # I
    .param p2, "messages"    # [Ljava/lang/String;

    .prologue
    .line 89
    packed-switch p1, :pswitch_data_0

    .line 97
    :goto_0
    return-void

    .line 91
    :pswitch_0
    iget-object v0, p0, Lcom/eshard/crackme/activities/CrackMeChallenge$1;->this$0:Lcom/eshard/crackme/activities/CrackMeChallenge;

    invoke-virtual {v0, p2}, Lcom/eshard/crackme/activities/CrackMeChallenge;->updateProgress([Ljava/lang/String;)V

    goto :goto_0

    .line 89
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
