#ifndef __FIFO_H__
#define __FIFO_H__

long StartCritical(void);
void EndCritical(long sr);

// macro to create an index FIFO
#define AddIndexFifo(NAME,SIZE,TYPE,SUCCESS,FAIL) 					\
uint32_t volatile NAME ## PutI;    													\
uint32_t volatile NAME ## GetI;   		 											\
TYPE static NAME ## Fifo [SIZE];        										\
void NAME ## Fifo_Init(void)																\
{ 																													\
	long sr;  																								\
  sr = StartCritical();                 										\
  NAME ## PutI = NAME ## GetI = 0;      										\
  EndCritical(sr);                      										\
}                                       										\
int NAME ## Fifo_Put (TYPE data)														\
{       																										\
  if(( NAME ## PutI - NAME ## GetI ) & ~(SIZE-1))						\
	{  																												\
    return(FAIL);      																			\
  }                    																			\
  NAME ## Fifo[ NAME ## PutI &(SIZE-1)] = data; 						\
  NAME ## PutI ## ++;  																			\
  return(SUCCESS);    													 						\
}                      																			\
int NAME ## Fifo_Get (TYPE *datapt)													\
{  																													\
  if( NAME ## PutI == NAME ## GetI )												\
	{ 																												\
    return(FAIL);      																			\
  }                    																			\
  *datapt = NAME ## Fifo[ NAME ## GetI &(SIZE-1)];					\
  NAME ## GetI ## ++;  																			\
  return(SUCCESS);     																			\
}                      																			\
unsigned short NAME ## Fifo_Size (void)											\
{  																													\
 return ((unsigned short)( NAME ## PutI - NAME ## GetI ));  \
}																														
// e.g.,
// AddIndexFifo(Tx,32,unsigned char, 1,0)
// SIZE must be a power of two
// creates TxFifo_Init() TxFifo_Get() and TxFifo_Put()

#endif //  __FIFO_H__
