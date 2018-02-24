#include "stack.h"

Stack stack_create()
{
    Stack stack = (Stack)malloc(sizeof(struct StackNode));
    stack->top = -1;
    return stack;
}
int stack_is_empty(Stack s)
{
    if(s){return s->top==-1;}
    else{return 0;}
}
int stack_is_full(Stack s)
{
    if(s){return s->top==STACK_MAX_LEN-1;}
    else{return 0;}
}
int stack_push(Stack s, int e)
{
    if(!s){return -1;}
    s->data[++s->top] = e;
    return 0;
}
int stack_pop(Stack s)
{
    if(!s){return -1;}
    return s->data[s->top--];
}
int stack_top(Stack s)
{
    if(!s){return -1;}
    return s->data[s->top];
}
