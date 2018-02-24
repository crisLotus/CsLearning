#ifndef LIST_H_INCLUDED_SIMPLE
#define LIST_H_INCLUDED_SIMPLE

#include <string.h>

struct ListNode;
typedef struct ListNode *PNode;
typedef PNode List;

struct ListNode {
    void* data;
    PNode next;
};

List init_list();
int list_is_empty(List L);
int list_is_last(List L, PNode position);
int insert_to_list(List L, PNode onenode);
void* del_from_list(List L, PNode position);
PNode find_in_list(List L, PNode pos);
PNode findpre_by_position_list(List L, PNode position);

#endif // LIST_H_INCLUDED_SIMPLE
