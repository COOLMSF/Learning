.class public Lcom/eshard/crackme/listeners/CrackMeActivityOnPageChangeListener;
.super Landroid/support/v4/view/ViewPager$SimpleOnPageChangeListener;
.source "CrackMeActivityOnPageChangeListener.java"


# instance fields
.field actionBar:Landroid/app/ActionBar;


# direct methods
.method public constructor <init>(Landroid/app/ActionBar;)V
    .locals 0
    .param p1, "actionBar"    # Landroid/app/ActionBar;

    .prologue
    .line 13
    invoke-direct {p0}, Landroid/support/v4/view/ViewPager$SimpleOnPageChangeListener;-><init>()V

    .line 14
    iput-object p1, p0, Lcom/eshard/crackme/listeners/CrackMeActivityOnPageChangeListener;->actionBar:Landroid/app/ActionBar;

    .line 15
    return-void
.end method


# virtual methods
.method public onPageSelected(I)V
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 19
    iget-object v0, p0, Lcom/eshard/crackme/listeners/CrackMeActivityOnPageChangeListener;->actionBar:Landroid/app/ActionBar;

    invoke-virtual {v0, p1}, Landroid/app/ActionBar;->setSelectedNavigationItem(I)V

    .line 20
    return-void
.end method
