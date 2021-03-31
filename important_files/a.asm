TEST   EAX, EAX   ;  Triger EFLAGS [CF, OF, PF, SF, and ZF]
JNS AbsResult     ;  If (SF) is off, jmp AbsResult
NEG    EAX        ;  If (SF) is on. (negation nullify by this opcode)
AbsResult:
