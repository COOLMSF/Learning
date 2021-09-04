
/* __x86.get_pc_thunk.bx */
void __x86_get_pc_thunk_bx();

void fun_8048600();

void _init() {
    int32_t ebx1;

    __x86_get_pc_thunk_bx();
    if (*reinterpret_cast<int32_t*>(ebx1 + 0x1a47 - 4)) {
        fun_8048600();
    }
    return;
}

/* __x86.get_pc_thunk.bx */
void __x86_get_pc_thunk_bx() {
    return;
}

int32_t __gmon_start__ = 0x8048606;

void fun_8048600() {
    goto __gmon_start__;
}

/* std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*) */
int32_t _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc = 0x8048646;

int32_t fun_8048640(int32_t a1, int32_t a2) {
    goto _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc;
}

/* std::basic_ostream<char, std::char_traits<char> >& std::endl<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&) */
int32_t _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_ = 0x8048686;

void fun_8048680(int32_t a1, int32_t a2) {
    goto _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_;
}

/* std::basic_istream<char, std::char_traits<char> >& std::operator>><char, std::char_traits<char> >(std::basic_istream<char, std::char_traits<char> >&, char*) */
int32_t _ZStrsIcSt11char_traitsIcEERSt13basic_istreamIT_T0_ES6_PS3_ = 0x8048666;

void fun_8048660(int32_t a1, unsigned char* a2) {
    goto _ZStrsIcSt11char_traitsIcEERSt13basic_istreamIT_T0_ES6_PS3_;
}

/* std::basic_ostream<char, std::char_traits<char> >& std::endl<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&) */
int32_t _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(int32_t a1, int32_t a2);

int32_t deregister_tm_clones() {
    int32_t eax1;
    int32_t v2;
    int32_t eax3;

    eax1 = 3;
    if (!0 || (eax1 = 0, 1)) {
        return eax1;
    } else {
        eax3 = _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(0x804a03c, v2);
        return eax3;
    }
}

int32_t __stack_chk_fail = 0x8048676;

void fun_8048670() {
    goto __stack_chk_fail;
}

/* std::ios_base::Init::Init() */
int32_t _ZNSt8ios_base4InitC1Ev = 0x8048616;

void fun_8048610(int32_t a1) {
    goto _ZNSt8ios_base4InitC1Ev;
}

int32_t __cxa_atexit = 0x80485f6;

void fun_80485f0(int32_t a1, int32_t a2, int32_t a3) {
    goto __cxa_atexit;
}

int32_t setlocale = 0x8048656;

void fun_8048650(int32_t a1, int32_t a2) {
    goto setlocale;
}

int32_t __libc_start_main = 0x8048626;

void fun_8048620(int32_t a1, int32_t a2, void* a3, int32_t a4, int32_t a5, int32_t a6, void** a7, int32_t a8) {
    goto __libc_start_main;
}

void _fini() {
    __x86_get_pc_thunk_bx();
    return;
}

void fun_80485ec() {
    signed char* eax1;
    signed char* eax2;
    signed char al3;
    signed char* eax4;
    signed char* eax5;
    signed char al6;

    *eax1 = reinterpret_cast<signed char>(*eax2 + al3);
    *eax4 = reinterpret_cast<signed char>(*eax5 + al6);
}

int32_t fun_80488fa() {
    int32_t eax1;

    if (!0 || 1) {
        return 0;
    } else {
        eax1 = _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(0x804a03c, 0);
        return eax1;
    }
}

/* completed.6591 */
signed char completed_6591 = 0;

int32_t fun_8048937() {
    int1_t zf1;
    int32_t eax2;

    zf1 = completed_6591 == 0;
    if (zf1) {
        eax2 = deregister_tm_clones();
        completed_6591 = 1;
    }
    return eax2;
}

int32_t __JCR_END__ = 0;

void frame_dummy() {
    int32_t eax1;
    int32_t v2;

    eax1 = __JCR_END__;
    if (!eax1 || 1) {
        goto 0x8048900;
    } else {
        _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(0x8049f08, v2);
        goto 0x8048900;
    }
}

void fun_80489f1() {
    return;
}

int32_t g804a008 = 0;

void fun_8048606() {
    goto g804a008;
}

