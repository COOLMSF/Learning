#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define LH 1 //左高
#define RH -1 //右高
#define EH  0 //等高
#define MAX_LEN 512
typedef struct TNode{
  char data[MAX_LEN];//数据
  int number;//计数器
  int bf;//平衡因子，左子树的深度减去右子树的深度
  struct TNode *lchild;//左子树
  struct TNode *rchild;//右子树
}TNode,*BTree;
//初始化一颗空二叉树
void InitBTree(BTree *T){
   (*T)=NULL;
}
//创建二叉平衡排序树
 int InsertVAL(BTree *T,char *key,int *taller){
     if(*T==NULL){//生成新的结点
       *T=(BTree)malloc(sizeof(TNode));
       strcpy((char *) &((*T)->data), key);
       (*T)->number=1;
       (*T)->bf=EH;
       (*T)->lchild=(*T)->rchild=NULL;
        *taller=1;
      printf("%s插入成功\n",(*T)->data);
     }else  if((*T)->data==key){
       (*T)->number=(*T)->number+1;
       printf("%s已存在计数器加1\n",key);
       *taller=0;
       return 0 ;
     }else if(key<(*T)->data){//在左子树遍历
       if(!InsertVAL(&(*T)->lchild,key,&*taller)) return 0;
       if(*taller){//有新的结点插入左子树
        switch((*T)->bf){//检查平衡度
        case LH:LeftBalance(&(*T));*taller=0; break; //原本左子树比右子树高，需做平衡出来
        case EH: (*T)->bf=LH; *taller=1;break;       //原本左右子树等高，现因左因子增高而使树等高
        case RH: (*T)->bf=EH; *taller=0;break;       //原本右子树比左子树高，现在一样高
        }
       }
     }else {
      if(!InsertVAL(&(*T)->rchild,key,&*taller)) return 0;
      if(*taller){
        switch((*T)->bf){
        case LH: (*T)->bf=EH; *taller=0; break;
        case EH: (*T)->bf=RH; *taller=1; break;
        case RH:RightBalance(&(*T));*taller=0;break;
        }
      }
     }
   return 1;
 }
