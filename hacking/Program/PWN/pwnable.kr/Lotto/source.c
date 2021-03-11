
// WARNING: Could not reconcile some variable overlaps
// WARNING: [r2ghidra] Failed to match type ssize_t for variable var_18h to Decompiler type: Unknown type identifier
// ssize_t
// WARNING: [r2ghidra] Failed to match type signed int64_t for variable var_24h to Decompiler type: Unknown type
// identifier signed
// WARNING: [r2ghidra] Detected overlap for variable fildes
// WARNING: [r2ghidra] Detected overlap for variable var_20h
// WARNING: [r2ghidra] Detected overlap for variable var_1ch

void sym.play(void)
{
    uint8_t uVar1;
    char cVar2;
    int32_t iVar3;
    int32_t iVar4;
    int64_t in_FS_OFFSET;
    undefined8 var_24h;
    int32_t var_1ch;
    undefined8 var_18h;
    void *buf;
    int64_t canary;
    
    canary = *(int64_t *)(in_FS_OFFSET + 0x28);
    sym.imp.printf("Submit your 6 lotto bytes : ");
    sym.imp.fflush(_reloc.stdout);
    sym.imp.read(0, obj.submit, 6);
    sym.imp.puts("Lotto Start!");
    iVar3 = sym.imp.open("/dev/urandom", 0);
    if (iVar3 == -1) {
        sym.imp.puts("error. tell admin");
        sym.imp.exit(0xffffffff);
    }
    iVar4 = sym.imp.read(iVar3, &buf, 6);
    if (iVar4 != 6) {
        sym.imp.puts("error2. tell admin");
        sym.imp.exit(0xffffffff);
    }
    var_24h._0_4_ = 0;
    while ((int32_t)var_24h < 6) {
        uVar1 = *(uint8_t *)((int64_t)&buf + (int64_t)(int32_t)var_24h);
        cVar2 = (char)((uint16_t)((uint16_t)uVar1 * 0x6c + (uint16_t)uVar1) >> 8);
        *(uint8_t *)((int64_t)&buf + (int64_t)(int32_t)var_24h) =
             uVar1 + ((uint8_t)(cVar2 + ((uint8_t)(uVar1 - cVar2) >> 1)) >> 5) * -0x2d + '\x01';
        var_24h._0_4_ = (int32_t)var_24h + 1;
    }
    sym.imp.close(iVar3);
    var_24h._4_4_ = 0;
    var_24h._0_4_ = 0;
    while ((int32_t)var_24h < 6) {
        var_1ch = 0;
        while (var_1ch < 6) {
            if (*(code *)((int64_t)&buf + (int64_t)(int32_t)var_24h) == obj.submit[var_1ch]) {
                var_24h._4_4_ = var_24h._4_4_ + 1;
            }
            var_1ch = var_1ch + 1;
        }
        var_24h._0_4_ = (int32_t)var_24h + 1;
    }
    if (var_24h._4_4_ == 6) {
        sym.imp.system("/bin/[7mcat[27m flag");
    } else {
        sym.imp.puts("bad luck...");
    }
    if (canary != *(int64_t *)(in_FS_OFFSET + 0x28)) {
        sym.imp.__stack_chk_fail();
    }
    return;
}
