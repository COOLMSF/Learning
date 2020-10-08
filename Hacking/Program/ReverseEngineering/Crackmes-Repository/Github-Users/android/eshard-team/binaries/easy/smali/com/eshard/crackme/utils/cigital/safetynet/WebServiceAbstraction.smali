.class public Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceAbstraction;
.super Ljava/lang/Object;
.source "WebServiceAbstraction.java"


# instance fields
.field protected safetyNetCallback:Lcom/eshard/crackme/utils/cigital/safetynet/SafetyNetWrapper$SafetyNetCallback;

.field protected safetyNetWrapper:Lcom/eshard/crackme/utils/cigital/safetynet/SafetyNetWrapper;

.field protected uri:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/eshard/crackme/utils/cigital/safetynet/SafetyNetWrapper$SafetyNetCallback;)V
    .locals 1
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "safetyNetCallback"    # Lcom/eshard/crackme/utils/cigital/safetynet/SafetyNetWrapper$SafetyNetCallback;

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p1, p0, Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceAbstraction;->uri:Ljava/lang/String;

    .line 16
    iput-object p2, p0, Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceAbstraction;->safetyNetCallback:Lcom/eshard/crackme/utils/cigital/safetynet/SafetyNetWrapper$SafetyNetCallback;

    .line 17
    new-instance v0, Lcom/eshard/crackme/utils/cigital/safetynet/SafetyNetWrapper;

    invoke-direct {v0}, Lcom/eshard/crackme/utils/cigital/safetynet/SafetyNetWrapper;-><init>()V

    iput-object v0, p0, Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceAbstraction;->safetyNetWrapper:Lcom/eshard/crackme/utils/cigital/safetynet/SafetyNetWrapper;

    .line 18
    return-void
.end method


# virtual methods
.method public getDate(Landroid/content/Context;)V
    .locals 3
    .param p1, "ctx"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 23
    new-instance v0, Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceRequestTask;

    invoke-direct {v0}, Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceRequestTask;-><init>()V

    .line 24
    .local v0, "requestDateTask":Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceRequestTask;
    iget-object v1, p0, Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceAbstraction;->safetyNetCallback:Lcom/eshard/crackme/utils/cigital/safetynet/SafetyNetWrapper$SafetyNetCallback;

    invoke-virtual {v0, v1}, Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceRequestTask;->setCallback(Lcom/eshard/crackme/utils/cigital/safetynet/SafetyNetWrapper$SafetyNetCallback;)V

    .line 25
    iget-object v1, p0, Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceAbstraction;->safetyNetWrapper:Lcom/eshard/crackme/utils/cigital/safetynet/SafetyNetWrapper;

    invoke-virtual {v0, v1}, Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceRequestTask;->setWrapper(Lcom/eshard/crackme/utils/cigital/safetynet/SafetyNetWrapper;)V

    .line 26
    iget-object v1, p0, Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceAbstraction;->uri:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceRequestTask;->setUri(Ljava/lang/String;)V

    .line 27
    const/4 v1, 0x1

    new-array v1, v1, [Landroid/content/Context;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceRequestTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 28
    return-void
.end method
