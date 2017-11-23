#ifndef _LIST_H

#define ElementType char

struct	Node;

typedef struct	Node	*PtrToNode;
typedef PtrToNode	List;
typedef PtrToNode	Node;
typedef PtrToNode	Position;

List		CreatList();
Node		CreatNode(void);
int			IsEmpty( List L );
int			IsLast( Position P, List L );
Position	Find( ElementType X, List  L);
void		Delete( ElementType X, List T );
Position	FindPrevious( ElementType X, List L );
void		Insert( ElementType X, List L );
void		DeleteList( List L );
Position	Advance( Position P );//add
ElementType	Retrieve( Position P );//È¡³öElement 

#endif

#ifndef _LIST_NODE
struct Node{
	ElementType Element;
	Position  Next;
};
#endif
