
// WARNING: Could not reconcile some variable overlaps
// WARNING: [r2ghidra] Detected overlap for variable var_324h
// WARNING: [r2ghidra] Failed to match type signed int64_t for variable var_328h to Decompiler type: Unknown type
// identifier signed
// WARNING: [r2ghidra] Detected overlap for variable var_328h
// WARNING: [r2ghidra] Detected overlap for variable var_330h
// WARNING: [r2ghidra] Detected overlap for variable var_8h

undefined8 main(void)
{
    bool bVar1;
    uint32_t uVar2;
    int32_t iVar3;
    undefined8 uVar4;
    uint64_t uVar5;
    char *pcVar6;
    uint64_t uVar7;
    int32_t var_330h;
    int64_t var_32ch;
    int64_t var_320h;
    int64_t var_310h;
    int64_t var_300h;
    int64_t var_2f8h;
    int64_t var_2f0h;
    int64_t var_180h;
    undefined auStack376 [360];
    
    uVar2 = method.std.operator__std::_Ios_Openmode__std::_Ios_Openmode(0x10, 8);
    
    sym.imp.std::basic_stringstream_char__std::char_traits_char___std::allocator_char___::basic_stringstream_std::_Ios_Openmode
              (&var_180h, (uint64_t)uVar2, (uint64_t)uVar2);
    sym.imp.std::basic_string_char__std::char_traits_char___std::allocator_char___::basic_string(&var_320h);
    sym.imp.std::basic_string_char__std::char_traits_char___std::allocator_char___::basic_string(&var_310h);
    while( true ) {
        uVar4 = 
                sym.imp.std::basic_ostream_char__std::char_traits_char_____std::operator____std::char_traits_char____std::basic_ostream_char__std::char_traits_char______char_const
                          (reloc.std::cout, "username:");
        sym.imp.std::ostream::operator___std::ostream______std::ostream
                  (uVar4, 
                   sym.imp.std::basic_ostream_char__std::char_traits_char_____std::endl_char__std::char_traits_char____std::basic_ostream_char__std::char_traits_char
                  );
        
        sym.imp.std::basic_istream_char__std::char_traits_char_____std::getline_char__std::char_traits_char___std::allocator_char____std::basic_istream_char__std::char_traits_char______std::basic_string_char__std::char_traits_char___std::allocator_char
                  (reloc.std::cin, &var_320h);
        uVar5 = sym.imp.std::string::length___const(&var_320h);
        if ((uVar5 < 8) || (uVar5 = sym.imp.std::string::length___const(&var_320h), 0xc < uVar5)) {
            bVar1 = true;
        } else {
            bVar1 = false;
        }
        if (!bVar1) break;
        uVar4 = 
                sym.imp.std::basic_ostream_char__std::char_traits_char_____std::operator____std::char_traits_char____std::basic_ostream_char__std::char_traits_char______char_const
                          (reloc.std::cout, "username must be between 8 and 12!");
        sym.imp.std::ostream::operator___std::ostream______std::ostream
                  (uVar4, 
                   sym.imp.std::basic_ostream_char__std::char_traits_char_____std::endl_char__std::char_traits_char____std::basic_ostream_char__std::char_traits_char
                  );
    }
    uVar4 = 
            sym.imp.std::basic_ostream_char__std::char_traits_char_____std::operator____std::char_traits_char____std::basic_ostream_char__std::char_traits_char______char_const
                      (reloc.std::cout, "serial number:");
    sym.imp.std::ostream::operator___std::ostream______std::ostream
              (uVar4, 
               sym.imp.std::basic_ostream_char__std::char_traits_char_____std::endl_char__std::char_traits_char____std::basic_ostream_char__std::char_traits_char
              );
    sym.imp.std::istream::operator___double(reloc.std::cin, &var_2f8h);
    var_32ch._0_4_ = 0;
    while (uVar7 = SEXT48((int32_t)(uint32_t)var_32ch), uVar5 = sym.imp.std::string::length___const(&var_320h),
          uVar7 < uVar5) {
        if (((uint32_t)var_32ch & 1) == 0) {
            pcVar6 = (char *)sym.imp.std::string::operator___unsigned_long
                                       (&var_320h, (int64_t)(int32_t)(uint32_t)var_32ch, 
                                        (int64_t)(int32_t)(uint32_t)var_32ch);
            uVar2 = sym.imp.tolower((uint64_t)(uint32_t)(int32_t)*pcVar6);
            sym.imp.std::ostream::operator___int(auStack376, (uint64_t)uVar2, auStack376);
        } else {
            pcVar6 = (char *)sym.imp.std::string::operator___unsigned_long
                                       (&var_320h, (int64_t)(int32_t)(uint32_t)var_32ch, 
                                        (int64_t)(int32_t)(uint32_t)var_32ch);
            uVar2 = sym.imp.toupper((uint64_t)(uint32_t)(int32_t)*pcVar6);
            sym.imp.std::ostream::operator___int(auStack376, (uint64_t)uVar2, auStack376);
        }
        var_32ch._0_4_ = (uint32_t)var_32ch + 1;
    }
    
    sym.imp.std::basic_istream_char__std::char_traits_char_____std::operator___char__std::char_traits_char___std::allocator_char____std::basic_istream_char__std::char_traits_char______std::basic_string_char__std::char_traits_char___std::allocator_char
              (&var_180h, &var_310h, &var_310h);
    iVar3 = sym.imp.std::string::length___const(&var_320h);
    sym.imp.std::string::substr_unsigned_long__unsigned_long__const
              (&var_2f0h, &var_310h, (int64_t)((iVar3 + -8) * 2), 0xffffffffffffffff);
    sym.imp.std::string::operator__std::string_const(&var_310h, &var_2f0h, &var_2f0h);
    sym.imp.std::basic_string_char__std::char_traits_char___std::allocator_char___::_basic_string(&var_2f0h);
    sym.imp.std::basic_string_char__std::char_traits_char___std::allocator_char___::basic_string(&var_300h);
    var_32ch._4_4_ = 0;
    while (var_32ch._4_4_ < 8) {
        pcVar6 = (char *)sym.imp.std::string::operator___unsigned_long
                                   (&var_310h, (int64_t)var_32ch._4_4_, (int64_t)var_32ch._4_4_);
        sym.imp.std::string::operator___char
                  (&var_300h, (uint64_t)(uint32_t)(int32_t)*pcVar6, (uint64_t)(uint32_t)(int32_t)*pcVar6);
        var_32ch._4_4_ = var_32ch._4_4_ + 1;
    }
    
    sym.imp.std::basic_istringstream_char__std::char_traits_char___std::allocator_char___::basic_istringstream_std::string_const___std::_Ios_Openmode
              (&var_2f0h, &var_300h, 8, &var_300h);
    sym.imp.std::istream::operator___int(&var_2f0h, &var_330h, &var_330h);
    if ((double)var_330h == (double)var_2f8h) {
        uVar4 = 
                sym.imp.std::basic_ostream_char__std::char_traits_char_____std::operator____std::char_traits_char____std::basic_ostream_char__std::char_traits_char______char_const
                          (reloc.std::cout, "s/n OK!");
        sym.imp.std::ostream::operator___std::ostream______std::ostream
                  (uVar4, 
                   sym.imp.std::basic_ostream_char__std::char_traits_char_____std::endl_char__std::char_traits_char____std::basic_ostream_char__std::char_traits_char
                  );
    } else {
        uVar4 = 
                sym.imp.std::basic_ostream_char__std::char_traits_char_____std::operator____std::char_traits_char____std::basic_ostream_char__std::char_traits_char______char_const
                          (reloc.std::cout, "s/n WRONG!");
        sym.imp.std::ostream::operator___std::ostream______std::ostream
                  (uVar4, 
                   sym.imp.std::basic_ostream_char__std::char_traits_char_____std::endl_char__std::char_traits_char____std::basic_ostream_char__std::char_traits_char
                  );
    }
    sym.imp.std::basic_istringstream_char__std::char_traits_char___std::allocator_char___::_basic_istringstream
              (&var_2f0h);
    sym.imp.std::basic_string_char__std::char_traits_char___std::allocator_char___::_basic_string(&var_300h);
    sym.imp.std::basic_string_char__std::char_traits_char___std::allocator_char___::_basic_string(&var_310h);
    sym.imp.std::basic_string_char__std::char_traits_char___std::allocator_char___::_basic_string(&var_320h);
    sym.imp.std::basic_stringstream_char__std::char_traits_char___std::allocator_char___::_basic_stringstream(&var_180h)
    ;
    return 0;
}