void fun_80485f6() {
    goto 0x80485e0;
}

void fun_8048646() {
    goto 0x80485e0;
}

void fun_8048686() {
    goto 0x80485e0;
}

void fun_8048666() {
    goto 0x80485e0;
}

int32_t main();

void __libc_csu_init(int32_t a1, int32_t a2, int32_t a3);

void _start() {
    void* esp1;
    int32_t edx2;
    int32_t eax3;

    esp1 = reinterpret_cast<void*>(reinterpret_cast<int32_t>(__zero_stack_offset()) + 4);
    fun_8048620(main, __return_address(), esp1, __libc_csu_init, 0x8048a00, edx2, (reinterpret_cast<uint32_t>(esp1) & 0xfffffff0) - 4 - 4, eax3);
    __asm__("hlt ");
}

void __libc_csu_init(int32_t a1, int32_t a2, int32_t a3) {
    int32_t edi4;
    int32_t ebx5;
    int32_t ebx6;
    int32_t ebp7;
    int32_t esi8;
    int32_t esi9;

    edi4 = 0;
    __x86_get_pc_thunk_bx();
    ebx5 = ebx6 + 0x1665;
    ebp7 = a1;
    _init();
    esi8 = ebx5 - 0xfc - (ebx5 - 0x104) >> 2;
    if (esi8) {
        esi9 = esi8;
        do {
            *reinterpret_cast<int32_t*>(ebx5 + edi4 * 4 - 0x104)(ebp7, a2, a3);
            ++edi4;
        } while (edi4 != esi9);
    }
    return;
}

uint32_t g14;

/* std::ios_base::Init::~Init() */
void _ZNSt8ios_base4InitD1Ev();

