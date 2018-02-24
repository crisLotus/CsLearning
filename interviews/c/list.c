#include "list.h"

List init_list()
{
    List list = (List)malloc(sizeof(struct ListNode));
    list->next = NULL;
    list->data = NULL;
    return list;
}

int list_is_empty(List L)
{
    return L->next == NULL;
}
int list_is_last(List L, PNode position)
{
    if(position){
        return position->next == NULL;
    }
    return 0;

}
int insert_to_list(List L, PNode onenode)
{
    PNode p = L;
    while(!list_is_last(L, p)){
        p = p->next;
    }
    p->next = onenode;
    return 0;
}
void* del_from_list(List L, PNode position)
{
    PNode pre = findpre_by_position_list(L, position);
    if(pre==NULL){
        return pre;
    }
    PNode tp =pre->next;
    pre->next = pre->next->next;
    free(tp);
}
PNode find_in_list(List L, PNode pos)
{
    for(PNode p=L; p!=NULL; p=p->next)
    {
        if(p==pos)
        {
            return 1;
        }
    }
    return NULL;
}
PNode findpre_by_position_list(List L, PNode position)
{
    PNode pre=L, tp;
    if(position == NULL)
    {
        return NULL;
    }
    for(tp=pre->next; tp != position && tp;)
    {
        tp = tp->next;
        pre = pre->next;
    }
    if(pre->next == position)
    {
        return pre;
    }
    return NULL;
}
