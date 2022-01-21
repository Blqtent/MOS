;this is the memory stuff
;i know

BASE_OF_HEAP = 0xA000
HEAP_POINTER = [BASE_OF_HEAP]



;initiates the heap
;usage: A = base address
heap_init:
	base_of_heap = [A] ;this is actually ez
	RET


;This is how malloc is implemented
;pointer = base of heap
;
;__________________________
;____________free__________
;^
;this is the pointer right now
;__________________________
;___alloc__|____free_______
;          ^
;The pointer after a malloc();
;so, 
;	function malloc(int amount){
;		int block;
;		let pointer = pointer + amount;
;		let block = pointer;
;	}
;(C-ish psuedo code)


;allocates a block of bytes to something
;input(s): size: B reg
;output(s): location: B reg
malloc:
	CAB ;copies A -> B
	CBA ;copies B -> A
	STA 0XFFFF
	LDA HEAP_POINTER
	ADD 0XFFFF
	RET