//画图理解
//LL型转uy
//右旋顺时针
//R_Rotate
void R_Rotate(BTree *p){
    BTree T2;
    T2=(*p)->lchild;
    (*p)->lchild=T2->rchild;
    T2->rchild=(*p);
    *p=T2;//p指向新的跟结点
}
//RR型旋转
//左旋逆时针
//L_Rotate
 void L_Rotate(BTree *p){
     BTree T2;
     T2=(*p)->rchild;
     (*p)->rchild=T2->lchild;
     T2->lchild=(*p);
     *p=T2;//p指向新的跟结点
}
//左平衡旋转包括LL型和LR型
void LeftBalance(BTree *T){
   BTree LT,RT;
   LT=(*T)->lchild;
  switch(LT->bf){
     case LH: //插在左子树的左孩子
        (*T)->bf=LT->bf=EH;
        //LL型调整
        R_Rotate(T);
        break;
    case EH:                //删除时需要，插入不需要
            (*T)->bf = 1;
            LT->bf = -1;
            R_Rotate(&(*T));
            break;
     case RH://插在左子树的右孩子
     RT=LT->rchild;
     switch(RT->bf){
     //先调整平衡因子在做旋转
     //为容易理解，约定左高或右高其中右子树或左子树为空，另一边的子树只有一个结点
     case LH:(*T)->bf=RH;LT->bf=EH; break;//左高，则RT的右子树为空，两次旋转后，T的左子树为空，因为T的左子树挂的是RT的右子数。
                                             //LT的右子树挂上RT的左子树，LT的平衡因子为0

     case EH:(*T)->bf=LT->bf=EH; break;//等高，RT的左右子树等高或都为空，则两次旋转后LT，T都等高
     case RH:(*T)->bf=EH;LT->bf=LH; break;
     }//switch((*RT)->bf)
     RT->bf=EH;//两次旋转后RT成为新的跟结点
      L_Rotate(&(*T)->lchild);
      R_Rotate(T);
  }
}
//右平衡旋转，包括RR型和RL型
void RightBalance(BTree *T){
  BTree RT,LT;
  RT=(*T)->rchild;
  switch(RT->bf){
  case RH:
    (*T)->bf=RT->bf=EH;
     L_Rotate(T);
    break;
    case EH:            //删除时需要，插入不需要，画图理解
            (*T)->bf = -1;//旋转后，RT的左子树挂在T的右子树，所以右高
            RT->bf = 1;//旋转后RT为此时的根节点，相当于T，原来的T成为RT的左子树，所以左高
            L_Rotate(&(*T));
            break;
    case LH:
   LT=RT->lchild;
    switch(LT->bf)
    {
    case LH:(*T)->bf=EH;RT->bf=RH;break;
    case EH:(*T)->bf=EH;RT->bf=EH;break;
    case RH:(*T)->bf=LH;RT->bf=EH;break;
   }
    LT->bf=EH;
    R_Rotate(&(*T)->rchild);
    L_Rotate(T);
    }
}
void  getData( BTree T){
if(T!=NULL){
    getData(T->lchild);
   int i;
   for(i=0;i<T->number;i++){
     printf("%s    ",T->data);
   }
    getData(T->rchild);
}

}
void  getData1( BTree T){
if(T!=NULL){
    printf("%s    ",T->data);
    getData1(T->lchild);
   int i;
    for(i=0;i<T->number;i++){

   }
    getData1(T->rchild);
}

}
void  getData2( BTree T){
if(T!=NULL){

    getData2(T->lchild);
   int i;
    for(i=0;i<T->number;i++){

   }
    getData2(T->rchild);
    printf("%s    ",T->data);
}

}
//删除结点
int DeleteNOde(BTree *T,char *data,int *taller){
    if((*T)==NULL||((strcmp((const char *) &(*T)->data, data) == 0)&& (*T)->number > 1)){
            //存在多个相同的数，number-1
        (*T)->number=(*T)->number-1;
        return 0;
    }else if((*T)->data==data){
      if((*T)->lchild==NULL){//包括左子树为空和左右子树都为空
        BTree  p=(*T);
        (*T)=(*T)->rchild;
        *taller=1;
        printf("%s删除成功！\n",data);
        free(p);
      }else if((*T)->rchild==NULL){//左子树不为空，右子树为空
          BTree p=(*T);
          (*T)=(*T)->lchild;
          *taller=1;
          free(p);
      }else{//左右都不为空
        BTree p=(*T)->lchild;
       //找到T右子树最大数p->data，并赋值给T
        while(p->rchild!=NULL){
            p=p->rchild;
        }
        strcpy((char *) &(*T)->data, p->data);
        //此时删除data，变成删除p->data
        DeleteNOde(&(*T)->lchild,p->data,&*taller);
      }
      //在左子树删除结点
    } else if(data<(*T)->data){
        //如果没有删除成功，则不调整
       if(!DeleteNOde(&(*T)->lchild,data,&*taller)){
        return 0;
       }
       if(*taller){
        switch((*T)->bf){
        case LH: (*T)->bf=EH,*taller=1; break;//原本左高，左子树删除一个结点，树的高度发生变化，此时等高
        case EH: (*T)->bf=RH,*taller=0; break;//原本等高，左子树删除一结点，此时右高
        case RH:
            if((*T)->rchild->bf == 0)
					{                //T->rchild平衡因子等高，
						*taller = 0;//T进行一次旋转即平衡,此时树的高度不变，taller=0
					}
					else
					{
						*taller = 1;//(1)T的平衡因子和T->rchild的平衡因子相等，做一次旋转即平衡，此时
                                    //树变矮，taller=1
					}               //(2)T的平衡因子和T->rchild的平衡因子符号相反，需做两旋转平衡
					                //此时树变矮，taller=1
            RightBalance(&(*T)); break;
        }
       }/*
          总结：设p为回溯至根节点的路径上的某一结点，观察p的平衡因子。
          1.如果p的当前平衡因子等高，则根据其左子树或右子树是否减短，将p的当前平衡因子做相应的改变，变量shorter设置为false
          2.如果p的当前平衡因子不等高，且p的较高的子树被减短，将p的当前平衡因子改成等高，变量shorter设置true
          3.如果p的当前平衡因子不等高，且p的较短的子树被减短，假设q指向p的较高的子树的跟结点
            a.如果q的平衡因子等高，则需要在p处进行一次单旋转，shorter设置为false
            b.如果q的平衡因子等于p的平衡因子，则需要在p处进行一次单旋转，shorter设置为true
            c.假设p和q的平衡因子符号相反，则需要在p处进行一次双旋转（即在q出进行一次单旋转，再在p进行一次单旋转）。调整平衡因子，将shorter设置为true
       */


    }else{
         if(!DeleteNOde(&(*T)->rchild,data,&*taller))
    {
      return 0;
    }
    if(*taller)
    {
      switch((*T)->bf)
      {
        case 1:
            if((*T)->lchild->bf == 0)
					{
						*taller = 0;
					}
					else
					{
						*taller= 1;
					}
         LeftBalance(&(*T));break;
        case 0:
          (*T)->bf = 1;
         *taller= 0;
          break;
        case -1:
        (*T)->bf = 0;
         *taller = 1;
          break;
      }
    }
    }
 return 1;
}
//求树的深度
void Depth(BTree *T,int level,int *haval){
   if((*T)!=NULL){
     if(level>*haval) *haval=level;
      Depth(&(*T)->lchild,level+1,&*haval);
      Depth(&(*T)->rchild,level+1,&*haval);
   }
}
int Depth1(BTree T)
{
	if (T==NULL)
		return 0;
	else
	{
		int ld = Depth1(T->lchild);
		int rd = Depth1(T->rchild);
		return 1 + (ld >rd ? ld : rd);
	}
}
 int isBalance(BTree T)
{
	if (T==NULL)
		return 1;
	int dis = Depth1(T->lchild) - Depth1(T->rchild);
	if (dis>1 || dis<-1 )
		return 0;
	else
		return isBalance(T->lchild) && isBalance(T->rchild);
}
int main()
{   BTree T;//=NULL;
    InitBTree(&T);
    // int a[]={1,45,92,78,32,46,12,11,11,1,1,11,1,12,23,24,25,26,27,28,29,37,42};
    char *a[] = {
    	"Hello", "world", "this", "is"
    };
    int i;
    // int n=sizeof(a)/sizeof (int);
    int n = 4;
    //测试函数
    int taller;
      int isb;
    for(i=0;i<n;i++){
    InsertVAL(&T,a[i],&taller);
    //验证是否为平衡二叉树，返回1是，0否
     isb=isBalance(T);
     printf("isb=%d\n",isb);
    }

  isb=isBalance(T);
  printf("isb=%d\n",isb);
     //中序遍历
     getData(T);
      printf("\n");
    int haval=0;
    //求树的深度
   Depth(&T,1,&haval);

     printf("\n");
    printf("haval=%d\n",haval);
    printf("\n");
    int b;

    for(i=0;i<n;i++){
    //删除结点
     DeleteNOde(&T,a[i],&b);
     isb=isBalance(T);
     printf("isb=%d\n",isb);
     int haval1=0;
     Depth(&T,1,&haval1);
     printf("\n");
    printf("haval1=%d\n",haval1);
    printf("\n");
    getData(T);
    printf("\n");
    }
    InsertVAL(&T,"foo",&taller);
   InsertVAL(&T,"bar",&taller);
    getData(T);
    printf("\n");

    printf("Hello world!\n");
    return 0;
}