extern (C) {
    __gshared void * _Dmodule_ref;

    void kernel_main() {
        wchar *vga = cast(wchar *)0xB8000;
        for (int y = 0; y < 25; y++)
            for (int x = 0; x < 80; x++)
                vga[y * 80 + x] = ' ' | 0x700;
        vga[0] = 'H' | 0x700;
        vga[1] = 'e' | 0x700;
        vga[2] = 'l' | 0x700;
        vga[3] = 'l' | 0x700;
        vga[4] = 'o' | 0x700;
        vga[6] = 'W' | 0x700;
        vga[7] = 'o' | 0x700;
        vga[8] = 'r' | 0x700;
        vga[9] = 'l' | 0x700;
        vga[10] = 'd' | 0x700;
    }
}
