extern (C) {
    ubyte inb(ushort port);
    void outb(ushort port, ubyte val);
}

void putchar(ubyte c) {
    while((inb(0x3f8 + 5) & 0x20) == 0) {
    }
    outb(0x3f8 + 0, c);
}

extern (C) {
    __gshared void * _Dmodule_ref;

    void kernel_main() {
        putchar('H');
        putchar('e');
        putchar('l');
        putchar('l');
        putchar('o');
    }
}
