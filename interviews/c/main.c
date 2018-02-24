#include <stdio.h>
#include <stdlib.h>
#include "minctest.h"
#include "list.h"
#include "stack.h"

/** \brief 传入字符串中字符是否唯一
 *
 * \param char string[]
 * \return 1 or 0
 *
 */
int string_is_uniqeue(char string[])
{
    int hash_list[256]= {0};
    for(int i=0; string[i]!='\0'; i++)
    {
        if(hash_list[(int)string[i]])
        {
            return 0;//false
        }
        hash_list[(int)string[i]] += 1;
    }
    return 1;//true
}

/** \brief 给定两个字符串，判断他们是否是彼此可置换的
 *
 * \param string_a
 * \param string_b
 * \return 0 or 1
 *
 */
int is_permutation(char string_a[], char string_b[])
{
    int hash_a[256]= {0}, hash_b[256]= {0};
    for(int i=strlen(string_a); i>0; i--)
    {
        hash_a[(int)string_a[i]]+=1;
    }
    for(int i=strlen(string_b); i>0; i--)
    {
        hash_b[(int)string_b[i]]+=1;
    }

    for(int i=0; i<256; i++)
    {
        if(hash_a[i]!=hash_b[i])
        {
            return 0;
        }
    }
    return 1;
}

// test=================================
void test_run();
int main()
{
    printf("unittest start:\n");
    test_run();
    printf("unittest end  ;\n");
    return 0;
}

void test_string_is_uniqeue()
{
    char *string="abcdefgh";
    lequal(string_is_uniqeue(string), 1);//true
    string = "aaaaabcdefghig";
    lequal(string_is_uniqeue(string), 0);//false
}

void test_is_permutation()
{
    char * string_a="abcdef";
    char * string_b="abcdef";
    lequal(is_permutation(string_a, string_b), 1);
    string_a="abcdeffff";
    lequal(is_permutation(string_a, string_b), 0);
}

void test_list()
{
    List list = init_list();
    lequal(list->next, NULL);
    lequal(list->data, NULL);

    PNode p = (PNode)malloc(sizeof(struct ListNode));
    p->next = NULL;
    insert_to_list(list, p);
    lequal(list->next, p);
    lequal(list->next->next, NULL);

    find_in_list(list, p);

    lequal(findpre_by_position_list(list, p), list);
    lequal(findpre_by_position_list(list, NULL), NULL);
    lequal(findpre_by_position_list(list, 0x1), NULL);

    del_from_list(list, p);
    lequal(list->next, NULL);
    //lequal(list_is_empty(list), 1);
}

void test_stack()
{
    Stack stack = stack_create();
    lequal(-1, stack->top);
    lequal(stack_is_empty(stack), 1);

    stack_push(stack, 10);
    lequal(stack_top(stack), 10);
    stack_push(stack, 12);
    lequal(stack_top(stack), 12);
    lequal(stack_pop(stack), 12);
    lequal(stack_top(stack), 10);
}

// run test = ===========================
void test_run()
{
    lrun("test_string_is_uniqeue:", test_string_is_uniqeue);
    lrun("test_is_permutation:", test_is_permutation);
    lrun("test_list:", test_list);
    lrun("test_stack:", test_stack);
    lresults();
}
