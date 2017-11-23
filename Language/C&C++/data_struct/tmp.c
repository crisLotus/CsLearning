#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include <assert.h>
#include "list.h"


Node CreatNode(void){
	List N = (List)malloc(sizeof(struct Node));
	N->Element=0;	//NULL;
	N->Next=NULL;
	return N;
}
List CreatList(){
	Node N = CreatNode();
	return (List)N;
}

int IsEmpty( List L ){
	return L->Next==NULL;
}

int	IsLast( Position P, List L ){
	if(IsEmpty(L)){
		printf("List is NULL\n");
		exit(-1);
	}
	return P->Next==NULL;
}

Position FindPrevious( ElementType x, List L ){
	Position p=L;
	for( ; p->Next != NULL && p->Next->Element != x; p=p->Next){}
	return p;
}

Position Find( ElementType X, List  L ){
	
	return FindPrevious(X,L)->Next;
} 

void Delete( ElementType x, List L ){
	Position temp,p;
	p = FindPrevious(x,L);
	temp = p->Next;
	
	if(!IsLast(p,L)){
		temp = p->Next;
		p->Next = temp->Next;
		free(temp);
	}	
}

/*insert to the back of the header*/
void Insert( ElementType X, List L ){
	Node N = CreatNode();
	N->Element = X;
	N->Next = L->Next;
	L->Next = N;
}

void		DeleteList( List L ){
	Position p,temp;
	p = L->Next;
	L->Next = NULL;
	while( p != NULL ){
		temp = p->Next;
		free(p);
		p = NULL;
		p = temp;
	}
}

ElementType	Retrieve( Position p ){
	return p->Element;
}//取出Element