int32_t main() {
    void* esp1;
    unsigned char* ebx2;
    uint32_t eax3;
    uint32_t v4;
    void* esp5;
    int32_t ecx6;
    unsigned char* edi7;
    int32_t eax8;
    int32_t eax9;
    unsigned char* eax10;
    uint32_t ecx11;
    unsigned char v12;
    unsigned char* esi13;
    int1_t zf14;
    void* eax15;
    uint32_t edx16;
    unsigned char v17;
    int1_t zf18;
    unsigned char* esi19;
    int32_t ebx20;
    unsigned char* edx21;
    unsigned char* eax22;
    uint32_t ecx23;
    unsigned char v24;
    int32_t ecx25;
    unsigned char* eax26;
    uint32_t edx27;
    unsigned char v28;
    int32_t eax29;
    int32_t v30;
    int32_t eax31;
    uint32_t edi32;

    esp1 = reinterpret_cast<void*>((reinterpret_cast<uint32_t>(reinterpret_cast<int32_t>(__zero_stack_offset()) - 4 - 4 - 4 - 4) & 0xfffffff0) - 0x400);
    ebx2 = reinterpret_cast<unsigned char*>(reinterpret_cast<uint32_t>(esp1) + 20);
    eax3 = g14;
    v4 = eax3;
    fun_8048650(6, ".OCP");
    esp5 = reinterpret_cast<void*>(reinterpret_cast<uint32_t>(esp1) - 4 + 4);
    ecx6 = 0x7d;
    while (ecx6) {
        --ecx6;
    }
    *reinterpret_cast<signed char*>(&ecx6) = 0x7d;
    while (ecx6) {
        --ecx6;
    }
    edi7 = reinterpret_cast<unsigned char*>(reinterpret_cast<uint32_t>(esp5) + 0x208);
    eax8 = fun_8048640(0x804a0e0, "Name:");
    fun_8048680(eax8, "Name:");
    fun_8048660(0x804a040, ebx2);
    eax9 = fun_8048640(0x804a0e0, "Password:");
    fun_8048680(eax9, "Password:");
    fun_8048660(0x804a040, edi7);
    eax10 = ebx2;
    do {
        eax10 = eax10 + 4;
        ecx11 = v12 - 0x1010101 & ~v12 & 0x80808080;
    } while (!ecx11);
    esi13 = edi7;
    zf14 = (ecx11 & 0x8080) == 0;
    if (zf14) {
        ecx11 = ecx11 >> 16;
    }
    if (zf14) {
        eax10 = eax10 + 2;
    }
    eax15 = reinterpret_cast<void*>(reinterpret_cast<uint32_t>(eax10) - (3 + reinterpret_cast<uint1_t>(reinterpret_cast<uint32_t>(eax10) < 3 + reinterpret_cast<uint1_t>(reinterpret_cast<unsigned char>(*reinterpret_cast<unsigned char*>(&ecx11) + *reinterpret_cast<unsigned char*>(&ecx11)) < *reinterpret_cast<unsigned char*>(&ecx11)))) - reinterpret_cast<uint32_t>(ebx2));
    do {
        esi13 = esi13 + 4;
        edx16 = v17 - 0x1010101 & ~v17 & 0x80808080;
    } while (!edx16);
    zf18 = (edx16 & 0x8080) == 0;
    if (zf18) {
        edx16 = edx16 >> 16;
    }
    if (zf18) {
        esi13 = esi13 + 2;
    }
    esi19 = reinterpret_cast<unsigned char*>(reinterpret_cast<uint32_t>(esi13) - (3 + reinterpret_cast<uint1_t>(reinterpret_cast<uint32_t>(esi13) < 3 + reinterpret_cast<uint1_t>(reinterpret_cast<unsigned char>(*reinterpret_cast<unsigned char*>(&edx16) + *reinterpret_cast<unsigned char*>(&edx16)) < *reinterpret_cast<unsigned char*>(&edx16)))) - reinterpret_cast<uint32_t>(edi7));
    if (reinterpret_cast<uint1_t>(reinterpret_cast<int32_t>(eax15) < reinterpret_cast<int32_t>(0)) | reinterpret_cast<uint1_t>(eax15 == 0)) {
        ebx20 = 0;
    } else {
        edx21 = ebx2;
        eax22 = reinterpret_cast<unsigned char*>(reinterpret_cast<uint32_t>(eax15) + reinterpret_cast<uint32_t>(ebx2));
        ebx20 = 0;
        esi19 = esi19;
        do {
            ++edx21;
            ecx23 = static_cast<uint32_t>(v24) ^ 71;
            ebx20 = ebx20 + *reinterpret_cast<signed char*>(&ecx23);
        } while (edx21 != eax22);
    }
    if (reinterpret_cast<uint1_t>(reinterpret_cast<int32_t>(esi19) < reinterpret_cast<int32_t>(0)) | reinterpret_cast<uint1_t>(esi19 == 0)) {
        ecx25 = 0;
    } else {
        eax26 = edi7;
        ecx25 = 0;
        esi19 = reinterpret_cast<unsigned char*>(reinterpret_cast<uint32_t>(esi19) + reinterpret_cast<uint32_t>(edi7));
        do {
            ++eax26;
            edx27 = static_cast<uint32_t>(v28) ^ 66;
            ecx25 = ecx25 + *reinterpret_cast<signed char*>(&edx27);
        } while (eax26 != esi19);
    }
    if (ebx20 == ecx25) {
        eax29 = fun_8048640(0x804a0e0, "Good!");
        v30 = eax29;
        fun_8048680(v30, "Good!");
    } else {
        eax31 = fun_8048640(0x804a0e0, "Bad!");
        v30 = eax31;
        fun_8048680(v30, "Bad!");
    }
    edi32 = v4 ^ g14;
    if (edi32) {
        fun_8048670();
        fun_8048610(0x804a16d);
        fun_80485f0(_ZNSt8ios_base4InitD1Ev, 0x804a16d, 0x804a038);
        goto v30;
    } else {
        return 0;
    }
}

void fun_8048676() {
    goto 0x80485e0;
}

void fun_8048616() {
    goto 0x80485e0;
}

void fun_8048656() {
    goto 0x80485e0;
}

void fun_8048626() {
    goto 0x80485e0;
}

/* std::ios_base::Init::~Init() */
int32_t _ZNSt8ios_base4InitD1Ev = 0x8048636;

/* std::ios_base::Init::~Init() */
void _ZNSt8ios_base4InitD1Ev() {
    goto _ZNSt8ios_base4InitD1Ev;
}

void fun_8048636() {
    goto 0x80485e0;
}
