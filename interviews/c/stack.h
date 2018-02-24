#ifndef STACK_H_INCLUDED_SIMPLE
#define STACK_H_INCLUDED_SIMPLE

#define STACK_MAX_LEN 256
// 简单实现元素为int的栈
struct StackNode;
typedef struct StackNode * PStackNode;
typedef PStackNode Stack;

struct StackNode
{
    int data[STACK_MAX_LEN];
    int top;
    int bottom;
};

Stack stack_create();
int stack_is_empty(Stack s);
int stack_is_full(Stack s);
int stack_push(Stack s, int e);
int stack_pop(Stack s);
int stack_top(Stack s);

#endif // STACK_H_INCLUDED_SIMPLE
