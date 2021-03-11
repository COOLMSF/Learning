
cobj.out:     file format elf32-i386


Disassembly of section .text:

00280000 <bootmain>:

//extern struct KEYBUF keybuf;
extern struct FIFO8 keyfifo;
extern struct FIFO8 mousefifo;

void bootmain(void){
  280000:	55                   	push   %ebp
  280001:	89 e5                	mov    %esp,%ebp
  280003:	57                   	push   %edi
  280004:	56                   	push   %esi
  280005:	53                   	push   %ebx
  280006:	e8 5a 11 00 00       	call   281165 <__x86.get_pc_thunk.bx>
  28000b:	81 c3 c5 32 00 00    	add    $0x32c5,%ebx
  280011:	81 ec 0c 02 00 00    	sub    $0x20c,%esp
	int mx, my, i;
	unsigned int memtotal;
	struct MOUSE_DEC mdec;
	struct MEMMAN *memman = (struct MEMMAN*)MEMMAN_ADDR;

	init_gdtidt();
  280017:	e8 35 0b 00 00       	call   280b51 <init_gdtidt>
	init_pic();
  28001c:	e8 55 0c 00 00       	call   280c76 <init_pic>
	io_sti();
  280021:	fb                   	sti    

	fifo8_init(&keyfifo, 32, keybuf);
  280022:	50                   	push   %eax
  280023:	8d 85 20 fe ff ff    	lea    -0x1e0(%ebp),%eax
  280029:	50                   	push   %eax
  28002a:	c7 c0 f8 32 28 00    	mov    $0x2832f8,%eax
  280030:	6a 20                	push   $0x20
  280032:	50                   	push   %eax
  280033:	89 85 00 fe ff ff    	mov    %eax,-0x200(%ebp)
  280039:	e8 5d 0d 00 00       	call   280d9b <fifo8_init>
	fifo8_init(&mousefifo, 128, mousebuf);
  28003e:	83 c4 0c             	add    $0xc,%esp
  280041:	8d 85 68 fe ff ff    	lea    -0x198(%ebp),%eax
  280047:	50                   	push   %eax
  280048:	c7 c0 e0 32 28 00    	mov    $0x2832e0,%eax
  28004e:	68 80 00 00 00       	push   $0x80
  280053:	50                   	push   %eax
  280054:	89 85 f8 fd ff ff    	mov    %eax,-0x208(%ebp)
  28005a:	e8 3c 0d 00 00       	call   280d9b <fifo8_init>

// out:write a data to a port
static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
  28005f:	b0 f9                	mov    $0xf9,%al
  280061:	ba 21 00 00 00       	mov    $0x21,%edx
  280066:	ee                   	out    %al,(%dx)
  280067:	b0 ef                	mov    $0xef,%al
  280069:	ba a1 00 00 00       	mov    $0xa1,%edx
  28006e:	ee                   	out    %al,(%dx)
	outb(PIC0_IMR, 0xf9);
	outb(PIC1_IMR, 0xef);

	init_keyboard();
  28006f:	e8 df 0d 00 00       	call   280e53 <init_keyboard>
	enable_mouse(&mdec);
  280074:	8d 85 10 fe ff ff    	lea    -0x1f0(%ebp),%eax
  28007a:	89 04 24             	mov    %eax,(%esp)
  28007d:	e8 f3 0d 00 00       	call   280e75 <enable_mouse>
	memtotal = memtest(0x00400000, 0xbfffffff);
  280082:	58                   	pop    %eax
  280083:	5a                   	pop    %edx
  280084:	68 ff ff ff bf       	push   $0xbfffffff
  280089:	68 00 00 40 00       	push   $0x400000
  28008e:	e8 0b 0f 00 00       	call   280f9e <memtest>
	memman_init(memman);
  280093:	c7 04 24 00 00 3c 00 	movl   $0x3c0000,(%esp)
	memtotal = memtest(0x00400000, 0xbfffffff);
  28009a:	89 c6                	mov    %eax,%esi
	memman_init(memman);
  28009c:	e8 50 0f 00 00       	call   280ff1 <memman_init>
	memman_free(memman, 0x00001000, 0x0009e000);
  2800a1:	83 c4 0c             	add    $0xc,%esp
  2800a4:	68 00 e0 09 00       	push   $0x9e000
  2800a9:	68 00 10 00 00       	push   $0x1000
  2800ae:	68 00 00 3c 00       	push   $0x3c0000
  2800b3:	e8 d8 0f 00 00       	call   281090 <memman_free>
	memman_free(memman, 0x00400000, memtotal - 0x00400000);
  2800b8:	83 c4 0c             	add    $0xc,%esp
  2800bb:	8d 86 00 00 c0 ff    	lea    -0x400000(%esi),%eax
	putblock8_8(binfo->vram, binfo->scrnx, 16, 16, mx, my, mcursor, 16);
//	sprintf(s, "(%d, %d)", mx, my);
	sprintf(s, "(%d,%d)", mx, my);
	putfonts8_asc(binfo->vram, binfo->scrnx, 0, 0, COL8_FFFFFF, s);

	sprintf(s, "memory %dMB free: %dKB", memtotal/(1024*1024), memman_total(memman)/1024);
  2800c1:	c1 ee 14             	shr    $0x14,%esi
	memman_free(memman, 0x00400000, memtotal - 0x00400000);
  2800c4:	50                   	push   %eax
  2800c5:	68 00 00 40 00       	push   $0x400000
  2800ca:	68 00 00 3c 00       	push   $0x3c0000
  2800cf:	e8 bc 0f 00 00       	call   281090 <memman_free>
	init_palette();
  2800d4:	e8 51 04 00 00       	call   28052a <init_palette>
	init_screen8(binfo->vram, binfo->scrnx, binfo->scrny);
  2800d9:	0f bf 05 f6 0f 00 00 	movswl 0xff6,%eax
  2800e0:	83 c4 0c             	add    $0xc,%esp
  2800e3:	50                   	push   %eax
  2800e4:	0f bf 05 f4 0f 00 00 	movswl 0xff4,%eax
  2800eb:	50                   	push   %eax
  2800ec:	ff 35 f8 0f 00 00    	push   0xff8
  2800f2:	e8 8e 04 00 00       	call   280585 <init_screen8>
	mx=(binfo->scrnx - 16) / 2;
  2800f7:	0f bf 05 f4 0f 00 00 	movswl 0xff4,%eax
  2800fe:	b9 02 00 00 00       	mov    $0x2,%ecx
  280103:	83 e8 10             	sub    $0x10,%eax
  280106:	99                   	cltd   
  280107:	f7 f9                	idiv   %ecx
  280109:	89 c7                	mov    %eax,%edi
	my = (binfo->scrny - 28 - 16) / 2;
  28010b:	0f bf 05 f6 0f 00 00 	movswl 0xff6,%eax
  280112:	83 e8 2c             	sub    $0x2c,%eax
  280115:	99                   	cltd   
  280116:	f7 f9                	idiv   %ecx
	init_mouse_cursor8(mcursor, COL8_008484);
  280118:	59                   	pop    %ecx
	my = (binfo->scrny - 28 - 16) / 2;
  280119:	89 85 04 fe ff ff    	mov    %eax,-0x1fc(%ebp)
	init_mouse_cursor8(mcursor, COL8_008484);
  28011f:	58                   	pop    %eax
  280120:	8d 85 e8 fe ff ff    	lea    -0x118(%ebp),%eax
  280126:	6a 0e                	push   $0xe
  280128:	50                   	push   %eax
  280129:	89 85 fc fd ff ff    	mov    %eax,-0x204(%ebp)
  28012f:	e8 82 06 00 00       	call   2807b6 <init_mouse_cursor8>
	putblock8_8(binfo->vram, binfo->scrnx, 16, 16, mx, my, mcursor, 16);
  280134:	8b 85 fc fd ff ff    	mov    -0x204(%ebp),%eax
  28013a:	6a 10                	push   $0x10
  28013c:	50                   	push   %eax
  28013d:	0f bf 05 f4 0f 00 00 	movswl 0xff4,%eax
  280144:	ff b5 04 fe ff ff    	push   -0x1fc(%ebp)
  28014a:	57                   	push   %edi
  28014b:	6a 10                	push   $0x10
  28014d:	6a 10                	push   $0x10
  28014f:	50                   	push   %eax
  280150:	ff 35 f8 0f 00 00    	push   0xff8
  280156:	e8 bd 06 00 00       	call   280818 <putblock8_8>
	sprintf(s, "(%d,%d)", mx, my);
  28015b:	83 c4 30             	add    $0x30,%esp
  28015e:	8d 83 b0 df ff ff    	lea    -0x2050(%ebx),%eax
  280164:	ff b5 04 fe ff ff    	push   -0x1fc(%ebp)
  28016a:	89 85 f4 fd ff ff    	mov    %eax,-0x20c(%ebp)
  280170:	57                   	push   %edi
  280171:	50                   	push   %eax
  280172:	8d 85 40 fe ff ff    	lea    -0x1c0(%ebp),%eax
  280178:	50                   	push   %eax
  280179:	89 85 fc fd ff ff    	mov    %eax,-0x204(%ebp)
  28017f:	e8 6b 08 00 00       	call   2809ef <sprintf>
	putfonts8_asc(binfo->vram, binfo->scrnx, 0, 0, COL8_FFFFFF, s);
  280184:	58                   	pop    %eax
  280185:	0f bf 05 f4 0f 00 00 	movswl 0xff4,%eax
  28018c:	5a                   	pop    %edx
  28018d:	ff b5 fc fd ff ff    	push   -0x204(%ebp)
  280193:	6a 07                	push   $0x7
  280195:	6a 00                	push   $0x0
  280197:	6a 00                	push   $0x0
  280199:	50                   	push   %eax
  28019a:	ff 35 f8 0f 00 00    	push   0xff8
  2801a0:	e8 bc 05 00 00       	call   280761 <putfonts8_asc>
	sprintf(s, "memory %dMB free: %dKB", memtotal/(1024*1024), memman_total(memman)/1024);
  2801a5:	83 c4 14             	add    $0x14,%esp
  2801a8:	68 00 00 3c 00       	push   $0x3c0000
  2801ad:	e8 62 0e 00 00       	call   281014 <memman_total>
  2801b2:	c1 e8 0a             	shr    $0xa,%eax
  2801b5:	50                   	push   %eax
  2801b6:	8d 83 b8 df ff ff    	lea    -0x2048(%ebx),%eax
  2801bc:	56                   	push   %esi
  2801bd:	50                   	push   %eax
  2801be:	ff b5 fc fd ff ff    	push   -0x204(%ebp)
  2801c4:	e8 26 08 00 00       	call   2809ef <sprintf>
	putfonts8_asc(binfo->vram, binfo->scrnx, 0, 32, COL8_FFFFFF, s);
  2801c9:	83 c4 18             	add    $0x18,%esp
  2801cc:	ff b5 fc fd ff ff    	push   -0x204(%ebp)
  2801d2:	0f bf 05 f4 0f 00 00 	movswl 0xff4,%eax
  2801d9:	6a 07                	push   $0x7
  2801db:	6a 20                	push   $0x20
  2801dd:	6a 00                	push   $0x0
  2801df:	50                   	push   %eax
  2801e0:	ff 35 f8 0f 00 00    	push   0xff8
  2801e6:	e8 76 05 00 00       	call   280761 <putfonts8_asc>
  2801eb:	83 c4 20             	add    $0x20,%esp

//	unsigned char mouse_dbuf[3], mouse_phase;
//	mouse_phase=0;

	for(;;){
		io_cli();
  2801ee:	fa                   	cli    
		if(fifo8_status(&keyfifo)+fifo8_status(&mousefifo)==0){
  2801ef:	83 ec 0c             	sub    $0xc,%esp
  2801f2:	ff b5 00 fe ff ff    	push   -0x200(%ebp)
  2801f8:	e8 3d 0c 00 00       	call   280e3a <fifo8_status>
  2801fd:	89 c6                	mov    %eax,%esi
  2801ff:	58                   	pop    %eax
  280200:	ff b5 f8 fd ff ff    	push   -0x208(%ebp)
  280206:	e8 2f 0c 00 00       	call   280e3a <fifo8_status>
  28020b:	83 c4 10             	add    $0x10,%esp
  28020e:	01 c6                	add    %eax,%esi
  280210:	75 07                	jne    280219 <bootmain+0x219>
			io_sti();
  280212:	fb                   	sti    
	__asm __volatile("hlt");
  280213:	f4                   	hlt    
}
  280214:	e9 71 02 00 00       	jmp    28048a <bootmain+0x48a>
			io_hlt();
		}else{
			if(fifo8_status(&keyfifo)!=0){
  280219:	83 ec 0c             	sub    $0xc,%esp
  28021c:	ff b5 00 fe ff ff    	push   -0x200(%ebp)
  280222:	e8 13 0c 00 00       	call   280e3a <fifo8_status>
  280227:	83 c4 10             	add    $0x10,%esp
  28022a:	85 c0                	test   %eax,%eax
  28022c:	0f 84 84 00 00 00    	je     2802b6 <bootmain+0x2b6>
				boxfill8(binfo->vram, binfo->scrnx, COL8_840000, 0, 16, 31, 31);//chriszz添加。刷字符区域为蓝色。
  280232:	56                   	push   %esi
  280233:	0f bf 05 f4 0f 00 00 	movswl 0xff4,%eax
  28023a:	6a 1f                	push   $0x1f
  28023c:	6a 1f                	push   $0x1f
  28023e:	6a 10                	push   $0x10
  280240:	6a 00                	push   $0x0
  280242:	6a 09                	push   $0x9
  280244:	50                   	push   %eax
  280245:	ff 35 f8 0f 00 00    	push   0xff8
  28024b:	e8 ff 02 00 00       	call   28054f <boxfill8>
				i=fifo8_get(&keyfifo);
  280250:	83 c4 14             	add    $0x14,%esp
  280253:	ff b5 00 fe ff ff    	push   -0x200(%ebp)
  280259:	e8 a6 0b 00 00       	call   280e04 <fifo8_get>
				io_sti();
  28025e:	fb                   	sti    
				sprintf(s, "%x", i);
  28025f:	83 c4 0c             	add    $0xc,%esp
  280262:	8d b5 40 fe ff ff    	lea    -0x1c0(%ebp),%esi
  280268:	50                   	push   %eax
  280269:	8d 83 f1 df ff ff    	lea    -0x200f(%ebx),%eax
  28026f:	50                   	push   %eax
  280270:	56                   	push   %esi
  280271:	e8 79 07 00 00       	call   2809ef <sprintf>
				boxfill8(binfo->vram, binfo->scrnx, COL8_840000, 0, 16, 31, 31);
  280276:	0f bf 05 f4 0f 00 00 	movswl 0xff4,%eax
  28027d:	83 c4 0c             	add    $0xc,%esp
  280280:	6a 1f                	push   $0x1f
  280282:	6a 1f                	push   $0x1f
  280284:	6a 10                	push   $0x10
  280286:	6a 00                	push   $0x0
  280288:	6a 09                	push   $0x9
  28028a:	50                   	push   %eax
  28028b:	ff 35 f8 0f 00 00    	push   0xff8
  280291:	e8 b9 02 00 00       	call   28054f <boxfill8>
				putfonts8_asc(binfo->vram, binfo->scrnx, 0, 16, COL8_FFFFFF, s);
  280296:	0f bf 05 f4 0f 00 00 	movswl 0xff4,%eax
  28029d:	83 c4 18             	add    $0x18,%esp
  2802a0:	56                   	push   %esi
  2802a1:	6a 07                	push   $0x7
  2802a3:	6a 10                	push   $0x10
  2802a5:	6a 00                	push   $0x0
  2802a7:	50                   	push   %eax
  2802a8:	ff 35 f8 0f 00 00    	push   0xff8
  2802ae:	e8 ae 04 00 00       	call   280761 <putfonts8_asc>
  2802b3:	83 c4 20             	add    $0x20,%esp
			}
			if(fifo8_status(&mousefifo)!=0){
  2802b6:	c7 c6 e0 32 28 00    	mov    $0x2832e0,%esi
  2802bc:	83 ec 0c             	sub    $0xc,%esp
  2802bf:	56                   	push   %esi
  2802c0:	e8 75 0b 00 00       	call   280e3a <fifo8_status>
  2802c5:	83 c4 10             	add    $0x10,%esp
  2802c8:	85 c0                	test   %eax,%eax
  2802ca:	0f 84 ba 01 00 00    	je     28048a <bootmain+0x48a>
				//boxfill8(binfo->vram, binfo->scrnx, COL8_000084, 32, 16, 64, 31);//chriszz添加。刷字符区域为蓝色。
				i=fifo8_get(&mousefifo);
  2802d0:	83 ec 0c             	sub    $0xc,%esp
  2802d3:	56                   	push   %esi
  2802d4:	e8 2b 0b 00 00       	call   280e04 <fifo8_get>
				io_sti();
  2802d9:	fb                   	sti    
				if(mouse_decode(&mdec, i)!=0){
  2802da:	0f b6 c0             	movzbl %al,%eax
  2802dd:	5a                   	pop    %edx
  2802de:	59                   	pop    %ecx
  2802df:	50                   	push   %eax
  2802e0:	8d 85 10 fe ff ff    	lea    -0x1f0(%ebp),%eax
  2802e6:	50                   	push   %eax
  2802e7:	e8 b2 0b 00 00       	call   280e9e <mouse_decode>
  2802ec:	83 c4 10             	add    $0x10,%esp
  2802ef:	85 c0                	test   %eax,%eax
  2802f1:	0f 84 93 01 00 00    	je     28048a <bootmain+0x48a>
					sprintf(s, "[lmr %d %d]", mdec.buf[1], mdec.buf[2]);
  2802f7:	0f b6 85 12 fe ff ff 	movzbl -0x1ee(%ebp),%eax
  2802fe:	8d b5 40 fe ff ff    	lea    -0x1c0(%ebp),%esi
  280304:	50                   	push   %eax
  280305:	0f b6 85 11 fe ff ff 	movzbl -0x1ef(%ebp),%eax
  28030c:	50                   	push   %eax
  28030d:	8d 83 cf df ff ff    	lea    -0x2031(%ebx),%eax
  280313:	50                   	push   %eax
  280314:	56                   	push   %esi
  280315:	e8 d5 06 00 00       	call   2809ef <sprintf>
					switch(mdec.btn){		//用switch替代if语句块。&的做法似乎有问题。
  28031a:	8b 85 1c fe ff ff    	mov    -0x1e4(%ebp),%eax
  280320:	83 c4 10             	add    $0x10,%esp
  280323:	83 f8 02             	cmp    $0x2,%eax
  280326:	74 11                	je     280339 <bootmain+0x339>
  280328:	83 f8 04             	cmp    $0x4,%eax
  28032b:	74 15                	je     280342 <bootmain+0x342>
  28032d:	48                   	dec    %eax
  28032e:	75 19                	jne    280349 <bootmain+0x349>
						case 1:s[1]='L';break;
  280330:	c6 85 41 fe ff ff 4c 	movb   $0x4c,-0x1bf(%ebp)
  280337:	eb 10                	jmp    280349 <bootmain+0x349>
						case 2:s[3]='R';break;
  280339:	c6 85 43 fe ff ff 52 	movb   $0x52,-0x1bd(%ebp)
  280340:	eb 07                	jmp    280349 <bootmain+0x349>
						case 4:s[2]='M';break;
  280342:	c6 85 42 fe ff ff 4d 	movb   $0x4d,-0x1be(%ebp)
					}
					boxfill8(binfo->vram, binfo->scrnx, COL8_008484, 32, 16, 150, 31);
  280349:	50                   	push   %eax
  28034a:	0f bf 05 f4 0f 00 00 	movswl 0xff4,%eax
  280351:	6a 1f                	push   $0x1f
  280353:	68 96 00 00 00       	push   $0x96
  280358:	6a 10                	push   $0x10
  28035a:	6a 20                	push   $0x20
  28035c:	6a 0e                	push   $0xe
  28035e:	50                   	push   %eax
  28035f:	ff 35 f8 0f 00 00    	push   0xff8
  280365:	e8 e5 01 00 00       	call   28054f <boxfill8>
					putfonts8_asc(binfo->vram, binfo->scrnx, 32, 16, COL8_FFFFFF, s);
  28036a:	0f bf 05 f4 0f 00 00 	movswl 0xff4,%eax
  280371:	83 c4 18             	add    $0x18,%esp
  280374:	56                   	push   %esi
  280375:	6a 07                	push   $0x7
  280377:	6a 10                	push   $0x10
  280379:	6a 20                	push   $0x20
  28037b:	50                   	push   %eax
  28037c:	ff 35 f8 0f 00 00    	push   0xff8
  280382:	e8 da 03 00 00       	call   280761 <putfonts8_asc>

					boxfill8(binfo->vram, binfo->scrnx, COL8_008484, mx, my, mx+15, my+15);//刷[原]鼠标位置
  280387:	8b 85 04 fe ff ff    	mov    -0x1fc(%ebp),%eax
  28038d:	83 c4 1c             	add    $0x1c,%esp
  280390:	83 c0 0f             	add    $0xf,%eax
  280393:	50                   	push   %eax
  280394:	8d 47 0f             	lea    0xf(%edi),%eax
  280397:	50                   	push   %eax
  280398:	0f bf 05 f4 0f 00 00 	movswl 0xff4,%eax
  28039f:	ff b5 04 fe ff ff    	push   -0x1fc(%ebp)
  2803a5:	57                   	push   %edi
  2803a6:	6a 0e                	push   $0xe
  2803a8:	50                   	push   %eax
  2803a9:	ff 35 f8 0f 00 00    	push   0xff8
  2803af:	e8 9b 01 00 00       	call   28054f <boxfill8>
  2803b4:	31 d2                	xor    %edx,%edx
  2803b6:	89 f8                	mov    %edi,%eax
  2803b8:	83 c4 20             	add    $0x20,%esp
  2803bb:	03 85 14 fe ff ff    	add    -0x1ec(%ebp),%eax
  2803c1:	0f 48 c2             	cmovs  %edx,%eax
  2803c4:	89 c7                	mov    %eax,%edi
  2803c6:	8b 85 04 fe ff ff    	mov    -0x1fc(%ebp),%eax
  2803cc:	03 85 18 fe ff ff    	add    -0x1e8(%ebp),%eax
  2803d2:	0f 49 d0             	cmovns %eax,%edx
					mx += mdec.x;
					my += mdec.y;
					if(mx<0) mx=0;
					if(my<0) my=0;
					if(mx>binfo->scrnx-16) mx=binfo->scrnx-16;
  2803d5:	0f bf 05 f4 0f 00 00 	movswl 0xff4,%eax
  2803dc:	89 95 04 fe ff ff    	mov    %edx,-0x1fc(%ebp)
  2803e2:	8d 50 f1             	lea    -0xf(%eax),%edx
  2803e5:	39 fa                	cmp    %edi,%edx
  2803e7:	7f 03                	jg     2803ec <bootmain+0x3ec>
  2803e9:	8d 78 f0             	lea    -0x10(%eax),%edi
					if(my>binfo->scrny-16) my=binfo->scrny-16;
  2803ec:	0f bf 05 f6 0f 00 00 	movswl 0xff6,%eax
  2803f3:	8d 50 f1             	lea    -0xf(%eax),%edx
  2803f6:	39 95 04 fe ff ff    	cmp    %edx,-0x1fc(%ebp)
  2803fc:	7c 09                	jl     280407 <bootmain+0x407>
  2803fe:	83 e8 10             	sub    $0x10,%eax
  280401:	89 85 04 fe ff ff    	mov    %eax,-0x1fc(%ebp)
					sprintf(s, "(%d,%d)", mx, my);
  280407:	8d b5 40 fe ff ff    	lea    -0x1c0(%ebp),%esi
  28040d:	ff b5 04 fe ff ff    	push   -0x1fc(%ebp)
  280413:	57                   	push   %edi
  280414:	ff b5 f4 fd ff ff    	push   -0x20c(%ebp)
  28041a:	56                   	push   %esi
  28041b:	e8 cf 05 00 00       	call   2809ef <sprintf>
					boxfill8(binfo->vram, binfo->scrnx, COL8_008484, 0, 0, 79, 15);
  280420:	0f bf 05 f4 0f 00 00 	movswl 0xff4,%eax
  280427:	83 c4 0c             	add    $0xc,%esp
  28042a:	6a 0f                	push   $0xf
  28042c:	6a 4f                	push   $0x4f
  28042e:	6a 00                	push   $0x0
  280430:	6a 00                	push   $0x0
  280432:	6a 0e                	push   $0xe
  280434:	50                   	push   %eax
  280435:	ff 35 f8 0f 00 00    	push   0xff8
  28043b:	e8 0f 01 00 00       	call   28054f <boxfill8>
					putfonts8_asc(binfo->vram, binfo->scrnx, 0, 0, COL8_FFFFFF, s);
  280440:	0f bf 05 f4 0f 00 00 	movswl 0xff4,%eax
  280447:	83 c4 18             	add    $0x18,%esp
  28044a:	56                   	push   %esi
  28044b:	6a 07                	push   $0x7
  28044d:	6a 00                	push   $0x0
  28044f:	6a 00                	push   $0x0
  280451:	50                   	push   %eax
  280452:	ff 35 f8 0f 00 00    	push   0xff8
  280458:	e8 04 03 00 00       	call   280761 <putfonts8_asc>
					putblock8_8(binfo->vram, binfo->scrnx, 16, 16, mx, my, mcursor, 16);//刷[新]鼠标位置
  28045d:	83 c4 20             	add    $0x20,%esp
  280460:	8d 85 e8 fe ff ff    	lea    -0x118(%ebp),%eax
  280466:	6a 10                	push   $0x10
  280468:	50                   	push   %eax
  280469:	0f bf 05 f4 0f 00 00 	movswl 0xff4,%eax
  280470:	ff b5 04 fe ff ff    	push   -0x1fc(%ebp)
  280476:	57                   	push   %edi
  280477:	6a 10                	push   $0x10
  280479:	6a 10                	push   $0x10
  28047b:	50                   	push   %eax
  28047c:	ff 35 f8 0f 00 00    	push   0xff8
  280482:	e8 91 03 00 00       	call   280818 <putblock8_8>
  280487:	83 c4 20             	add    $0x20,%esp
				}
			}
		}
		i=memtest(0x00400000, 0xbfffffff)/(1024 * 1024);
  28048a:	50                   	push   %eax
		sprintf(s, "memory %dMB", i);
  28048b:	8d b5 40 fe ff ff    	lea    -0x1c0(%ebp),%esi
		i=memtest(0x00400000, 0xbfffffff)/(1024 * 1024);
  280491:	50                   	push   %eax
  280492:	68 ff ff ff bf       	push   $0xbfffffff
  280497:	68 00 00 40 00       	push   $0x400000
  28049c:	e8 fd 0a 00 00       	call   280f9e <memtest>
		sprintf(s, "memory %dMB", i);
  2804a1:	83 c4 0c             	add    $0xc,%esp
		i=memtest(0x00400000, 0xbfffffff)/(1024 * 1024);
  2804a4:	c1 e8 14             	shr    $0x14,%eax
		sprintf(s, "memory %dMB", i);
  2804a7:	50                   	push   %eax
  2804a8:	8d 83 db df ff ff    	lea    -0x2025(%ebx),%eax
  2804ae:	50                   	push   %eax
  2804af:	56                   	push   %esi
  2804b0:	e8 3a 05 00 00       	call   2809ef <sprintf>
		putfonts8_asc(binfo->vram, binfo->scrnx, 0, 32, COL8_FFFFFF, s);
  2804b5:	5a                   	pop    %edx
  2804b6:	59                   	pop    %ecx
  2804b7:	56                   	push   %esi
  2804b8:	e9 15 fd ff ff       	jmp    2801d2 <bootmain+0x1d2>

002804bd <clear_screen>:
#include<header.h>


void clear_screen(char color) //15:pure white
{
  2804bd:	55                   	push   %ebp
	int i;
	for(i=0xa0000;i<0xaffff;i++)
  2804be:	b8 00 00 0a 00       	mov    $0xa0000,%eax
{
  2804c3:	89 e5                	mov    %esp,%ebp
  2804c5:	8a 55 08             	mov    0x8(%ebp),%dl
	{
		write_mem8(i,color);  //if we write 15 ,all pixels color will be white,15 mens pure white ,so the screen changes into white
  2804c8:	88 10                	mov    %dl,(%eax)
	for(i=0xa0000;i<0xaffff;i++)
  2804ca:	40                   	inc    %eax
  2804cb:	3d ff ff 0a 00       	cmp    $0xaffff,%eax
  2804d0:	75 f6                	jne    2804c8 <clear_screen+0xb>

	}
}
  2804d2:	5d                   	pop    %ebp
  2804d3:	c3                   	ret    

002804d4 <color_screen>:

void color_screen(char color) //15:pure white
{
	int i;
	color=color;
	for(i=0xa0000;i<0xaffff;i++)
  2804d4:	b8 00 00 0a 00       	mov    $0xa0000,%eax
	{
		write_mem8(i,i&0x0f);  //if we write 15 ,all pixels color will be white,15 mens pure white ,so the screen changes into white
  2804d9:	89 c2                	mov    %eax,%edx
	for(i=0xa0000;i<0xaffff;i++)
  2804db:	40                   	inc    %eax
		write_mem8(i,i&0x0f);  //if we write 15 ,all pixels color will be white,15 mens pure white ,so the screen changes into white
  2804dc:	83 e2 0f             	and    $0xf,%edx
  2804df:	88 50 ff             	mov    %dl,-0x1(%eax)
	for(i=0xa0000;i<0xaffff;i++)
  2804e2:	3d ff ff 0a 00       	cmp    $0xaffff,%eax
  2804e7:	75 f0                	jne    2804d9 <color_screen+0x5>

	}
}
  2804e9:	c3                   	ret    

002804ea <set_palette>:

void set_palette(int start, int end, unsigned char* rgb){
  2804ea:	55                   	push   %ebp
  2804eb:	89 e5                	mov    %esp,%ebp
  2804ed:	56                   	push   %esi
  2804ee:	8b 4d 10             	mov    0x10(%ebp),%ecx
  2804f1:	53                   	push   %ebx
  2804f2:	8b 5d 08             	mov    0x8(%ebp),%ebx
//read eflags and write_eflags
static __inline uint32_t
io_load_eflags(void)
{
        uint32_t eflags;
        __asm __volatile("pushfl; popl %0" : "=r" (eflags));
  2804f5:	9c                   	pushf  
  2804f6:	5e                   	pop    %esi
	int i, eflags;
	eflags = io_load_eflags();	//替代作者的io_load_eflags()
	io_cli();
  2804f7:	fa                   	cli    
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
  2804f8:	ba c8 03 00 00       	mov    $0x3c8,%edx
  2804fd:	89 d8                	mov    %ebx,%eax
  2804ff:	ee                   	out    %al,(%dx)
  280500:	ba c9 03 00 00       	mov    $0x3c9,%edx
	outb(0x03c8, start);	//替代作者的io_out8()
	for(i=start; i<=end; i++){
  280505:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
  280508:	7f 1a                	jg     280524 <set_palette+0x3a>
		outb(0x03c9,rgb[0]/4);
  28050a:	8a 01                	mov    (%ecx),%al
  28050c:	c0 e8 02             	shr    $0x2,%al
  28050f:	ee                   	out    %al,(%dx)
		outb(0x03c9,rgb[1]/4);
  280510:	8a 41 01             	mov    0x1(%ecx),%al
  280513:	c0 e8 02             	shr    $0x2,%al
  280516:	ee                   	out    %al,(%dx)
		outb(0x03c9,rgb[2]/4);
  280517:	8a 41 02             	mov    0x2(%ecx),%al
  28051a:	c0 e8 02             	shr    $0x2,%al
  28051d:	ee                   	out    %al,(%dx)
		rgb+=3;
  28051e:	83 c1 03             	add    $0x3,%ecx
	for(i=start; i<=end; i++){
  280521:	43                   	inc    %ebx
  280522:	eb e1                	jmp    280505 <set_palette+0x1b>
}

static __inline void
io_store_eflags(uint32_t eflags)
{
        __asm __volatile("pushl %0; popfl" : : "r" (eflags));
  280524:	56                   	push   %esi
  280525:	9d                   	popf   
	}
	io_store_eflags(eflags);	//替代作者的io_store_eflags(eflags)
	return;
}
  280526:	5b                   	pop    %ebx
  280527:	5e                   	pop    %esi
  280528:	5d                   	pop    %ebp
  280529:	c3                   	ret    

0028052a <init_palette>:


void init_palette(void){
  28052a:	e8 3a 0c 00 00       	call   281169 <__x86.get_pc_thunk.ax>
  28052f:	05 a1 2d 00 00       	add    $0x2da1,%eax
  280534:	55                   	push   %ebp
  280535:	89 e5                	mov    %esp,%ebp
  280537:	83 ec 0c             	sub    $0xc,%esp
		0x00,0x00,0x84,   /*12:dark 青*/
		0x84,0x00,0x84,   /*13:dark purper*/
		0x00,0x84,0x84,   /*14:light blue*/
		0x84,0x84,0x84,   /*15:dark gray*/
	};  
	set_palette(0,15,table_rgb);
  28053a:	8d 80 d0 ff ff ff    	lea    -0x30(%eax),%eax
  280540:	50                   	push   %eax
  280541:	6a 0f                	push   $0xf
  280543:	6a 00                	push   $0x0
  280545:	e8 a0 ff ff ff       	call   2804ea <set_palette>
	return;
  28054a:	83 c4 10             	add    $0x10,%esp
}
  28054d:	c9                   	leave  
  28054e:	c3                   	ret    

0028054f <boxfill8>:

void boxfill8(char* vram, int xsize, unsigned char c, int x0, int y0, int x1, int y1){
  28054f:	55                   	push   %ebp
  280550:	89 e5                	mov    %esp,%ebp
  280552:	57                   	push   %edi
  280553:	8b 45 18             	mov    0x18(%ebp),%eax
  280556:	8b 7d 0c             	mov    0xc(%ebp),%edi
  280559:	56                   	push   %esi
  28055a:	53                   	push   %ebx
  28055b:	8a 5d 10             	mov    0x10(%ebp),%bl
  28055e:	89 c1                	mov    %eax,%ecx
  280560:	0f af cf             	imul   %edi,%ecx
	int x, y;
	for(y=y0; y<=y1; y++){
  280563:	3b 45 20             	cmp    0x20(%ebp),%eax
  280566:	7f 18                	jg     280580 <boxfill8+0x31>
		for(x=x0; x<=x1; x++){
			vram[y*xsize+x]=c;
  280568:	8b 75 08             	mov    0x8(%ebp),%esi
		for(x=x0; x<=x1; x++){
  28056b:	8b 55 14             	mov    0x14(%ebp),%edx
			vram[y*xsize+x]=c;
  28056e:	01 ce                	add    %ecx,%esi
		for(x=x0; x<=x1; x++){
  280570:	3b 55 1c             	cmp    0x1c(%ebp),%edx
  280573:	7f 06                	jg     28057b <boxfill8+0x2c>
			vram[y*xsize+x]=c;
  280575:	88 1c 16             	mov    %bl,(%esi,%edx,1)
		for(x=x0; x<=x1; x++){
  280578:	42                   	inc    %edx
  280579:	eb f5                	jmp    280570 <boxfill8+0x21>
	for(y=y0; y<=y1; y++){
  28057b:	40                   	inc    %eax
  28057c:	01 f9                	add    %edi,%ecx
  28057e:	eb e3                	jmp    280563 <boxfill8+0x14>
		}
	}
	return;
}
  280580:	5b                   	pop    %ebx
  280581:	5e                   	pop    %esi
  280582:	5f                   	pop    %edi
  280583:	5d                   	pop    %ebp
  280584:	c3                   	ret    

00280585 <init_screen8>:
   binfo->color_mode = 8;
   binfo->xsize = 320;
   binfo->ysize = 200;
   }
   */
void init_screen8(char *vram, int x, int y){
  280585:	55                   	push   %ebp
  280586:	89 e5                	mov    %esp,%ebp
  280588:	57                   	push   %edi
  280589:	56                   	push   %esi
  28058a:	53                   	push   %ebx
  28058b:	83 ec 20             	sub    $0x20,%esp
  28058e:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  280591:	8b 75 10             	mov    0x10(%ebp),%esi
	boxfill8(vram, x, COL8_008484,  0,     0,      x -  1, y - 29);
  280594:	8d 7b ff             	lea    -0x1(%ebx),%edi
  280597:	8d 46 e3             	lea    -0x1d(%esi),%eax
  28059a:	50                   	push   %eax
  28059b:	57                   	push   %edi
  28059c:	6a 00                	push   $0x0
  28059e:	6a 00                	push   $0x0
  2805a0:	6a 0e                	push   $0xe
  2805a2:	53                   	push   %ebx
  2805a3:	ff 75 08             	push   0x8(%ebp)
  2805a6:	e8 a4 ff ff ff       	call   28054f <boxfill8>
	boxfill8(vram, x, COL8_C6C6C6,  0,     y - 28, x -  1, y - 28);
  2805ab:	83 c4 1c             	add    $0x1c,%esp
  2805ae:	8d 46 e4             	lea    -0x1c(%esi),%eax
  2805b1:	50                   	push   %eax
  2805b2:	57                   	push   %edi
  2805b3:	50                   	push   %eax
  2805b4:	6a 00                	push   $0x0
  2805b6:	6a 08                	push   $0x8
  2805b8:	53                   	push   %ebx
  2805b9:	ff 75 08             	push   0x8(%ebp)
  2805bc:	e8 8e ff ff ff       	call   28054f <boxfill8>
	boxfill8(vram, x, COL8_FFFFFF,  0,     y - 27, x -  1, y - 27);
  2805c1:	83 c4 1c             	add    $0x1c,%esp
  2805c4:	8d 46 e5             	lea    -0x1b(%esi),%eax
  2805c7:	50                   	push   %eax
  2805c8:	57                   	push   %edi
  2805c9:	50                   	push   %eax
  2805ca:	6a 00                	push   $0x0
  2805cc:	6a 07                	push   $0x7
  2805ce:	53                   	push   %ebx
  2805cf:	ff 75 08             	push   0x8(%ebp)
  2805d2:	e8 78 ff ff ff       	call   28054f <boxfill8>
	boxfill8(vram, x, COL8_C6C6C6,  0,     y - 26, x -  1, y -  1);
  2805d7:	83 c4 1c             	add    $0x1c,%esp
  2805da:	8d 46 ff             	lea    -0x1(%esi),%eax
  2805dd:	50                   	push   %eax
  2805de:	8d 46 e6             	lea    -0x1a(%esi),%eax
  2805e1:	57                   	push   %edi

	boxfill8(vram, x, COL8_FFFFFF,  3,     y - 24, 59,     y - 24);
  2805e2:	8d 7e e8             	lea    -0x18(%esi),%edi
	boxfill8(vram, x, COL8_C6C6C6,  0,     y - 26, x -  1, y -  1);
  2805e5:	50                   	push   %eax
  2805e6:	6a 00                	push   $0x0
  2805e8:	6a 08                	push   $0x8
  2805ea:	53                   	push   %ebx
  2805eb:	ff 75 08             	push   0x8(%ebp)
  2805ee:	e8 5c ff ff ff       	call   28054f <boxfill8>
	boxfill8(vram, x, COL8_FFFFFF,  3,     y - 24, 59,     y - 24);
  2805f3:	83 c4 1c             	add    $0x1c,%esp
  2805f6:	57                   	push   %edi
  2805f7:	6a 3b                	push   $0x3b
  2805f9:	57                   	push   %edi
  2805fa:	6a 03                	push   $0x3
  2805fc:	6a 07                	push   $0x7
  2805fe:	53                   	push   %ebx
  2805ff:	ff 75 08             	push   0x8(%ebp)
  280602:	e8 48 ff ff ff       	call   28054f <boxfill8>
	boxfill8(vram, x, COL8_FFFFFF,  2,     y - 24,  2,     y -  4);
  280607:	83 c4 1c             	add    $0x1c,%esp
  28060a:	8d 4e fc             	lea    -0x4(%esi),%ecx
  28060d:	51                   	push   %ecx
  28060e:	6a 02                	push   $0x2
  280610:	57                   	push   %edi
  280611:	6a 02                	push   $0x2
  280613:	6a 07                	push   $0x7
  280615:	53                   	push   %ebx
  280616:	ff 75 08             	push   0x8(%ebp)
  280619:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  28061c:	e8 2e ff ff ff       	call   28054f <boxfill8>
	boxfill8(vram, x, COL8_848484,  3,     y -  4, 59,     y -  4);
  280621:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  280624:	83 c4 1c             	add    $0x1c,%esp
  280627:	51                   	push   %ecx
  280628:	6a 3b                	push   $0x3b
  28062a:	51                   	push   %ecx
  28062b:	6a 03                	push   $0x3
  28062d:	6a 0f                	push   $0xf
  28062f:	53                   	push   %ebx
  280630:	ff 75 08             	push   0x8(%ebp)
  280633:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  280636:	e8 14 ff ff ff       	call   28054f <boxfill8>
	boxfill8(vram, x, COL8_848484, 59,     y - 23, 59,     y -  5);
  28063b:	8d 46 e9             	lea    -0x17(%esi),%eax
  28063e:	83 c4 1c             	add    $0x1c,%esp
  280641:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  280644:	8d 46 fb             	lea    -0x5(%esi),%eax
	boxfill8(vram, x, COL8_000000,  2,     y -  3, 59,     y -  3);
  280647:	83 ee 03             	sub    $0x3,%esi
	boxfill8(vram, x, COL8_848484, 59,     y - 23, 59,     y -  5);
  28064a:	50                   	push   %eax
  28064b:	6a 3b                	push   $0x3b
  28064d:	ff 75 e4             	push   -0x1c(%ebp)
  280650:	6a 3b                	push   $0x3b
  280652:	6a 0f                	push   $0xf
  280654:	53                   	push   %ebx
  280655:	ff 75 08             	push   0x8(%ebp)
  280658:	e8 f2 fe ff ff       	call   28054f <boxfill8>
	boxfill8(vram, x, COL8_000000,  2,     y -  3, 59,     y -  3);
  28065d:	83 c4 1c             	add    $0x1c,%esp
  280660:	56                   	push   %esi
  280661:	6a 3b                	push   $0x3b
  280663:	56                   	push   %esi
  280664:	6a 02                	push   $0x2
  280666:	6a 00                	push   $0x0
  280668:	53                   	push   %ebx
  280669:	ff 75 08             	push   0x8(%ebp)
  28066c:	e8 de fe ff ff       	call   28054f <boxfill8>
	boxfill8(vram, x, COL8_000000, 60,     y - 24, 60,     y -  3);
  280671:	83 c4 1c             	add    $0x1c,%esp
  280674:	56                   	push   %esi
  280675:	6a 3c                	push   $0x3c
  280677:	57                   	push   %edi
  280678:	6a 3c                	push   $0x3c
  28067a:	6a 00                	push   $0x0
  28067c:	53                   	push   %ebx
  28067d:	ff 75 08             	push   0x8(%ebp)
  280680:	e8 ca fe ff ff       	call   28054f <boxfill8>

	boxfill8(vram, x, COL8_848484, x - 47, y - 24, x -  4, y - 24);
  280685:	83 c4 1c             	add    $0x1c,%esp
  280688:	8d 53 fc             	lea    -0x4(%ebx),%edx
  28068b:	8d 43 d1             	lea    -0x2f(%ebx),%eax
  28068e:	57                   	push   %edi
  28068f:	52                   	push   %edx
  280690:	57                   	push   %edi
  280691:	50                   	push   %eax
  280692:	6a 0f                	push   $0xf
  280694:	53                   	push   %ebx
  280695:	ff 75 08             	push   0x8(%ebp)
  280698:	89 55 dc             	mov    %edx,-0x24(%ebp)
  28069b:	89 45 e0             	mov    %eax,-0x20(%ebp)
  28069e:	e8 ac fe ff ff       	call   28054f <boxfill8>
	boxfill8(vram, x, COL8_848484, x - 47, y - 23, x - 47, y -  4);
  2806a3:	8b 45 e0             	mov    -0x20(%ebp),%eax
  2806a6:	8b 4d d8             	mov    -0x28(%ebp),%ecx
  2806a9:	83 c4 1c             	add    $0x1c,%esp
  2806ac:	51                   	push   %ecx
  2806ad:	50                   	push   %eax
  2806ae:	ff 75 e4             	push   -0x1c(%ebp)
  2806b1:	50                   	push   %eax
  2806b2:	6a 0f                	push   $0xf
  2806b4:	53                   	push   %ebx
  2806b5:	ff 75 08             	push   0x8(%ebp)
  2806b8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  2806bb:	e8 8f fe ff ff       	call   28054f <boxfill8>
	boxfill8(vram, x, COL8_FFFFFF, x - 47, y -  3, x -  4, y -  3);
  2806c0:	8b 55 dc             	mov    -0x24(%ebp),%edx
  2806c3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2806c6:	83 c4 1c             	add    $0x1c,%esp
  2806c9:	56                   	push   %esi
  2806ca:	52                   	push   %edx
  2806cb:	56                   	push   %esi
  2806cc:	50                   	push   %eax
  2806cd:	6a 07                	push   $0x7
  2806cf:	53                   	push   %ebx
  2806d0:	ff 75 08             	push   0x8(%ebp)
  2806d3:	e8 77 fe ff ff       	call   28054f <boxfill8>
	boxfill8(vram, x, COL8_FFFFFF, x -  3, y - 24, x -  3, y -  3);
  2806d8:	83 c4 1c             	add    $0x1c,%esp
  2806db:	8d 43 fd             	lea    -0x3(%ebx),%eax
  2806de:	56                   	push   %esi
  2806df:	50                   	push   %eax
  2806e0:	57                   	push   %edi
  2806e1:	50                   	push   %eax
  2806e2:	6a 07                	push   $0x7
  2806e4:	53                   	push   %ebx
  2806e5:	ff 75 08             	push   0x8(%ebp)
  2806e8:	e8 62 fe ff ff       	call   28054f <boxfill8>
	return;
  2806ed:	83 c4 20             	add    $0x20,%esp
}
  2806f0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  2806f3:	5b                   	pop    %ebx
  2806f4:	5e                   	pop    %esi
  2806f5:	5f                   	pop    %edi
  2806f6:	5d                   	pop    %ebp
  2806f7:	c3                   	ret    

002806f8 <putfont8>:


void putfont8(char *vram, int xsize, int x, int y, char c, char *font){
  2806f8:	55                   	push   %ebp
  2806f9:	89 e5                	mov    %esp,%ebp
  2806fb:	56                   	push   %esi
	int i;
	char *p, d /* data */;
	for (i = 0; i < 16; i++) {
  2806fc:	31 f6                	xor    %esi,%esi
void putfont8(char *vram, int xsize, int x, int y, char c, char *font){
  2806fe:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  280701:	8b 45 14             	mov    0x14(%ebp),%eax
  280704:	53                   	push   %ebx
  280705:	8a 55 18             	mov    0x18(%ebp),%dl
  280708:	0f af c1             	imul   %ecx,%eax
  28070b:	03 45 10             	add    0x10(%ebp),%eax
  28070e:	03 45 08             	add    0x8(%ebp),%eax
		p = vram + (y + i) * xsize + x;
		d = font[i];
  280711:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
  280714:	8a 1c 33             	mov    (%ebx,%esi,1),%bl
		if ((d & 0x80) != 0) { p[0] = c; }
  280717:	84 db                	test   %bl,%bl
  280719:	79 02                	jns    28071d <putfont8+0x25>
  28071b:	88 10                	mov    %dl,(%eax)
		if ((d & 0x40) != 0) { p[1] = c; }
  28071d:	f6 c3 40             	test   $0x40,%bl
  280720:	74 03                	je     280725 <putfont8+0x2d>
  280722:	88 50 01             	mov    %dl,0x1(%eax)
		if ((d & 0x20) != 0) { p[2] = c; }
  280725:	f6 c3 20             	test   $0x20,%bl
  280728:	74 03                	je     28072d <putfont8+0x35>
  28072a:	88 50 02             	mov    %dl,0x2(%eax)
		if ((d & 0x10) != 0) { p[3] = c; }
  28072d:	f6 c3 10             	test   $0x10,%bl
  280730:	74 03                	je     280735 <putfont8+0x3d>
  280732:	88 50 03             	mov    %dl,0x3(%eax)
		if ((d & 0x08) != 0) { p[4] = c; }
  280735:	f6 c3 08             	test   $0x8,%bl
  280738:	74 03                	je     28073d <putfont8+0x45>
  28073a:	88 50 04             	mov    %dl,0x4(%eax)
		if ((d & 0x04) != 0) { p[5] = c; }
  28073d:	f6 c3 04             	test   $0x4,%bl
  280740:	74 03                	je     280745 <putfont8+0x4d>
  280742:	88 50 05             	mov    %dl,0x5(%eax)
		if ((d & 0x02) != 0) { p[6] = c; }
  280745:	f6 c3 02             	test   $0x2,%bl
  280748:	74 03                	je     28074d <putfont8+0x55>
  28074a:	88 50 06             	mov    %dl,0x6(%eax)
		if ((d & 0x01) != 0) { p[7] = c; }
  28074d:	80 e3 01             	and    $0x1,%bl
  280750:	74 03                	je     280755 <putfont8+0x5d>
  280752:	88 50 07             	mov    %dl,0x7(%eax)
	for (i = 0; i < 16; i++) {
  280755:	46                   	inc    %esi
  280756:	01 c8                	add    %ecx,%eax
  280758:	83 fe 10             	cmp    $0x10,%esi
  28075b:	75 b4                	jne    280711 <putfont8+0x19>
	}
	return;
}
  28075d:	5b                   	pop    %ebx
  28075e:	5e                   	pop    %esi
  28075f:	5d                   	pop    %ebp
  280760:	c3                   	ret    

00280761 <putfonts8_asc>:

void putfonts8_asc(char* vram, int xsize, int x, int y, char c, char *s){
  280761:	e8 03 0a 00 00       	call   281169 <__x86.get_pc_thunk.ax>
  280766:	05 6a 2b 00 00       	add    $0x2b6a,%eax
  28076b:	55                   	push   %ebp
  28076c:	89 e5                	mov    %esp,%ebp
  28076e:	57                   	push   %edi
  28076f:	56                   	push   %esi
  280770:	53                   	push   %ebx
  280771:	83 ec 0c             	sub    $0xc,%esp
  280774:	8b 75 10             	mov    0x10(%ebp),%esi
	//其实这就是一个简易版本的printf
	extern char hankaku[2048];
	for(; *s!=0x00; s++){
		putfont8(vram, xsize, x, y, c, hankaku+*s*16);
  280777:	c7 c7 c0 18 28 00    	mov    $0x2818c0,%edi
  28077d:	0f be 5d 18          	movsbl 0x18(%ebp),%ebx
	for(; *s!=0x00; s++){
  280781:	8b 45 1c             	mov    0x1c(%ebp),%eax
  280784:	0f be 00             	movsbl (%eax),%eax
  280787:	84 c0                	test   %al,%al
  280789:	74 23                	je     2807ae <putfonts8_asc+0x4d>
		putfont8(vram, xsize, x, y, c, hankaku+*s*16);
  28078b:	c1 e0 04             	shl    $0x4,%eax
  28078e:	52                   	push   %edx
  28078f:	01 f8                	add    %edi,%eax
  280791:	52                   	push   %edx
  280792:	50                   	push   %eax
  280793:	53                   	push   %ebx
  280794:	ff 75 14             	push   0x14(%ebp)
  280797:	56                   	push   %esi
		x+=8;
  280798:	83 c6 08             	add    $0x8,%esi
		putfont8(vram, xsize, x, y, c, hankaku+*s*16);
  28079b:	ff 75 0c             	push   0xc(%ebp)
  28079e:	ff 75 08             	push   0x8(%ebp)
  2807a1:	e8 52 ff ff ff       	call   2806f8 <putfont8>
	for(; *s!=0x00; s++){
  2807a6:	ff 45 1c             	incl   0x1c(%ebp)
  2807a9:	83 c4 20             	add    $0x20,%esp
  2807ac:	eb d3                	jmp    280781 <putfonts8_asc+0x20>
	}
	return;
}
  2807ae:	8d 65 f4             	lea    -0xc(%ebp),%esp
  2807b1:	5b                   	pop    %ebx
  2807b2:	5e                   	pop    %esi
  2807b3:	5f                   	pop    %edi
  2807b4:	5d                   	pop    %ebp
  2807b5:	c3                   	ret    

002807b6 <init_mouse_cursor8>:

void init_mouse_cursor8(char *mouse,char bg){
  2807b6:	55                   	push   %ebp
  2807b7:	89 e5                	mov    %esp,%ebp
  2807b9:	57                   	push   %edi
  2807ba:	56                   	push   %esi
  2807bb:	53                   	push   %ebx
  2807bc:	52                   	push   %edx
  2807bd:	8a 45 0c             	mov    0xc(%ebp),%al
  2807c0:	e8 a8 09 00 00       	call   28116d <__x86.get_pc_thunk.dx>
  2807c5:	81 c2 0b 2b 00 00    	add    $0x2b0b,%edx
  2807cb:	88 45 f3             	mov    %al,-0xd(%ebp)
		"............*OO*",
		".............***"
	};
	int x,y;
	for(y=0;y<16;y++){
		for(x=0;x<16;x++){
  2807ce:	31 c0                	xor    %eax,%eax
			switch (cursor[y][x]){
  2807d0:	8d ba b0 de ff ff    	lea    -0x2150(%edx),%edi
  2807d6:	8b 55 08             	mov    0x8(%ebp),%edx
		for(x=0;x<16;x++){
  2807d9:	31 c9                	xor    %ecx,%ecx
			switch (cursor[y][x]){
  2807db:	8d 34 38             	lea    (%eax,%edi,1),%esi
  2807de:	01 c2                	add    %eax,%edx
  2807e0:	8a 1c 0e             	mov    (%esi,%ecx,1),%bl
  2807e3:	80 fb 2e             	cmp    $0x2e,%bl
  2807e6:	74 0f                	je     2807f7 <init_mouse_cursor8+0x41>
  2807e8:	80 fb 4f             	cmp    $0x4f,%bl
  2807eb:	74 11                	je     2807fe <init_mouse_cursor8+0x48>
  2807ed:	80 fb 2a             	cmp    $0x2a,%bl
  2807f0:	75 0f                	jne    280801 <init_mouse_cursor8+0x4b>
				case '.':mouse[x+16*y]=bg;break;  //background
				case '*':mouse[x+16*y]=outline;break;   //outline
  2807f2:	c6 02 00             	movb   $0x0,(%edx)
  2807f5:	eb 0a                	jmp    280801 <init_mouse_cursor8+0x4b>
				case '.':mouse[x+16*y]=bg;break;  //background
  2807f7:	8a 5d f3             	mov    -0xd(%ebp),%bl
  2807fa:	88 1a                	mov    %bl,(%edx)
  2807fc:	eb 03                	jmp    280801 <init_mouse_cursor8+0x4b>
				case 'O':mouse[x+16*y]=inside;break;  //inside
  2807fe:	c6 02 02             	movb   $0x2,(%edx)
		for(x=0;x<16;x++){
  280801:	41                   	inc    %ecx
  280802:	42                   	inc    %edx
  280803:	83 f9 10             	cmp    $0x10,%ecx
  280806:	75 d8                	jne    2807e0 <init_mouse_cursor8+0x2a>
	for(y=0;y<16;y++){
  280808:	83 c0 10             	add    $0x10,%eax
  28080b:	3d 00 01 00 00       	cmp    $0x100,%eax
  280810:	75 c4                	jne    2807d6 <init_mouse_cursor8+0x20>
			}
		}
	}
}
  280812:	58                   	pop    %eax
  280813:	5b                   	pop    %ebx
  280814:	5e                   	pop    %esi
  280815:	5f                   	pop    %edi
  280816:	5d                   	pop    %ebp
  280817:	c3                   	ret    

00280818 <putblock8_8>:

void putblock8_8(char *vram,int xsize,int pxsize,int pysize,int px0,int py0,char *buf,int bxsize){
  280818:	55                   	push   %ebp
	//显示鼠标,display_mouse 
	int x, y;
	for(y=0; y<pysize; y++){
  280819:	31 c9                	xor    %ecx,%ecx
void putblock8_8(char *vram,int xsize,int pxsize,int pysize,int px0,int py0,char *buf,int bxsize){
  28081b:	89 e5                	mov    %esp,%ebp
  28081d:	57                   	push   %edi
  28081e:	56                   	push   %esi
  28081f:	53                   	push   %ebx
  280820:	83 ec 08             	sub    $0x8,%esp
		for(x=0; x<pxsize; x++){
			vram[(py0+y)*xsize+(px0+x)]=buf[y*bxsize+x];
  280823:	8b 45 18             	mov    0x18(%ebp),%eax
  280826:	03 45 08             	add    0x8(%ebp),%eax
	for(y=0; y<pysize; y++){
  280829:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  280830:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
  280833:	0f af 5d 0c          	imul   0xc(%ebp),%ebx
			vram[(py0+y)*xsize+(px0+x)]=buf[y*bxsize+x];
  280837:	89 45 ec             	mov    %eax,-0x14(%ebp)
	for(y=0; y<pysize; y++){
  28083a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  28083d:	3b 45 14             	cmp    0x14(%ebp),%eax
  280840:	7d 26                	jge    280868 <putblock8_8+0x50>
			vram[(py0+y)*xsize+(px0+x)]=buf[y*bxsize+x];
  280842:	8b 55 ec             	mov    -0x14(%ebp),%edx
		for(x=0; x<pxsize; x++){
  280845:	31 c0                	xor    %eax,%eax
			vram[(py0+y)*xsize+(px0+x)]=buf[y*bxsize+x];
  280847:	8d 34 1a             	lea    (%edx,%ebx,1),%esi
		for(x=0; x<pxsize; x++){
  28084a:	3b 45 10             	cmp    0x10(%ebp),%eax
  28084d:	7d 0e                	jge    28085d <putblock8_8+0x45>
			vram[(py0+y)*xsize+(px0+x)]=buf[y*bxsize+x];
  28084f:	8b 7d 20             	mov    0x20(%ebp),%edi
  280852:	01 cf                	add    %ecx,%edi
  280854:	8a 14 07             	mov    (%edi,%eax,1),%dl
  280857:	88 14 06             	mov    %dl,(%esi,%eax,1)
		for(x=0; x<pxsize; x++){
  28085a:	40                   	inc    %eax
  28085b:	eb ed                	jmp    28084a <putblock8_8+0x32>
	for(y=0; y<pysize; y++){
  28085d:	ff 45 f0             	incl   -0x10(%ebp)
  280860:	03 4d 24             	add    0x24(%ebp),%ecx
  280863:	03 5d 0c             	add    0xc(%ebp),%ebx
  280866:	eb d2                	jmp    28083a <putblock8_8+0x22>
		}
	}
}
  280868:	58                   	pop    %eax
  280869:	5a                   	pop    %edx
  28086a:	5b                   	pop    %ebx
  28086b:	5e                   	pop    %esi
  28086c:	5f                   	pop    %edi
  28086d:	5d                   	pop    %ebp
  28086e:	c3                   	ret    

0028086f <boxfill>:

void boxfill(char color, int x0, int y0, int x1, int y1){
  28086f:	55                   	push   %ebp
  280870:	89 e5                	mov    %esp,%ebp
  280872:	83 ec 0c             	sub    $0xc,%esp
	boxfill8((char *)VRAM, 320, color, x0, y0, x1, y1);
  280875:	0f b6 45 08          	movzbl 0x8(%ebp),%eax
  280879:	ff 75 18             	push   0x18(%ebp)
  28087c:	ff 75 14             	push   0x14(%ebp)
  28087f:	ff 75 10             	push   0x10(%ebp)
  280882:	ff 75 0c             	push   0xc(%ebp)
  280885:	50                   	push   %eax
  280886:	68 40 01 00 00       	push   $0x140
  28088b:	68 00 00 e2 ff       	push   $0xffe20000
  280890:	e8 ba fc ff ff       	call   28054f <boxfill8>
}
  280895:	83 c4 20             	add    $0x20,%esp
  280898:	c9                   	leave  
  280899:	c3                   	ret    

0028089a <puts8>:
	sprintf(font,"Debug:var=%x" ,i);
	puts8((char *)VRAM ,320,x,150,1,font);

}

void puts8(char *vram ,int xsize,int x,int y,char color,char *font){
  28089a:	55                   	push   %ebp
  28089b:	89 e5                	mov    %esp,%ebp
  28089d:	57                   	push   %edi
  28089e:	56                   	push   %esi
  28089f:	53                   	push   %ebx
  2808a0:	e8 c0 08 00 00       	call   281165 <__x86.get_pc_thunk.bx>
  2808a5:	81 c3 2b 2a 00 00    	add    $0x2a2b,%ebx
  2808ab:	83 ec 1c             	sub    $0x1c,%esp
  2808ae:	8b 7d 10             	mov    0x10(%ebp),%edi
  2808b1:	8b 75 14             	mov    0x14(%ebp),%esi
	while(*font){
		if(*font=='\n'){
			x=0;
			y=y+16;
		}else{  
			putfont8((char *)vram ,xsize,x,y,color,(char *)(hankaku+(*font)*16));
  2808b4:	0f be 4d 18          	movsbl 0x18(%ebp),%ecx
  2808b8:	c7 c2 c0 18 28 00    	mov    $0x2818c0,%edx
	while(*font){
  2808be:	8b 45 1c             	mov    0x1c(%ebp),%eax
  2808c1:	0f be 00             	movsbl (%eax),%eax
  2808c4:	84 c0                	test   %al,%al
  2808c6:	74 50                	je     280918 <puts8+0x7e>
		if(*font=='\n'){
  2808c8:	3c 0a                	cmp    $0xa,%al
  2808ca:	75 07                	jne    2808d3 <puts8+0x39>
			y=y+16;
  2808cc:	83 c6 10             	add    $0x10,%esi
			x=0;
  2808cf:	31 ff                	xor    %edi,%edi
  2808d1:	eb 40                	jmp    280913 <puts8+0x79>
			putfont8((char *)vram ,xsize,x,y,color,(char *)(hankaku+(*font)*16));
  2808d3:	c1 e0 04             	shl    $0x4,%eax
  2808d6:	83 ec 08             	sub    $0x8,%esp
  2808d9:	89 55 e0             	mov    %edx,-0x20(%ebp)
  2808dc:	01 d0                	add    %edx,%eax
  2808de:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  2808e1:	50                   	push   %eax
  2808e2:	51                   	push   %ecx
  2808e3:	56                   	push   %esi
  2808e4:	57                   	push   %edi
			x+=8;
  2808e5:	83 c7 08             	add    $0x8,%edi
			putfont8((char *)vram ,xsize,x,y,color,(char *)(hankaku+(*font)*16));
  2808e8:	ff 75 0c             	push   0xc(%ebp)
  2808eb:	ff 75 08             	push   0x8(%ebp)
  2808ee:	e8 05 fe ff ff       	call   2806f8 <putfont8>
			if(x>312){
  2808f3:	83 c4 20             	add    $0x20,%esp
  2808f6:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  2808f9:	8b 55 e0             	mov    -0x20(%ebp),%edx
  2808fc:	81 ff 38 01 00 00    	cmp    $0x138,%edi
  280902:	7e 0f                	jle    280913 <puts8+0x79>
				x=0;
				y+=16;
  280904:	83 c6 10             	add    $0x10,%esi
				x=0;
  280907:	31 ff                	xor    %edi,%edi
				if(y>183){
  280909:	81 fe b7 00 00 00    	cmp    $0xb7,%esi
  28090f:	7e 02                	jle    280913 <puts8+0x79>
					x=0;
					y=0;
  280911:	31 f6                	xor    %esi,%esi
				}
			}    
		}
		font++;
  280913:	ff 45 1c             	incl   0x1c(%ebp)
  280916:	eb a6                	jmp    2808be <puts8+0x24>
	}
}
  280918:	8d 65 f4             	lea    -0xc(%ebp),%esp
  28091b:	5b                   	pop    %ebx
  28091c:	5e                   	pop    %esi
  28091d:	5f                   	pop    %edi
  28091e:	5d                   	pop    %ebp
  28091f:	c3                   	ret    

00280920 <itoa>:

void itoa(int value,char *buf){
  280920:	55                   	push   %ebp
	char tmp_buf[10] = {0};
  280921:	b9 06 00 00 00       	mov    $0x6,%ecx
  280926:	31 c0                	xor    %eax,%eax
void itoa(int value,char *buf){
  280928:	89 e5                	mov    %esp,%ebp
  28092a:	57                   	push   %edi
  28092b:	56                   	push   %esi
	char tmp_buf[10] = {0};
  28092c:	8d 7d ee             	lea    -0x12(%ebp),%edi
void itoa(int value,char *buf){
  28092f:	53                   	push   %ebx
  280930:	83 ec 10             	sub    $0x10,%esp
  280933:	8b 55 08             	mov    0x8(%ebp),%edx
  280936:	8b 5d 0c             	mov    0xc(%ebp),%ebx
	char tmp_buf[10] = {0};
  280939:	c7 45 ea 00 00 00 00 	movl   $0x0,-0x16(%ebp)
  280940:	f3 aa                	rep stos %al,%es:(%edi)
	char *tbp = tmp_buf;
	if((value >> 31) & 0x1){ // neg num 
  280942:	85 d2                	test   %edx,%edx
  280944:	79 06                	jns    28094c <itoa+0x2c>
		*buf++ = '-';
  280946:	c6 03 2d             	movb   $0x2d,(%ebx)
		value = ~value + 1; 
  280949:	f7 da                	neg    %edx
		*buf++ = '-';
  28094b:	43                   	inc    %ebx
  28094c:	8d 4d ea             	lea    -0x16(%ebp),%ecx
	}

	do{
		*tbp++ = ('0' + (char)(value % 10));
  28094f:	be 0a 00 00 00       	mov    $0xa,%esi
  280954:	89 cf                	mov    %ecx,%edi
  280956:	89 d0                	mov    %edx,%eax
  280958:	41                   	inc    %ecx
  280959:	99                   	cltd   
  28095a:	f7 fe                	idiv   %esi
  28095c:	83 c2 30             	add    $0x30,%edx
  28095f:	88 51 ff             	mov    %dl,-0x1(%ecx)
		value /= 10;
  280962:	89 c2                	mov    %eax,%edx
	}while(value);
  280964:	85 c0                	test   %eax,%eax
  280966:	75 ee                	jne    280956 <itoa+0x36>
  280968:	89 de                	mov    %ebx,%esi
  28096a:	89 c8                	mov    %ecx,%eax
	while(tmp_buf != tbp--)
  28096c:	39 c7                	cmp    %eax,%edi
  28096e:	74 0a                	je     28097a <itoa+0x5a>
		*buf++ = *tbp;
  280970:	8a 50 ff             	mov    -0x1(%eax),%dl
  280973:	46                   	inc    %esi
  280974:	48                   	dec    %eax
  280975:	88 56 ff             	mov    %dl,-0x1(%esi)
  280978:	eb f2                	jmp    28096c <itoa+0x4c>
	*buf='\0';
  28097a:	29 f9                	sub    %edi,%ecx
  28097c:	c6 04 0b 00          	movb   $0x0,(%ebx,%ecx,1)
}
  280980:	83 c4 10             	add    $0x10,%esp
  280983:	5b                   	pop    %ebx
  280984:	5e                   	pop    %esi
  280985:	5f                   	pop    %edi
  280986:	5d                   	pop    %ebp
  280987:	c3                   	ret    

00280988 <xtoa>:
	else
		value = value + 48;
	return value;
}

void xtoa(unsigned int value,char *buf){
  280988:	55                   	push   %ebp
	char tmp_buf[30] = {0};
  280989:	31 c0                	xor    %eax,%eax
  28098b:	b9 1a 00 00 00       	mov    $0x1a,%ecx
void xtoa(unsigned int value,char *buf){
  280990:	89 e5                	mov    %esp,%ebp
  280992:	57                   	push   %edi
  280993:	56                   	push   %esi
	char tmp_buf[30] = {0};
  280994:	8d 7d da             	lea    -0x26(%ebp),%edi
void xtoa(unsigned int value,char *buf){
  280997:	53                   	push   %ebx
  280998:	83 ec 20             	sub    $0x20,%esp
  28099b:	8b 55 0c             	mov    0xc(%ebp),%edx
  28099e:	8b 75 08             	mov    0x8(%ebp),%esi
	char tmp_buf[30] = {0};
  2809a1:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
  2809a8:	f3 aa                	rep stos %al,%es:(%edi)
	char *tbp = tmp_buf;
  2809aa:	8d 45 d6             	lea    -0x2a(%ebp),%eax

	*buf++='0';
  2809ad:	66 c7 02 30 78       	movw   $0x7830,(%edx)
  2809b2:	89 c7                	mov    %eax,%edi
	*buf++='x';
	do{
		// *tbp++ = ('0' + (char)(value % 16));//得到低位数字
		*tbp++=fourbtoc(value&0x0000000f);
  2809b4:	89 f1                	mov    %esi,%ecx
  2809b6:	40                   	inc    %eax
  2809b7:	83 e1 0f             	and    $0xf,%ecx
		value = value + 48;
  2809ba:	8d 59 30             	lea    0x30(%ecx),%ebx
	if(value >= 10)
  2809bd:	83 f9 09             	cmp    $0x9,%ecx
  2809c0:	7e 03                	jle    2809c5 <xtoa+0x3d>
		value = value - 10 + 65;
  2809c2:	8d 59 37             	lea    0x37(%ecx),%ebx

		//*tbp++ = ((value % 16)>9)?('A' + (char)(value % 16-10)):('0' + (char)(value % 16));//得到低位数字
		value >>= 4;
	}while(value);
  2809c5:	c1 ee 04             	shr    $0x4,%esi
	return value;
  2809c8:	88 58 ff             	mov    %bl,-0x1(%eax)
	}while(value);
  2809cb:	75 e7                	jne    2809b4 <xtoa+0x2c>
  2809cd:	8d 72 02             	lea    0x2(%edx),%esi
		*tbp++=fourbtoc(value&0x0000000f);
  2809d0:	89 c1                	mov    %eax,%ecx

	while(tmp_buf != tbp){
  2809d2:	39 f9                	cmp    %edi,%ecx
  2809d4:	74 0a                	je     2809e0 <xtoa+0x58>
		tbp--;
		*buf++ = *tbp;
  2809d6:	8a 59 ff             	mov    -0x1(%ecx),%bl
		tbp--;
  2809d9:	49                   	dec    %ecx
  2809da:	46                   	inc    %esi
		*buf++ = *tbp;
  2809db:	88 5e ff             	mov    %bl,-0x1(%esi)
  2809de:	eb f2                	jmp    2809d2 <xtoa+0x4a>
	}
	*buf='\0';
  2809e0:	29 c8                	sub    %ecx,%eax
  2809e2:	c6 44 02 02 00       	movb   $0x0,0x2(%edx,%eax,1)
}
  2809e7:	83 c4 20             	add    $0x20,%esp
  2809ea:	5b                   	pop    %ebx
  2809eb:	5e                   	pop    %esi
  2809ec:	5f                   	pop    %edi
  2809ed:	5d                   	pop    %ebp
  2809ee:	c3                   	ret    

002809ef <sprintf>:
void sprintf(char *str,char *format ,...){
  2809ef:	55                   	push   %ebp
  2809f0:	89 e5                	mov    %esp,%ebp
  2809f2:	57                   	push   %edi
  2809f3:	56                   	push   %esi
	int *var=(int *)(&format)+1; //得到第一个可变参数的地址
  2809f4:	8d 7d 10             	lea    0x10(%ebp),%edi
void sprintf(char *str,char *format ,...){
  2809f7:	53                   	push   %ebx
  2809f8:	83 ec 14             	sub    $0x14,%esp
  2809fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
	while(*format){
  2809fe:	8b 75 0c             	mov    0xc(%ebp),%esi
  280a01:	8a 06                	mov    (%esi),%al
  280a03:	84 c0                	test   %al,%al
  280a05:	74 7d                	je     280a84 <sprintf+0x95>
			*str++=*format++;
  280a07:	8d 56 01             	lea    0x1(%esi),%edx
  280a0a:	89 55 0c             	mov    %edx,0xc(%ebp)
		if(*format!='%'){
  280a0d:	3c 25                	cmp    $0x25,%al
  280a0f:	74 05                	je     280a16 <sprintf+0x27>
			*str++=*format++;
  280a11:	88 03                	mov    %al,(%ebx)
  280a13:	43                   	inc    %ebx
			continue;
  280a14:	eb e8                	jmp    2809fe <sprintf+0xf>
			switch (*format)
  280a16:	8a 46 01             	mov    0x1(%esi),%al
  280a19:	3c 73                	cmp    $0x73,%al
  280a1b:	74 48                	je     280a65 <sprintf+0x76>
  280a1d:	3c 78                	cmp    $0x78,%al
  280a1f:	74 24                	je     280a45 <sprintf+0x56>
  280a21:	3c 64                	cmp    $0x64,%al
  280a23:	75 51                	jne    280a76 <sprintf+0x87>
					itoa(*var,buf);
  280a25:	8d 45 ea             	lea    -0x16(%ebp),%eax
  280a28:	50                   	push   %eax
  280a29:	ff 37                	push   (%edi)
  280a2b:	89 45 e0             	mov    %eax,-0x20(%ebp)
  280a2e:	e8 ed fe ff ff       	call   280920 <itoa>
					while(*buf){*str++=*buf++;};
  280a33:	59                   	pop    %ecx
  280a34:	58                   	pop    %eax
  280a35:	8b 45 e0             	mov    -0x20(%ebp),%eax
  280a38:	8a 10                	mov    (%eax),%dl
  280a3a:	84 d2                	test   %dl,%dl
  280a3c:	74 38                	je     280a76 <sprintf+0x87>
  280a3e:	43                   	inc    %ebx
  280a3f:	40                   	inc    %eax
  280a40:	88 53 ff             	mov    %dl,-0x1(%ebx)
  280a43:	eb f3                	jmp    280a38 <sprintf+0x49>
					xtoa(*var,buf);
  280a45:	8d 45 ea             	lea    -0x16(%ebp),%eax
  280a48:	50                   	push   %eax
  280a49:	ff 37                	push   (%edi)
  280a4b:	89 45 e0             	mov    %eax,-0x20(%ebp)
  280a4e:	e8 35 ff ff ff       	call   280988 <xtoa>
					while(*buf){*str++=*buf++;};
  280a53:	58                   	pop    %eax
  280a54:	8b 45 e0             	mov    -0x20(%ebp),%eax
  280a57:	5a                   	pop    %edx
  280a58:	8a 10                	mov    (%eax),%dl
  280a5a:	84 d2                	test   %dl,%dl
  280a5c:	74 18                	je     280a76 <sprintf+0x87>
  280a5e:	43                   	inc    %ebx
  280a5f:	40                   	inc    %eax
  280a60:	88 53 ff             	mov    %dl,-0x1(%ebx)
  280a63:	eb f3                	jmp    280a58 <sprintf+0x69>
					while(*buf){*str++=*buf++;};
  280a65:	8b 07                	mov    (%edi),%eax
  280a67:	29 d8                	sub    %ebx,%eax
  280a69:	8a 14 03             	mov    (%ebx,%eax,1),%dl
  280a6c:	84 d2                	test   %dl,%dl
  280a6e:	74 06                	je     280a76 <sprintf+0x87>
  280a70:	43                   	inc    %ebx
  280a71:	88 53 ff             	mov    %dl,-0x1(%ebx)
  280a74:	eb f3                	jmp    280a69 <sprintf+0x7a>
			format++;
  280a76:	83 c6 02             	add    $0x2,%esi
			var++;
  280a79:	83 c7 04             	add    $0x4,%edi
			format++;
  280a7c:	89 75 0c             	mov    %esi,0xc(%ebp)
  280a7f:	e9 7a ff ff ff       	jmp    2809fe <sprintf+0xf>
	*str='\0';
  280a84:	c6 03 00             	movb   $0x0,(%ebx)
}
  280a87:	8d 65 f4             	lea    -0xc(%ebp),%esp
  280a8a:	5b                   	pop    %ebx
  280a8b:	5e                   	pop    %esi
  280a8c:	5f                   	pop    %edi
  280a8d:	5d                   	pop    %ebp
  280a8e:	c3                   	ret    

00280a8f <printdebug>:
void printdebug(int i,int x){
  280a8f:	e8 d5 06 00 00       	call   281169 <__x86.get_pc_thunk.ax>
  280a94:	05 3c 28 00 00       	add    $0x283c,%eax
  280a99:	55                   	push   %ebp
  280a9a:	89 e5                	mov    %esp,%ebp
  280a9c:	53                   	push   %ebx
	sprintf(font,"Debug:var=%x" ,i);
  280a9d:	8d 5d da             	lea    -0x26(%ebp),%ebx
void printdebug(int i,int x){
  280aa0:	83 ec 24             	sub    $0x24,%esp
	sprintf(font,"Debug:var=%x" ,i);
  280aa3:	8d 80 e7 df ff ff    	lea    -0x2019(%eax),%eax
  280aa9:	ff 75 08             	push   0x8(%ebp)
  280aac:	50                   	push   %eax
  280aad:	53                   	push   %ebx
  280aae:	e8 3c ff ff ff       	call   2809ef <sprintf>
	puts8((char *)VRAM ,320,x,150,1,font);
  280ab3:	83 ec 0c             	sub    $0xc,%esp
  280ab6:	53                   	push   %ebx
  280ab7:	6a 01                	push   $0x1
  280ab9:	68 96 00 00 00       	push   $0x96
  280abe:	ff 75 0c             	push   0xc(%ebp)
  280ac1:	68 40 01 00 00       	push   $0x140
  280ac6:	68 00 00 e2 ff       	push   $0xffe20000
  280acb:	e8 ca fd ff ff       	call   28089a <puts8>
}
  280ad0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  280ad3:	83 c4 30             	add    $0x30,%esp
  280ad6:	c9                   	leave  
  280ad7:	c3                   	ret    

00280ad8 <set_segmdesc>:
	gd->access_right = ar & 0xff;
	gd->offset_high = (offset >> 16) & 0xffff;
	return;
}
*/
void set_segmdesc(struct SEGMENT_DESCRIPTOR *sd, unsigned int limit, int  base, int ar){
  280ad8:	55                   	push   %ebp
  280ad9:	89 e5                	mov    %esp,%ebp
  280adb:	57                   	push   %edi
  280adc:	8b 55 08             	mov    0x8(%ebp),%edx
  280adf:	8b 4d 10             	mov    0x10(%ebp),%ecx
  280ae2:	56                   	push   %esi
  280ae3:	53                   	push   %ebx
  280ae4:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  280ae7:	8b 7d 14             	mov    0x14(%ebp),%edi
	if(limit>0xfffff){
  280aea:	81 fb ff ff 0f 00    	cmp    $0xfffff,%ebx
  280af0:	76 09                	jbe    280afb <set_segmdesc+0x23>
		ar |= 0x8000;
  280af2:	81 cf 00 80 00 00    	or     $0x8000,%edi
		limit /= 0x1000;
  280af8:	c1 eb 0c             	shr    $0xc,%ebx
	}
	sd->limit_low = limit&0xffff;
	sd->base_low = base & 0xffff;
	sd->base_mid = (base>>16)&0xff;
  280afb:	89 ce                	mov    %ecx,%esi
	sd->limit_low = limit&0xffff;
  280afd:	66 89 1a             	mov    %bx,(%edx)
	sd->access_right = ar&0xff;
	sd->limit_high = ((limit>>16) & 0x0f)|((ar>>8)&0xf0);
  280b00:	c1 eb 10             	shr    $0x10,%ebx
	sd->base_mid = (base>>16)&0xff;
  280b03:	c1 fe 10             	sar    $0x10,%esi
	sd->base_low = base & 0xffff;
  280b06:	66 89 4a 02          	mov    %cx,0x2(%edx)
	sd->base_high = (base >> 24) & 0xff;
  280b0a:	c1 e9 18             	shr    $0x18,%ecx
	sd->base_mid = (base>>16)&0xff;
  280b0d:	89 f0                	mov    %esi,%eax
	sd->base_high = (base >> 24) & 0xff;
  280b0f:	88 4a 07             	mov    %cl,0x7(%edx)
	sd->base_mid = (base>>16)&0xff;
  280b12:	88 42 04             	mov    %al,0x4(%edx)
	sd->access_right = ar&0xff;
  280b15:	89 f8                	mov    %edi,%eax
  280b17:	88 42 05             	mov    %al,0x5(%edx)
	sd->limit_high = ((limit>>16) & 0x0f)|((ar>>8)&0xf0);
  280b1a:	89 f8                	mov    %edi,%eax
  280b1c:	c1 f8 08             	sar    $0x8,%eax
  280b1f:	83 e0 f0             	and    $0xfffffff0,%eax
  280b22:	09 d8                	or     %ebx,%eax
  280b24:	88 42 06             	mov    %al,0x6(%edx)
	return;
}
  280b27:	5b                   	pop    %ebx
  280b28:	5e                   	pop    %esi
  280b29:	5f                   	pop    %edi
  280b2a:	5d                   	pop    %ebp
  280b2b:	c3                   	ret    

00280b2c <set_gatedesc>:

void set_gatedesc(struct GATE_DESCRIPTOR *gd, int offset, int selector, int ar){
  280b2c:	55                   	push   %ebp
  280b2d:	89 e5                	mov    %esp,%ebp
  280b2f:	8b 45 08             	mov    0x8(%ebp),%eax
	gd->offset_low = offset & 0xffff;
	gd->selector = selector;
  280b32:	8b 4d 10             	mov    0x10(%ebp),%ecx
void set_gatedesc(struct GATE_DESCRIPTOR *gd, int offset, int selector, int ar){
  280b35:	8b 55 0c             	mov    0xc(%ebp),%edx
	gd->selector = selector;
  280b38:	66 89 48 02          	mov    %cx,0x2(%eax)
	gd->dw_count = (ar>>8)&0xff;
  280b3c:	8b 4d 14             	mov    0x14(%ebp),%ecx
	gd->offset_low = offset & 0xffff;
  280b3f:	66 89 10             	mov    %dx,(%eax)
	gd->access_right = (char)(ar & 0xff);
	gd->offset_high = (offset >> 16) & 0xffff;
  280b42:	c1 ea 10             	shr    $0x10,%edx
	gd->dw_count = (ar>>8)&0xff;
  280b45:	86 e9                	xchg   %ch,%cl
	gd->offset_high = (offset >> 16) & 0xffff;
  280b47:	66 89 50 06          	mov    %dx,0x6(%eax)
	gd->dw_count = (ar>>8)&0xff;
  280b4b:	66 89 48 04          	mov    %cx,0x4(%eax)
	return;
}
  280b4f:	5d                   	pop    %ebp
  280b50:	c3                   	ret    

00280b51 <init_gdtidt>:

void init_gdtidt(void){
  280b51:	55                   	push   %ebp
  280b52:	89 e5                	mov    %esp,%ebp
  280b54:	56                   	push   %esi
  280b55:	be 00 00 27 00       	mov    $0x270000,%esi
  280b5a:	53                   	push   %ebx
  280b5b:	e8 05 06 00 00       	call   281165 <__x86.get_pc_thunk.bx>
  280b60:	81 c3 70 27 00 00    	add    $0x2770,%ebx
	struct GATE_DESCRIPTOR *idt= (struct GATE_DESCRIPTOR*)0x0026f800;
	int i;

	//gdt initialize
	for(i=0; i<8192; i++){
		set_segmdesc(gdt+i, 0, 0, 0);
  280b66:	6a 00                	push   $0x0
  280b68:	6a 00                	push   $0x0
  280b6a:	6a 00                	push   $0x0
  280b6c:	56                   	push   %esi
	for(i=0; i<8192; i++){
  280b6d:	83 c6 08             	add    $0x8,%esi
		set_segmdesc(gdt+i, 0, 0, 0);
  280b70:	e8 63 ff ff ff       	call   280ad8 <set_segmdesc>
	for(i=0; i<8192; i++){
  280b75:	83 c4 10             	add    $0x10,%esp
  280b78:	81 fe 00 00 28 00    	cmp    $0x280000,%esi
  280b7e:	75 e6                	jne    280b66 <init_gdtidt+0x15>
	}
	set_segmdesc(gdt+1, 0xffffffff, 0x00000000, 0x4092);
  280b80:	68 92 40 00 00       	push   $0x4092
  280b85:	6a 00                	push   $0x0
  280b87:	6a ff                	push   $0xffffffff
  280b89:	68 08 00 27 00       	push   $0x270008
  280b8e:	e8 45 ff ff ff       	call   280ad8 <set_segmdesc>
	set_segmdesc(gdt+2, 0x000fffff, 0x00000000, 0x409a);
  280b93:	68 9a 40 00 00       	push   $0x409a
  280b98:	6a 00                	push   $0x0
  280b9a:	68 ff ff 0f 00       	push   $0xfffff
  280b9f:	68 10 00 27 00       	push   $0x270010
  280ba4:	e8 2f ff ff ff       	call   280ad8 <set_segmdesc>
	set_segmdesc(gdt+3, 0x000fffff, 0x00280000, 0x409a);
  280ba9:	83 c4 20             	add    $0x20,%esp
  280bac:	68 9a 40 00 00       	push   $0x409a
  280bb1:	68 00 00 28 00       	push   $0x280000
  280bb6:	68 ff ff 0f 00       	push   $0xfffff
  280bbb:	68 18 00 27 00       	push   $0x270018
  280bc0:	e8 13 ff ff ff       	call   280ad8 <set_segmdesc>
	
	load_gdtr(0xfff, 0x00270000);//??or 0xfff?
  280bc5:	5a                   	pop    %edx
  280bc6:	59                   	pop    %ecx
  280bc7:	68 00 00 27 00       	push   $0x270000
  280bcc:	68 ff 0f 00 00       	push   $0xfff
  280bd1:	e8 a5 01 00 00       	call   280d7b <load_gdtr>
  280bd6:	83 c4 10             	add    $0x10,%esp
  280bd9:	b8 00 f8 26 00       	mov    $0x26f800,%eax
	gd->offset_low = offset & 0xffff;
  280bde:	c7 00 00 00 00 00    	movl   $0x0,(%eax)


	//idt initialize
	for(i=0; i<256; i++){
  280be4:	83 c0 08             	add    $0x8,%eax
	gd->dw_count = (ar>>8)&0xff;
  280be7:	c7 40 fc 00 00 00 00 	movl   $0x0,-0x4(%eax)
	for(i=0; i<256; i++){
  280bee:	3d 00 00 27 00       	cmp    $0x270000,%eax
  280bf3:	75 e9                	jne    280bde <init_gdtidt+0x8d>
	gd->offset_high = (offset >> 16) & 0xffff;
  280bf5:	c7 c0 45 0d 28 00    	mov    $0x280d45,%eax
  280bfb:	ba 00 f8 26 00       	mov    $0x26f800,%edx
  280c00:	89 c1                	mov    %eax,%ecx
  280c02:	c1 e9 10             	shr    $0x10,%ecx
	gd->offset_low = offset & 0xffff;
  280c05:	66 89 02             	mov    %ax,(%edx)
		set_gatedesc(idt+i, 0, 0, 0);
	}

	for(i=0; i<256; i++){
  280c08:	83 c2 08             	add    $0x8,%edx
	gd->selector = selector;
  280c0b:	c7 42 fa 18 00 00 8e 	movl   $0x8e000018,-0x6(%edx)
	gd->offset_high = (offset >> 16) & 0xffff;
  280c12:	66 89 4a fe          	mov    %cx,-0x2(%edx)
	for(i=0; i<256; i++){
  280c16:	81 fa 00 00 27 00    	cmp    $0x270000,%edx
  280c1c:	75 e7                	jne    280c05 <init_gdtidt+0xb4>
	gd->selector = selector;
  280c1e:	c7 05 0a f9 26 00 18 	movl   $0x8e000018,0x26f90a
  280c25:	00 00 8e 
		set_gatedesc(idt+i, (int)asm_inthandler21, 3*8, 0x008e);
	}
	set_gatedesc(idt+0x21, (int)asm_inthandler21-0x280000, 3*8, 0x008e);
  280c28:	2d 00 00 28 00       	sub    $0x280000,%eax
	gd->offset_low = offset & 0xffff;
  280c2d:	66 a3 08 f9 26 00    	mov    %ax,0x26f908
	gd->offset_high = (offset >> 16) & 0xffff;
  280c33:	c1 e8 10             	shr    $0x10,%eax
  280c36:	66 a3 0e f9 26 00    	mov    %ax,0x26f90e
	gd->offset_low = offset & 0xffff;
  280c3c:	c7 c0 60 0d 28 00    	mov    $0x280d60,%eax
	gd->selector = selector;
  280c42:	c7 05 62 f9 26 00 10 	movl   $0x8e000010,0x26f962
  280c49:	00 00 8e 
	gd->offset_low = offset & 0xffff;
  280c4c:	66 a3 60 f9 26 00    	mov    %ax,0x26f960
	gd->offset_high = (offset >> 16) & 0xffff;
  280c52:	c1 e8 10             	shr    $0x10,%eax
  280c55:	66 a3 66 f9 26 00    	mov    %ax,0x26f966
	set_gatedesc(idt+0x2c, (int)asm_inthandler2c, 2*8, AR_INTGATE32);

	load_idtr(0x7ff, 0x0026f800);
  280c5b:	50                   	push   %eax
  280c5c:	50                   	push   %eax
  280c5d:	68 00 f8 26 00       	push   $0x26f800
  280c62:	68 ff 07 00 00       	push   $0x7ff
  280c67:	e8 1f 01 00 00       	call   280d8b <load_idtr>

	return;
  280c6c:	83 c4 10             	add    $0x10,%esp
}
  280c6f:	8d 65 f8             	lea    -0x8(%ebp),%esp
  280c72:	5b                   	pop    %ebx
  280c73:	5e                   	pop    %esi
  280c74:	5d                   	pop    %ebp
  280c75:	c3                   	ret    

00280c76 <init_pic>:

struct KEYBUF keybuf;
struct FIFO8 keyfifo;
struct FIFO8 mousefifo;

void init_pic(void){
  280c76:	55                   	push   %ebp
  280c77:	89 e5                	mov    %esp,%ebp
  280c79:	57                   	push   %edi
  280c7a:	56                   	push   %esi
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
  280c7b:	be ff ff ff ff       	mov    $0xffffffff,%esi
  280c80:	53                   	push   %ebx
  280c81:	bb 21 00 00 00       	mov    $0x21,%ebx
  280c86:	89 f0                	mov    %esi,%eax
  280c88:	89 da                	mov    %ebx,%edx
  280c8a:	ee                   	out    %al,(%dx)
  280c8b:	b9 a1 00 00 00       	mov    $0xa1,%ecx
  280c90:	89 ca                	mov    %ecx,%edx
  280c92:	ee                   	out    %al,(%dx)
  280c93:	bf 11 00 00 00       	mov    $0x11,%edi
  280c98:	ba 20 00 00 00       	mov    $0x20,%edx
  280c9d:	89 f8                	mov    %edi,%eax
  280c9f:	ee                   	out    %al,(%dx)
  280ca0:	b0 20                	mov    $0x20,%al
  280ca2:	89 da                	mov    %ebx,%edx
  280ca4:	ee                   	out    %al,(%dx)
  280ca5:	b0 04                	mov    $0x4,%al
  280ca7:	ee                   	out    %al,(%dx)
  280ca8:	b0 01                	mov    $0x1,%al
  280caa:	ee                   	out    %al,(%dx)
  280cab:	ba a0 00 00 00       	mov    $0xa0,%edx
  280cb0:	89 f8                	mov    %edi,%eax
  280cb2:	ee                   	out    %al,(%dx)
  280cb3:	b0 28                	mov    $0x28,%al
  280cb5:	89 ca                	mov    %ecx,%edx
  280cb7:	ee                   	out    %al,(%dx)
  280cb8:	b0 02                	mov    $0x2,%al
  280cba:	ee                   	out    %al,(%dx)
  280cbb:	b0 01                	mov    $0x1,%al
  280cbd:	ee                   	out    %al,(%dx)
  280cbe:	b0 fb                	mov    $0xfb,%al
  280cc0:	89 da                	mov    %ebx,%edx
  280cc2:	ee                   	out    %al,(%dx)
  280cc3:	89 f0                	mov    %esi,%eax
  280cc5:	89 ca                	mov    %ecx,%edx
  280cc7:	ee                   	out    %al,(%dx)

	outb(PIC0_IMR, 0xfb);
	outb(PIC1_IMR, 0xff);

	return;
}
  280cc8:	5b                   	pop    %ebx
  280cc9:	5e                   	pop    %esi
  280cca:	5f                   	pop    %edi
  280ccb:	5d                   	pop    %ebp
  280ccc:	c3                   	ret    

00280ccd <inthandler21>:


void inthandler21(int *esp){
  280ccd:	55                   	push   %ebp
  280cce:	b0 61                	mov    $0x61,%al
  280cd0:	ba 20 00 00 00       	mov    $0x20,%edx
  280cd5:	89 e5                	mov    %esp,%ebp
  280cd7:	53                   	push   %ebx
  280cd8:	e8 88 04 00 00       	call   281165 <__x86.get_pc_thunk.bx>
  280cdd:	81 c3 f3 25 00 00    	add    $0x25f3,%ebx
  280ce3:	83 ec 0c             	sub    $0xc,%esp
  280ce6:	ee                   	out    %al,(%dx)
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
  280ce7:	ba 60 00 00 00       	mov    $0x60,%edx
  280cec:	ec                   	in     (%dx),%al
		keybuf.next_w++;
		if(keybuf.next_w==32){
			keybuf.next_w=0;
		}
	}*/
	fifo8_put(&keyfifo, data);
  280ced:	0f be c0             	movsbl %al,%eax
  280cf0:	50                   	push   %eax
  280cf1:	8d 83 28 00 00 00    	lea    0x28(%ebx),%eax
  280cf7:	50                   	push   %eax
  280cf8:	e8 c9 00 00 00       	call   280dc6 <fifo8_put>

//	sprintf(s, "%x", data);
//	boxfill8(binfo->vram, binfo->scrnx, COL8_000084, 0, 16, 15, 31);
//	putfonts8_asc(binfo->vram, binfo->scrnx, 0, 16, COL8_FFFFFF, s);
	return;
}
  280cfd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
	return;
  280d00:	83 c4 10             	add    $0x10,%esp
}
  280d03:	c9                   	leave  
  280d04:	c3                   	ret    

00280d05 <inthandler2c>:
		}
	}
	return;
}
*/
void inthandler2c(int *esp){
  280d05:	55                   	push   %ebp
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
  280d06:	b0 64                	mov    $0x64,%al
  280d08:	ba a0 00 00 00       	mov    $0xa0,%edx
  280d0d:	89 e5                	mov    %esp,%ebp
  280d0f:	53                   	push   %ebx
  280d10:	e8 50 04 00 00       	call   281165 <__x86.get_pc_thunk.bx>
  280d15:	81 c3 bb 25 00 00    	add    $0x25bb,%ebx
  280d1b:	83 ec 0c             	sub    $0xc,%esp
  280d1e:	ee                   	out    %al,(%dx)
  280d1f:	b0 62                	mov    $0x62,%al
  280d21:	ba 20 00 00 00       	mov    $0x20,%edx
  280d26:	ee                   	out    %al,(%dx)
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
  280d27:	ba 60 00 00 00       	mov    $0x60,%edx
  280d2c:	ec                   	in     (%dx),%al
	unsigned char data;
	outb(PIC1_OCW2, 0x64);
	outb(PIC0_OCW2, 0X62);
	data = inb(PORT_KEYDAT);
	fifo8_put(&mousefifo, data);
  280d2d:	0f be c0             	movsbl %al,%eax
  280d30:	50                   	push   %eax
  280d31:	8d 83 10 00 00 00    	lea    0x10(%ebx),%eax
  280d37:	50                   	push   %eax
  280d38:	e8 89 00 00 00       	call   280dc6 <fifo8_put>
	putfonts8_asc(binfo->vram, binfo->scrnx, 0, 0, COL8_FFFFFF, "INT 2C (IRQ-12): PS/2 mouse");
	for(;;){
		io_hlt();
	}
	*/
}
  280d3d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
	return;
  280d40:	83 c4 10             	add    $0x10,%esp
}
  280d43:	c9                   	leave  
  280d44:	c3                   	ret    

00280d45 <asm_inthandler21>:
.global load_gdtr 
.global load_idtr

.code32
asm_inthandler21:
  pushw %es
  280d45:	66 06                	pushw  %es
  pushw %ds
  280d47:	66 1e                	pushw  %ds
  pushal
  280d49:	60                   	pusha  
  movl %esp,%eax
  280d4a:	89 e0                	mov    %esp,%eax
  pushl %eax
  280d4c:	50                   	push   %eax
  movw %ss,%ax
  280d4d:	66 8c d0             	mov    %ss,%ax
  movw %ax,%ds
  280d50:	8e d8                	mov    %eax,%ds
  movw %ax,%es
  280d52:	8e c0                	mov    %eax,%es
  call inthandler21
  280d54:	e8 74 ff ff ff       	call   280ccd <inthandler21>
  
  popl %eax
  280d59:	58                   	pop    %eax
  popal
  280d5a:	61                   	popa   
  popw %ds
  280d5b:	66 1f                	popw   %ds
  popW %es
  280d5d:	66 07                	popw   %es
  iretl
  280d5f:	cf                   	iret   

00280d60 <asm_inthandler2c>:

asm_inthandler2c:
	pushw %es
  280d60:	66 06                	pushw  %es
	pushw %ds
  280d62:	66 1e                	pushw  %ds
	pushal
  280d64:	60                   	pusha  
	movl %esp, %eax
  280d65:	89 e0                	mov    %esp,%eax
	pushl %eax
  280d67:	50                   	push   %eax
	movw %ss, %ax
  280d68:	66 8c d0             	mov    %ss,%ax
	movw %ax, %ds
  280d6b:	8e d8                	mov    %eax,%ds
	movw %ax, %es
  280d6d:	8e c0                	mov    %eax,%es
	call inthandler2c
  280d6f:	e8 91 ff ff ff       	call   280d05 <inthandler2c>

	popl %eax
  280d74:	58                   	pop    %eax
	popal
  280d75:	61                   	popa   
	popw %ds
  280d76:	66 1f                	popw   %ds
	popw %es
  280d78:	66 07                	popw   %es
	iretl
  280d7a:	cf                   	iret   

00280d7b <load_gdtr>:


load_gdtr:		#; void load_gdtr(int limit, int addr);
  mov 4(%esp) ,%ax
  280d7b:	66 8b 44 24 04       	mov    0x4(%esp),%ax
  mov %ax,6(%esp)
  280d80:	66 89 44 24 06       	mov    %ax,0x6(%esp)
  lgdt 6(%esp)
  280d85:	0f 01 54 24 06       	lgdtl  0x6(%esp)
  ret
  280d8a:	c3                   	ret    

00280d8b <load_idtr>:


load_idtr:		#; void load_idtr(int limit, int addr);
  mov 4(%esp) ,%ax
  280d8b:	66 8b 44 24 04       	mov    0x4(%esp),%ax
  mov %ax,6(%esp)
  280d90:	66 89 44 24 06       	mov    %ax,0x6(%esp)
  lidt 6(%esp)
  280d95:	0f 01 5c 24 06       	lidtl  0x6(%esp)
  ret
  280d9a:	c3                   	ret    

00280d9b <fifo8_init>:
 * ==================================================
 */
#include <header.h>
#define FLAGS_OVERRUN 0x0001

void fifo8_init(struct FIFO8* fifo, int size, unsigned char *buf){
  280d9b:	55                   	push   %ebp
  280d9c:	89 e5                	mov    %esp,%ebp
  280d9e:	8b 45 08             	mov    0x8(%ebp),%eax
  280da1:	8b 55 0c             	mov    0xc(%ebp),%edx
	fifo->size = size;
	fifo->buf = buf;
  280da4:	8b 4d 10             	mov    0x10(%ebp),%ecx
	fifo->size = size;
  280da7:	89 50 0c             	mov    %edx,0xc(%eax)
	fifo->buf = buf;
  280daa:	89 08                	mov    %ecx,(%eax)
	fifo->free = size;
  280dac:	89 50 10             	mov    %edx,0x10(%eax)
	fifo->flags = 0;
  280daf:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
	fifo->p = 0;
  280db6:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	fifo->q = 0;
  280dbd:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
	return;
}
  280dc4:	5d                   	pop    %ebp
  280dc5:	c3                   	ret    

00280dc6 <fifo8_put>:

int fifo8_put(struct FIFO8* fifo, char data){
  280dc6:	55                   	push   %ebp
  280dc7:	89 e5                	mov    %esp,%ebp
  280dc9:	53                   	push   %ebx
  280dca:	8b 45 08             	mov    0x8(%ebp),%eax
  280dcd:	8b 5d 0c             	mov    0xc(%ebp),%ebx
	if(fifo->free==0){
  280dd0:	83 78 10 00          	cmpl   $0x0,0x10(%eax)
  280dd4:	75 09                	jne    280ddf <fifo8_put+0x19>
		fifo->flags |= FLAGS_OVERRUN;
  280dd6:	83 48 14 01          	orl    $0x1,0x14(%eax)
		return -1;
  280dda:	83 c8 ff             	or     $0xffffffff,%eax
  280ddd:	eb 22                	jmp    280e01 <fifo8_put+0x3b>
	}
	fifo->buf[fifo->p] = data;
  280ddf:	8b 50 04             	mov    0x4(%eax),%edx
  280de2:	8b 08                	mov    (%eax),%ecx
  280de4:	88 1c 11             	mov    %bl,(%ecx,%edx,1)
	fifo->p++;
  280de7:	8b 48 04             	mov    0x4(%eax),%ecx
  280dea:	8d 51 01             	lea    0x1(%ecx),%edx
  280ded:	89 50 04             	mov    %edx,0x4(%eax)
	if(fifo->p == fifo->size){
  280df0:	3b 50 0c             	cmp    0xc(%eax),%edx
  280df3:	75 07                	jne    280dfc <fifo8_put+0x36>
		fifo->p=0;
  280df5:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	}
	fifo->free--;
  280dfc:	ff 48 10             	decl   0x10(%eax)
	return 0;
  280dff:	31 c0                	xor    %eax,%eax
}
  280e01:	5b                   	pop    %ebx
  280e02:	5d                   	pop    %ebp
  280e03:	c3                   	ret    

00280e04 <fifo8_get>:

int fifo8_get(struct FIFO8* fifo){
  280e04:	55                   	push   %ebp
  280e05:	89 e5                	mov    %esp,%ebp
  280e07:	56                   	push   %esi
  280e08:	8b 55 08             	mov    0x8(%ebp),%edx
  280e0b:	53                   	push   %ebx
  280e0c:	83 cb ff             	or     $0xffffffff,%ebx
	int data;
	if(fifo->free==fifo->size){
  280e0f:	8b 4a 10             	mov    0x10(%edx),%ecx
  280e12:	8b 72 0c             	mov    0xc(%edx),%esi
  280e15:	39 f1                	cmp    %esi,%ecx
  280e17:	74 1b                	je     280e34 <fifo8_get+0x30>
		return -1;
	}
	data = fifo->buf[fifo->q];
  280e19:	8b 42 08             	mov    0x8(%edx),%eax
  280e1c:	8b 1a                	mov    (%edx),%ebx
  280e1e:	0f b6 1c 03          	movzbl (%ebx,%eax,1),%ebx
	fifo->q++;
  280e22:	40                   	inc    %eax
  280e23:	39 c6                	cmp    %eax,%esi
  280e25:	be 00 00 00 00       	mov    $0x0,%esi
  280e2a:	0f 44 c6             	cmove  %esi,%eax
	if(fifo->q==fifo->size){
		fifo->q=0;
	}
	fifo->free++;
  280e2d:	41                   	inc    %ecx
  280e2e:	89 4a 10             	mov    %ecx,0x10(%edx)
	fifo->q++;
  280e31:	89 42 08             	mov    %eax,0x8(%edx)
	return data;
}
  280e34:	89 d8                	mov    %ebx,%eax
  280e36:	5b                   	pop    %ebx
  280e37:	5e                   	pop    %esi
  280e38:	5d                   	pop    %ebp
  280e39:	c3                   	ret    

00280e3a <fifo8_status>:

int fifo8_status(struct FIFO8* fifo){
  280e3a:	55                   	push   %ebp
  280e3b:	89 e5                	mov    %esp,%ebp
  280e3d:	8b 55 08             	mov    0x8(%ebp),%edx
	return fifo->size-fifo->free;
}
  280e40:	5d                   	pop    %ebp
	return fifo->size-fifo->free;
  280e41:	8b 42 0c             	mov    0xc(%edx),%eax
  280e44:	2b 42 10             	sub    0x10(%edx),%eax
}
  280e47:	c3                   	ret    

00280e48 <wait_KBC_sendready>:
  280e48:	ba 64 00 00 00       	mov    $0x64,%edx
  280e4d:	ec                   	in     (%dx),%al
 * ==================================================
 */
#include <header.h>
void wait_KBC_sendready(void){
	for(;;){
		if((inb(PORT_KEYSTA) & KEYSTA_SEND_NOTREADY)==0){
  280e4e:	a8 02                	test   $0x2,%al
  280e50:	75 fb                	jne    280e4d <wait_KBC_sendready+0x5>
			break;
		}
	}
	return;
}
  280e52:	c3                   	ret    

00280e53 <init_keyboard>:

void init_keyboard(void){
  280e53:	55                   	push   %ebp
  280e54:	89 e5                	mov    %esp,%ebp
  280e56:	83 ec 08             	sub    $0x8,%esp
	wait_KBC_sendready();
  280e59:	e8 ea ff ff ff       	call   280e48 <wait_KBC_sendready>
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
  280e5e:	b0 60                	mov    $0x60,%al
  280e60:	ba 64 00 00 00       	mov    $0x64,%edx
  280e65:	ee                   	out    %al,(%dx)
	outb(PORT_KEYCMD, KEYCMD_WRITE_MODE);
	wait_KBC_sendready();
  280e66:	e8 dd ff ff ff       	call   280e48 <wait_KBC_sendready>
  280e6b:	b0 47                	mov    $0x47,%al
  280e6d:	ba 60 00 00 00       	mov    $0x60,%edx
  280e72:	ee                   	out    %al,(%dx)
	outb(PORT_KEYDAT, KBC_MODE);
	return;
}
  280e73:	c9                   	leave  
  280e74:	c3                   	ret    

00280e75 <enable_mouse>:
	wait_KBC_sendready();
	outb(PORT_KEYDAT, MOUSECMD_ENABLE);
	return;
}
*/
void enable_mouse(struct MOUSE_DEC *mdec)      {
  280e75:	55                   	push   %ebp
  280e76:	89 e5                	mov    %esp,%ebp
  280e78:	83 ec 08             	sub    $0x8,%esp
	wait_KBC_sendready();
  280e7b:	e8 c8 ff ff ff       	call   280e48 <wait_KBC_sendready>
  280e80:	b0 d4                	mov    $0xd4,%al
  280e82:	ba 64 00 00 00       	mov    $0x64,%edx
  280e87:	ee                   	out    %al,(%dx)
	outb(PORT_KEYCMD, KEYCMD_SENDTO_MOUSE);
	wait_KBC_sendready();
  280e88:	e8 bb ff ff ff       	call   280e48 <wait_KBC_sendready>
  280e8d:	b0 f4                	mov    $0xf4,%al
  280e8f:	ba 60 00 00 00       	mov    $0x60,%edx
  280e94:	ee                   	out    %al,(%dx)
	outb(PORT_KEYDAT, MOUSECMD_ENABLE);
	mdec->phase = 0;
  280e95:	8b 45 08             	mov    0x8(%ebp),%eax
  280e98:	c6 40 03 00          	movb   $0x0,0x3(%eax)
	return;
}
  280e9c:	c9                   	leave  
  280e9d:	c3                   	ret    

00280e9e <mouse_decode>:

int mouse_decode(struct MOUSE_DEC *mdec, unsigned char dat){
  280e9e:	55                   	push   %ebp
  280e9f:	89 e5                	mov    %esp,%ebp
  280ea1:	53                   	push   %ebx
  280ea2:	8b 45 08             	mov    0x8(%ebp),%eax
  280ea5:	8b 55 0c             	mov    0xc(%ebp),%edx
	if(mdec->phase==0){
  280ea8:	8a 58 03             	mov    0x3(%eax),%bl
  280eab:	84 db                	test   %bl,%bl
  280ead:	75 0d                	jne    280ebc <mouse_decode+0x1e>
		if(dat==0xfa){
			mdec->phase=1;
		}
		return 0;
  280eaf:	31 c9                	xor    %ecx,%ecx
		if(dat==0xfa){
  280eb1:	80 fa fa             	cmp    $0xfa,%dl
  280eb4:	75 79                	jne    280f2f <mouse_decode+0x91>
			mdec->phase=1;
  280eb6:	c6 40 03 01          	movb   $0x1,0x3(%eax)
  280eba:	eb 73                	jmp    280f2f <mouse_decode+0x91>
	}
	if(mdec->phase==1){
  280ebc:	80 fb 01             	cmp    $0x1,%bl
  280ebf:	75 14                	jne    280ed5 <mouse_decode+0x37>
		if((dat&0xc8)==0x08){
  280ec1:	89 d3                	mov    %edx,%ebx
		return 0;
  280ec3:	31 c9                	xor    %ecx,%ecx
		if((dat&0xc8)==0x08){
  280ec5:	83 e3 c8             	and    $0xffffffc8,%ebx
  280ec8:	80 fb 08             	cmp    $0x8,%bl
  280ecb:	75 62                	jne    280f2f <mouse_decode+0x91>
			mdec->buf[0]=dat;
  280ecd:	88 10                	mov    %dl,(%eax)
			mdec->phase=2;
  280ecf:	c6 40 03 02          	movb   $0x2,0x3(%eax)
  280ed3:	eb 5a                	jmp    280f2f <mouse_decode+0x91>
		}
		return 0;
	}
	if(mdec->phase==2){
  280ed5:	80 fb 02             	cmp    $0x2,%bl
  280ed8:	75 0b                	jne    280ee5 <mouse_decode+0x47>
		mdec->buf[1]=dat;
  280eda:	88 50 01             	mov    %dl,0x1(%eax)
		mdec->phase=3;
		return 0;
  280edd:	31 c9                	xor    %ecx,%ecx
		mdec->phase=3;
  280edf:	c6 40 03 03          	movb   $0x3,0x3(%eax)
		return 0;
  280ee3:	eb 4a                	jmp    280f2f <mouse_decode+0x91>
			mdec->y |= 0xffffff00;
		}
		mdec->y = - mdec->y;
		return 1;
	}
	return -1;
  280ee5:	83 c9 ff             	or     $0xffffffff,%ecx
	if(mdec->phase==3){
  280ee8:	80 fb 03             	cmp    $0x3,%bl
  280eeb:	75 42                	jne    280f2f <mouse_decode+0x91>
		mdec->btn=mdec->buf[0]&0x07;
  280eed:	8a 18                	mov    (%eax),%bl
		mdec->buf[2]=dat;
  280eef:	88 50 02             	mov    %dl,0x2(%eax)
		mdec->y=mdec->buf[2];
  280ef2:	0f b6 d2             	movzbl %dl,%edx
		mdec->phase=1;
  280ef5:	c6 40 03 01          	movb   $0x1,0x3(%eax)
		mdec->btn=mdec->buf[0]&0x07;
  280ef9:	89 d9                	mov    %ebx,%ecx
		mdec->y=mdec->buf[2];
  280efb:	89 50 08             	mov    %edx,0x8(%eax)
		mdec->btn=mdec->buf[0]&0x07;
  280efe:	83 e1 07             	and    $0x7,%ecx
  280f01:	89 48 0c             	mov    %ecx,0xc(%eax)
		mdec->x=mdec->buf[1];
  280f04:	0f b6 48 01          	movzbl 0x1(%eax),%ecx
  280f08:	89 48 04             	mov    %ecx,0x4(%eax)
		if((mdec->buf[0]&0x10)!=0){
  280f0b:	f6 c3 10             	test   $0x10,%bl
  280f0e:	74 09                	je     280f19 <mouse_decode+0x7b>
			mdec->x |= 0xffffff00;
  280f10:	81 c9 00 ff ff ff    	or     $0xffffff00,%ecx
  280f16:	89 48 04             	mov    %ecx,0x4(%eax)
		if((mdec->buf[0]&0x20)!=0){
  280f19:	80 e3 20             	and    $0x20,%bl
  280f1c:	74 09                	je     280f27 <mouse_decode+0x89>
			mdec->y |= 0xffffff00;
  280f1e:	81 ca 00 ff ff ff    	or     $0xffffff00,%edx
  280f24:	89 50 08             	mov    %edx,0x8(%eax)
		mdec->y = - mdec->y;
  280f27:	f7 58 08             	negl   0x8(%eax)
		return 1;
  280f2a:	b9 01 00 00 00       	mov    $0x1,%ecx
}
  280f2f:	89 c8                	mov    %ecx,%eax
  280f31:	5b                   	pop    %ebx
  280f32:	5d                   	pop    %ebp
  280f33:	c3                   	ret    

00280f34 <memtest_sub>:
		store_cr0(cr0);
	}
	return i;
}

unsigned int memtest_sub(unsigned int start, unsigned int end){
  280f34:	55                   	push   %ebp
  280f35:	89 e5                	mov    %esp,%ebp
  280f37:	53                   	push   %ebx
	unsigned int i, old, pat0=0xaa55aa55, pat1=0x55aa55aa;
	volatile unsigned int *p;
	for(i=start; i<=end; i+=0x1000){
  280f38:	8b 45 08             	mov    0x8(%ebp),%eax
  280f3b:	3b 45 0c             	cmp    0xc(%ebp),%eax
  280f3e:	77 5b                	ja     280f9b <memtest_sub+0x67>
		p = (unsigned int *)(i+0xffc);
		old = *p;
  280f40:	8b 98 fc 0f 00 00    	mov    0xffc(%eax),%ebx
  280f46:	8d 88 fc 0f 00 00    	lea    0xffc(%eax),%ecx
		*p = pat0;
  280f4c:	c7 80 fc 0f 00 00 55 	movl   $0xaa55aa55,0xffc(%eax)
  280f53:	aa 55 aa 
		*p ^= 0xffffffff;
  280f56:	8b 90 fc 0f 00 00    	mov    0xffc(%eax),%edx
  280f5c:	f7 d2                	not    %edx
  280f5e:	89 90 fc 0f 00 00    	mov    %edx,0xffc(%eax)
		if(*p!=pat1){
  280f64:	8b 90 fc 0f 00 00    	mov    0xffc(%eax),%edx
  280f6a:	81 fa aa 55 aa 55    	cmp    $0x55aa55aa,%edx
  280f70:	74 04                	je     280f76 <memtest_sub+0x42>
not_memory:
			*p = old;
  280f72:	89 19                	mov    %ebx,(%ecx)
			break;
  280f74:	eb 25                	jmp    280f9b <memtest_sub+0x67>
		}
		*p ^= 0xffffffff;
  280f76:	8b 90 fc 0f 00 00    	mov    0xffc(%eax),%edx
  280f7c:	f7 d2                	not    %edx
  280f7e:	89 90 fc 0f 00 00    	mov    %edx,0xffc(%eax)
		if(*p!=pat0){
  280f84:	8b 90 fc 0f 00 00    	mov    0xffc(%eax),%edx
  280f8a:	81 fa 55 aa 55 aa    	cmp    $0xaa55aa55,%edx
  280f90:	75 e0                	jne    280f72 <memtest_sub+0x3e>
			goto not_memory;
		}
		*p = old;
  280f92:	89 19                	mov    %ebx,(%ecx)
	for(i=start; i<=end; i+=0x1000){
  280f94:	05 00 10 00 00       	add    $0x1000,%eax
  280f99:	eb a0                	jmp    280f3b <memtest_sub+0x7>
	}
	return i;
}
  280f9b:	5b                   	pop    %ebx
  280f9c:	5d                   	pop    %ebp
  280f9d:	c3                   	ret    

00280f9e <memtest>:
unsigned int memtest(unsigned int start, unsigned int end){
  280f9e:	55                   	push   %ebp
  280f9f:	89 e5                	mov    %esp,%ebp
  280fa1:	53                   	push   %ebx
  280fa2:	52                   	push   %edx
        __asm __volatile("pushfl; popl %0" : "=r" (eflags));
  280fa3:	9c                   	pushf  
  280fa4:	58                   	pop    %eax
	eflg |= EFLAGS_AC_BIT;
  280fa5:	0d 00 00 04 00       	or     $0x40000,%eax
        __asm __volatile("pushl %0; popfl" : : "r" (eflags));
  280faa:	50                   	push   %eax
  280fab:	9d                   	popf   
        __asm __volatile("pushfl; popl %0" : "=r" (eflags));
  280fac:	9c                   	pushf  
  280fad:	58                   	pop    %eax
	if((eflg & EFLAGS_AC_BIT)!=0){
  280fae:	89 c3                	mov    %eax,%ebx
	eflg &= ~EFLAGS_AC_BIT;
  280fb0:	25 ff ff fb ff       	and    $0xfffbffff,%eax
	if((eflg & EFLAGS_AC_BIT)!=0){
  280fb5:	81 e3 00 00 04 00    	and    $0x40000,%ebx
        __asm __volatile("pushl %0; popfl" : : "r" (eflags));
  280fbb:	50                   	push   %eax
  280fbc:	9d                   	popf   
	if(flg486!=0){
  280fbd:	85 db                	test   %ebx,%ebx
  280fbf:	74 0b                	je     280fcc <memtest+0x2e>
	__asm __volatile("movl %%cr0,%0" : "=r" (val));
  280fc1:	0f 20 c0             	mov    %cr0,%eax
		cr0 |= CR0_CACHE_DISABLE;
  280fc4:	0d 00 00 00 60       	or     $0x60000000,%eax
	__asm __volatile("movl %0,%%cr0" : : "r" (val));
  280fc9:	0f 22 c0             	mov    %eax,%cr0
	i=memtest_sub(start, end);
  280fcc:	50                   	push   %eax
  280fcd:	50                   	push   %eax
  280fce:	ff 75 0c             	push   0xc(%ebp)
  280fd1:	ff 75 08             	push   0x8(%ebp)
  280fd4:	e8 5b ff ff ff       	call   280f34 <memtest_sub>
	if(flg486!=0){
  280fd9:	83 c4 10             	add    $0x10,%esp
  280fdc:	85 db                	test   %ebx,%ebx
  280fde:	74 0c                	je     280fec <memtest+0x4e>
	__asm __volatile("movl %%cr0,%0" : "=r" (val));
  280fe0:	0f 20 c2             	mov    %cr0,%edx
		cr0 &= ~CR0_CACHE_DISABLE;
  280fe3:	81 e2 ff ff ff 9f    	and    $0x9fffffff,%edx
	__asm __volatile("movl %0,%%cr0" : : "r" (val));
  280fe9:	0f 22 c2             	mov    %edx,%cr0
}
  280fec:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  280fef:	c9                   	leave  
  280ff0:	c3                   	ret    

00280ff1 <memman_init>:

void memman_init(struct MEMMAN *man){
  280ff1:	55                   	push   %ebp
  280ff2:	89 e5                	mov    %esp,%ebp
  280ff4:	8b 45 08             	mov    0x8(%ebp),%eax
	man->frees = 0;
  280ff7:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	man->maxfrees = 0;
  280ffd:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	man->lostsize = 0;
  281004:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
	man->losts = 0;
  28100b:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
	return;
}
  281012:	5d                   	pop    %ebp
  281013:	c3                   	ret    

00281014 <memman_total>:

unsigned int memman_total(struct MEMMAN *man){
  281014:	55                   	push   %ebp
	unsigned int i, t=0;
  281015:	31 d2                	xor    %edx,%edx
	for(i=0; i<man->frees; i++){
  281017:	31 c0                	xor    %eax,%eax
unsigned int memman_total(struct MEMMAN *man){
  281019:	89 e5                	mov    %esp,%ebp
  28101b:	53                   	push   %ebx
  28101c:	8b 4d 08             	mov    0x8(%ebp),%ecx
	for(i=0; i<man->frees; i++){
  28101f:	8b 19                	mov    (%ecx),%ebx
  281021:	39 c3                	cmp    %eax,%ebx
  281023:	74 07                	je     28102c <memman_total+0x18>
		t += man->free[i].size;
  281025:	03 54 c1 14          	add    0x14(%ecx,%eax,8),%edx
	for(i=0; i<man->frees; i++){
  281029:	40                   	inc    %eax
  28102a:	eb f5                	jmp    281021 <memman_total+0xd>
	}
	return t;
}
  28102c:	89 d0                	mov    %edx,%eax
  28102e:	5b                   	pop    %ebx
  28102f:	5d                   	pop    %ebp
  281030:	c3                   	ret    

00281031 <memman_alloc>:

unsigned int memman_alloc(struct MEMMAN *man, unsigned int size){
  281031:	55                   	push   %ebp
  281032:	89 e5                	mov    %esp,%ebp
  281034:	57                   	push   %edi
  281035:	56                   	push   %esi
  281036:	53                   	push   %ebx
  281037:	83 ec 1c             	sub    $0x1c,%esp
  28103a:	8b 55 08             	mov    0x8(%ebp),%edx
	unsigned int i, a;
	for(i=0; i<man->frees; i++){
  28103d:	8b 02                	mov    (%edx),%eax
  28103f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  281042:	31 c0                	xor    %eax,%eax
  281044:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
  281047:	74 3b                	je     281084 <memman_alloc+0x53>
		if(man->free[i].size >= size){
  281049:	8b 4c c2 14          	mov    0x14(%edx,%eax,8),%ecx
  28104d:	3b 4d 0c             	cmp    0xc(%ebp),%ecx
  281050:	72 2f                	jb     281081 <memman_alloc+0x50>
  281052:	8d 34 c2             	lea    (%edx,%eax,8),%esi
			a = man->free[i].addr;
			man->free[i].addr += size;
  281055:	8b 7d 0c             	mov    0xc(%ebp),%edi
			a = man->free[i].addr;
  281058:	8b 5e 10             	mov    0x10(%esi),%ebx
			man->free[i].addr += size;
  28105b:	01 df                	add    %ebx,%edi
			man->free[i].size -= size;
  28105d:	2b 4d 0c             	sub    0xc(%ebp),%ecx
			man->free[i].addr += size;
  281060:	89 7e 10             	mov    %edi,0x10(%esi)
			man->free[i].size -= size;
  281063:	89 4e 14             	mov    %ecx,0x14(%esi)
			if(man->free[i].size ==0){
  281066:	75 1e                	jne    281086 <memman_alloc+0x55>
				man->frees--;
  281068:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  28106b:	49                   	dec    %ecx
  28106c:	89 0a                	mov    %ecx,(%edx)
				for(; i<man->frees; i++){
  28106e:	39 c1                	cmp    %eax,%ecx
  281070:	76 14                	jbe    281086 <memman_alloc+0x55>
					man->free[i] = man->free[i+1];
  281072:	40                   	inc    %eax
  281073:	f3 0f 7e 44 c2 10    	movq   0x10(%edx,%eax,8),%xmm0
  281079:	66 0f d6 44 c2 08    	movq   %xmm0,0x8(%edx,%eax,8)
  28107f:	eb ed                	jmp    28106e <memman_alloc+0x3d>
	for(i=0; i<man->frees; i++){
  281081:	40                   	inc    %eax
  281082:	eb c0                	jmp    281044 <memman_alloc+0x13>
				}
			}
			return a;
		}
	}
	return 0;
  281084:	31 db                	xor    %ebx,%ebx
}
  281086:	83 c4 1c             	add    $0x1c,%esp
  281089:	89 d8                	mov    %ebx,%eax
  28108b:	5b                   	pop    %ebx
  28108c:	5e                   	pop    %esi
  28108d:	5f                   	pop    %edi
  28108e:	5d                   	pop    %ebp
  28108f:	c3                   	ret    

00281090 <memman_free>:

int memman_free(struct MEMMAN *man, unsigned int addr, unsigned int size){
  281090:	55                   	push   %ebp
	int i, j;
	for(i=0; i<man->frees; i++){
  281091:	31 c9                	xor    %ecx,%ecx
int memman_free(struct MEMMAN *man, unsigned int addr, unsigned int size){
  281093:	89 e5                	mov    %esp,%ebp
  281095:	57                   	push   %edi
  281096:	8b 45 08             	mov    0x8(%ebp),%eax
  281099:	56                   	push   %esi
  28109a:	53                   	push   %ebx
	for(i=0; i<man->frees; i++){
  28109b:	8b 10                	mov    (%eax),%edx
  28109d:	39 ca                	cmp    %ecx,%edx
  28109f:	7e 10                	jle    2810b1 <memman_free+0x21>
		if(man->free[i].addr > addr){
  2810a1:	8b 75 0c             	mov    0xc(%ebp),%esi
  2810a4:	39 74 c8 10          	cmp    %esi,0x10(%eax,%ecx,8)
  2810a8:	0f 87 a9 00 00 00    	ja     281157 <memman_free+0xc7>
	for(i=0; i<man->frees; i++){
  2810ae:	41                   	inc    %ecx
  2810af:	eb ec                	jmp    28109d <memman_free+0xd>
			break;
		}
	}
	if(i>0){
  2810b1:	85 c9                	test   %ecx,%ecx
  2810b3:	74 41                	je     2810f6 <memman_free+0x66>
  2810b5:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
		if(man->free[i-1].addr + man->free[i-1].size == addr){
  2810b8:	8b 5e 0c             	mov    0xc(%esi),%ebx
  2810bb:	8b 7e 08             	mov    0x8(%esi),%edi
  2810be:	01 df                	add    %ebx,%edi
  2810c0:	3b 7d 0c             	cmp    0xc(%ebp),%edi
  2810c3:	75 4c                	jne    281111 <memman_free+0x81>
			man->free[i-1].size += size;
  2810c5:	03 5d 10             	add    0x10(%ebp),%ebx
  2810c8:	89 5e 0c             	mov    %ebx,0xc(%esi)
			if(i<man->frees){
  2810cb:	39 ca                	cmp    %ecx,%edx
  2810cd:	7e 42                	jle    281111 <memman_free+0x81>
				if(addr+size == man->free[i].addr){
  2810cf:	8b 7d 10             	mov    0x10(%ebp),%edi
  2810d2:	03 7d 0c             	add    0xc(%ebp),%edi
  2810d5:	3b 7e 10             	cmp    0x10(%esi),%edi
  2810d8:	75 37                	jne    281111 <memman_free+0x81>
					man->free[i-1].size += man->free[i].size;
  2810da:	03 5e 14             	add    0x14(%esi),%ebx
					man->frees--;
  2810dd:	4a                   	dec    %edx
					man->free[i-1].size += man->free[i].size;
  2810de:	89 5e 0c             	mov    %ebx,0xc(%esi)
					man->frees--;
  2810e1:	89 10                	mov    %edx,(%eax)
					for(; i<man->frees; i++){
  2810e3:	39 ca                	cmp    %ecx,%edx
  2810e5:	7e 2a                	jle    281111 <memman_free+0x81>
						man->free[i] = man->free[i+1];
  2810e7:	41                   	inc    %ecx
  2810e8:	f3 0f 7e 44 c8 10    	movq   0x10(%eax,%ecx,8),%xmm0
  2810ee:	66 0f d6 44 c8 08    	movq   %xmm0,0x8(%eax,%ecx,8)
  2810f4:	eb ed                	jmp    2810e3 <memman_free+0x53>
				}
			}
		}
		return 0;
	}
	if(i<man->frees){
  2810f6:	85 d2                	test   %edx,%edx
  2810f8:	7e 38                	jle    281132 <memman_free+0xa2>
		if(addr+size == man->free[i].addr){
  2810fa:	8b 7d 10             	mov    0x10(%ebp),%edi
  2810fd:	03 7d 0c             	add    0xc(%ebp),%edi
  281100:	3b 78 10             	cmp    0x10(%eax),%edi
  281103:	75 10                	jne    281115 <memman_free+0x85>
			man->free[i].addr = addr;
  281105:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  281108:	89 58 10             	mov    %ebx,0x10(%eax)
			man->free[i].size += size;
  28110b:	8b 5d 10             	mov    0x10(%ebp),%ebx
  28110e:	01 58 14             	add    %ebx,0x14(%eax)
			return 0;
  281111:	31 c0                	xor    %eax,%eax
  281113:	eb 4b                	jmp    281160 <memman_free+0xd0>
		}
	}
	if(man->frees < MEMMAN_FREES){
  281115:	81 fa f9 0f 00 00    	cmp    $0xff9,%edx
  28111b:	7f 2c                	jg     281149 <memman_free+0xb9>
  28111d:	89 d1                	mov    %edx,%ecx
		for(j=man->frees; j>i; j--){
  28111f:	85 c9                	test   %ecx,%ecx
  281121:	7e 0f                	jle    281132 <memman_free+0xa2>
			man->free[j] = man->free[j-1];
  281123:	49                   	dec    %ecx
  281124:	f3 0f 7e 44 c8 10    	movq   0x10(%eax,%ecx,8),%xmm0
  28112a:	66 0f d6 44 c8 18    	movq   %xmm0,0x18(%eax,%ecx,8)
  281130:	eb ed                	jmp    28111f <memman_free+0x8f>
		}
		man->frees++;
  281132:	42                   	inc    %edx
  281133:	89 10                	mov    %edx,(%eax)
		if(man->maxfrees < man->frees){
  281135:	3b 50 04             	cmp    0x4(%eax),%edx
  281138:	7e 03                	jle    28113d <memman_free+0xad>
			man->maxfrees = man->frees;
  28113a:	89 50 04             	mov    %edx,0x4(%eax)
		}
		man->free[i].addr = addr;
  28113d:	8b 75 0c             	mov    0xc(%ebp),%esi
  281140:	89 70 10             	mov    %esi,0x10(%eax)
		man->free[i].size = size;
  281143:	8b 75 10             	mov    0x10(%ebp),%esi
  281146:	89 70 14             	mov    %esi,0x14(%eax)
	}
	man->losts++;
  281149:	ff 40 0c             	incl   0xc(%eax)
	man->lostsize += size;
  28114c:	8b 5d 10             	mov    0x10(%ebp),%ebx
  28114f:	01 58 08             	add    %ebx,0x8(%eax)
	return -1;
  281152:	83 c8 ff             	or     $0xffffffff,%eax
  281155:	eb 09                	jmp    281160 <memman_free+0xd0>
	if(i>0){
  281157:	85 c9                	test   %ecx,%ecx
  281159:	74 9f                	je     2810fa <memman_free+0x6a>
  28115b:	e9 55 ff ff ff       	jmp    2810b5 <memman_free+0x25>
}
  281160:	5b                   	pop    %ebx
  281161:	5e                   	pop    %esi
  281162:	5f                   	pop    %edi
  281163:	5d                   	pop    %ebp
  281164:	c3                   	ret    

Disassembly of section .text.__x86.get_pc_thunk.bx:

00281165 <__x86.get_pc_thunk.bx>:
  281165:	8b 1c 24             	mov    (%esp),%ebx
  281168:	c3                   	ret    

Disassembly of section .text.__x86.get_pc_thunk.ax:

00281169 <__x86.get_pc_thunk.ax>:
  281169:	8b 04 24             	mov    (%esp),%eax
  28116c:	c3                   	ret    

Disassembly of section .text.__x86.get_pc_thunk.dx:

0028116d <__x86.get_pc_thunk.dx>:
  28116d:	8b 14 24             	mov    (%esp),%edx
  281170:	c3                   	ret    

Disassembly of section .rodata:

00281180 <cursor.0>:
  281180:	2a 2a                	sub    (%edx),%ch
  281182:	2a 2a                	sub    (%edx),%ch
  281184:	2a 2a                	sub    (%edx),%ch
  281186:	2a 2a                	sub    (%edx),%ch
  281188:	2a 2a                	sub    (%edx),%ch
  28118a:	2a 2a                	sub    (%edx),%ch
  28118c:	2a 2a                	sub    (%edx),%ch
  28118e:	2e 2e 2a 4f 4f       	cs sub %cs:0x4f(%edi),%cl
  281193:	4f                   	dec    %edi
  281194:	4f                   	dec    %edi
  281195:	4f                   	dec    %edi
  281196:	4f                   	dec    %edi
  281197:	4f                   	dec    %edi
  281198:	4f                   	dec    %edi
  281199:	4f                   	dec    %edi
  28119a:	4f                   	dec    %edi
  28119b:	4f                   	dec    %edi
  28119c:	2a 2e                	sub    (%esi),%ch
  28119e:	2e 2e 2a 4f 4f       	cs sub %cs:0x4f(%edi),%cl
  2811a3:	4f                   	dec    %edi
  2811a4:	4f                   	dec    %edi
  2811a5:	4f                   	dec    %edi
  2811a6:	4f                   	dec    %edi
  2811a7:	4f                   	dec    %edi
  2811a8:	4f                   	dec    %edi
  2811a9:	4f                   	dec    %edi
  2811aa:	4f                   	dec    %edi
  2811ab:	2a 2e                	sub    (%esi),%ch
  2811ad:	2e 2e 2e 2a 4f 4f    	cs cs sub %cs:0x4f(%edi),%cl
  2811b3:	4f                   	dec    %edi
  2811b4:	4f                   	dec    %edi
  2811b5:	4f                   	dec    %edi
  2811b6:	4f                   	dec    %edi
  2811b7:	4f                   	dec    %edi
  2811b8:	4f                   	dec    %edi
  2811b9:	4f                   	dec    %edi
  2811ba:	2a 2e                	sub    (%esi),%ch
  2811bc:	2e 2e 2e 2e 2a 4f 4f 	cs cs cs sub %cs:0x4f(%edi),%cl
  2811c3:	4f                   	dec    %edi
  2811c4:	4f                   	dec    %edi
  2811c5:	4f                   	dec    %edi
  2811c6:	4f                   	dec    %edi
  2811c7:	4f                   	dec    %edi
  2811c8:	4f                   	dec    %edi
  2811c9:	2a 2e                	sub    (%esi),%ch
  2811cb:	2e 2e 2e 2e 2e 2a 4f 	cs cs cs cs sub %cs:0x4f(%edi),%cl
  2811d2:	4f 
  2811d3:	4f                   	dec    %edi
  2811d4:	4f                   	dec    %edi
  2811d5:	4f                   	dec    %edi
  2811d6:	4f                   	dec    %edi
  2811d7:	4f                   	dec    %edi
  2811d8:	2a 2e                	sub    (%esi),%ch
  2811da:	2e 2e 2e 2e 2e 2e 2a 	cs cs cs cs cs sub %cs:0x4f(%edi),%cl
  2811e1:	4f 4f 
  2811e3:	4f                   	dec    %edi
  2811e4:	4f                   	dec    %edi
  2811e5:	4f                   	dec    %edi
  2811e6:	4f                   	dec    %edi
  2811e7:	4f                   	dec    %edi
  2811e8:	2a 2e                	sub    (%esi),%ch
  2811ea:	2e 2e 2e 2e 2e 2e 2a 	cs cs cs cs cs sub %cs:0x4f(%edi),%cl
  2811f1:	4f 4f 
  2811f3:	4f                   	dec    %edi
  2811f4:	4f                   	dec    %edi
  2811f5:	4f                   	dec    %edi
  2811f6:	4f                   	dec    %edi
  2811f7:	4f                   	dec    %edi
  2811f8:	4f                   	dec    %edi
  2811f9:	2a 2e                	sub    (%esi),%ch
  2811fb:	2e 2e 2e 2e 2e 2a 4f 	cs cs cs cs sub %cs:0x4f(%edi),%cl
  281202:	4f 
  281203:	4f                   	dec    %edi
  281204:	4f                   	dec    %edi
  281205:	2a 2a                	sub    (%edx),%ch
  281207:	4f                   	dec    %edi
  281208:	4f                   	dec    %edi
  281209:	4f                   	dec    %edi
  28120a:	2a 2e                	sub    (%esi),%ch
  28120c:	2e 2e 2e 2e 2a 4f 4f 	cs cs cs sub %cs:0x4f(%edi),%cl
  281213:	4f                   	dec    %edi
  281214:	2a 2e                	sub    (%esi),%ch
  281216:	2e 2a 4f 4f          	sub    %cs:0x4f(%edi),%cl
  28121a:	4f                   	dec    %edi
  28121b:	2a 2e                	sub    (%esi),%ch
  28121d:	2e 2e 2e 2a 4f 4f    	cs cs sub %cs:0x4f(%edi),%cl
  281223:	2a 2e                	sub    (%esi),%ch
  281225:	2e 2e 2e 2a 4f 4f    	cs cs sub %cs:0x4f(%edi),%cl
  28122b:	4f                   	dec    %edi
  28122c:	2a 2e                	sub    (%esi),%ch
  28122e:	2e 2e 2a 4f 2a       	cs sub %cs:0x2a(%edi),%cl
  281233:	2e 2e 2e 2e 2e 2e 2a 	cs cs cs cs cs sub %cs:0x4f(%edi),%cl
  28123a:	4f 4f 
  28123c:	4f                   	dec    %edi
  28123d:	2a 2e                	sub    (%esi),%ch
  28123f:	2e 2a 2a             	sub    %cs:(%edx),%ch
  281242:	2e 2e 2e 2e 2e 2e 2e 	cs cs cs cs cs cs cs sub %cs:0x4f(%edi),%cl
  281249:	2e 2a 4f 4f 
  28124d:	4f                   	dec    %edi
  28124e:	2a 2e                	sub    (%esi),%ch
  281250:	2a 2e                	sub    (%esi),%ch
  281252:	2e 2e 2e 2e 2e 2e 2e 	cs cs cs cs cs cs cs cs sub %cs:0x4f(%edi),%cl
  281259:	2e 2e 2a 4f 4f 
  28125e:	4f                   	dec    %edi
  28125f:	2a 2e                	sub    (%esi),%ch
  281261:	2e 2e 2e 2e 2e 2e 2e 	cs cs cs cs cs cs cs cs cs cs sub %cs:0x4f(%edi),%cl
  281268:	2e 2e 2e 2e 2a 4f 4f 
  28126f:	2a 2e                	sub    (%esi),%ch
  281271:	2e 2e 2e 2e 2e 2e 2e 	cs cs cs cs cs cs cs cs cs cs cs sub %cs:(%edx),%ch
  281278:	2e 2e 2e 2e 2e 2a 2a 
  28127f:	2a                   	.byte 0x2a

Disassembly of section .rodata.str1.1:

00281280 <.rodata.str1.1>:
  281280:	28 25 64 2c 25 64    	sub    %ah,0x64252c64
  281286:	29 00                	sub    %eax,(%eax)
  281288:	6d                   	insl   (%dx),%es:(%edi)
  281289:	65 6d                	gs insl (%dx),%es:(%edi)
  28128b:	6f                   	outsl  %ds:(%esi),(%dx)
  28128c:	72 79                	jb     281307 <cursor.0+0x187>
  28128e:	20 25 64 4d 42 20    	and    %ah,0x20424d64
  281294:	66 72 65             	data16 jb 2812fc <cursor.0+0x17c>
  281297:	65 3a 20             	cmp    %gs:(%eax),%ah
  28129a:	25 64 4b 42 00       	and    $0x424b64,%eax
  28129f:	5b                   	pop    %ebx
  2812a0:	6c                   	insb   (%dx),%es:(%edi)
  2812a1:	6d                   	insl   (%dx),%es:(%edi)
  2812a2:	72 20                	jb     2812c4 <cursor.0+0x144>
  2812a4:	25 64 20 25 64       	and    $0x64252064,%eax
  2812a9:	5d                   	pop    %ebp
  2812aa:	00 6d 65             	add    %ch,0x65(%ebp)
  2812ad:	6d                   	insl   (%dx),%es:(%edi)
  2812ae:	6f                   	outsl  %ds:(%esi),(%dx)
  2812af:	72 79                	jb     28132a <cursor.0+0x1aa>
  2812b1:	20 25 64 4d 42 00    	and    %ah,0x424d64
  2812b7:	44                   	inc    %esp
  2812b8:	65 62 75 67          	bound  %esi,%gs:0x67(%ebp)
  2812bc:	3a 76 61             	cmp    0x61(%esi),%dh
  2812bf:	72 3d                	jb     2812fe <cursor.0+0x17e>
  2812c1:	25                   	.byte 0x25
  2812c2:	78 00                	js     2812c4 <cursor.0+0x144>

Disassembly of section .eh_frame:

002812c4 <.eh_frame>:
  2812c4:	14 00                	adc    $0x0,%al
  2812c6:	00 00                	add    %al,(%eax)
  2812c8:	00 00                	add    %al,(%eax)
  2812ca:	00 00                	add    %al,(%eax)
  2812cc:	01 7a 52             	add    %edi,0x52(%edx)
  2812cf:	00 01                	add    %al,(%ecx)
  2812d1:	7c 08                	jl     2812db <cursor.0+0x15b>
  2812d3:	01 1b                	add    %ebx,(%ebx)
  2812d5:	0c 04                	or     $0x4,%al
  2812d7:	04 88                	add    $0x88,%al
  2812d9:	01 00                	add    %eax,(%eax)
  2812db:	00 1c 00             	add    %bl,(%eax,%eax,1)
  2812de:	00 00                	add    %al,(%eax)
  2812e0:	1c 00                	sbb    $0x0,%al
  2812e2:	00 00                	add    %al,(%eax)
  2812e4:	1c ed                	sbb    $0xed,%al
  2812e6:	ff                   	(bad)  
  2812e7:	ff                   	(bad)  
  2812e8:	bd 04 00 00 00       	mov    $0x4,%ebp
  2812ed:	41                   	inc    %ecx
  2812ee:	0e                   	push   %cs
  2812ef:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  2812f5:	43                   	inc    %ebx
  2812f6:	87 03                	xchg   %eax,(%ebx)
  2812f8:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  2812fb:	05 10 00 00 00       	add    $0x10,%eax
  281300:	3c 00                	cmp    $0x0,%al
  281302:	00 00                	add    %al,(%eax)
  281304:	61                   	popa   
  281305:	fe                   	(bad)  
  281306:	ff                   	(bad)  
  281307:	ff 04 00             	incl   (%eax,%eax,1)
  28130a:	00 00                	add    %al,(%eax)
  28130c:	00 00                	add    %al,(%eax)
  28130e:	00 00                	add    %al,(%eax)
  281310:	1c 00                	sbb    $0x0,%al
  281312:	00 00                	add    %al,(%eax)
  281314:	50                   	push   %eax
  281315:	00 00                	add    %al,(%eax)
  281317:	00 a5 f1 ff ff 17    	add    %ah,0x17fffff1(%ebp)
  28131d:	00 00                	add    %al,(%eax)
  28131f:	00 00                	add    %al,(%eax)
  281321:	41                   	inc    %ecx
  281322:	0e                   	push   %cs
  281323:	08 85 02 47 0d 05    	or     %al,0x50d4702(%ebp)
  281329:	4e                   	dec    %esi
  28132a:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  28132d:	04 00                	add    $0x0,%al
  28132f:	00 10                	add    %dl,(%eax)
  281331:	00 00                	add    %al,(%eax)
  281333:	00 70 00             	add    %dh,0x0(%eax)
  281336:	00 00                	add    %al,(%eax)
  281338:	9c                   	pushf  
  281339:	f1                   	icebp  
  28133a:	ff                   	(bad)  
  28133b:	ff 16                	call   *(%esi)
  28133d:	00 00                	add    %al,(%eax)
  28133f:	00 00                	add    %al,(%eax)
  281341:	00 00                	add    %al,(%eax)
  281343:	00 24 00             	add    %ah,(%eax,%eax,1)
  281346:	00 00                	add    %al,(%eax)
  281348:	84 00                	test   %al,(%eax)
  28134a:	00 00                	add    %al,(%eax)
  28134c:	9e                   	sahf   
  28134d:	f1                   	icebp  
  28134e:	ff                   	(bad)  
  28134f:	ff 40 00             	incl   0x0(%eax)
  281352:	00 00                	add    %al,(%eax)
  281354:	00 41 0e             	add    %al,0xe(%ecx)
  281357:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  28135d:	45                   	inc    %ebp
  28135e:	86 03                	xchg   %al,(%ebx)
  281360:	83 04 75 c3 41 c6 41 	addl   $0xffffffc5,0x41c641c3(,%esi,2)
  281367:	c5 
  281368:	0c 04                	or     $0x4,%al
  28136a:	04 00                	add    $0x0,%al
  28136c:	1c 00                	sbb    $0x0,%al
  28136e:	00 00                	add    %al,(%eax)
  281370:	ac                   	lods   %ds:(%esi),%al
  281371:	00 00                	add    %al,(%eax)
  281373:	00 b6 f1 ff ff 25    	add    %dh,0x25fffff1(%esi)
  281379:	00 00                	add    %al,(%eax)
  28137b:	00 00                	add    %al,(%eax)
  28137d:	4b                   	dec    %ebx
  28137e:	0e                   	push   %cs
  28137f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  281385:	57                   	push   %edi
  281386:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  281389:	04 00                	add    $0x0,%al
  28138b:	00 28                	add    %ch,(%eax)
  28138d:	00 00                	add    %al,(%eax)
  28138f:	00 cc                	add    %cl,%ah
  281391:	00 00                	add    %al,(%eax)
  281393:	00 bb f1 ff ff 36    	add    %bh,0x36fffff1(%ebx)
  281399:	00 00                	add    %al,(%eax)
  28139b:	00 00                	add    %al,(%eax)
  28139d:	41                   	inc    %ecx
  28139e:	0e                   	push   %cs
  28139f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  2813a5:	44                   	inc    %esp
  2813a6:	87 03                	xchg   %eax,(%ebx)
  2813a8:	45                   	inc    %ebp
  2813a9:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  2813ac:	05 66 c3 41 c6       	add    $0xc641c366,%eax
  2813b1:	41                   	inc    %ecx
  2813b2:	c7 41 c5 0c 04 04 2c 	movl   $0x2c04040c,-0x3b(%ecx)
  2813b9:	00 00                	add    %al,(%eax)
  2813bb:	00 f8                	add    %bh,%al
  2813bd:	00 00                	add    %al,(%eax)
  2813bf:	00 c5                	add    %al,%ch
  2813c1:	f1                   	icebp  
  2813c2:	ff                   	(bad)  
  2813c3:	ff 73 01             	push   0x1(%ebx)
  2813c6:	00 00                	add    %al,(%eax)
  2813c8:	00 41 0e             	add    %al,0xe(%ecx)
  2813cb:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  2813d1:	46                   	inc    %esi
  2813d2:	87 03                	xchg   %eax,(%ebx)
  2813d4:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  2813d7:	05 03 66 01 c3       	add    $0xc3016603,%eax
  2813dc:	41                   	inc    %ecx
  2813dd:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  2813e1:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  2813e4:	04 00                	add    $0x0,%al
  2813e6:	00 00                	add    %al,(%eax)
  2813e8:	28 00                	sub    %al,(%eax)
  2813ea:	00 00                	add    %al,(%eax)
  2813ec:	28 01                	sub    %al,(%ecx)
  2813ee:	00 00                	add    %al,(%eax)
  2813f0:	08 f3                	or     %dh,%bl
  2813f2:	ff                   	(bad)  
  2813f3:	ff 69 00             	ljmp   *0x0(%ecx)
  2813f6:	00 00                	add    %al,(%eax)
  2813f8:	00 41 0e             	add    %al,0xe(%ecx)
  2813fb:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  281401:	41                   	inc    %ecx
  281402:	86 03                	xchg   %al,(%ebx)
  281404:	49                   	dec    %ecx
  281405:	83 04 02 59          	addl   $0x59,(%edx,%eax,1)
  281409:	c3                   	ret    
  28140a:	41                   	inc    %ecx
  28140b:	c6 41 c5 0c          	movb   $0xc,-0x3b(%ecx)
  28140f:	04 04                	add    $0x4,%al
  281411:	00 00                	add    %al,(%eax)
  281413:	00 28                	add    %ch,(%eax)
  281415:	00 00                	add    %al,(%eax)
  281417:	00 54 01 00          	add    %dl,0x0(%ecx,%eax,1)
  28141b:	00 45 f3             	add    %al,-0xd(%ebp)
  28141e:	ff                   	(bad)  
  28141f:	ff 55 00             	call   *0x0(%ebp)
  281422:	00 00                	add    %al,(%eax)
  281424:	00 4b 0e             	add    %cl,0xe(%ebx)
  281427:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  28142d:	46                   	inc    %esi
  28142e:	87 03                	xchg   %eax,(%ebx)
  281430:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  281433:	05 7e c3 41 c6       	add    $0xc641c37e,%eax
  281438:	41                   	inc    %ecx
  281439:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  281440:	28 00                	sub    %al,(%eax)
  281442:	00 00                	add    %al,(%eax)
  281444:	80 01 00             	addb   $0x0,(%ecx)
  281447:	00 6e f3             	add    %ch,-0xd(%esi)
  28144a:	ff                   	(bad)  
  28144b:	ff 62 00             	jmp    *0x0(%edx)
  28144e:	00 00                	add    %al,(%eax)
  281450:	00 41 0e             	add    %al,0xe(%ecx)
  281453:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  281459:	44                   	inc    %esp
  28145a:	87 03                	xchg   %eax,(%ebx)
  28145c:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  28145f:	05 02 57 c3 41       	add    $0x41c35702,%eax
  281464:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  281468:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  28146b:	04 28                	add    $0x28,%al
  28146d:	00 00                	add    %al,(%eax)
  28146f:	00 ac 01 00 00 a4 f3 	add    %ch,-0xc5c0000(%ecx,%eax,1)
  281476:	ff                   	(bad)  
  281477:	ff 57 00             	call   *0x0(%edi)
  28147a:	00 00                	add    %al,(%eax)
  28147c:	00 41 0e             	add    %al,0xe(%ecx)
  28147f:	08 85 02 44 0d 05    	or     %al,0x50d4402(%ebp)
  281485:	46                   	inc    %esi
  281486:	87 03                	xchg   %eax,(%ebx)
  281488:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  28148b:	05 02 48 c3 41       	add    $0x41c34802,%eax
  281490:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  281494:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  281497:	04 1c                	add    $0x1c,%al
  281499:	00 00                	add    %al,(%eax)
  28149b:	00 d8                	add    %bl,%al
  28149d:	01 00                	add    %eax,(%eax)
  28149f:	00 cf                	add    %cl,%bh
  2814a1:	f3 ff                	repz (bad) 
  2814a3:	ff 2b                	ljmp   *(%ebx)
  2814a5:	00 00                	add    %al,(%eax)
  2814a7:	00 00                	add    %al,(%eax)
  2814a9:	41                   	inc    %ecx
  2814aa:	0e                   	push   %cs
  2814ab:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  2814b1:	67 c5 0c             	lds    (%si),%ecx
  2814b4:	04 04                	add    $0x4,%al
  2814b6:	00 00                	add    %al,(%eax)
  2814b8:	10 00                	adc    %al,(%eax)
  2814ba:	00 00                	add    %al,(%eax)
  2814bc:	f8                   	clc    
  2814bd:	01 00                	add    %eax,(%eax)
  2814bf:	00 a9 fc ff ff 04    	add    %ch,0x4fffffc(%ecx)
  2814c5:	00 00                	add    %al,(%eax)
  2814c7:	00 00                	add    %al,(%eax)
  2814c9:	00 00                	add    %al,(%eax)
  2814cb:	00 10                	add    %dl,(%eax)
  2814cd:	00 00                	add    %al,(%eax)
  2814cf:	00 0c 02             	add    %cl,(%edx,%eax,1)
  2814d2:	00 00                	add    %al,(%eax)
  2814d4:	99                   	cltd   
  2814d5:	fc                   	cld    
  2814d6:	ff                   	(bad)  
  2814d7:	ff 04 00             	incl   (%eax,%eax,1)
  2814da:	00 00                	add    %al,(%eax)
  2814dc:	00 00                	add    %al,(%eax)
  2814de:	00 00                	add    %al,(%eax)
  2814e0:	28 00                	sub    %al,(%eax)
  2814e2:	00 00                	add    %al,(%eax)
  2814e4:	20 02                	and    %al,(%edx)
  2814e6:	00 00                	add    %al,(%eax)
  2814e8:	b2 f3                	mov    $0xf3,%dl
  2814ea:	ff                   	(bad)  
  2814eb:	ff 86 00 00 00 00    	incl   0x0(%esi)
  2814f1:	41                   	inc    %ecx
  2814f2:	0e                   	push   %cs
  2814f3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  2814f9:	43                   	inc    %ebx
  2814fa:	87 03                	xchg   %eax,(%ebx)
  2814fc:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  2814ff:	05 02 7c c3 41       	add    $0x41c37c02,%eax
  281504:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  281508:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  28150b:	04 2c                	add    $0x2c,%al
  28150d:	00 00                	add    %al,(%eax)
  28150f:	00 4c 02 00          	add    %cl,0x0(%edx,%eax,1)
  281513:	00 0c f4             	add    %cl,(%esp,%esi,8)
  281516:	ff                   	(bad)  
  281517:	ff 68 00             	ljmp   *0x0(%eax)
  28151a:	00 00                	add    %al,(%eax)
  28151c:	00 41 0e             	add    %al,0xe(%ecx)
  28151f:	08 85 02 49 0d 05    	or     %al,0x50d4902(%ebp)
  281525:	42                   	inc    %edx
  281526:	87 03                	xchg   %eax,(%ebx)
  281528:	86 04 47             	xchg   %al,(%edi,%eax,2)
  28152b:	83 05 02 51 c3 41 c6 	addl   $0xffffffc6,0x41c35102
  281532:	41                   	inc    %ecx
  281533:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  28153a:	00 00                	add    %al,(%eax)
  28153c:	2c 00                	sub    $0x0,%al
  28153e:	00 00                	add    %al,(%eax)
  281540:	7c 02                	jl     281544 <cursor.0+0x3c4>
  281542:	00 00                	add    %al,(%eax)
  281544:	44                   	inc    %esp
  281545:	f4                   	hlt    
  281546:	ff                   	(bad)  
  281547:	ff 67 00             	jmp    *0x0(%edi)
  28154a:	00 00                	add    %al,(%eax)
  28154c:	00 41 0e             	add    %al,0xe(%ecx)
  28154f:	08 85 02 49 0d 05    	or     %al,0x50d4902(%ebp)
  281555:	42                   	inc    %edx
  281556:	87 03                	xchg   %eax,(%ebx)
  281558:	86 04 47             	xchg   %al,(%edi,%eax,2)
  28155b:	83 05 02 50 c3 41 c6 	addl   $0xffffffc6,0x41c35002
  281562:	41                   	inc    %ecx
  281563:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  28156a:	00 00                	add    %al,(%eax)
  28156c:	2c 00                	sub    $0x0,%al
  28156e:	00 00                	add    %al,(%eax)
  281570:	ac                   	lods   %ds:(%esi),%al
  281571:	02 00                	add    (%eax),%al
  281573:	00 7b f4             	add    %bh,-0xc(%ebx)
  281576:	ff                   	(bad)  
  281577:	ff a0 00 00 00 00    	jmp    *0x0(%eax)
  28157d:	41                   	inc    %ecx
  28157e:	0e                   	push   %cs
  28157f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  281585:	42                   	inc    %edx
  281586:	87 03                	xchg   %eax,(%ebx)
  281588:	86 04 47             	xchg   %al,(%edi,%eax,2)
  28158b:	83 05 02 90 c3 41 c6 	addl   $0xffffffc6,0x41c39002
  281592:	41                   	inc    %ecx
  281593:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  28159a:	00 00                	add    %al,(%eax)
  28159c:	20 00                	and    %al,(%eax)
  28159e:	00 00                	add    %al,(%eax)
  2815a0:	dc 02                	faddl  (%edx)
  2815a2:	00 00                	add    %al,(%eax)
  2815a4:	eb f4                	jmp    28159a <cursor.0+0x41a>
  2815a6:	ff                   	(bad)  
  2815a7:	ff 49 00             	decl   0x0(%ecx)
  2815aa:	00 00                	add    %al,(%eax)
  2815ac:	00 4b 0e             	add    %cl,0xe(%ebx)
  2815af:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  2815b5:	41                   	inc    %ecx
  2815b6:	83 03 7a             	addl   $0x7a,(%ebx)
  2815b9:	c5 c3 0c             	(bad)
  2815bc:	04 04                	add    $0x4,%al
  2815be:	00 00                	add    %al,(%eax)
  2815c0:	28 00                	sub    %al,(%eax)
  2815c2:	00 00                	add    %al,(%eax)
  2815c4:	00 03                	add    %al,(%ebx)
  2815c6:	00 00                	add    %al,(%eax)
  2815c8:	10 f5                	adc    %dh,%ch
  2815ca:	ff                   	(bad)  
  2815cb:	ff 54 00 00          	call   *0x0(%eax,%eax,1)
  2815cf:	00 00                	add    %al,(%eax)
  2815d1:	41                   	inc    %ecx
  2815d2:	0e                   	push   %cs
  2815d3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  2815d9:	49                   	dec    %ecx
  2815da:	87 03                	xchg   %eax,(%ebx)
  2815dc:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  2815df:	05 02 44 c3 41       	add    $0x41c34402,%eax
  2815e4:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  2815e8:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  2815eb:	04 1c                	add    $0x1c,%al
  2815ed:	00 00                	add    %al,(%eax)
  2815ef:	00 2c 03             	add    %ch,(%ebx,%eax,1)
  2815f2:	00 00                	add    %al,(%eax)
  2815f4:	38 f5                	cmp    %dh,%ch
  2815f6:	ff                   	(bad)  
  2815f7:	ff 25 00 00 00 00    	jmp    *0x0
  2815fd:	41                   	inc    %ecx
  2815fe:	0e                   	push   %cs
  2815ff:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  281605:	61                   	popa   
  281606:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  281609:	04 00                	add    $0x0,%al
  28160b:	00 28                	add    %ch,(%eax)
  28160d:	00 00                	add    %al,(%eax)
  28160f:	00 4c 03 00          	add    %cl,0x0(%ebx,%eax,1)
  281613:	00 3d f5 ff ff 25    	add    %bh,0x25fffff5
  281619:	01 00                	add    %eax,(%eax)
  28161b:	00 00                	add    %al,(%eax)
  28161d:	41                   	inc    %ecx
  28161e:	0e                   	push   %cs
  28161f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  281625:	41                   	inc    %ecx
  281626:	86 03                	xchg   %al,(%ebx)
  281628:	46                   	inc    %esi
  281629:	83 04 03 18          	addl   $0x18,(%ebx,%eax,1)
  28162d:	01 c3                	add    %eax,%ebx
  28162f:	41                   	inc    %ecx
  281630:	c6 41 c5 0c          	movb   $0xc,-0x3b(%ecx)
  281634:	04 04                	add    $0x4,%al
  281636:	00 00                	add    %al,(%eax)
  281638:	2c 00                	sub    $0x0,%al
  28163a:	00 00                	add    %al,(%eax)
  28163c:	78 03                	js     281641 <cursor.0+0x4c1>
  28163e:	00 00                	add    %al,(%eax)
  281640:	36 f6 ff             	ss idiv %bh
  281643:	ff 57 00             	call   *0x0(%edi)
  281646:	00 00                	add    %al,(%eax)
  281648:	00 41 0e             	add    %al,0xe(%ecx)
  28164b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  281651:	42                   	inc    %edx
  281652:	87 03                	xchg   %eax,(%ebx)
  281654:	86 04 46             	xchg   %al,(%esi,%eax,2)
  281657:	83 05 02 48 c3 41 c6 	addl   $0xffffffc6,0x41c34802
  28165e:	41                   	inc    %ecx
  28165f:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  281666:	00 00                	add    %al,(%eax)
  281668:	20 00                	and    %al,(%eax)
  28166a:	00 00                	add    %al,(%eax)
  28166c:	a8 03                	test   $0x3,%al
  28166e:	00 00                	add    %al,(%eax)
  281670:	5d                   	pop    %ebp
  281671:	f6 ff                	idiv   %bh
  281673:	ff                   	(bad)  
  281674:	38 00                	cmp    %al,(%eax)
  281676:	00 00                	add    %al,(%eax)
  281678:	00 41 0e             	add    %al,0xe(%ecx)
  28167b:	08 85 02 49 0d 05    	or     %al,0x50d4902(%ebp)
  281681:	41                   	inc    %ecx
  281682:	83 03 6c             	addl   $0x6c,(%ebx)
  281685:	c5 c3 0c             	(bad)
  281688:	04 04                	add    $0x4,%al
  28168a:	00 00                	add    %al,(%eax)
  28168c:	20 00                	and    %al,(%eax)
  28168e:	00 00                	add    %al,(%eax)
  281690:	cc                   	int3   
  281691:	03 00                	add    (%eax),%eax
  281693:	00 71 f6             	add    %dh,-0xa(%ecx)
  281696:	ff                   	(bad)  
  281697:	ff 40 00             	incl   0x0(%eax)
  28169a:	00 00                	add    %al,(%eax)
  28169c:	00 41 0e             	add    %al,0xe(%ecx)
  28169f:	08 85 02 49 0d 05    	or     %al,0x50d4902(%ebp)
  2816a5:	41                   	inc    %ecx
  2816a6:	83 03 74             	addl   $0x74,(%ebx)
  2816a9:	c5 c3 0c             	(bad)
  2816ac:	04 04                	add    $0x4,%al
  2816ae:	00 00                	add    %al,(%eax)
  2816b0:	1c 00                	sbb    $0x0,%al
  2816b2:	00 00                	add    %al,(%eax)
  2816b4:	f0 03 00             	lock add (%eax),%eax
  2816b7:	00 e3                	add    %ah,%bl
  2816b9:	f6 ff                	idiv   %bh
  2816bb:	ff 2b                	ljmp   *(%ebx)
  2816bd:	00 00                	add    %al,(%eax)
  2816bf:	00 00                	add    %al,(%eax)
  2816c1:	41                   	inc    %ecx
  2816c2:	0e                   	push   %cs
  2816c3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  2816c9:	67 c5 0c             	lds    (%si),%ecx
  2816cc:	04 04                	add    $0x4,%al
  2816ce:	00 00                	add    %al,(%eax)
  2816d0:	20 00                	and    %al,(%eax)
  2816d2:	00 00                	add    %al,(%eax)
  2816d4:	10 04 00             	adc    %al,(%eax,%eax,1)
  2816d7:	00 ee                	add    %ch,%dh
  2816d9:	f6 ff                	idiv   %bh
  2816db:	ff                   	(bad)  
  2816dc:	3e 00 00             	add    %al,%ds:(%eax)
  2816df:	00 00                	add    %al,(%eax)
  2816e1:	41                   	inc    %ecx
  2816e2:	0e                   	push   %cs
  2816e3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  2816e9:	41                   	inc    %ecx
  2816ea:	83 03 78             	addl   $0x78,(%ebx)
  2816ed:	c3                   	ret    
  2816ee:	41                   	inc    %ecx
  2816ef:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  2816f2:	04 00                	add    $0x0,%al
  2816f4:	24 00                	and    $0x0,%al
  2816f6:	00 00                	add    %al,(%eax)
  2816f8:	34 04                	xor    $0x4,%al
  2816fa:	00 00                	add    %al,(%eax)
  2816fc:	08 f7                	or     %dh,%bh
  2816fe:	ff                   	(bad)  
  2816ff:	ff 36                	push   (%esi)
  281701:	00 00                	add    %al,(%eax)
  281703:	00 00                	add    %al,(%eax)
  281705:	41                   	inc    %ecx
  281706:	0e                   	push   %cs
  281707:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  28170d:	45                   	inc    %ebp
  28170e:	86 03                	xchg   %al,(%ebx)
  281710:	83 04 6b c3          	addl   $0xffffffc3,(%ebx,%ebp,2)
  281714:	41                   	inc    %ecx
  281715:	c6 41 c5 0c          	movb   $0xc,-0x3b(%ecx)
  281719:	04 04                	add    $0x4,%al
  28171b:	00 1c 00             	add    %bl,(%eax,%eax,1)
  28171e:	00 00                	add    %al,(%eax)
  281720:	5c                   	pop    %esp
  281721:	04 00                	add    $0x0,%al
  281723:	00 16                	add    %dl,(%esi)
  281725:	f7 ff                	idiv   %edi
  281727:	ff 0e                	decl   (%esi)
  281729:	00 00                	add    %al,(%eax)
  28172b:	00 00                	add    %al,(%eax)
  28172d:	41                   	inc    %ecx
  28172e:	0e                   	push   %cs
  28172f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  281735:	44                   	inc    %esp
  281736:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  281739:	04 00                	add    $0x0,%al
  28173b:	00 10                	add    %dl,(%eax)
  28173d:	00 00                	add    %al,(%eax)
  28173f:	00 7c 04 00          	add    %bh,0x0(%esp,%eax,1)
  281743:	00 04 f7             	add    %al,(%edi,%esi,8)
  281746:	ff                   	(bad)  
  281747:	ff 0b                	decl   (%ebx)
  281749:	00 00                	add    %al,(%eax)
  28174b:	00 00                	add    %al,(%eax)
  28174d:	00 00                	add    %al,(%eax)
  28174f:	00 1c 00             	add    %bl,(%eax,%eax,1)
  281752:	00 00                	add    %al,(%eax)
  281754:	90                   	nop
  281755:	04 00                	add    $0x0,%al
  281757:	00 fb                	add    %bh,%bl
  281759:	f6 ff                	idiv   %bh
  28175b:	ff 22                	jmp    *(%edx)
  28175d:	00 00                	add    %al,(%eax)
  28175f:	00 00                	add    %al,(%eax)
  281761:	41                   	inc    %ecx
  281762:	0e                   	push   %cs
  281763:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  281769:	5e                   	pop    %esi
  28176a:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  28176d:	04 00                	add    $0x0,%al
  28176f:	00 1c 00             	add    %bl,(%eax,%eax,1)
  281772:	00 00                	add    %al,(%eax)
  281774:	b0 04                	mov    $0x4,%al
  281776:	00 00                	add    %al,(%eax)
  281778:	fd                   	std    
  281779:	f6 ff                	idiv   %bh
  28177b:	ff 29                	ljmp   *(%ecx)
  28177d:	00 00                	add    %al,(%eax)
  28177f:	00 00                	add    %al,(%eax)
  281781:	41                   	inc    %ecx
  281782:	0e                   	push   %cs
  281783:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  281789:	65 c5 0c 04          	lds    %gs:(%esp,%eax,1),%ecx
  28178d:	04 00                	add    $0x0,%al
  28178f:	00 20                	add    %ah,(%eax)
  281791:	00 00                	add    %al,(%eax)
  281793:	00 d0                	add    %dl,%al
  281795:	04 00                	add    $0x0,%al
  281797:	00 06                	add    %al,(%esi)
  281799:	f7 ff                	idiv   %edi
  28179b:	ff 96 00 00 00 00    	call   *0x0(%esi)
  2817a1:	41                   	inc    %ecx
  2817a2:	0e                   	push   %cs
  2817a3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  2817a9:	41                   	inc    %ecx
  2817aa:	83 03 02             	addl   $0x2,(%ebx)
  2817ad:	90                   	nop
  2817ae:	c3                   	ret    
  2817af:	41                   	inc    %ecx
  2817b0:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  2817b3:	04 20                	add    $0x20,%al
  2817b5:	00 00                	add    %al,(%eax)
  2817b7:	00 f4                	add    %dh,%ah
  2817b9:	04 00                	add    $0x0,%al
  2817bb:	00 78 f7             	add    %bh,-0x9(%eax)
  2817be:	ff                   	(bad)  
  2817bf:	ff 6a 00             	ljmp   *0x0(%edx)
  2817c2:	00 00                	add    %al,(%eax)
  2817c4:	00 41 0e             	add    %al,0xe(%ecx)
  2817c7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  2817cd:	41                   	inc    %ecx
  2817ce:	83 03 02             	addl   $0x2,(%ebx)
  2817d1:	64 c3                	fs ret 
  2817d3:	41                   	inc    %ecx
  2817d4:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  2817d7:	04 20                	add    $0x20,%al
  2817d9:	00 00                	add    %al,(%eax)
  2817db:	00 18                	add    %bl,(%eax)
  2817dd:	05 00 00 be f7       	add    $0xf7be0000,%eax
  2817e2:	ff                   	(bad)  
  2817e3:	ff 53 00             	call   *0x0(%ebx)
  2817e6:	00 00                	add    %al,(%eax)
  2817e8:	00 41 0e             	add    %al,0xe(%ecx)
  2817eb:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  2817f1:	42                   	inc    %edx
  2817f2:	83 03 02             	addl   $0x2,(%ebx)
  2817f5:	4d                   	dec    %ebp
  2817f6:	c5 c3 0c             	(bad)
  2817f9:	04 04                	add    $0x4,%al
  2817fb:	00 1c 00             	add    %bl,(%eax,%eax,1)
  2817fe:	00 00                	add    %al,(%eax)
  281800:	3c 05                	cmp    $0x5,%al
  281802:	00 00                	add    %al,(%eax)
  281804:	ed                   	in     (%dx),%eax
  281805:	f7 ff                	idiv   %edi
  281807:	ff 23                	jmp    *(%ebx)
  281809:	00 00                	add    %al,(%eax)
  28180b:	00 00                	add    %al,(%eax)
  28180d:	41                   	inc    %ecx
  28180e:	0e                   	push   %cs
  28180f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  281815:	5f                   	pop    %edi
  281816:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  281819:	04 00                	add    $0x0,%al
  28181b:	00 20                	add    %ah,(%eax)
  28181d:	00 00                	add    %al,(%eax)
  28181f:	00 5c 05 00          	add    %bl,0x0(%ebp,%eax,1)
  281823:	00 f0                	add    %dh,%al
  281825:	f7 ff                	idiv   %edi
  281827:	ff 1d 00 00 00 00    	lcall  *0x0
  28182d:	41                   	inc    %ecx
  28182e:	0e                   	push   %cs
  28182f:	08 85 02 46 0d 05    	or     %al,0x50d4602(%ebp)
  281835:	41                   	inc    %ecx
  281836:	83 03 53             	addl   $0x53,(%ebx)
  281839:	c3                   	ret    
  28183a:	41                   	inc    %ecx
  28183b:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  28183e:	04 00                	add    $0x0,%al
  281840:	28 00                	sub    %al,(%eax)
  281842:	00 00                	add    %al,(%eax)
  281844:	80 05 00 00 e9 f7 ff 	addb   $0xff,0xf7e90000
  28184b:	ff 5f 00             	lcall  *0x0(%edi)
  28184e:	00 00                	add    %al,(%eax)
  281850:	00 41 0e             	add    %al,0xe(%ecx)
  281853:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  281859:	46                   	inc    %esi
  28185a:	87 03                	xchg   %eax,(%ebx)
  28185c:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  28185f:	05 02 52 c3 41       	add    $0x41c35202,%eax
  281864:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  281868:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  28186b:	04 28                	add    $0x28,%al
  28186d:	00 00                	add    %al,(%eax)
  28186f:	00 ac 05 00 00 1c f8 	add    %ch,-0x7e40000(%ebp,%eax,1)
  281876:	ff                   	(bad)  
  281877:	ff d5                	call   *%ebp
  281879:	00 00                	add    %al,(%eax)
  28187b:	00 00                	add    %al,(%eax)
  28187d:	41                   	inc    %ecx
  28187e:	0e                   	push   %cs
  28187f:	08 85 02 44 0d 05    	or     %al,0x50d4402(%ebp)
  281885:	46                   	inc    %esi
  281886:	87 03                	xchg   %eax,(%ebx)
  281888:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  28188b:	05 02 c6 c3 41       	add    $0x41c3c602,%eax
  281890:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  281894:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  281897:	04                   	.byte 0x4

Disassembly of section .note.gnu.property:

00281898 <.note.gnu.property>:
  281898:	04 00                	add    $0x0,%al
  28189a:	00 00                	add    %al,(%eax)
  28189c:	18 00                	sbb    %al,(%eax)
  28189e:	00 00                	add    %al,(%eax)
  2818a0:	05 00 00 00 47       	add    $0x47000000,%eax
  2818a5:	4e                   	dec    %esi
  2818a6:	55                   	push   %ebp
  2818a7:	00 01                	add    %al,(%ecx)
  2818a9:	00 01                	add    %al,(%ecx)
  2818ab:	c0 04 00 00          	rolb   $0x0,(%eax,%eax,1)
  2818af:	00 09                	add    %cl,(%ecx)
  2818b1:	00 00                	add    %al,(%eax)
  2818b3:	00 02                	add    %al,(%edx)
  2818b5:	00 01                	add    %al,(%ecx)
  2818b7:	c0 04 00 00          	rolb   $0x0,(%eax,%eax,1)
  2818bb:	00 01                	add    %al,(%ecx)
  2818bd:	00 00                	add    %al,(%eax)
	...

Disassembly of section .data:

002818c0 <hankaku>:
	...
  281ad0:	00 00                	add    %al,(%eax)
  281ad2:	00 10                	add    %dl,(%eax)
  281ad4:	10 10                	adc    %dl,(%eax)
  281ad6:	10 10                	adc    %dl,(%eax)
  281ad8:	10 00                	adc    %al,(%eax)
  281ada:	10 10                	adc    %dl,(%eax)
  281adc:	00 00                	add    %al,(%eax)
  281ade:	00 00                	add    %al,(%eax)
  281ae0:	00 00                	add    %al,(%eax)
  281ae2:	00 24 24             	add    %ah,(%esp)
  281ae5:	24 00                	and    $0x0,%al
	...
  281af3:	24 24                	and    $0x24,%al
  281af5:	7e 24                	jle    281b1b <hankaku+0x25b>
  281af7:	24 24                	and    $0x24,%al
  281af9:	7e 24                	jle    281b1f <hankaku+0x25f>
  281afb:	24 00                	and    $0x0,%al
  281afd:	00 00                	add    %al,(%eax)
  281aff:	00 00                	add    %al,(%eax)
  281b01:	00 00                	add    %al,(%eax)
  281b03:	10 7c 90 90          	adc    %bh,-0x70(%eax,%edx,4)
  281b07:	7c 12                	jl     281b1b <hankaku+0x25b>
  281b09:	12 7c 10 00          	adc    0x0(%eax,%edx,1),%bh
  281b0d:	00 00                	add    %al,(%eax)
  281b0f:	00 00                	add    %al,(%eax)
  281b11:	00 00                	add    %al,(%eax)
  281b13:	00 62 64             	add    %ah,0x64(%edx)
  281b16:	08 10                	or     %dl,(%eax)
  281b18:	20 4c 8c 00          	and    %cl,0x0(%esp,%ecx,4)
	...
  281b24:	18 24 20             	sbb    %ah,(%eax,%eiz,1)
  281b27:	50                   	push   %eax
  281b28:	8a 84 4a 30 00 00 00 	mov    0x30(%edx,%ecx,2),%al
  281b2f:	00 00                	add    %al,(%eax)
  281b31:	00 00                	add    %al,(%eax)
  281b33:	10 10                	adc    %dl,(%eax)
  281b35:	20 00                	and    %al,(%eax)
	...
  281b3f:	00 00                	add    %al,(%eax)
  281b41:	00 08                	add    %cl,(%eax)
  281b43:	10 20                	adc    %ah,(%eax)
  281b45:	20 20                	and    %ah,(%eax)
  281b47:	20 20                	and    %ah,(%eax)
  281b49:	20 20                	and    %ah,(%eax)
  281b4b:	10 08                	adc    %cl,(%eax)
  281b4d:	00 00                	add    %al,(%eax)
  281b4f:	00 00                	add    %al,(%eax)
  281b51:	00 20                	add    %ah,(%eax)
  281b53:	10 08                	adc    %cl,(%eax)
  281b55:	08 08                	or     %cl,(%eax)
  281b57:	08 08                	or     %cl,(%eax)
  281b59:	08 08                	or     %cl,(%eax)
  281b5b:	10 20                	adc    %ah,(%eax)
	...
  281b65:	10 54 38 38          	adc    %dl,0x38(%eax,%edi,1)
  281b69:	54                   	push   %esp
  281b6a:	10 00                	adc    %al,(%eax)
	...
  281b74:	00 10                	add    %dl,(%eax)
  281b76:	10 7c 10 10          	adc    %bh,0x10(%eax,%edx,1)
	...
  281b8a:	10 10                	adc    %dl,(%eax)
  281b8c:	20 00                	and    %al,(%eax)
	...
  281b96:	00 7c 00 00          	add    %bh,0x0(%eax,%eax,1)
	...
  281baa:	00 10                	add    %dl,(%eax)
	...
  281bb4:	00 02                	add    %al,(%edx)
  281bb6:	04 08                	add    $0x8,%al
  281bb8:	10 20                	adc    %ah,(%eax)
  281bba:	40                   	inc    %eax
	...
  281bc3:	38 44 44 4c          	cmp    %al,0x4c(%esp,%eax,2)
  281bc7:	54                   	push   %esp
  281bc8:	64 44                	fs inc %esp
  281bca:	44                   	inc    %esp
  281bcb:	38 00                	cmp    %al,(%eax)
  281bcd:	00 00                	add    %al,(%eax)
  281bcf:	00 00                	add    %al,(%eax)
  281bd1:	00 00                	add    %al,(%eax)
  281bd3:	10 30                	adc    %dh,(%eax)
  281bd5:	10 10                	adc    %dl,(%eax)
  281bd7:	10 10                	adc    %dl,(%eax)
  281bd9:	10 10                	adc    %dl,(%eax)
  281bdb:	38 00                	cmp    %al,(%eax)
  281bdd:	00 00                	add    %al,(%eax)
  281bdf:	00 00                	add    %al,(%eax)
  281be1:	00 00                	add    %al,(%eax)
  281be3:	38 44 04 04          	cmp    %al,0x4(%esp,%eax,1)
  281be7:	08 10                	or     %dl,(%eax)
  281be9:	20 40 7c             	and    %al,0x7c(%eax)
  281bec:	00 00                	add    %al,(%eax)
  281bee:	00 00                	add    %al,(%eax)
  281bf0:	00 00                	add    %al,(%eax)
  281bf2:	00 7c 04 08          	add    %bh,0x8(%esp,%eax,1)
  281bf6:	10 38                	adc    %bh,(%eax)
  281bf8:	04 04                	add    $0x4,%al
  281bfa:	04 78                	add    $0x78,%al
  281bfc:	00 00                	add    %al,(%eax)
  281bfe:	00 00                	add    %al,(%eax)
  281c00:	00 00                	add    %al,(%eax)
  281c02:	00 08                	add    %cl,(%eax)
  281c04:	18 28                	sbb    %ch,(%eax)
  281c06:	48                   	dec    %eax
  281c07:	48                   	dec    %eax
  281c08:	7c 08                	jl     281c12 <hankaku+0x352>
  281c0a:	08 08                	or     %cl,(%eax)
  281c0c:	00 00                	add    %al,(%eax)
  281c0e:	00 00                	add    %al,(%eax)
  281c10:	00 00                	add    %al,(%eax)
  281c12:	00 7c 40 40          	add    %bh,0x40(%eax,%eax,2)
  281c16:	40                   	inc    %eax
  281c17:	78 04                	js     281c1d <hankaku+0x35d>
  281c19:	04 04                	add    $0x4,%al
  281c1b:	78 00                	js     281c1d <hankaku+0x35d>
  281c1d:	00 00                	add    %al,(%eax)
  281c1f:	00 00                	add    %al,(%eax)
  281c21:	00 00                	add    %al,(%eax)
  281c23:	3c 40                	cmp    $0x40,%al
  281c25:	40                   	inc    %eax
  281c26:	40                   	inc    %eax
  281c27:	78 44                	js     281c6d <hankaku+0x3ad>
  281c29:	44                   	inc    %esp
  281c2a:	44                   	inc    %esp
  281c2b:	38 00                	cmp    %al,(%eax)
  281c2d:	00 00                	add    %al,(%eax)
  281c2f:	00 00                	add    %al,(%eax)
  281c31:	00 00                	add    %al,(%eax)
  281c33:	7c 04                	jl     281c39 <hankaku+0x379>
  281c35:	04 08                	add    $0x8,%al
  281c37:	10 20                	adc    %ah,(%eax)
  281c39:	20 20                	and    %ah,(%eax)
  281c3b:	20 00                	and    %al,(%eax)
  281c3d:	00 00                	add    %al,(%eax)
  281c3f:	00 00                	add    %al,(%eax)
  281c41:	00 00                	add    %al,(%eax)
  281c43:	38 44 44 44          	cmp    %al,0x44(%esp,%eax,2)
  281c47:	38 44 44 44          	cmp    %al,0x44(%esp,%eax,2)
  281c4b:	38 00                	cmp    %al,(%eax)
  281c4d:	00 00                	add    %al,(%eax)
  281c4f:	00 00                	add    %al,(%eax)
  281c51:	00 00                	add    %al,(%eax)
  281c53:	38 44 44 44          	cmp    %al,0x44(%esp,%eax,2)
  281c57:	3c 04                	cmp    $0x4,%al
  281c59:	04 04                	add    $0x4,%al
  281c5b:	38 00                	cmp    %al,(%eax)
	...
  281c65:	00 00                	add    %al,(%eax)
  281c67:	10 00                	adc    %al,(%eax)
  281c69:	00 10                	add    %dl,(%eax)
	...
  281c77:	00 10                	add    %dl,(%eax)
  281c79:	00 10                	add    %dl,(%eax)
  281c7b:	10 20                	adc    %ah,(%eax)
	...
  281c85:	04 08                	add    $0x8,%al
  281c87:	10 20                	adc    %ah,(%eax)
  281c89:	10 08                	adc    %cl,(%eax)
  281c8b:	04 00                	add    $0x0,%al
	...
  281c95:	00 00                	add    %al,(%eax)
  281c97:	7c 00                	jl     281c99 <hankaku+0x3d9>
  281c99:	7c 00                	jl     281c9b <hankaku+0x3db>
	...
  281ca3:	00 00                	add    %al,(%eax)
  281ca5:	20 10                	and    %dl,(%eax)
  281ca7:	08 04 08             	or     %al,(%eax,%ecx,1)
  281caa:	10 20                	adc    %ah,(%eax)
  281cac:	00 00                	add    %al,(%eax)
  281cae:	00 00                	add    %al,(%eax)
  281cb0:	00 00                	add    %al,(%eax)
  281cb2:	38 44 44 04          	cmp    %al,0x4(%esp,%eax,2)
  281cb6:	08 10                	or     %dl,(%eax)
  281cb8:	10 00                	adc    %al,(%eax)
  281cba:	10 10                	adc    %dl,(%eax)
	...
  281cc4:	00 38                	add    %bh,(%eax)
  281cc6:	44                   	inc    %esp
  281cc7:	5c                   	pop    %esp
  281cc8:	54                   	push   %esp
  281cc9:	5c                   	pop    %esp
  281cca:	40                   	inc    %eax
  281ccb:	3c 00                	cmp    $0x0,%al
  281ccd:	00 00                	add    %al,(%eax)
  281ccf:	00 00                	add    %al,(%eax)
  281cd1:	00 18                	add    %bl,(%eax)
  281cd3:	24 42                	and    $0x42,%al
  281cd5:	42                   	inc    %edx
  281cd6:	42                   	inc    %edx
  281cd7:	7e 42                	jle    281d1b <hankaku+0x45b>
  281cd9:	42                   	inc    %edx
  281cda:	42                   	inc    %edx
  281cdb:	42                   	inc    %edx
  281cdc:	00 00                	add    %al,(%eax)
  281cde:	00 00                	add    %al,(%eax)
  281ce0:	00 00                	add    %al,(%eax)
  281ce2:	7c 42                	jl     281d26 <hankaku+0x466>
  281ce4:	42                   	inc    %edx
  281ce5:	42                   	inc    %edx
  281ce6:	7c 42                	jl     281d2a <hankaku+0x46a>
  281ce8:	42                   	inc    %edx
  281ce9:	42                   	inc    %edx
  281cea:	42                   	inc    %edx
  281ceb:	7c 00                	jl     281ced <hankaku+0x42d>
  281ced:	00 00                	add    %al,(%eax)
  281cef:	00 00                	add    %al,(%eax)
  281cf1:	00 3c 42             	add    %bh,(%edx,%eax,2)
  281cf4:	40                   	inc    %eax
  281cf5:	40                   	inc    %eax
  281cf6:	40                   	inc    %eax
  281cf7:	40                   	inc    %eax
  281cf8:	40                   	inc    %eax
  281cf9:	40                   	inc    %eax
  281cfa:	42                   	inc    %edx
  281cfb:	3c 00                	cmp    $0x0,%al
  281cfd:	00 00                	add    %al,(%eax)
  281cff:	00 00                	add    %al,(%eax)
  281d01:	00 7c 42 42          	add    %bh,0x42(%edx,%eax,2)
  281d05:	42                   	inc    %edx
  281d06:	42                   	inc    %edx
  281d07:	42                   	inc    %edx
  281d08:	42                   	inc    %edx
  281d09:	42                   	inc    %edx
  281d0a:	42                   	inc    %edx
  281d0b:	7c 00                	jl     281d0d <hankaku+0x44d>
  281d0d:	00 00                	add    %al,(%eax)
  281d0f:	00 00                	add    %al,(%eax)
  281d11:	00 7e 40             	add    %bh,0x40(%esi)
  281d14:	40                   	inc    %eax
  281d15:	40                   	inc    %eax
  281d16:	78 40                	js     281d58 <hankaku+0x498>
  281d18:	40                   	inc    %eax
  281d19:	40                   	inc    %eax
  281d1a:	40                   	inc    %eax
  281d1b:	7e 00                	jle    281d1d <hankaku+0x45d>
  281d1d:	00 00                	add    %al,(%eax)
  281d1f:	00 00                	add    %al,(%eax)
  281d21:	00 7e 40             	add    %bh,0x40(%esi)
  281d24:	40                   	inc    %eax
  281d25:	40                   	inc    %eax
  281d26:	78 40                	js     281d68 <hankaku+0x4a8>
  281d28:	40                   	inc    %eax
  281d29:	40                   	inc    %eax
  281d2a:	40                   	inc    %eax
  281d2b:	40                   	inc    %eax
  281d2c:	00 00                	add    %al,(%eax)
  281d2e:	00 00                	add    %al,(%eax)
  281d30:	00 00                	add    %al,(%eax)
  281d32:	3c 42                	cmp    $0x42,%al
  281d34:	40                   	inc    %eax
  281d35:	40                   	inc    %eax
  281d36:	5e                   	pop    %esi
  281d37:	42                   	inc    %edx
  281d38:	42                   	inc    %edx
  281d39:	42                   	inc    %edx
  281d3a:	42                   	inc    %edx
  281d3b:	3c 00                	cmp    $0x0,%al
  281d3d:	00 00                	add    %al,(%eax)
  281d3f:	00 00                	add    %al,(%eax)
  281d41:	00 42 42             	add    %al,0x42(%edx)
  281d44:	42                   	inc    %edx
  281d45:	42                   	inc    %edx
  281d46:	7e 42                	jle    281d8a <hankaku+0x4ca>
  281d48:	42                   	inc    %edx
  281d49:	42                   	inc    %edx
  281d4a:	42                   	inc    %edx
  281d4b:	42                   	inc    %edx
  281d4c:	00 00                	add    %al,(%eax)
  281d4e:	00 00                	add    %al,(%eax)
  281d50:	00 00                	add    %al,(%eax)
  281d52:	38 10                	cmp    %dl,(%eax)
  281d54:	10 10                	adc    %dl,(%eax)
  281d56:	10 10                	adc    %dl,(%eax)
  281d58:	10 10                	adc    %dl,(%eax)
  281d5a:	10 38                	adc    %bh,(%eax)
  281d5c:	00 00                	add    %al,(%eax)
  281d5e:	00 00                	add    %al,(%eax)
  281d60:	00 00                	add    %al,(%eax)
  281d62:	1c 08                	sbb    $0x8,%al
  281d64:	08 08                	or     %cl,(%eax)
  281d66:	08 08                	or     %cl,(%eax)
  281d68:	08 08                	or     %cl,(%eax)
  281d6a:	48                   	dec    %eax
  281d6b:	30 00                	xor    %al,(%eax)
  281d6d:	00 00                	add    %al,(%eax)
  281d6f:	00 00                	add    %al,(%eax)
  281d71:	00 42 44             	add    %al,0x44(%edx)
  281d74:	48                   	dec    %eax
  281d75:	50                   	push   %eax
  281d76:	60                   	pusha  
  281d77:	60                   	pusha  
  281d78:	50                   	push   %eax
  281d79:	48                   	dec    %eax
  281d7a:	44                   	inc    %esp
  281d7b:	42                   	inc    %edx
  281d7c:	00 00                	add    %al,(%eax)
  281d7e:	00 00                	add    %al,(%eax)
  281d80:	00 00                	add    %al,(%eax)
  281d82:	40                   	inc    %eax
  281d83:	40                   	inc    %eax
  281d84:	40                   	inc    %eax
  281d85:	40                   	inc    %eax
  281d86:	40                   	inc    %eax
  281d87:	40                   	inc    %eax
  281d88:	40                   	inc    %eax
  281d89:	40                   	inc    %eax
  281d8a:	40                   	inc    %eax
  281d8b:	7e 00                	jle    281d8d <hankaku+0x4cd>
  281d8d:	00 00                	add    %al,(%eax)
  281d8f:	00 00                	add    %al,(%eax)
  281d91:	00 82 82 c6 c6 aa    	add    %al,-0x5539397e(%edx)
  281d97:	aa                   	stos   %al,%es:(%edi)
  281d98:	92                   	xchg   %eax,%edx
  281d99:	92                   	xchg   %eax,%edx
  281d9a:	82 82 00 00 00 00 00 	addb   $0x0,0x0(%edx)
  281da1:	00 42 62             	add    %al,0x62(%edx)
  281da4:	62 52 52             	bound  %edx,0x52(%edx)
  281da7:	4a                   	dec    %edx
  281da8:	4a                   	dec    %edx
  281da9:	46                   	inc    %esi
  281daa:	46                   	inc    %esi
  281dab:	42                   	inc    %edx
  281dac:	00 00                	add    %al,(%eax)
  281dae:	00 00                	add    %al,(%eax)
  281db0:	00 00                	add    %al,(%eax)
  281db2:	3c 42                	cmp    $0x42,%al
  281db4:	42                   	inc    %edx
  281db5:	42                   	inc    %edx
  281db6:	42                   	inc    %edx
  281db7:	42                   	inc    %edx
  281db8:	42                   	inc    %edx
  281db9:	42                   	inc    %edx
  281dba:	42                   	inc    %edx
  281dbb:	3c 00                	cmp    $0x0,%al
  281dbd:	00 00                	add    %al,(%eax)
  281dbf:	00 00                	add    %al,(%eax)
  281dc1:	00 7c 42 42          	add    %bh,0x42(%edx,%eax,2)
  281dc5:	42                   	inc    %edx
  281dc6:	42                   	inc    %edx
  281dc7:	7c 40                	jl     281e09 <hankaku+0x549>
  281dc9:	40                   	inc    %eax
  281dca:	40                   	inc    %eax
  281dcb:	40                   	inc    %eax
  281dcc:	00 00                	add    %al,(%eax)
  281dce:	00 00                	add    %al,(%eax)
  281dd0:	00 00                	add    %al,(%eax)
  281dd2:	3c 42                	cmp    $0x42,%al
  281dd4:	42                   	inc    %edx
  281dd5:	42                   	inc    %edx
  281dd6:	42                   	inc    %edx
  281dd7:	42                   	inc    %edx
  281dd8:	42                   	inc    %edx
  281dd9:	42                   	inc    %edx
  281dda:	4a                   	dec    %edx
  281ddb:	3c 0e                	cmp    $0xe,%al
  281ddd:	00 00                	add    %al,(%eax)
  281ddf:	00 00                	add    %al,(%eax)
  281de1:	00 7c 42 42          	add    %bh,0x42(%edx,%eax,2)
  281de5:	42                   	inc    %edx
  281de6:	42                   	inc    %edx
  281de7:	7c 50                	jl     281e39 <hankaku+0x579>
  281de9:	48                   	dec    %eax
  281dea:	44                   	inc    %esp
  281deb:	42                   	inc    %edx
  281dec:	00 00                	add    %al,(%eax)
  281dee:	00 00                	add    %al,(%eax)
  281df0:	00 00                	add    %al,(%eax)
  281df2:	3c 42                	cmp    $0x42,%al
  281df4:	40                   	inc    %eax
  281df5:	40                   	inc    %eax
  281df6:	3c 02                	cmp    $0x2,%al
  281df8:	02 02                	add    (%edx),%al
  281dfa:	42                   	inc    %edx
  281dfb:	3c 00                	cmp    $0x0,%al
  281dfd:	00 00                	add    %al,(%eax)
  281dff:	00 00                	add    %al,(%eax)
  281e01:	00 7c 10 10          	add    %bh,0x10(%eax,%edx,1)
  281e05:	10 10                	adc    %dl,(%eax)
  281e07:	10 10                	adc    %dl,(%eax)
  281e09:	10 10                	adc    %dl,(%eax)
  281e0b:	10 00                	adc    %al,(%eax)
  281e0d:	00 00                	add    %al,(%eax)
  281e0f:	00 00                	add    %al,(%eax)
  281e11:	00 42 42             	add    %al,0x42(%edx)
  281e14:	42                   	inc    %edx
  281e15:	42                   	inc    %edx
  281e16:	42                   	inc    %edx
  281e17:	42                   	inc    %edx
  281e18:	42                   	inc    %edx
  281e19:	42                   	inc    %edx
  281e1a:	42                   	inc    %edx
  281e1b:	3c 00                	cmp    $0x0,%al
  281e1d:	00 00                	add    %al,(%eax)
  281e1f:	00 00                	add    %al,(%eax)
  281e21:	00 44 44 44          	add    %al,0x44(%esp,%eax,2)
  281e25:	44                   	inc    %esp
  281e26:	28 28                	sub    %ch,(%eax)
  281e28:	28 10                	sub    %dl,(%eax)
  281e2a:	10 10                	adc    %dl,(%eax)
  281e2c:	00 00                	add    %al,(%eax)
  281e2e:	00 00                	add    %al,(%eax)
  281e30:	00 00                	add    %al,(%eax)
  281e32:	82 82 82 82 54 54 54 	addb   $0x54,0x54548282(%edx)
  281e39:	28 28                	sub    %ch,(%eax)
  281e3b:	28 00                	sub    %al,(%eax)
  281e3d:	00 00                	add    %al,(%eax)
  281e3f:	00 00                	add    %al,(%eax)
  281e41:	00 42 42             	add    %al,0x42(%edx)
  281e44:	24 18                	and    $0x18,%al
  281e46:	18 18                	sbb    %bl,(%eax)
  281e48:	24 24                	and    $0x24,%al
  281e4a:	42                   	inc    %edx
  281e4b:	42                   	inc    %edx
  281e4c:	00 00                	add    %al,(%eax)
  281e4e:	00 00                	add    %al,(%eax)
  281e50:	00 00                	add    %al,(%eax)
  281e52:	44                   	inc    %esp
  281e53:	44                   	inc    %esp
  281e54:	44                   	inc    %esp
  281e55:	44                   	inc    %esp
  281e56:	28 28                	sub    %ch,(%eax)
  281e58:	10 10                	adc    %dl,(%eax)
  281e5a:	10 10                	adc    %dl,(%eax)
  281e5c:	00 00                	add    %al,(%eax)
  281e5e:	00 00                	add    %al,(%eax)
  281e60:	00 00                	add    %al,(%eax)
  281e62:	7e 02                	jle    281e66 <hankaku+0x5a6>
  281e64:	02 04 08             	add    (%eax,%ecx,1),%al
  281e67:	10 20                	adc    %ah,(%eax)
  281e69:	40                   	inc    %eax
  281e6a:	40                   	inc    %eax
  281e6b:	7e 00                	jle    281e6d <hankaku+0x5ad>
  281e6d:	00 00                	add    %al,(%eax)
  281e6f:	00 00                	add    %al,(%eax)
  281e71:	00 38                	add    %bh,(%eax)
  281e73:	20 20                	and    %ah,(%eax)
  281e75:	20 20                	and    %ah,(%eax)
  281e77:	20 20                	and    %ah,(%eax)
  281e79:	20 20                	and    %ah,(%eax)
  281e7b:	38 00                	cmp    %al,(%eax)
	...
  281e85:	00 40 20             	add    %al,0x20(%eax)
  281e88:	10 08                	adc    %cl,(%eax)
  281e8a:	04 02                	add    $0x2,%al
  281e8c:	00 00                	add    %al,(%eax)
  281e8e:	00 00                	add    %al,(%eax)
  281e90:	00 00                	add    %al,(%eax)
  281e92:	1c 04                	sbb    $0x4,%al
  281e94:	04 04                	add    $0x4,%al
  281e96:	04 04                	add    $0x4,%al
  281e98:	04 04                	add    $0x4,%al
  281e9a:	04 1c                	add    $0x1c,%al
	...
  281ea4:	10 28                	adc    %ch,(%eax)
  281ea6:	44                   	inc    %esp
	...
  281ebb:	00 ff                	add    %bh,%bh
  281ebd:	00 00                	add    %al,(%eax)
  281ebf:	00 00                	add    %al,(%eax)
  281ec1:	00 00                	add    %al,(%eax)
  281ec3:	10 10                	adc    %dl,(%eax)
  281ec5:	08 00                	or     %al,(%eax)
	...
  281ed3:	00 00                	add    %al,(%eax)
  281ed5:	78 04                	js     281edb <hankaku+0x61b>
  281ed7:	3c 44                	cmp    $0x44,%al
  281ed9:	44                   	inc    %esp
  281eda:	44                   	inc    %esp
  281edb:	3a 00                	cmp    (%eax),%al
  281edd:	00 00                	add    %al,(%eax)
  281edf:	00 00                	add    %al,(%eax)
  281ee1:	00 40 40             	add    %al,0x40(%eax)
  281ee4:	40                   	inc    %eax
  281ee5:	5c                   	pop    %esp
  281ee6:	62 42 42             	bound  %eax,0x42(%edx)
  281ee9:	42                   	inc    %edx
  281eea:	62 5c 00 00          	bound  %ebx,0x0(%eax,%eax,1)
  281eee:	00 00                	add    %al,(%eax)
  281ef0:	00 00                	add    %al,(%eax)
  281ef2:	00 00                	add    %al,(%eax)
  281ef4:	00 3c 42             	add    %bh,(%edx,%eax,2)
  281ef7:	40                   	inc    %eax
  281ef8:	40                   	inc    %eax
  281ef9:	40                   	inc    %eax
  281efa:	42                   	inc    %edx
  281efb:	3c 00                	cmp    $0x0,%al
  281efd:	00 00                	add    %al,(%eax)
  281eff:	00 00                	add    %al,(%eax)
  281f01:	00 02                	add    %al,(%edx)
  281f03:	02 02                	add    (%edx),%al
  281f05:	3a 46 42             	cmp    0x42(%esi),%al
  281f08:	42                   	inc    %edx
  281f09:	42                   	inc    %edx
  281f0a:	46                   	inc    %esi
  281f0b:	3a 00                	cmp    (%eax),%al
	...
  281f15:	3c 42                	cmp    $0x42,%al
  281f17:	42                   	inc    %edx
  281f18:	7e 40                	jle    281f5a <hankaku+0x69a>
  281f1a:	42                   	inc    %edx
  281f1b:	3c 00                	cmp    $0x0,%al
  281f1d:	00 00                	add    %al,(%eax)
  281f1f:	00 00                	add    %al,(%eax)
  281f21:	00 0e                	add    %cl,(%esi)
  281f23:	10 10                	adc    %dl,(%eax)
  281f25:	10 3c 10             	adc    %bh,(%eax,%edx,1)
  281f28:	10 10                	adc    %dl,(%eax)
  281f2a:	10 10                	adc    %dl,(%eax)
	...
  281f34:	00 3e                	add    %bh,(%esi)
  281f36:	42                   	inc    %edx
  281f37:	42                   	inc    %edx
  281f38:	42                   	inc    %edx
  281f39:	42                   	inc    %edx
  281f3a:	3e 02 02             	add    %ds:(%edx),%al
  281f3d:	3c 00                	cmp    $0x0,%al
  281f3f:	00 00                	add    %al,(%eax)
  281f41:	00 40 40             	add    %al,0x40(%eax)
  281f44:	40                   	inc    %eax
  281f45:	5c                   	pop    %esp
  281f46:	62 42 42             	bound  %eax,0x42(%edx)
  281f49:	42                   	inc    %edx
  281f4a:	42                   	inc    %edx
  281f4b:	42                   	inc    %edx
  281f4c:	00 00                	add    %al,(%eax)
  281f4e:	00 00                	add    %al,(%eax)
  281f50:	00 00                	add    %al,(%eax)
  281f52:	00 08                	add    %cl,(%eax)
  281f54:	00 08                	add    %cl,(%eax)
  281f56:	08 08                	or     %cl,(%eax)
  281f58:	08 08                	or     %cl,(%eax)
  281f5a:	08 08                	or     %cl,(%eax)
  281f5c:	00 00                	add    %al,(%eax)
  281f5e:	00 00                	add    %al,(%eax)
  281f60:	00 00                	add    %al,(%eax)
  281f62:	00 04 00             	add    %al,(%eax,%eax,1)
  281f65:	04 04                	add    $0x4,%al
  281f67:	04 04                	add    $0x4,%al
  281f69:	04 04                	add    $0x4,%al
  281f6b:	04 44                	add    $0x44,%al
  281f6d:	38 00                	cmp    %al,(%eax)
  281f6f:	00 00                	add    %al,(%eax)
  281f71:	00 40 40             	add    %al,0x40(%eax)
  281f74:	40                   	inc    %eax
  281f75:	42                   	inc    %edx
  281f76:	44                   	inc    %esp
  281f77:	48                   	dec    %eax
  281f78:	50                   	push   %eax
  281f79:	68 44 42 00 00       	push   $0x4244
  281f7e:	00 00                	add    %al,(%eax)
  281f80:	00 00                	add    %al,(%eax)
  281f82:	10 10                	adc    %dl,(%eax)
  281f84:	10 10                	adc    %dl,(%eax)
  281f86:	10 10                	adc    %dl,(%eax)
  281f88:	10 10                	adc    %dl,(%eax)
  281f8a:	10 10                	adc    %dl,(%eax)
	...
  281f94:	00 ec                	add    %ch,%ah
  281f96:	92                   	xchg   %eax,%edx
  281f97:	92                   	xchg   %eax,%edx
  281f98:	92                   	xchg   %eax,%edx
  281f99:	92                   	xchg   %eax,%edx
  281f9a:	92                   	xchg   %eax,%edx
  281f9b:	92                   	xchg   %eax,%edx
	...
  281fa4:	00 7c 42 42          	add    %bh,0x42(%edx,%eax,2)
  281fa8:	42                   	inc    %edx
  281fa9:	42                   	inc    %edx
  281faa:	42                   	inc    %edx
  281fab:	42                   	inc    %edx
	...
  281fb4:	00 3c 42             	add    %bh,(%edx,%eax,2)
  281fb7:	42                   	inc    %edx
  281fb8:	42                   	inc    %edx
  281fb9:	42                   	inc    %edx
  281fba:	42                   	inc    %edx
  281fbb:	3c 00                	cmp    $0x0,%al
	...
  281fc5:	5c                   	pop    %esp
  281fc6:	62 42 42             	bound  %eax,0x42(%edx)
  281fc9:	42                   	inc    %edx
  281fca:	62 5c 40 40          	bound  %ebx,0x40(%eax,%eax,2)
  281fce:	00 00                	add    %al,(%eax)
  281fd0:	00 00                	add    %al,(%eax)
  281fd2:	00 00                	add    %al,(%eax)
  281fd4:	00 3a                	add    %bh,(%edx)
  281fd6:	46                   	inc    %esi
  281fd7:	42                   	inc    %edx
  281fd8:	42                   	inc    %edx
  281fd9:	42                   	inc    %edx
  281fda:	46                   	inc    %esi
  281fdb:	3a 02                	cmp    (%edx),%al
  281fdd:	02 00                	add    (%eax),%al
  281fdf:	00 00                	add    %al,(%eax)
  281fe1:	00 00                	add    %al,(%eax)
  281fe3:	00 00                	add    %al,(%eax)
  281fe5:	5c                   	pop    %esp
  281fe6:	62 40 40             	bound  %eax,0x40(%eax)
  281fe9:	40                   	inc    %eax
  281fea:	40                   	inc    %eax
  281feb:	40                   	inc    %eax
	...
  281ff4:	00 3c 42             	add    %bh,(%edx,%eax,2)
  281ff7:	40                   	inc    %eax
  281ff8:	3c 02                	cmp    $0x2,%al
  281ffa:	42                   	inc    %edx
  281ffb:	3c 00                	cmp    $0x0,%al
  281ffd:	00 00                	add    %al,(%eax)
  281fff:	00 00                	add    %al,(%eax)
  282001:	00 00                	add    %al,(%eax)
  282003:	20 20                	and    %ah,(%eax)
  282005:	78 20                	js     282027 <hankaku+0x767>
  282007:	20 20                	and    %ah,(%eax)
  282009:	20 22                	and    %ah,(%edx)
  28200b:	1c 00                	sbb    $0x0,%al
	...
  282015:	42                   	inc    %edx
  282016:	42                   	inc    %edx
  282017:	42                   	inc    %edx
  282018:	42                   	inc    %edx
  282019:	42                   	inc    %edx
  28201a:	42                   	inc    %edx
  28201b:	3e 00 00             	add    %al,%ds:(%eax)
  28201e:	00 00                	add    %al,(%eax)
  282020:	00 00                	add    %al,(%eax)
  282022:	00 00                	add    %al,(%eax)
  282024:	00 42 42             	add    %al,0x42(%edx)
  282027:	42                   	inc    %edx
  282028:	42                   	inc    %edx
  282029:	42                   	inc    %edx
  28202a:	24 18                	and    $0x18,%al
	...
  282034:	00 82 82 82 92 92    	add    %al,-0x6d6d7d7e(%edx)
  28203a:	aa                   	stos   %al,%es:(%edi)
  28203b:	44                   	inc    %esp
	...
  282044:	00 42 42             	add    %al,0x42(%edx)
  282047:	24 18                	and    $0x18,%al
  282049:	24 42                	and    $0x42,%al
  28204b:	42                   	inc    %edx
	...
  282054:	00 42 42             	add    %al,0x42(%edx)
  282057:	42                   	inc    %edx
  282058:	42                   	inc    %edx
  282059:	42                   	inc    %edx
  28205a:	3e 02 02             	add    %ds:(%edx),%al
  28205d:	3c 00                	cmp    $0x0,%al
  28205f:	00 00                	add    %al,(%eax)
  282061:	00 00                	add    %al,(%eax)
  282063:	00 00                	add    %al,(%eax)
  282065:	7e 02                	jle    282069 <hankaku+0x7a9>
  282067:	04 18                	add    $0x18,%al
  282069:	20 40 7e             	and    %al,0x7e(%eax)
  28206c:	00 00                	add    %al,(%eax)
  28206e:	00 00                	add    %al,(%eax)
  282070:	00 00                	add    %al,(%eax)
  282072:	08 10                	or     %dl,(%eax)
  282074:	10 10                	adc    %dl,(%eax)
  282076:	20 40 20             	and    %al,0x20(%eax)
  282079:	10 10                	adc    %dl,(%eax)
  28207b:	10 08                	adc    %cl,(%eax)
  28207d:	00 00                	add    %al,(%eax)
  28207f:	00 00                	add    %al,(%eax)
  282081:	10 10                	adc    %dl,(%eax)
  282083:	10 10                	adc    %dl,(%eax)
  282085:	10 10                	adc    %dl,(%eax)
  282087:	10 10                	adc    %dl,(%eax)
  282089:	10 10                	adc    %dl,(%eax)
  28208b:	10 10                	adc    %dl,(%eax)
  28208d:	10 10                	adc    %dl,(%eax)
  28208f:	00 00                	add    %al,(%eax)
  282091:	00 20                	add    %ah,(%eax)
  282093:	10 10                	adc    %dl,(%eax)
  282095:	10 08                	adc    %cl,(%eax)
  282097:	04 08                	add    $0x8,%al
  282099:	10 10                	adc    %dl,(%eax)
  28209b:	10 20                	adc    %ah,(%eax)
	...
  2820a5:	00 22                	add    %ah,(%edx)
  2820a7:	54                   	push   %esp
  2820a8:	88 00                	mov    %al,(%eax)
	...

002820c0 <ASCII_Table>:
	...
  2820f0:	00 00                	add    %al,(%eax)
  2820f2:	80 01 80             	addb   $0x80,(%ecx)
  2820f5:	01 80 01 80 01 80    	add    %eax,-0x7ffe7fff(%eax)
  2820fb:	01 80 01 80 01 80    	add    %eax,-0x7ffe7fff(%eax)
  282101:	01 80 01 80 01 80    	add    %eax,-0x7ffe7fff(%eax)
  282107:	01 80 01 80 01 00    	add    %eax,0x18001(%eax)
  28210d:	00 00                	add    %al,(%eax)
  28210f:	00 80 01 80 01 00    	add    %al,0x18001(%eax)
	...
  282121:	00 00                	add    %al,(%eax)
  282123:	00 cc                	add    %cl,%ah
  282125:	00 cc                	add    %cl,%ah
  282127:	00 cc                	add    %cl,%ah
  282129:	00 cc                	add    %cl,%ah
  28212b:	00 cc                	add    %cl,%ah
  28212d:	00 cc                	add    %cl,%ah
	...
  28215b:	00 60 0c             	add    %ah,0xc(%eax)
  28215e:	60                   	pusha  
  28215f:	0c 60                	or     $0x60,%al
  282161:	0c 30                	or     $0x30,%al
  282163:	06                   	push   %es
  282164:	30 06                	xor    %al,(%esi)
  282166:	fe                   	(bad)  
  282167:	1f                   	pop    %ds
  282168:	fe                   	(bad)  
  282169:	1f                   	pop    %ds
  28216a:	30 06                	xor    %al,(%esi)
  28216c:	38 07                	cmp    %al,(%edi)
  28216e:	18 03                	sbb    %al,(%ebx)
  282170:	fe                   	(bad)  
  282171:	1f                   	pop    %ds
  282172:	fe                   	(bad)  
  282173:	1f                   	pop    %ds
  282174:	18 03                	sbb    %al,(%ebx)
  282176:	18 03                	sbb    %al,(%ebx)
  282178:	8c 01                	mov    %es,(%ecx)
  28217a:	8c 01                	mov    %es,(%ecx)
  28217c:	8c 01                	mov    %es,(%ecx)
  28217e:	00 00                	add    %al,(%eax)
  282180:	00 00                	add    %al,(%eax)
  282182:	80 00 e0             	addb   $0xe0,(%eax)
  282185:	03 f8                	add    %eax,%edi
  282187:	0f 9c 0e             	setl   (%esi)
  28218a:	8c 1c 8c             	mov    %ds,(%esp,%ecx,4)
  28218d:	18 8c 00 98 00 f8 01 	sbb    %cl,0x1f80098(%eax,%eax,1)
  282194:	e0 07                	loopne 28219d <ASCII_Table+0xdd>
  282196:	80 0e 80             	orb    $0x80,(%esi)
  282199:	1c 8c                	sbb    $0x8c,%al
  28219b:	18 8c 18 9c 18 b8 0c 	sbb    %cl,0xcb8189c(%eax,%ebx,1)
  2821a2:	f0 0f e0 03          	lock pavgb (%ebx),%mm0
  2821a6:	80 00 80             	addb   $0x80,(%eax)
	...
  2821b5:	00 0e                	add    %cl,(%esi)
  2821b7:	18 1b                	sbb    %bl,(%ebx)
  2821b9:	0c 11                	or     $0x11,%al
  2821bb:	0c 11                	or     $0x11,%al
  2821bd:	06                   	push   %es
  2821be:	11 06                	adc    %eax,(%esi)
  2821c0:	11 03                	adc    %eax,(%ebx)
  2821c2:	11 03                	adc    %eax,(%ebx)
  2821c4:	9b                   	fwait
  2821c5:	01 8e 01 c0 38 c0    	add    %ecx,-0x3fc73fff(%esi)
  2821cb:	6c                   	insb   (%dx),%es:(%edi)
  2821cc:	60                   	pusha  
  2821cd:	44                   	inc    %esp
  2821ce:	60                   	pusha  
  2821cf:	44                   	inc    %esp
  2821d0:	30 44 30 44          	xor    %al,0x44(%eax,%esi,1)
  2821d4:	18 44 18 6c          	sbb    %al,0x6c(%eax,%ebx,1)
  2821d8:	0c 38                	or     $0x38,%al
	...
  2821e2:	e0 01                	loopne 2821e5 <ASCII_Table+0x125>
  2821e4:	f0 03 38             	lock add (%eax),%edi
  2821e7:	07                   	pop    %es
  2821e8:	18 06                	sbb    %al,(%esi)
  2821ea:	18 06                	sbb    %al,(%esi)
  2821ec:	30 03                	xor    %al,(%ebx)
  2821ee:	f0 01 f0             	lock add %esi,%eax
  2821f1:	00 f8                	add    %bh,%al
  2821f3:	00 9c 31 0e 33 06 1e 	add    %bl,0x1e06330e(%ecx,%esi,1)
  2821fa:	06                   	push   %es
  2821fb:	1c 06                	sbb    $0x6,%al
  2821fd:	1c 06                	sbb    $0x6,%al
  2821ff:	3f                   	aas    
  282200:	fc                   	cld    
  282201:	73 f0                	jae    2821f3 <ASCII_Table+0x133>
  282203:	21 00                	and    %eax,(%eax)
	...
  282211:	00 00                	add    %al,(%eax)
  282213:	00 0c 00             	add    %cl,(%eax,%eax,1)
  282216:	0c 00                	or     $0x0,%al
  282218:	0c 00                	or     $0x0,%al
  28221a:	0c 00                	or     $0x0,%al
  28221c:	0c 00                	or     $0x0,%al
  28221e:	0c 00                	or     $0x0,%al
	...
  282240:	00 00                	add    %al,(%eax)
  282242:	00 02                	add    %al,(%edx)
  282244:	00 03                	add    %al,(%ebx)
  282246:	80 01 c0             	addb   $0xc0,(%ecx)
  282249:	00 c0                	add    %al,%al
  28224b:	00 60 00             	add    %ah,0x0(%eax)
  28224e:	60                   	pusha  
  28224f:	00 30                	add    %dh,(%eax)
  282251:	00 30                	add    %dh,(%eax)
  282253:	00 30                	add    %dh,(%eax)
  282255:	00 30                	add    %dh,(%eax)
  282257:	00 30                	add    %dh,(%eax)
  282259:	00 30                	add    %dh,(%eax)
  28225b:	00 30                	add    %dh,(%eax)
  28225d:	00 30                	add    %dh,(%eax)
  28225f:	00 60 00             	add    %ah,0x0(%eax)
  282262:	60                   	pusha  
  282263:	00 c0                	add    %al,%al
  282265:	00 c0                	add    %al,%al
  282267:	00 80 01 00 03 00    	add    %al,0x30001(%eax)
  28226d:	02 00                	add    (%eax),%al
  28226f:	00 00                	add    %al,(%eax)
  282271:	00 20                	add    %ah,(%eax)
  282273:	00 60 00             	add    %ah,0x0(%eax)
  282276:	c0 00 80             	rolb   $0x80,(%eax)
  282279:	01 80 01 00 03 00    	add    %eax,0x30001(%eax)
  28227f:	03 00                	add    (%eax),%eax
  282281:	06                   	push   %es
  282282:	00 06                	add    %al,(%esi)
  282284:	00 06                	add    %al,(%esi)
  282286:	00 06                	add    %al,(%esi)
  282288:	00 06                	add    %al,(%esi)
  28228a:	00 06                	add    %al,(%esi)
  28228c:	00 06                	add    %al,(%esi)
  28228e:	00 06                	add    %al,(%esi)
  282290:	00 03                	add    %al,(%ebx)
  282292:	00 03                	add    %al,(%ebx)
  282294:	80 01 80             	addb   $0x80,(%ecx)
  282297:	01 c0                	add    %eax,%eax
  282299:	00 60 00             	add    %ah,0x0(%eax)
  28229c:	20 00                	and    %al,(%eax)
	...
  2822aa:	00 00                	add    %al,(%eax)
  2822ac:	c0 00 c0             	rolb   $0xc0,(%eax)
  2822af:	00 d8                	add    %bl,%al
  2822b1:	06                   	push   %es
  2822b2:	f8                   	clc    
  2822b3:	07                   	pop    %es
  2822b4:	e0 01                	loopne 2822b7 <ASCII_Table+0x1f7>
  2822b6:	30 03                	xor    %al,(%ebx)
  2822b8:	38 07                	cmp    %al,(%edi)
	...
  2822da:	00 00                	add    %al,(%eax)
  2822dc:	80 01 80             	addb   $0x80,(%ecx)
  2822df:	01 80 01 80 01 80    	add    %eax,-0x7ffe7fff(%eax)
  2822e5:	01 fc                	add    %edi,%esp
  2822e7:	3f                   	aas    
  2822e8:	fc                   	cld    
  2822e9:	3f                   	aas    
  2822ea:	80 01 80             	addb   $0x80,(%ecx)
  2822ed:	01 80 01 80 01 80    	add    %eax,-0x7ffe7fff(%eax)
  2822f3:	01 00                	add    %eax,(%eax)
	...
  282321:	00 80 01 80 01 00    	add    %al,0x18001(%eax)
  282327:	01 00                	add    %eax,(%eax)
  282329:	01 80 00 00 00 00    	add    %eax,0x0(%eax)
	...
  282347:	00 e0                	add    %ah,%al
  282349:	07                   	pop    %es
  28234a:	e0 07                	loopne 282353 <ASCII_Table+0x293>
	...
  282380:	00 00                	add    %al,(%eax)
  282382:	c0 00 c0             	rolb   $0xc0,(%eax)
	...
  282391:	00 00                	add    %al,(%eax)
  282393:	0c 00                	or     $0x0,%al
  282395:	0c 00                	or     $0x0,%al
  282397:	06                   	push   %es
  282398:	00 06                	add    %al,(%esi)
  28239a:	00 06                	add    %al,(%esi)
  28239c:	00 03                	add    %al,(%ebx)
  28239e:	00 03                	add    %al,(%ebx)
  2823a0:	00 03                	add    %al,(%ebx)
  2823a2:	80 03 80             	addb   $0x80,(%ebx)
  2823a5:	01 80 01 80 01 c0    	add    %eax,-0x3ffe7fff(%eax)
  2823ab:	00 c0                	add    %al,%al
  2823ad:	00 c0                	add    %al,%al
  2823af:	00 60 00             	add    %ah,0x0(%eax)
  2823b2:	60                   	pusha  
	...
  2823bf:	00 00                	add    %al,(%eax)
  2823c1:	00 e0                	add    %ah,%al
  2823c3:	03 f0                	add    %eax,%esi
  2823c5:	07                   	pop    %es
  2823c6:	38 0e                	cmp    %cl,(%esi)
  2823c8:	18 0c 0c             	sbb    %cl,(%esp,%ecx,1)
  2823cb:	18 0c 18             	sbb    %cl,(%eax,%ebx,1)
  2823ce:	0c 18                	or     $0x18,%al
  2823d0:	0c 18                	or     $0x18,%al
  2823d2:	0c 18                	or     $0x18,%al
  2823d4:	0c 18                	or     $0x18,%al
  2823d6:	0c 18                	or     $0x18,%al
  2823d8:	0c 18                	or     $0x18,%al
  2823da:	0c 18                	or     $0x18,%al
  2823dc:	18 0c 38             	sbb    %cl,(%eax,%edi,1)
  2823df:	0e                   	push   %cs
  2823e0:	f0 07                	lock pop %es
  2823e2:	e0 03                	loopne 2823e7 <ASCII_Table+0x327>
	...
  2823f0:	00 00                	add    %al,(%eax)
  2823f2:	00 01                	add    %al,(%ecx)
  2823f4:	80 01 c0             	addb   $0xc0,(%ecx)
  2823f7:	01 f0                	add    %esi,%eax
  2823f9:	01 98 01 88 01 80    	add    %ebx,-0x7ffe77ff(%eax)
  2823ff:	01 80 01 80 01 80    	add    %eax,-0x7ffe7fff(%eax)
  282405:	01 80 01 80 01 80    	add    %eax,-0x7ffe7fff(%eax)
  28240b:	01 80 01 80 01 80    	add    %eax,-0x7ffe7fff(%eax)
  282411:	01 80 01 00 00 00    	add    %eax,0x1(%eax)
	...
  28241f:	00 00                	add    %al,(%eax)
  282421:	00 e0                	add    %ah,%al
  282423:	03 f8                	add    %eax,%edi
  282425:	0f 18 0c 0c          	prefetcht0 (%esp,%ecx,1)
  282429:	18 0c 18             	sbb    %cl,(%eax,%ebx,1)
  28242c:	00 18                	add    %bl,(%eax)
  28242e:	00 18                	add    %bl,(%eax)
  282430:	00 0c 00             	add    %cl,(%eax,%eax,1)
  282433:	06                   	push   %es
  282434:	00 03                	add    %al,(%ebx)
  282436:	80 01 c0             	addb   $0xc0,(%ecx)
  282439:	00 60 00             	add    %ah,0x0(%eax)
  28243c:	30 00                	xor    %al,(%eax)
  28243e:	18 00                	sbb    %al,(%eax)
  282440:	fc                   	cld    
  282441:	1f                   	pop    %ds
  282442:	fc                   	cld    
  282443:	1f                   	pop    %ds
	...
  282450:	00 00                	add    %al,(%eax)
  282452:	e0 01                	loopne 282455 <ASCII_Table+0x395>
  282454:	f8                   	clc    
  282455:	07                   	pop    %es
  282456:	18 0e                	sbb    %cl,(%esi)
  282458:	0c 0c                	or     $0xc,%al
  28245a:	0c 0c                	or     $0xc,%al
  28245c:	00 0c 00             	add    %cl,(%eax,%eax,1)
  28245f:	06                   	push   %es
  282460:	c0 03 c0             	rolb   $0xc0,(%ebx)
  282463:	07                   	pop    %es
  282464:	00 0c 00             	add    %cl,(%eax,%eax,1)
  282467:	18 00                	sbb    %al,(%eax)
  282469:	18 0c 18             	sbb    %cl,(%eax,%ebx,1)
  28246c:	0c 18                	or     $0x18,%al
  28246e:	18 0c f8             	sbb    %cl,(%eax,%edi,8)
  282471:	07                   	pop    %es
  282472:	e0 03                	loopne 282477 <ASCII_Table+0x3b7>
	...
  282480:	00 00                	add    %al,(%eax)
  282482:	00 0c 00             	add    %cl,(%eax,%eax,1)
  282485:	0e                   	push   %cs
  282486:	00 0f                	add    %cl,(%edi)
  282488:	00 0f                	add    %cl,(%edi)
  28248a:	80 0d c0 0c 60 0c 60 	orb    $0x60,0xc600cc0
  282491:	0c 30                	or     $0x30,%al
  282493:	0c 18                	or     $0x18,%al
  282495:	0c 0c                	or     $0xc,%al
  282497:	0c fc                	or     $0xfc,%al
  282499:	3f                   	aas    
  28249a:	fc                   	cld    
  28249b:	3f                   	aas    
  28249c:	00 0c 00             	add    %cl,(%eax,%eax,1)
  28249f:	0c 00                	or     $0x0,%al
  2824a1:	0c 00                	or     $0x0,%al
  2824a3:	0c 00                	or     $0x0,%al
	...
  2824b1:	00 f8                	add    %bh,%al
  2824b3:	0f f8 0f             	psubb  (%edi),%mm1
  2824b6:	18 00                	sbb    %al,(%eax)
  2824b8:	18 00                	sbb    %al,(%eax)
  2824ba:	0c 00                	or     $0x0,%al
  2824bc:	ec                   	in     (%dx),%al
  2824bd:	03 fc                	add    %esp,%edi
  2824bf:	07                   	pop    %es
  2824c0:	1c 0e                	sbb    $0xe,%al
  2824c2:	00 1c 00             	add    %bl,(%eax,%eax,1)
  2824c5:	18 00                	sbb    %al,(%eax)
  2824c7:	18 00                	sbb    %al,(%eax)
  2824c9:	18 0c 18             	sbb    %cl,(%eax,%ebx,1)
  2824cc:	1c 0c                	sbb    $0xc,%al
  2824ce:	18 0e                	sbb    %cl,(%esi)
  2824d0:	f8                   	clc    
  2824d1:	07                   	pop    %es
  2824d2:	e0 03                	loopne 2824d7 <ASCII_Table+0x417>
	...
  2824e0:	00 00                	add    %al,(%eax)
  2824e2:	c0 07 f0             	rolb   $0xf0,(%edi)
  2824e5:	0f 38 1c 18          	pabsb  (%eax),%mm3
  2824e9:	18 18                	sbb    %bl,(%eax)
  2824eb:	00 0c 00             	add    %cl,(%eax,%eax,1)
  2824ee:	cc                   	int3   
  2824ef:	03 ec                	add    %esp,%ebp
  2824f1:	0f 3c                	(bad)  
  2824f3:	0e                   	push   %cs
  2824f4:	1c 1c                	sbb    $0x1c,%al
  2824f6:	0c 18                	or     $0x18,%al
  2824f8:	0c 18                	or     $0x18,%al
  2824fa:	0c 18                	or     $0x18,%al
  2824fc:	18 1c 38             	sbb    %bl,(%eax,%edi,1)
  2824ff:	0e                   	push   %cs
  282500:	f0 07                	lock pop %es
  282502:	e0 03                	loopne 282507 <ASCII_Table+0x447>
	...
  282510:	00 00                	add    %al,(%eax)
  282512:	fc                   	cld    
  282513:	1f                   	pop    %ds
  282514:	fc                   	cld    
  282515:	1f                   	pop    %ds
  282516:	00 0c 00             	add    %cl,(%eax,%eax,1)
  282519:	06                   	push   %es
  28251a:	00 06                	add    %al,(%esi)
  28251c:	00 03                	add    %al,(%ebx)
  28251e:	80 03 80             	addb   $0x80,(%ebx)
  282521:	01 c0                	add    %eax,%eax
  282523:	01 c0                	add    %eax,%eax
  282525:	00 e0                	add    %ah,%al
  282527:	00 60 00             	add    %ah,0x0(%eax)
  28252a:	60                   	pusha  
  28252b:	00 70 00             	add    %dh,0x0(%eax)
  28252e:	30 00                	xor    %al,(%eax)
  282530:	30 00                	xor    %al,(%eax)
  282532:	30 00                	xor    %al,(%eax)
	...
  282540:	00 00                	add    %al,(%eax)
  282542:	e0 03                	loopne 282547 <ASCII_Table+0x487>
  282544:	f0 07                	lock pop %es
  282546:	38 0e                	cmp    %cl,(%esi)
  282548:	18 0c 18             	sbb    %cl,(%eax,%ebx,1)
  28254b:	0c 18                	or     $0x18,%al
  28254d:	0c 38                	or     $0x38,%al
  28254f:	06                   	push   %es
  282550:	f0 07                	lock pop %es
  282552:	f0 07                	lock pop %es
  282554:	18 0c 0c             	sbb    %cl,(%esp,%ecx,1)
  282557:	18 0c 18             	sbb    %cl,(%eax,%ebx,1)
  28255a:	0c 18                	or     $0x18,%al
  28255c:	0c 18                	or     $0x18,%al
  28255e:	38 0c f8             	cmp    %cl,(%eax,%edi,8)
  282561:	0f e0 03             	pavgb  (%ebx),%mm0
	...
  282570:	00 00                	add    %al,(%eax)
  282572:	e0 03                	loopne 282577 <ASCII_Table+0x4b7>
  282574:	f0 07                	lock pop %es
  282576:	38 0e                	cmp    %cl,(%esi)
  282578:	1c 0c                	sbb    $0xc,%al
  28257a:	0c 18                	or     $0x18,%al
  28257c:	0c 18                	or     $0x18,%al
  28257e:	0c 18                	or     $0x18,%al
  282580:	1c 1c                	sbb    $0x1c,%al
  282582:	38 1e                	cmp    %bl,(%esi)
  282584:	f8                   	clc    
  282585:	1b e0                	sbb    %eax,%esp
  282587:	19 00                	sbb    %eax,(%eax)
  282589:	18 00                	sbb    %al,(%eax)
  28258b:	0c 00                	or     $0x0,%al
  28258d:	0c 1c                	or     $0x1c,%al
  28258f:	0e                   	push   %cs
  282590:	f8                   	clc    
  282591:	07                   	pop    %es
  282592:	f0 01 00             	lock add %eax,(%eax)
	...
  2825a9:	00 00                	add    %al,(%eax)
  2825ab:	00 80 01 80 01 00    	add    %al,0x18001(%eax)
	...
  2825bd:	00 00                	add    %al,(%eax)
  2825bf:	00 80 01 80 01 00    	add    %al,0x18001(%eax)
	...
  2825d9:	00 00                	add    %al,(%eax)
  2825db:	00 80 01 80 01 00    	add    %al,0x18001(%eax)
	...
  2825ed:	00 00                	add    %al,(%eax)
  2825ef:	00 80 01 80 01 00    	add    %al,0x18001(%eax)
  2825f5:	01 00                	add    %eax,(%eax)
  2825f7:	01 80 00 00 00 00    	add    %eax,0x0(%eax)
	...
  282611:	10 00                	adc    %al,(%eax)
  282613:	1c 80                	sbb    $0x80,%al
  282615:	0f e0 03             	pavgb  (%ebx),%mm0
  282618:	f8                   	clc    
  282619:	00 18                	add    %bl,(%eax)
  28261b:	00 f8                	add    %bh,%al
  28261d:	00 e0                	add    %ah,%al
  28261f:	03 80 0f 00 1c 00    	add    0x1c000f(%eax),%eax
  282625:	10 00                	adc    %al,(%eax)
	...
  28263f:	00 f8                	add    %bh,%al
  282641:	1f                   	pop    %ds
  282642:	00 00                	add    %al,(%eax)
  282644:	00 00                	add    %al,(%eax)
  282646:	00 00                	add    %al,(%eax)
  282648:	f8                   	clc    
  282649:	1f                   	pop    %ds
	...
  28266e:	00 00                	add    %al,(%eax)
  282670:	08 00                	or     %al,(%eax)
  282672:	38 00                	cmp    %al,(%eax)
  282674:	f0 01 c0             	lock add %eax,%eax
  282677:	07                   	pop    %es
  282678:	00 1f                	add    %bl,(%edi)
  28267a:	00 18                	add    %bl,(%eax)
  28267c:	00 1f                	add    %bl,(%edi)
  28267e:	c0 07 f0             	rolb   $0xf0,(%edi)
  282681:	01 38                	add    %edi,(%eax)
  282683:	00 08                	add    %cl,(%eax)
	...
  282691:	00 e0                	add    %ah,%al
  282693:	03 f8                	add    %eax,%edi
  282695:	0f 18 0c 0c          	prefetcht0 (%esp,%ecx,1)
  282699:	18 0c 18             	sbb    %cl,(%eax,%ebx,1)
  28269c:	00 18                	add    %bl,(%eax)
  28269e:	00 0c 00             	add    %cl,(%eax,%eax,1)
  2826a1:	06                   	push   %es
  2826a2:	00 03                	add    %al,(%ebx)
  2826a4:	80 01 c0             	addb   $0xc0,(%ecx)
  2826a7:	00 c0                	add    %al,%al
  2826a9:	00 c0                	add    %al,%al
  2826ab:	00 00                	add    %al,(%eax)
  2826ad:	00 00                	add    %al,(%eax)
  2826af:	00 c0                	add    %al,%al
  2826b1:	00 c0                	add    %al,%al
	...
  2826c3:	00 e0                	add    %ah,%al
  2826c5:	07                   	pop    %es
  2826c6:	18 18                	sbb    %bl,(%eax)
  2826c8:	04 20                	add    $0x20,%al
  2826ca:	c2 29 22             	ret    $0x2229
  2826cd:	4a                   	dec    %edx
  2826ce:	11 44 09 44          	adc    %eax,0x44(%ecx,%ecx,1)
  2826d2:	09 44 09 44          	or     %eax,0x44(%ecx,%ecx,1)
  2826d6:	09 22                	or     %esp,(%edx)
  2826d8:	11 13                	adc    %edx,(%ebx)
  2826da:	e2 0c                	loop   2826e8 <ASCII_Table+0x628>
  2826dc:	02 40 04             	add    0x4(%eax),%al
  2826df:	20 18                	and    %bl,(%eax)
  2826e1:	18 e0                	sbb    %ah,%al
  2826e3:	07                   	pop    %es
	...
  2826f0:	00 00                	add    %al,(%eax)
  2826f2:	80 03 80             	addb   $0x80,(%ebx)
  2826f5:	03 c0                	add    %eax,%eax
  2826f7:	06                   	push   %es
  2826f8:	c0 06 c0             	rolb   $0xc0,(%esi)
  2826fb:	06                   	push   %es
  2826fc:	60                   	pusha  
  2826fd:	0c 60                	or     $0x60,%al
  2826ff:	0c 30                	or     $0x30,%al
  282701:	18 30                	sbb    %dh,(%eax)
  282703:	18 30                	sbb    %dh,(%eax)
  282705:	18 f8                	sbb    %bh,%al
  282707:	3f                   	aas    
  282708:	f8                   	clc    
  282709:	3f                   	aas    
  28270a:	1c 70                	sbb    $0x70,%al
  28270c:	0c 60                	or     $0x60,%al
  28270e:	0c 60                	or     $0x60,%al
  282710:	06                   	push   %es
  282711:	c0 06 c0             	rolb   $0xc0,(%esi)
	...
  282720:	00 00                	add    %al,(%eax)
  282722:	fc                   	cld    
  282723:	03 fc                	add    %esp,%edi
  282725:	0f 0c                	(bad)  
  282727:	0c 0c                	or     $0xc,%al
  282729:	18 0c 18             	sbb    %cl,(%eax,%ebx,1)
  28272c:	0c 18                	or     $0x18,%al
  28272e:	0c 0c                	or     $0xc,%al
  282730:	fc                   	cld    
  282731:	07                   	pop    %es
  282732:	fc                   	cld    
  282733:	0f 0c                	(bad)  
  282735:	18 0c 30             	sbb    %cl,(%eax,%esi,1)
  282738:	0c 30                	or     $0x30,%al
  28273a:	0c 30                	or     $0x30,%al
  28273c:	0c 30                	or     $0x30,%al
  28273e:	0c 18                	or     $0x18,%al
  282740:	fc                   	cld    
  282741:	1f                   	pop    %ds
  282742:	fc                   	cld    
  282743:	07                   	pop    %es
	...
  282750:	00 00                	add    %al,(%eax)
  282752:	c0 07 f0             	rolb   $0xf0,(%edi)
  282755:	1f                   	pop    %ds
  282756:	38 38                	cmp    %bh,(%eax)
  282758:	1c 30                	sbb    $0x30,%al
  28275a:	0c 70                	or     $0x70,%al
  28275c:	06                   	push   %es
  28275d:	60                   	pusha  
  28275e:	06                   	push   %es
  28275f:	00 06                	add    %al,(%esi)
  282761:	00 06                	add    %al,(%esi)
  282763:	00 06                	add    %al,(%esi)
  282765:	00 06                	add    %al,(%esi)
  282767:	00 06                	add    %al,(%esi)
  282769:	00 06                	add    %al,(%esi)
  28276b:	60                   	pusha  
  28276c:	0c 70                	or     $0x70,%al
  28276e:	1c 30                	sbb    $0x30,%al
  282770:	f0 1f                	lock pop %ds
  282772:	e0 07                	loopne 28277b <ASCII_Table+0x6bb>
	...
  282780:	00 00                	add    %al,(%eax)
  282782:	fe 03                	incb   (%ebx)
  282784:	fe 0f                	decb   (%edi)
  282786:	06                   	push   %es
  282787:	0e                   	push   %cs
  282788:	06                   	push   %es
  282789:	18 06                	sbb    %al,(%esi)
  28278b:	18 06                	sbb    %al,(%esi)
  28278d:	30 06                	xor    %al,(%esi)
  28278f:	30 06                	xor    %al,(%esi)
  282791:	30 06                	xor    %al,(%esi)
  282793:	30 06                	xor    %al,(%esi)
  282795:	30 06                	xor    %al,(%esi)
  282797:	30 06                	xor    %al,(%esi)
  282799:	30 06                	xor    %al,(%esi)
  28279b:	18 06                	sbb    %al,(%esi)
  28279d:	18 06                	sbb    %al,(%esi)
  28279f:	0e                   	push   %cs
  2827a0:	fe 0f                	decb   (%edi)
  2827a2:	fe 03                	incb   (%ebx)
	...
  2827b0:	00 00                	add    %al,(%eax)
  2827b2:	fc                   	cld    
  2827b3:	3f                   	aas    
  2827b4:	fc                   	cld    
  2827b5:	3f                   	aas    
  2827b6:	0c 00                	or     $0x0,%al
  2827b8:	0c 00                	or     $0x0,%al
  2827ba:	0c 00                	or     $0x0,%al
  2827bc:	0c 00                	or     $0x0,%al
  2827be:	0c 00                	or     $0x0,%al
  2827c0:	fc                   	cld    
  2827c1:	1f                   	pop    %ds
  2827c2:	fc                   	cld    
  2827c3:	1f                   	pop    %ds
  2827c4:	0c 00                	or     $0x0,%al
  2827c6:	0c 00                	or     $0x0,%al
  2827c8:	0c 00                	or     $0x0,%al
  2827ca:	0c 00                	or     $0x0,%al
  2827cc:	0c 00                	or     $0x0,%al
  2827ce:	0c 00                	or     $0x0,%al
  2827d0:	fc                   	cld    
  2827d1:	3f                   	aas    
  2827d2:	fc                   	cld    
  2827d3:	3f                   	aas    
	...
  2827e0:	00 00                	add    %al,(%eax)
  2827e2:	f8                   	clc    
  2827e3:	3f                   	aas    
  2827e4:	f8                   	clc    
  2827e5:	3f                   	aas    
  2827e6:	18 00                	sbb    %al,(%eax)
  2827e8:	18 00                	sbb    %al,(%eax)
  2827ea:	18 00                	sbb    %al,(%eax)
  2827ec:	18 00                	sbb    %al,(%eax)
  2827ee:	18 00                	sbb    %al,(%eax)
  2827f0:	f8                   	clc    
  2827f1:	1f                   	pop    %ds
  2827f2:	f8                   	clc    
  2827f3:	1f                   	pop    %ds
  2827f4:	18 00                	sbb    %al,(%eax)
  2827f6:	18 00                	sbb    %al,(%eax)
  2827f8:	18 00                	sbb    %al,(%eax)
  2827fa:	18 00                	sbb    %al,(%eax)
  2827fc:	18 00                	sbb    %al,(%eax)
  2827fe:	18 00                	sbb    %al,(%eax)
  282800:	18 00                	sbb    %al,(%eax)
  282802:	18 00                	sbb    %al,(%eax)
	...
  282810:	00 00                	add    %al,(%eax)
  282812:	e0 0f                	loopne 282823 <ASCII_Table+0x763>
  282814:	f8                   	clc    
  282815:	3f                   	aas    
  282816:	3c 78                	cmp    $0x78,%al
  282818:	0e                   	push   %cs
  282819:	60                   	pusha  
  28281a:	06                   	push   %es
  28281b:	e0 07                	loopne 282824 <ASCII_Table+0x764>
  28281d:	c0 03 00             	rolb   $0x0,(%ebx)
  282820:	03 00                	add    (%eax),%eax
  282822:	03 fe                	add    %esi,%edi
  282824:	03 fe                	add    %esi,%edi
  282826:	03 c0                	add    %eax,%eax
  282828:	07                   	pop    %es
  282829:	c0 06 c0             	rolb   $0xc0,(%esi)
  28282c:	0e                   	push   %cs
  28282d:	c0 3c f0 f8          	sarb   $0xf8,(%eax,%esi,8)
  282831:	3f                   	aas    
  282832:	e0 0f                	loopne 282843 <ASCII_Table+0x783>
	...
  282840:	00 00                	add    %al,(%eax)
  282842:	0c 30                	or     $0x30,%al
  282844:	0c 30                	or     $0x30,%al
  282846:	0c 30                	or     $0x30,%al
  282848:	0c 30                	or     $0x30,%al
  28284a:	0c 30                	or     $0x30,%al
  28284c:	0c 30                	or     $0x30,%al
  28284e:	0c 30                	or     $0x30,%al
  282850:	fc                   	cld    
  282851:	3f                   	aas    
  282852:	fc                   	cld    
  282853:	3f                   	aas    
  282854:	0c 30                	or     $0x30,%al
  282856:	0c 30                	or     $0x30,%al
  282858:	0c 30                	or     $0x30,%al
  28285a:	0c 30                	or     $0x30,%al
  28285c:	0c 30                	or     $0x30,%al
  28285e:	0c 30                	or     $0x30,%al
  282860:	0c 30                	or     $0x30,%al
  282862:	0c 30                	or     $0x30,%al
	...
  282870:	00 00                	add    %al,(%eax)
  282872:	80 01 80             	addb   $0x80,(%ecx)
  282875:	01 80 01 80 01 80    	add    %eax,-0x7ffe7fff(%eax)
  28287b:	01 80 01 80 01 80    	add    %eax,-0x7ffe7fff(%eax)
  282881:	01 80 01 80 01 80    	add    %eax,-0x7ffe7fff(%eax)
  282887:	01 80 01 80 01 80    	add    %eax,-0x7ffe7fff(%eax)
  28288d:	01 80 01 80 01 80    	add    %eax,-0x7ffe7fff(%eax)
  282893:	01 00                	add    %eax,(%eax)
	...
  2828a1:	00 00                	add    %al,(%eax)
  2828a3:	06                   	push   %es
  2828a4:	00 06                	add    %al,(%esi)
  2828a6:	00 06                	add    %al,(%esi)
  2828a8:	00 06                	add    %al,(%esi)
  2828aa:	00 06                	add    %al,(%esi)
  2828ac:	00 06                	add    %al,(%esi)
  2828ae:	00 06                	add    %al,(%esi)
  2828b0:	00 06                	add    %al,(%esi)
  2828b2:	00 06                	add    %al,(%esi)
  2828b4:	00 06                	add    %al,(%esi)
  2828b6:	00 06                	add    %al,(%esi)
  2828b8:	00 06                	add    %al,(%esi)
  2828ba:	18 06                	sbb    %al,(%esi)
  2828bc:	18 06                	sbb    %al,(%esi)
  2828be:	38 07                	cmp    %al,(%edi)
  2828c0:	f0 03 e0             	lock add %eax,%esp
  2828c3:	01 00                	add    %eax,(%eax)
	...
  2828d1:	00 06                	add    %al,(%esi)
  2828d3:	30 06                	xor    %al,(%esi)
  2828d5:	18 06                	sbb    %al,(%esi)
  2828d7:	0c 06                	or     $0x6,%al
  2828d9:	06                   	push   %es
  2828da:	06                   	push   %es
  2828db:	03 86 01 c6 00 66    	add    0x6600c601(%esi),%eax
  2828e1:	00 76 00             	add    %dh,0x0(%esi)
  2828e4:	de 00                	fiadds (%eax)
  2828e6:	8e 01                	mov    (%ecx),%es
  2828e8:	06                   	push   %es
  2828e9:	03 06                	add    (%esi),%eax
  2828eb:	06                   	push   %es
  2828ec:	06                   	push   %es
  2828ed:	0c 06                	or     $0x6,%al
  2828ef:	18 06                	sbb    %al,(%esi)
  2828f1:	30 06                	xor    %al,(%esi)
  2828f3:	60                   	pusha  
	...
  282900:	00 00                	add    %al,(%eax)
  282902:	18 00                	sbb    %al,(%eax)
  282904:	18 00                	sbb    %al,(%eax)
  282906:	18 00                	sbb    %al,(%eax)
  282908:	18 00                	sbb    %al,(%eax)
  28290a:	18 00                	sbb    %al,(%eax)
  28290c:	18 00                	sbb    %al,(%eax)
  28290e:	18 00                	sbb    %al,(%eax)
  282910:	18 00                	sbb    %al,(%eax)
  282912:	18 00                	sbb    %al,(%eax)
  282914:	18 00                	sbb    %al,(%eax)
  282916:	18 00                	sbb    %al,(%eax)
  282918:	18 00                	sbb    %al,(%eax)
  28291a:	18 00                	sbb    %al,(%eax)
  28291c:	18 00                	sbb    %al,(%eax)
  28291e:	18 00                	sbb    %al,(%eax)
  282920:	f8                   	clc    
  282921:	1f                   	pop    %ds
  282922:	f8                   	clc    
  282923:	1f                   	pop    %ds
	...
  282930:	00 00                	add    %al,(%eax)
  282932:	0e                   	push   %cs
  282933:	e0 1e                	loopne 282953 <ASCII_Table+0x893>
  282935:	f0 1e                	lock push %ds
  282937:	f0 1e                	lock push %ds
  282939:	f0 36 d8 36          	lock fdivs %ss:(%esi)
  28293d:	d8 36                	fdivs  (%esi)
  28293f:	d8 36                	fdivs  (%esi)
  282941:	d8 66 cc             	fsubs  -0x34(%esi)
  282944:	66 cc                	data16 int3 
  282946:	66 cc                	data16 int3 
  282948:	c6 c6 c6             	mov    $0xc6,%dh
  28294b:	c6 c6 c6             	mov    $0xc6,%dh
  28294e:	c6 c6 86             	mov    $0x86,%dh
  282951:	c3                   	ret    
  282952:	86 c3                	xchg   %al,%bl
	...
  282960:	00 00                	add    %al,(%eax)
  282962:	0c 30                	or     $0x30,%al
  282964:	1c 30                	sbb    $0x30,%al
  282966:	3c 30                	cmp    $0x30,%al
  282968:	3c 30                	cmp    $0x30,%al
  28296a:	6c                   	insb   (%dx),%es:(%edi)
  28296b:	30 6c 30 cc          	xor    %ch,-0x34(%eax,%esi,1)
  28296f:	30 cc                	xor    %cl,%ah
  282971:	30 8c 31 0c 33 0c 33 	xor    %cl,0x330c330c(%ecx,%esi,1)
  282978:	0c 36                	or     $0x36,%al
  28297a:	0c 36                	or     $0x36,%al
  28297c:	0c 3c                	or     $0x3c,%al
  28297e:	0c 3c                	or     $0x3c,%al
  282980:	0c 38                	or     $0x38,%al
  282982:	0c 30                	or     $0x30,%al
	...
  282990:	00 00                	add    %al,(%eax)
  282992:	e0 07                	loopne 28299b <ASCII_Table+0x8db>
  282994:	f8                   	clc    
  282995:	1f                   	pop    %ds
  282996:	1c 38                	sbb    $0x38,%al
  282998:	0e                   	push   %cs
  282999:	70 06                	jo     2829a1 <ASCII_Table+0x8e1>
  28299b:	60                   	pusha  
  28299c:	03 c0                	add    %eax,%eax
  28299e:	03 c0                	add    %eax,%eax
  2829a0:	03 c0                	add    %eax,%eax
  2829a2:	03 c0                	add    %eax,%eax
  2829a4:	03 c0                	add    %eax,%eax
  2829a6:	03 c0                	add    %eax,%eax
  2829a8:	03 c0                	add    %eax,%eax
  2829aa:	06                   	push   %es
  2829ab:	60                   	pusha  
  2829ac:	0e                   	push   %cs
  2829ad:	70 1c                	jo     2829cb <ASCII_Table+0x90b>
  2829af:	38 f8                	cmp    %bh,%al
  2829b1:	1f                   	pop    %ds
  2829b2:	e0 07                	loopne 2829bb <ASCII_Table+0x8fb>
	...
  2829c0:	00 00                	add    %al,(%eax)
  2829c2:	fc                   	cld    
  2829c3:	0f fc 1f             	paddb  (%edi),%mm3
  2829c6:	0c 38                	or     $0x38,%al
  2829c8:	0c 30                	or     $0x30,%al
  2829ca:	0c 30                	or     $0x30,%al
  2829cc:	0c 30                	or     $0x30,%al
  2829ce:	0c 30                	or     $0x30,%al
  2829d0:	0c 18                	or     $0x18,%al
  2829d2:	fc                   	cld    
  2829d3:	1f                   	pop    %ds
  2829d4:	fc                   	cld    
  2829d5:	07                   	pop    %es
  2829d6:	0c 00                	or     $0x0,%al
  2829d8:	0c 00                	or     $0x0,%al
  2829da:	0c 00                	or     $0x0,%al
  2829dc:	0c 00                	or     $0x0,%al
  2829de:	0c 00                	or     $0x0,%al
  2829e0:	0c 00                	or     $0x0,%al
  2829e2:	0c 00                	or     $0x0,%al
	...
  2829f0:	00 00                	add    %al,(%eax)
  2829f2:	e0 07                	loopne 2829fb <ASCII_Table+0x93b>
  2829f4:	f8                   	clc    
  2829f5:	1f                   	pop    %ds
  2829f6:	1c 38                	sbb    $0x38,%al
  2829f8:	0e                   	push   %cs
  2829f9:	70 06                	jo     282a01 <ASCII_Table+0x941>
  2829fb:	60                   	pusha  
  2829fc:	03 e0                	add    %eax,%esp
  2829fe:	03 c0                	add    %eax,%eax
  282a00:	03 c0                	add    %eax,%eax
  282a02:	03 c0                	add    %eax,%eax
  282a04:	03 c0                	add    %eax,%eax
  282a06:	03 c0                	add    %eax,%eax
  282a08:	07                   	pop    %es
  282a09:	e0 06                	loopne 282a11 <ASCII_Table+0x951>
  282a0b:	63 0e                	arpl   %cx,(%esi)
  282a0d:	3f                   	aas    
  282a0e:	1c 3c                	sbb    $0x3c,%al
  282a10:	f8                   	clc    
  282a11:	3f                   	aas    
  282a12:	e0 f7                	loopne 282a0b <ASCII_Table+0x94b>
  282a14:	00 c0                	add    %al,%al
	...
  282a22:	fe 0f                	decb   (%edi)
  282a24:	fe                   	(bad)  
  282a25:	1f                   	pop    %ds
  282a26:	06                   	push   %es
  282a27:	38 06                	cmp    %al,(%esi)
  282a29:	30 06                	xor    %al,(%esi)
  282a2b:	30 06                	xor    %al,(%esi)
  282a2d:	30 06                	xor    %al,(%esi)
  282a2f:	38 fe                	cmp    %bh,%dh
  282a31:	1f                   	pop    %ds
  282a32:	fe 07                	incb   (%edi)
  282a34:	06                   	push   %es
  282a35:	03 06                	add    (%esi),%eax
  282a37:	06                   	push   %es
  282a38:	06                   	push   %es
  282a39:	0c 06                	or     $0x6,%al
  282a3b:	18 06                	sbb    %al,(%esi)
  282a3d:	18 06                	sbb    %al,(%esi)
  282a3f:	30 06                	xor    %al,(%esi)
  282a41:	30 06                	xor    %al,(%esi)
  282a43:	60                   	pusha  
	...
  282a50:	00 00                	add    %al,(%eax)
  282a52:	e0 03                	loopne 282a57 <ASCII_Table+0x997>
  282a54:	f8                   	clc    
  282a55:	0f 1c 0c 0c          	nopl   (%esp,%ecx,1)
  282a59:	18 0c 18             	sbb    %cl,(%eax,%ebx,1)
  282a5c:	0c 00                	or     $0x0,%al
  282a5e:	1c 00                	sbb    $0x0,%al
  282a60:	f8                   	clc    
  282a61:	03 e0                	add    %eax,%esp
  282a63:	0f 00 1e             	ltr    (%esi)
  282a66:	00 38                	add    %bh,(%eax)
  282a68:	06                   	push   %es
  282a69:	30 06                	xor    %al,(%esi)
  282a6b:	30 0e                	xor    %cl,(%esi)
  282a6d:	30 1c 1c             	xor    %bl,(%esp,%ebx,1)
  282a70:	f8                   	clc    
  282a71:	0f e0 07             	pavgb  (%edi),%mm0
	...
  282a80:	00 00                	add    %al,(%eax)
  282a82:	fe                   	(bad)  
  282a83:	7f fe                	jg     282a83 <ASCII_Table+0x9c3>
  282a85:	7f 80                	jg     282a07 <ASCII_Table+0x947>
  282a87:	01 80 01 80 01 80    	add    %eax,-0x7ffe7fff(%eax)
  282a8d:	01 80 01 80 01 80    	add    %eax,-0x7ffe7fff(%eax)
  282a93:	01 80 01 80 01 80    	add    %eax,-0x7ffe7fff(%eax)
  282a99:	01 80 01 80 01 80    	add    %eax,-0x7ffe7fff(%eax)
  282a9f:	01 80 01 80 01 00    	add    %eax,0x18001(%eax)
	...
  282ab1:	00 0c 30             	add    %cl,(%eax,%esi,1)
  282ab4:	0c 30                	or     $0x30,%al
  282ab6:	0c 30                	or     $0x30,%al
  282ab8:	0c 30                	or     $0x30,%al
  282aba:	0c 30                	or     $0x30,%al
  282abc:	0c 30                	or     $0x30,%al
  282abe:	0c 30                	or     $0x30,%al
  282ac0:	0c 30                	or     $0x30,%al
  282ac2:	0c 30                	or     $0x30,%al
  282ac4:	0c 30                	or     $0x30,%al
  282ac6:	0c 30                	or     $0x30,%al
  282ac8:	0c 30                	or     $0x30,%al
  282aca:	0c 30                	or     $0x30,%al
  282acc:	0c 30                	or     $0x30,%al
  282ace:	18 18                	sbb    %bl,(%eax)
  282ad0:	f8                   	clc    
  282ad1:	1f                   	pop    %ds
  282ad2:	e0 07                	loopne 282adb <ASCII_Table+0xa1b>
	...
  282ae0:	00 00                	add    %al,(%eax)
  282ae2:	03 60 06             	add    0x6(%eax),%esp
  282ae5:	30 06                	xor    %al,(%esi)
  282ae7:	30 06                	xor    %al,(%esi)
  282ae9:	30 0c 18             	xor    %cl,(%eax,%ebx,1)
  282aec:	0c 18                	or     $0x18,%al
  282aee:	0c 18                	or     $0x18,%al
  282af0:	18 0c 18             	sbb    %cl,(%eax,%ebx,1)
  282af3:	0c 38                	or     $0x38,%al
  282af5:	0e                   	push   %cs
  282af6:	30 06                	xor    %al,(%esi)
  282af8:	30 06                	xor    %al,(%esi)
  282afa:	70 07                	jo     282b03 <ASCII_Table+0xa43>
  282afc:	60                   	pusha  
  282afd:	03 60 03             	add    0x3(%eax),%esp
  282b00:	c0 01 c0             	rolb   $0xc0,(%ecx)
  282b03:	01 00                	add    %eax,(%eax)
	...
  282b11:	00 03                	add    %al,(%ebx)
  282b13:	60                   	pusha  
  282b14:	c3                   	ret    
  282b15:	61                   	popa   
  282b16:	c3                   	ret    
  282b17:	61                   	popa   
  282b18:	c3                   	ret    
  282b19:	61                   	popa   
  282b1a:	66 33 66 33          	xor    0x33(%esi),%sp
  282b1e:	66 33 66 33          	xor    0x33(%esi),%sp
  282b22:	66 33 66 33          	xor    0x33(%esi),%sp
  282b26:	6c                   	insb   (%dx),%es:(%edi)
  282b27:	1b 6c 1b 6c          	sbb    0x6c(%ebx,%ebx,1),%ebp
  282b2b:	1b 2c 1a             	sbb    (%edx,%ebx,1),%ebp
  282b2e:	3c 1e                	cmp    $0x1e,%al
  282b30:	38 0e                	cmp    %cl,(%esi)
  282b32:	38 0e                	cmp    %cl,(%esi)
	...
  282b40:	00 00                	add    %al,(%eax)
  282b42:	0f e0 0c 70          	pavgb  (%eax,%esi,2),%mm1
  282b46:	18 30                	sbb    %dh,(%eax)
  282b48:	30 18                	xor    %bl,(%eax)
  282b4a:	70 0c                	jo     282b58 <ASCII_Table+0xa98>
  282b4c:	60                   	pusha  
  282b4d:	0e                   	push   %cs
  282b4e:	c0 07 80             	rolb   $0x80,(%edi)
  282b51:	03 80 03 c0 03 e0    	add    -0x1ffc3ffd(%eax),%eax
  282b57:	06                   	push   %es
  282b58:	70 0c                	jo     282b66 <ASCII_Table+0xaa6>
  282b5a:	30 1c 18             	xor    %bl,(%eax,%ebx,1)
  282b5d:	18 0c 30             	sbb    %cl,(%eax,%esi,1)
  282b60:	0e                   	push   %cs
  282b61:	60                   	pusha  
  282b62:	07                   	pop    %es
  282b63:	e0 00                	loopne 282b65 <ASCII_Table+0xaa5>
	...
  282b71:	00 03                	add    %al,(%ebx)
  282b73:	c0 06 60             	rolb   $0x60,(%esi)
  282b76:	0c 30                	or     $0x30,%al
  282b78:	1c 38                	sbb    $0x38,%al
  282b7a:	38 18                	cmp    %bl,(%eax)
  282b7c:	30 0c 60             	xor    %cl,(%eax,%eiz,2)
  282b7f:	06                   	push   %es
  282b80:	e0 07                	loopne 282b89 <ASCII_Table+0xac9>
  282b82:	c0 03 80             	rolb   $0x80,(%ebx)
  282b85:	01 80 01 80 01 80    	add    %eax,-0x7ffe7fff(%eax)
  282b8b:	01 80 01 80 01 80    	add    %eax,-0x7ffe7fff(%eax)
  282b91:	01 80 01 00 00 00    	add    %eax,0x1(%eax)
	...
  282b9f:	00 00                	add    %al,(%eax)
  282ba1:	00 fc                	add    %bh,%ah
  282ba3:	7f fc                	jg     282ba1 <ASCII_Table+0xae1>
  282ba5:	7f 00                	jg     282ba7 <ASCII_Table+0xae7>
  282ba7:	60                   	pusha  
  282ba8:	00 30                	add    %dh,(%eax)
  282baa:	00 18                	add    %bl,(%eax)
  282bac:	00 0c 00             	add    %cl,(%eax,%eax,1)
  282baf:	06                   	push   %es
  282bb0:	00 03                	add    %al,(%ebx)
  282bb2:	80 01 c0             	addb   $0xc0,(%ecx)
  282bb5:	00 60 00             	add    %ah,0x0(%eax)
  282bb8:	30 00                	xor    %al,(%eax)
  282bba:	18 00                	sbb    %al,(%eax)
  282bbc:	0c 00                	or     $0x0,%al
  282bbe:	06                   	push   %es
  282bbf:	00 fe                	add    %bh,%dh
  282bc1:	7f fe                	jg     282bc1 <ASCII_Table+0xb01>
  282bc3:	7f 00                	jg     282bc5 <ASCII_Table+0xb05>
	...
  282bd1:	00 e0                	add    %ah,%al
  282bd3:	03 e0                	add    %eax,%esp
  282bd5:	03 60 00             	add    0x0(%eax),%esp
  282bd8:	60                   	pusha  
  282bd9:	00 60 00             	add    %ah,0x0(%eax)
  282bdc:	60                   	pusha  
  282bdd:	00 60 00             	add    %ah,0x0(%eax)
  282be0:	60                   	pusha  
  282be1:	00 60 00             	add    %ah,0x0(%eax)
  282be4:	60                   	pusha  
  282be5:	00 60 00             	add    %ah,0x0(%eax)
  282be8:	60                   	pusha  
  282be9:	00 60 00             	add    %ah,0x0(%eax)
  282bec:	60                   	pusha  
  282bed:	00 60 00             	add    %ah,0x0(%eax)
  282bf0:	60                   	pusha  
  282bf1:	00 60 00             	add    %ah,0x0(%eax)
  282bf4:	60                   	pusha  
  282bf5:	00 60 00             	add    %ah,0x0(%eax)
  282bf8:	60                   	pusha  
  282bf9:	00 e0                	add    %ah,%al
  282bfb:	03 e0                	add    %eax,%esp
  282bfd:	03 00                	add    (%eax),%eax
  282bff:	00 00                	add    %al,(%eax)
  282c01:	00 30                	add    %dh,(%eax)
  282c03:	00 30                	add    %dh,(%eax)
  282c05:	00 60 00             	add    %ah,0x0(%eax)
  282c08:	60                   	pusha  
  282c09:	00 60 00             	add    %ah,0x0(%eax)
  282c0c:	c0 00 c0             	rolb   $0xc0,(%eax)
  282c0f:	00 c0                	add    %al,%al
  282c11:	00 c0                	add    %al,%al
  282c13:	01 80 01 80 01 80    	add    %eax,-0x7ffe7fff(%eax)
  282c19:	01 00                	add    %eax,(%eax)
  282c1b:	03 00                	add    (%eax),%eax
  282c1d:	03 00                	add    (%eax),%eax
  282c1f:	03 00                	add    (%eax),%eax
  282c21:	06                   	push   %es
  282c22:	00 06                	add    %al,(%esi)
	...
  282c30:	00 00                	add    %al,(%eax)
  282c32:	e0 03                	loopne 282c37 <ASCII_Table+0xb77>
  282c34:	e0 03                	loopne 282c39 <ASCII_Table+0xb79>
  282c36:	00 03                	add    %al,(%ebx)
  282c38:	00 03                	add    %al,(%ebx)
  282c3a:	00 03                	add    %al,(%ebx)
  282c3c:	00 03                	add    %al,(%ebx)
  282c3e:	00 03                	add    %al,(%ebx)
  282c40:	00 03                	add    %al,(%ebx)
  282c42:	00 03                	add    %al,(%ebx)
  282c44:	00 03                	add    %al,(%ebx)
  282c46:	00 03                	add    %al,(%ebx)
  282c48:	00 03                	add    %al,(%ebx)
  282c4a:	00 03                	add    %al,(%ebx)
  282c4c:	00 03                	add    %al,(%ebx)
  282c4e:	00 03                	add    %al,(%ebx)
  282c50:	00 03                	add    %al,(%ebx)
  282c52:	00 03                	add    %al,(%ebx)
  282c54:	00 03                	add    %al,(%ebx)
  282c56:	00 03                	add    %al,(%ebx)
  282c58:	00 03                	add    %al,(%ebx)
  282c5a:	e0 03                	loopne 282c5f <ASCII_Table+0xb9f>
  282c5c:	e0 03                	loopne 282c61 <ASCII_Table+0xba1>
  282c5e:	00 00                	add    %al,(%eax)
  282c60:	00 00                	add    %al,(%eax)
  282c62:	00 00                	add    %al,(%eax)
  282c64:	c0 01 c0             	rolb   $0xc0,(%ecx)
  282c67:	01 60 03             	add    %esp,0x3(%eax)
  282c6a:	60                   	pusha  
  282c6b:	03 60 03             	add    0x3(%eax),%esp
  282c6e:	30 06                	xor    %al,(%esi)
  282c70:	30 06                	xor    %al,(%esi)
  282c72:	18 0c 18             	sbb    %cl,(%eax,%ebx,1)
  282c75:	0c 00                	or     $0x0,%al
	...
  282caf:	00 00                	add    %al,(%eax)
  282cb1:	00 ff                	add    %bh,%bh
  282cb3:	ff                   	(bad)  
  282cb4:	ff                   	(bad)  
  282cb5:	ff 00                	incl   (%eax)
	...
  282cbf:	00 00                	add    %al,(%eax)
  282cc1:	00 0c 00             	add    %cl,(%eax,%eax,1)
  282cc4:	0c 00                	or     $0x0,%al
  282cc6:	0c 00                	or     $0x0,%al
  282cc8:	0c 00                	or     $0x0,%al
  282cca:	0c 00                	or     $0x0,%al
  282ccc:	0c 00                	or     $0x0,%al
	...
  282cfa:	00 00                	add    %al,(%eax)
  282cfc:	f0 03 f8             	lock add %eax,%edi
  282cff:	07                   	pop    %es
  282d00:	1c 0c                	sbb    $0xc,%al
  282d02:	0c 0c                	or     $0xc,%al
  282d04:	00 0f                	add    %cl,(%edi)
  282d06:	f0 0f f8 0c 0c       	lock psubb (%esp,%ecx,1),%mm1
  282d0b:	0c 0c                	or     $0xc,%al
  282d0d:	0c 1c                	or     $0x1c,%al
  282d0f:	0f f8 0f             	psubb  (%edi),%mm1
  282d12:	f0 18 00             	lock sbb %al,(%eax)
	...
  282d21:	00 18                	add    %bl,(%eax)
  282d23:	00 18                	add    %bl,(%eax)
  282d25:	00 18                	add    %bl,(%eax)
  282d27:	00 18                	add    %bl,(%eax)
  282d29:	00 18                	add    %bl,(%eax)
  282d2b:	00 d8                	add    %bl,%al
  282d2d:	03 f8                	add    %eax,%edi
  282d2f:	0f 38 0c             	(bad)  
  282d32:	18 18                	sbb    %bl,(%eax)
  282d34:	18 18                	sbb    %bl,(%eax)
  282d36:	18 18                	sbb    %bl,(%eax)
  282d38:	18 18                	sbb    %bl,(%eax)
  282d3a:	18 18                	sbb    %bl,(%eax)
  282d3c:	18 18                	sbb    %bl,(%eax)
  282d3e:	38 0c f8             	cmp    %cl,(%eax,%edi,8)
  282d41:	0f d8 03             	psubusb (%ebx),%mm0
	...
  282d5c:	c0 03 f0             	rolb   $0xf0,(%ebx)
  282d5f:	07                   	pop    %es
  282d60:	30 0e                	xor    %cl,(%esi)
  282d62:	18 0c 18             	sbb    %cl,(%eax,%ebx,1)
  282d65:	00 18                	add    %bl,(%eax)
  282d67:	00 18                	add    %bl,(%eax)
  282d69:	00 18                	add    %bl,(%eax)
  282d6b:	00 18                	add    %bl,(%eax)
  282d6d:	0c 30                	or     $0x30,%al
  282d6f:	0e                   	push   %cs
  282d70:	f0 07                	lock pop %es
  282d72:	c0 03 00             	rolb   $0x0,(%ebx)
	...
  282d81:	00 00                	add    %al,(%eax)
  282d83:	18 00                	sbb    %al,(%eax)
  282d85:	18 00                	sbb    %al,(%eax)
  282d87:	18 00                	sbb    %al,(%eax)
  282d89:	18 00                	sbb    %al,(%eax)
  282d8b:	18 c0                	sbb    %al,%al
  282d8d:	1b f0                	sbb    %eax,%esi
  282d8f:	1f                   	pop    %ds
  282d90:	30 1c 18             	xor    %bl,(%eax,%ebx,1)
  282d93:	18 18                	sbb    %bl,(%eax)
  282d95:	18 18                	sbb    %bl,(%eax)
  282d97:	18 18                	sbb    %bl,(%eax)
  282d99:	18 18                	sbb    %bl,(%eax)
  282d9b:	18 18                	sbb    %bl,(%eax)
  282d9d:	18 30                	sbb    %dh,(%eax)
  282d9f:	1c f0                	sbb    $0xf0,%al
  282da1:	1f                   	pop    %ds
  282da2:	c0 1b 00             	rcrb   $0x0,(%ebx)
	...
  282db9:	00 00                	add    %al,(%eax)
  282dbb:	00 c0                	add    %al,%al
  282dbd:	03 f0                	add    %eax,%esi
  282dbf:	0f 30                	wrmsr  
  282dc1:	0c 18                	or     $0x18,%al
  282dc3:	18 f8                	sbb    %bh,%al
  282dc5:	1f                   	pop    %ds
  282dc6:	f8                   	clc    
  282dc7:	1f                   	pop    %ds
  282dc8:	18 00                	sbb    %al,(%eax)
  282dca:	18 00                	sbb    %al,(%eax)
  282dcc:	38 18                	cmp    %bl,(%eax)
  282dce:	30 1c f0             	xor    %bl,(%eax,%esi,8)
  282dd1:	0f c0 07             	xadd   %al,(%edi)
	...
  282de0:	00 00                	add    %al,(%eax)
  282de2:	80 0f c0             	orb    $0xc0,(%edi)
  282de5:	0f c0 00             	xadd   %al,(%eax)
  282de8:	c0 00 c0             	rolb   $0xc0,(%eax)
  282deb:	00 f0                	add    %dh,%al
  282ded:	07                   	pop    %es
  282dee:	f0 07                	lock pop %es
  282df0:	c0 00 c0             	rolb   $0xc0,(%eax)
  282df3:	00 c0                	add    %al,%al
  282df5:	00 c0                	add    %al,%al
  282df7:	00 c0                	add    %al,%al
  282df9:	00 c0                	add    %al,%al
  282dfb:	00 c0                	add    %al,%al
  282dfd:	00 c0                	add    %al,%al
  282dff:	00 c0                	add    %al,%al
  282e01:	00 c0                	add    %al,%al
	...
  282e1b:	00 e0                	add    %ah,%al
  282e1d:	0d f8 0f 18 0e       	or     $0xe180ff8,%eax
  282e22:	0c 0c                	or     $0xc,%al
  282e24:	0c 0c                	or     $0xc,%al
  282e26:	0c 0c                	or     $0xc,%al
  282e28:	0c 0c                	or     $0xc,%al
  282e2a:	0c 0c                	or     $0xc,%al
  282e2c:	0c 0c                	or     $0xc,%al
  282e2e:	18 0e                	sbb    %cl,(%esi)
  282e30:	f8                   	clc    
  282e31:	0f e0 0d 00 0c 0c 0c 	pavgb  0xc0c0c00,%mm1
  282e38:	1c 06                	sbb    $0x6,%al
  282e3a:	f8                   	clc    
  282e3b:	07                   	pop    %es
  282e3c:	f0 01 00             	lock add %eax,(%eax)
  282e3f:	00 00                	add    %al,(%eax)
  282e41:	00 18                	add    %bl,(%eax)
  282e43:	00 18                	add    %bl,(%eax)
  282e45:	00 18                	add    %bl,(%eax)
  282e47:	00 18                	add    %bl,(%eax)
  282e49:	00 18                	add    %bl,(%eax)
  282e4b:	00 d8                	add    %bl,%al
  282e4d:	07                   	pop    %es
  282e4e:	f8                   	clc    
  282e4f:	0f 38 1c 18          	pabsb  (%eax),%mm3
  282e53:	18 18                	sbb    %bl,(%eax)
  282e55:	18 18                	sbb    %bl,(%eax)
  282e57:	18 18                	sbb    %bl,(%eax)
  282e59:	18 18                	sbb    %bl,(%eax)
  282e5b:	18 18                	sbb    %bl,(%eax)
  282e5d:	18 18                	sbb    %bl,(%eax)
  282e5f:	18 18                	sbb    %bl,(%eax)
  282e61:	18 18                	sbb    %bl,(%eax)
  282e63:	18 00                	sbb    %al,(%eax)
	...
  282e71:	00 c0                	add    %al,%al
  282e73:	00 c0                	add    %al,%al
  282e75:	00 00                	add    %al,(%eax)
  282e77:	00 00                	add    %al,(%eax)
  282e79:	00 00                	add    %al,(%eax)
  282e7b:	00 c0                	add    %al,%al
  282e7d:	00 c0                	add    %al,%al
  282e7f:	00 c0                	add    %al,%al
  282e81:	00 c0                	add    %al,%al
  282e83:	00 c0                	add    %al,%al
  282e85:	00 c0                	add    %al,%al
  282e87:	00 c0                	add    %al,%al
  282e89:	00 c0                	add    %al,%al
  282e8b:	00 c0                	add    %al,%al
  282e8d:	00 c0                	add    %al,%al
  282e8f:	00 c0                	add    %al,%al
  282e91:	00 c0                	add    %al,%al
	...
  282e9f:	00 00                	add    %al,(%eax)
  282ea1:	00 c0                	add    %al,%al
  282ea3:	00 c0                	add    %al,%al
  282ea5:	00 00                	add    %al,(%eax)
  282ea7:	00 00                	add    %al,(%eax)
  282ea9:	00 00                	add    %al,(%eax)
  282eab:	00 c0                	add    %al,%al
  282ead:	00 c0                	add    %al,%al
  282eaf:	00 c0                	add    %al,%al
  282eb1:	00 c0                	add    %al,%al
  282eb3:	00 c0                	add    %al,%al
  282eb5:	00 c0                	add    %al,%al
  282eb7:	00 c0                	add    %al,%al
  282eb9:	00 c0                	add    %al,%al
  282ebb:	00 c0                	add    %al,%al
  282ebd:	00 c0                	add    %al,%al
  282ebf:	00 c0                	add    %al,%al
  282ec1:	00 c0                	add    %al,%al
  282ec3:	00 c0                	add    %al,%al
  282ec5:	00 c0                	add    %al,%al
  282ec7:	00 c0                	add    %al,%al
  282ec9:	00 f8                	add    %bh,%al
  282ecb:	00 78 00             	add    %bh,0x0(%eax)
  282ece:	00 00                	add    %al,(%eax)
  282ed0:	00 00                	add    %al,(%eax)
  282ed2:	0c 00                	or     $0x0,%al
  282ed4:	0c 00                	or     $0x0,%al
  282ed6:	0c 00                	or     $0x0,%al
  282ed8:	0c 00                	or     $0x0,%al
  282eda:	0c 00                	or     $0x0,%al
  282edc:	0c 0c                	or     $0xc,%al
  282ede:	0c 06                	or     $0x6,%al
  282ee0:	0c 03                	or     $0x3,%al
  282ee2:	8c 01                	mov    %es,(%ecx)
  282ee4:	cc                   	int3   
  282ee5:	00 6c 00 fc          	add    %ch,-0x4(%eax,%eax,1)
  282ee9:	00 9c 01 8c 03 0c 03 	add    %bl,0x30c038c(%ecx,%eax,1)
  282ef0:	0c 06                	or     $0x6,%al
  282ef2:	0c 0c                	or     $0xc,%al
	...
  282f00:	00 00                	add    %al,(%eax)
  282f02:	c0 00 c0             	rolb   $0xc0,(%eax)
  282f05:	00 c0                	add    %al,%al
  282f07:	00 c0                	add    %al,%al
  282f09:	00 c0                	add    %al,%al
  282f0b:	00 c0                	add    %al,%al
  282f0d:	00 c0                	add    %al,%al
  282f0f:	00 c0                	add    %al,%al
  282f11:	00 c0                	add    %al,%al
  282f13:	00 c0                	add    %al,%al
  282f15:	00 c0                	add    %al,%al
  282f17:	00 c0                	add    %al,%al
  282f19:	00 c0                	add    %al,%al
  282f1b:	00 c0                	add    %al,%al
  282f1d:	00 c0                	add    %al,%al
  282f1f:	00 c0                	add    %al,%al
  282f21:	00 c0                	add    %al,%al
	...
  282f3b:	00 7c 3c ff          	add    %bh,-0x1(%esp,%edi,1)
  282f3f:	7e c7                	jle    282f08 <ASCII_Table+0xe48>
  282f41:	e3 83                	jecxz  282ec6 <ASCII_Table+0xe06>
  282f43:	c1 83 c1 83 c1 83 c1 	roll   $0xc1,-0x7c3e7c3f(%ebx)
  282f4a:	83 c1 83             	add    $0xffffff83,%ecx
  282f4d:	c1 83 c1 83 c1 83 c1 	roll   $0xc1,-0x7c3e7c3f(%ebx)
	...
  282f6c:	98                   	cwtl   
  282f6d:	07                   	pop    %es
  282f6e:	f8                   	clc    
  282f6f:	0f 38 1c 18          	pabsb  (%eax),%mm3
  282f73:	18 18                	sbb    %bl,(%eax)
  282f75:	18 18                	sbb    %bl,(%eax)
  282f77:	18 18                	sbb    %bl,(%eax)
  282f79:	18 18                	sbb    %bl,(%eax)
  282f7b:	18 18                	sbb    %bl,(%eax)
  282f7d:	18 18                	sbb    %bl,(%eax)
  282f7f:	18 18                	sbb    %bl,(%eax)
  282f81:	18 18                	sbb    %bl,(%eax)
  282f83:	18 00                	sbb    %al,(%eax)
	...
  282f99:	00 00                	add    %al,(%eax)
  282f9b:	00 c0                	add    %al,%al
  282f9d:	03 f0                	add    %eax,%esi
  282f9f:	0f 30                	wrmsr  
  282fa1:	0c 18                	or     $0x18,%al
  282fa3:	18 18                	sbb    %bl,(%eax)
  282fa5:	18 18                	sbb    %bl,(%eax)
  282fa7:	18 18                	sbb    %bl,(%eax)
  282fa9:	18 18                	sbb    %bl,(%eax)
  282fab:	18 18                	sbb    %bl,(%eax)
  282fad:	18 30                	sbb    %dh,(%eax)
  282faf:	0c f0                	or     $0xf0,%al
  282fb1:	0f c0 03             	xadd   %al,(%ebx)
	...
  282fcc:	d8 03                	fadds  (%ebx)
  282fce:	f8                   	clc    
  282fcf:	0f 38 0c             	(bad)  
  282fd2:	18 18                	sbb    %bl,(%eax)
  282fd4:	18 18                	sbb    %bl,(%eax)
  282fd6:	18 18                	sbb    %bl,(%eax)
  282fd8:	18 18                	sbb    %bl,(%eax)
  282fda:	18 18                	sbb    %bl,(%eax)
  282fdc:	18 18                	sbb    %bl,(%eax)
  282fde:	38 0c f8             	cmp    %cl,(%eax,%edi,8)
  282fe1:	0f d8 03             	psubusb (%ebx),%mm0
  282fe4:	18 00                	sbb    %al,(%eax)
  282fe6:	18 00                	sbb    %al,(%eax)
  282fe8:	18 00                	sbb    %al,(%eax)
  282fea:	18 00                	sbb    %al,(%eax)
  282fec:	18 00                	sbb    %al,(%eax)
	...
  282ffa:	00 00                	add    %al,(%eax)
  282ffc:	c0 1b f0             	rcrb   $0xf0,(%ebx)
  282fff:	1f                   	pop    %ds
  283000:	30 1c 18             	xor    %bl,(%eax,%ebx,1)
  283003:	18 18                	sbb    %bl,(%eax)
  283005:	18 18                	sbb    %bl,(%eax)
  283007:	18 18                	sbb    %bl,(%eax)
  283009:	18 18                	sbb    %bl,(%eax)
  28300b:	18 18                	sbb    %bl,(%eax)
  28300d:	18 30                	sbb    %dh,(%eax)
  28300f:	1c f0                	sbb    $0xf0,%al
  283011:	1f                   	pop    %ds
  283012:	c0 1b 00             	rcrb   $0x0,(%ebx)
  283015:	18 00                	sbb    %al,(%eax)
  283017:	18 00                	sbb    %al,(%eax)
  283019:	18 00                	sbb    %al,(%eax)
  28301b:	18 00                	sbb    %al,(%eax)
  28301d:	18 00                	sbb    %al,(%eax)
	...
  28302b:	00 b0 07 f0 03 70    	add    %dh,0x7003f007(%eax)
  283031:	00 30                	add    %dh,(%eax)
  283033:	00 30                	add    %dh,(%eax)
  283035:	00 30                	add    %dh,(%eax)
  283037:	00 30                	add    %dh,(%eax)
  283039:	00 30                	add    %dh,(%eax)
  28303b:	00 30                	add    %dh,(%eax)
  28303d:	00 30                	add    %dh,(%eax)
  28303f:	00 30                	add    %dh,(%eax)
  283041:	00 30                	add    %dh,(%eax)
	...
  28305b:	00 e0                	add    %ah,%al
  28305d:	03 f0                	add    %eax,%esi
  28305f:	03 38                	add    (%eax),%edi
  283061:	0e                   	push   %cs
  283062:	18 0c 38             	sbb    %cl,(%eax,%edi,1)
  283065:	00 f0                	add    %dh,%al
  283067:	03 c0                	add    %eax,%eax
  283069:	07                   	pop    %es
  28306a:	00 0c 18             	add    %cl,(%eax,%ebx,1)
  28306d:	0c 38                	or     $0x38,%al
  28306f:	0e                   	push   %cs
  283070:	f0 07                	lock pop %es
  283072:	e0 03                	loopne 283077 <ASCII_Table+0xfb7>
	...
  283084:	80 00 c0             	addb   $0xc0,(%eax)
  283087:	00 c0                	add    %al,%al
  283089:	00 c0                	add    %al,%al
  28308b:	00 f0                	add    %dh,%al
  28308d:	07                   	pop    %es
  28308e:	f0 07                	lock pop %es
  283090:	c0 00 c0             	rolb   $0xc0,(%eax)
  283093:	00 c0                	add    %al,%al
  283095:	00 c0                	add    %al,%al
  283097:	00 c0                	add    %al,%al
  283099:	00 c0                	add    %al,%al
  28309b:	00 c0                	add    %al,%al
  28309d:	00 c0                	add    %al,%al
  28309f:	00 c0                	add    %al,%al
  2830a1:	07                   	pop    %es
  2830a2:	80 07 00             	addb   $0x0,(%edi)
	...
  2830b9:	00 00                	add    %al,(%eax)
  2830bb:	00 18                	add    %bl,(%eax)
  2830bd:	18 18                	sbb    %bl,(%eax)
  2830bf:	18 18                	sbb    %bl,(%eax)
  2830c1:	18 18                	sbb    %bl,(%eax)
  2830c3:	18 18                	sbb    %bl,(%eax)
  2830c5:	18 18                	sbb    %bl,(%eax)
  2830c7:	18 18                	sbb    %bl,(%eax)
  2830c9:	18 18                	sbb    %bl,(%eax)
  2830cb:	18 18                	sbb    %bl,(%eax)
  2830cd:	18 38                	sbb    %bh,(%eax)
  2830cf:	1c f0                	sbb    $0xf0,%al
  2830d1:	1f                   	pop    %ds
  2830d2:	e0 19                	loopne 2830ed <ASCII_Table+0x102d>
	...
  2830ec:	0c 18                	or     $0x18,%al
  2830ee:	18 0c 18             	sbb    %cl,(%eax,%ebx,1)
  2830f1:	0c 18                	or     $0x18,%al
  2830f3:	0c 30                	or     $0x30,%al
  2830f5:	06                   	push   %es
  2830f6:	30 06                	xor    %al,(%esi)
  2830f8:	30 06                	xor    %al,(%esi)
  2830fa:	60                   	pusha  
  2830fb:	03 60 03             	add    0x3(%eax),%esp
  2830fe:	60                   	pusha  
  2830ff:	03 c0                	add    %eax,%eax
  283101:	01 c0                	add    %eax,%eax
  283103:	01 00                	add    %eax,(%eax)
	...
  283119:	00 00                	add    %al,(%eax)
  28311b:	00 c1                	add    %al,%cl
  28311d:	41                   	inc    %ecx
  28311e:	c1 41 c3 61          	roll   $0x61,-0x3d(%ecx)
  283122:	63 63 63             	arpl   %sp,0x63(%ebx)
  283125:	63 63 63             	arpl   %sp,0x63(%ebx)
  283128:	36 36 36 36 36 36 1c 	ss ss ss ss ss ss sbb $0x1c,%al
  28312f:	1c 
  283130:	1c 1c                	sbb    $0x1c,%al
  283132:	1c 1c                	sbb    $0x1c,%al
	...
  28314c:	1c 38                	sbb    $0x38,%al
  28314e:	38 1c 30             	cmp    %bl,(%eax,%esi,1)
  283151:	0c 60                	or     $0x60,%al
  283153:	06                   	push   %es
  283154:	60                   	pusha  
  283155:	03 60 03             	add    0x3(%eax),%esp
  283158:	60                   	pusha  
  283159:	03 60 03             	add    0x3(%eax),%esp
  28315c:	60                   	pusha  
  28315d:	06                   	push   %es
  28315e:	30 0c 38             	xor    %cl,(%eax,%edi,1)
  283161:	1c 1c                	sbb    $0x1c,%al
  283163:	38 00                	cmp    %al,(%eax)
	...
  283179:	00 00                	add    %al,(%eax)
  28317b:	00 18                	add    %bl,(%eax)
  28317d:	30 30                	xor    %dh,(%eax)
  28317f:	18 30                	sbb    %dh,(%eax)
  283181:	18 70 18             	sbb    %dh,0x18(%eax)
  283184:	60                   	pusha  
  283185:	0c 60                	or     $0x60,%al
  283187:	0c e0                	or     $0xe0,%al
  283189:	0c c0                	or     $0xc0,%al
  28318b:	06                   	push   %es
  28318c:	c0 06 80             	rolb   $0x80,(%esi)
  28318f:	03 80 03 80 03 80    	add    -0x7ffc7ffd(%eax),%eax
  283195:	01 80 01 c0 01 f0    	add    %eax,-0xffe3fff(%eax)
  28319b:	00 70 00             	add    %dh,0x0(%eax)
	...
  2831aa:	00 00                	add    %al,(%eax)
  2831ac:	fc                   	cld    
  2831ad:	1f                   	pop    %ds
  2831ae:	fc                   	cld    
  2831af:	1f                   	pop    %ds
  2831b0:	00 0c 00             	add    %cl,(%eax,%eax,1)
  2831b3:	06                   	push   %es
  2831b4:	00 03                	add    %al,(%ebx)
  2831b6:	80 01 c0             	addb   $0xc0,(%ecx)
  2831b9:	00 60 00             	add    %ah,0x0(%eax)
  2831bc:	30 00                	xor    %al,(%eax)
  2831be:	18 00                	sbb    %al,(%eax)
  2831c0:	fc                   	cld    
  2831c1:	1f                   	pop    %ds
  2831c2:	fc                   	cld    
  2831c3:	1f                   	pop    %ds
	...
  2831d0:	00 00                	add    %al,(%eax)
  2831d2:	00 03                	add    %al,(%ebx)
  2831d4:	80 01 c0             	addb   $0xc0,(%ecx)
  2831d7:	00 c0                	add    %al,%al
  2831d9:	00 c0                	add    %al,%al
  2831db:	00 c0                	add    %al,%al
  2831dd:	00 c0                	add    %al,%al
  2831df:	00 c0                	add    %al,%al
  2831e1:	00 60 00             	add    %ah,0x0(%eax)
  2831e4:	60                   	pusha  
  2831e5:	00 30                	add    %dh,(%eax)
  2831e7:	00 60 00             	add    %ah,0x0(%eax)
  2831ea:	40                   	inc    %eax
  2831eb:	00 c0                	add    %al,%al
  2831ed:	00 c0                	add    %al,%al
  2831ef:	00 c0                	add    %al,%al
  2831f1:	00 c0                	add    %al,%al
  2831f3:	00 c0                	add    %al,%al
  2831f5:	00 c0                	add    %al,%al
  2831f7:	00 80 01 00 03 00    	add    %al,0x30001(%eax)
  2831fd:	00 00                	add    %al,(%eax)
  2831ff:	00 00                	add    %al,(%eax)
  283201:	00 80 01 80 01 80    	add    %al,-0x7ffe7fff(%eax)
  283207:	01 80 01 80 01 80    	add    %eax,-0x7ffe7fff(%eax)
  28320d:	01 80 01 80 01 80    	add    %eax,-0x7ffe7fff(%eax)
  283213:	01 80 01 80 01 80    	add    %eax,-0x7ffe7fff(%eax)
  283219:	01 80 01 80 01 80    	add    %eax,-0x7ffe7fff(%eax)
  28321f:	01 80 01 80 01 80    	add    %eax,-0x7ffe7fff(%eax)
  283225:	01 80 01 80 01 80    	add    %eax,-0x7ffe7fff(%eax)
  28322b:	01 80 01 00 00 00    	add    %eax,0x1(%eax)
  283231:	00 60 00             	add    %ah,0x0(%eax)
  283234:	c0 00 c0             	rolb   $0xc0,(%eax)
  283237:	01 80 01 80 01 80    	add    %eax,-0x7ffe7fff(%eax)
  28323d:	01 80 01 80 01 00    	add    %eax,0x18001(%eax)
  283243:	03 00                	add    (%eax),%eax
  283245:	03 00                	add    (%eax),%eax
  283247:	06                   	push   %es
  283248:	00 03                	add    %al,(%ebx)
  28324a:	00 01                	add    %al,(%ecx)
  28324c:	80 01 80             	addb   $0x80,(%ecx)
  28324f:	01 80 01 80 01 80    	add    %eax,-0x7ffe7fff(%eax)
  283255:	01 80 01 c0 00 60    	add    %eax,0x6000c001(%eax)
	...
  28326f:	00 f0                	add    %dh,%al
  283271:	10 f8                	adc    %bh,%al
  283273:	1f                   	pop    %ds
  283274:	08 0f                	or     %cl,(%edi)
	...

002832a0 <table_rgb.1>:
  2832a0:	00 00                	add    %al,(%eax)
  2832a2:	00 ff                	add    %bh,%bh
  2832a4:	00 00                	add    %al,(%eax)
  2832a6:	00 ff                	add    %bh,%bh
  2832a8:	00 ff                	add    %bh,%bh
  2832aa:	ff 00                	incl   (%eax)
  2832ac:	00 00                	add    %al,(%eax)
  2832ae:	ff                   	(bad)  
  2832af:	ff 00                	incl   (%eax)
  2832b1:	ff 00                	incl   (%eax)
  2832b3:	ff                   	(bad)  
  2832b4:	ff                   	(bad)  
  2832b5:	ff                   	(bad)  
  2832b6:	ff                   	(bad)  
  2832b7:	ff c6                	inc    %esi
  2832b9:	c6 c6 84             	mov    $0x84,%dh
  2832bc:	00 00                	add    %al,(%eax)
  2832be:	00 84 00 84 84 00 00 	add    %al,0x8484(%eax,%eax,1)
  2832c5:	00 84 84 00 84 00 84 	add    %al,-0x7bff7c00(%esp,%eax,4)
  2832cc:	84                   	.byte 0x84
  2832cd:	84                   	.byte 0x84
  2832ce:	84                   	.byte 0x84
  2832cf:	84                   	.byte 0x84

Disassembly of section .got.plt:

002832d0 <_GLOBAL_OFFSET_TABLE_>:
	...

Disassembly of section .bss:

002832e0 <mousefifo>:
	...

002832f8 <keyfifo>:
	...

00283320 <keybuf>:
	...

Disassembly of section .stab:

00000000 <.stab>:
       0:	01 00                	add    %eax,(%eax)
       2:	00 00                	add    %al,(%eax)
       4:	00 00                	add    %al,(%eax)
       6:	0d 04 4e 14 00       	or     $0x144e04,%eax
       b:	00 01                	add    %al,(%ecx)
       d:	00 00                	add    %al,(%eax)
       f:	00 64 00 02          	add    %ah,0x2(%eax,%eax,1)
      13:	00 00                	add    %al,(%eax)
      15:	00 28                	add    %ch,(%eax)
      17:	00 08                	add    %cl,(%eax)
      19:	00 00                	add    %al,(%eax)
      1b:	00 3c 00             	add    %bh,(%eax,%eax,1)
      1e:	00 00                	add    %al,(%eax)
      20:	00 00                	add    %al,(%eax)
      22:	00 00                	add    %al,(%eax)
      24:	17                   	pop    %ss
      25:	00 00                	add    %al,(%eax)
      27:	00 24 00             	add    %ah,(%eax,%eax,1)
      2a:	00 00                	add    %al,(%eax)
      2c:	00 00                	add    %al,(%eax)
      2e:	28 00                	sub    %al,(%eax)
      30:	2d 00 00 00 80       	sub    $0x80000000,%eax
      35:	00 00                	add    %al,(%eax)
      37:	00 00                	add    %al,(%eax)
      39:	00 00                	add    %al,(%eax)
      3b:	00 e3                	add    %ah,%bl
      3d:	00 00                	add    %al,(%eax)
      3f:	00 80 00 00 00 00    	add    %al,0x0(%eax)
      45:	00 00                	add    %al,(%eax)
      47:	00 b2 01 00 00 80    	add    %dh,-0x7fffffff(%edx)
      4d:	00 00                	add    %al,(%eax)
      4f:	00 00                	add    %al,(%eax)
      51:	00 00                	add    %al,(%eax)
      53:	00 be 01 00 00 80    	add    %bh,-0x7fffffff(%esi)
      59:	00 00                	add    %al,(%eax)
      5b:	00 00                	add    %al,(%eax)
      5d:	00 00                	add    %al,(%eax)
      5f:	00 ca                	add    %cl,%dl
      61:	01 00                	add    %eax,(%eax)
      63:	00 80 00 00 00 00    	add    %al,0x0(%eax)
      69:	00 00                	add    %al,(%eax)
      6b:	00 db                	add    %bl,%bl
      6d:	01 00                	add    %eax,(%eax)
      6f:	00 80 00 00 00 00    	add    %al,0x0(%eax)
      75:	00 00                	add    %al,(%eax)
      77:	00 e6                	add    %ah,%dh
      79:	01 00                	add    %eax,(%eax)
      7b:	00 80 00 00 00 00    	add    %al,0x0(%eax)
      81:	00 00                	add    %al,(%eax)
      83:	00 34 02             	add    %dh,(%edx,%eax,1)
      86:	00 00                	add    %al,(%eax)
      88:	80 00 00             	addb   $0x0,(%eax)
	...
      93:	00 44 00 16          	add    %al,0x16(%eax,%eax,1)
	...
      9f:	00 44 00 22          	add    %al,0x22(%eax,%eax,1)
      a3:	00 17                	add    %dl,(%edi)
      a5:	00 00                	add    %al,(%eax)
      a7:	00 00                	add    %al,(%eax)
      a9:	00 00                	add    %al,(%eax)
      ab:	00 44 00 23          	add    %al,0x23(%eax,%eax,1)
      af:	00 1c 00             	add    %bl,(%eax,%eax,1)
      b2:	00 00                	add    %al,(%eax)
      b4:	00 00                	add    %al,(%eax)
      b6:	00 00                	add    %al,(%eax)
      b8:	44                   	inc    %esp
      b9:	00 24 00             	add    %ah,(%eax,%eax,1)
      bc:	21 00                	and    %eax,(%eax)
      be:	00 00                	add    %al,(%eax)
      c0:	00 00                	add    %al,(%eax)
      c2:	00 00                	add    %al,(%eax)
      c4:	44                   	inc    %esp
      c5:	00 26                	add    %ah,(%esi)
      c7:	00 22                	add    %ah,(%edx)
      c9:	00 00                	add    %al,(%eax)
      cb:	00 00                	add    %al,(%eax)
      cd:	00 00                	add    %al,(%eax)
      cf:	00 44 00 27          	add    %al,0x27(%eax,%eax,1)
      d3:	00 3e                	add    %bh,(%esi)
      d5:	00 00                	add    %al,(%eax)
      d7:	00 49 02             	add    %cl,0x2(%ecx)
      da:	00 00                	add    %al,(%eax)
      dc:	84 00                	test   %al,(%eax)
      de:	00 00                	add    %al,(%eax)
      e0:	5f                   	pop    %edi
      e1:	00 28                	add    %ch,(%eax)
      e3:	00 00                	add    %al,(%eax)
      e5:	00 00                	add    %al,(%eax)
      e7:	00 44 00 6b          	add    %al,0x6b(%eax,%eax,1)
      eb:	00 5f 00             	add    %bl,0x0(%edi)
      ee:	00 00                	add    %al,(%eax)
      f0:	01 00                	add    %eax,(%eax)
      f2:	00 00                	add    %al,(%eax)
      f4:	84 00                	test   %al,(%eax)
      f6:	00 00                	add    %al,(%eax)
      f8:	6f                   	outsl  %ds:(%esi),(%dx)
      f9:	00 28                	add    %ch,(%eax)
      fb:	00 00                	add    %al,(%eax)
      fd:	00 00                	add    %al,(%eax)
      ff:	00 44 00 2b          	add    %al,0x2b(%eax,%eax,1)
     103:	00 6f 00             	add    %ch,0x0(%edi)
     106:	00 00                	add    %al,(%eax)
     108:	00 00                	add    %al,(%eax)
     10a:	00 00                	add    %al,(%eax)
     10c:	44                   	inc    %esp
     10d:	00 2c 00             	add    %ch,(%eax,%eax,1)
     110:	74 00                	je     112 <bootmain-0x27feee>
     112:	00 00                	add    %al,(%eax)
     114:	00 00                	add    %al,(%eax)
     116:	00 00                	add    %al,(%eax)
     118:	44                   	inc    %esp
     119:	00 2d 00 82 00 00    	add    %ch,0x8200
     11f:	00 00                	add    %al,(%eax)
     121:	00 00                	add    %al,(%eax)
     123:	00 44 00 2e          	add    %al,0x2e(%eax,%eax,1)
     127:	00 93 00 00 00 00    	add    %dl,0x0(%ebx)
     12d:	00 00                	add    %al,(%eax)
     12f:	00 44 00 2d          	add    %al,0x2d(%eax,%eax,1)
     133:	00 9a 00 00 00 00    	add    %bl,0x0(%edx)
     139:	00 00                	add    %al,(%eax)
     13b:	00 44 00 2e          	add    %al,0x2e(%eax,%eax,1)
     13f:	00 9c 00 00 00 00 00 	add    %bl,0x0(%eax,%eax,1)
     146:	00 00                	add    %al,(%eax)
     148:	44                   	inc    %esp
     149:	00 2f                	add    %ch,(%edi)
     14b:	00 a1 00 00 00 00    	add    %ah,0x0(%ecx)
     151:	00 00                	add    %al,(%eax)
     153:	00 44 00 30          	add    %al,0x30(%eax,%eax,1)
     157:	00 b8 00 00 00 00    	add    %bh,0x0(%eax)
     15d:	00 00                	add    %al,(%eax)
     15f:	00 44 00 3d          	add    %al,0x3d(%eax,%eax,1)
     163:	00 c1                	add    %al,%cl
     165:	00 00                	add    %al,(%eax)
     167:	00 00                	add    %al,(%eax)
     169:	00 00                	add    %al,(%eax)
     16b:	00 44 00 30          	add    %al,0x30(%eax,%eax,1)
     16f:	00 c4                	add    %al,%ah
     171:	00 00                	add    %al,(%eax)
     173:	00 00                	add    %al,(%eax)
     175:	00 00                	add    %al,(%eax)
     177:	00 44 00 32          	add    %al,0x32(%eax,%eax,1)
     17b:	00 d4                	add    %dl,%ah
     17d:	00 00                	add    %al,(%eax)
     17f:	00 00                	add    %al,(%eax)
     181:	00 00                	add    %al,(%eax)
     183:	00 44 00 33          	add    %al,0x33(%eax,%eax,1)
     187:	00 d9                	add    %bl,%cl
     189:	00 00                	add    %al,(%eax)
     18b:	00 00                	add    %al,(%eax)
     18d:	00 00                	add    %al,(%eax)
     18f:	00 44 00 34          	add    %al,0x34(%eax,%eax,1)
     193:	00 f7                	add    %dh,%bh
     195:	00 00                	add    %al,(%eax)
     197:	00 00                	add    %al,(%eax)
     199:	00 00                	add    %al,(%eax)
     19b:	00 44 00 34          	add    %al,0x34(%eax,%eax,1)
     19f:	00 fe                	add    %bh,%dh
     1a1:	00 00                	add    %al,(%eax)
     1a3:	00 00                	add    %al,(%eax)
     1a5:	00 00                	add    %al,(%eax)
     1a7:	00 44 00 34          	add    %al,0x34(%eax,%eax,1)
     1ab:	00 03                	add    %al,(%ebx)
     1ad:	01 00                	add    %eax,(%eax)
     1af:	00 00                	add    %al,(%eax)
     1b1:	00 00                	add    %al,(%eax)
     1b3:	00 44 00 34          	add    %al,0x34(%eax,%eax,1)
     1b7:	00 06                	add    %al,(%esi)
     1b9:	01 00                	add    %eax,(%eax)
     1bb:	00 00                	add    %al,(%eax)
     1bd:	00 00                	add    %al,(%eax)
     1bf:	00 44 00 35          	add    %al,0x35(%eax,%eax,1)
     1c3:	00 0b                	add    %cl,(%ebx)
     1c5:	01 00                	add    %eax,(%eax)
     1c7:	00 00                	add    %al,(%eax)
     1c9:	00 00                	add    %al,(%eax)
     1cb:	00 44 00 35          	add    %al,0x35(%eax,%eax,1)
     1cf:	00 12                	add    %dl,(%edx)
     1d1:	01 00                	add    %eax,(%eax)
     1d3:	00 00                	add    %al,(%eax)
     1d5:	00 00                	add    %al,(%eax)
     1d7:	00 44 00 35          	add    %al,0x35(%eax,%eax,1)
     1db:	00 15 01 00 00 00    	add    %dl,0x1
     1e1:	00 00                	add    %al,(%eax)
     1e3:	00 44 00 36          	add    %al,0x36(%eax,%eax,1)
     1e7:	00 18                	add    %bl,(%eax)
     1e9:	01 00                	add    %eax,(%eax)
     1eb:	00 00                	add    %al,(%eax)
     1ed:	00 00                	add    %al,(%eax)
     1ef:	00 44 00 35          	add    %al,0x35(%eax,%eax,1)
     1f3:	00 19                	add    %bl,(%ecx)
     1f5:	01 00                	add    %eax,(%eax)
     1f7:	00 00                	add    %al,(%eax)
     1f9:	00 00                	add    %al,(%eax)
     1fb:	00 44 00 36          	add    %al,0x36(%eax,%eax,1)
     1ff:	00 1f                	add    %bl,(%edi)
     201:	01 00                	add    %eax,(%eax)
     203:	00 00                	add    %al,(%eax)
     205:	00 00                	add    %al,(%eax)
     207:	00 44 00 38          	add    %al,0x38(%eax,%eax,1)
     20b:	00 34 01             	add    %dh,(%ecx,%eax,1)
     20e:	00 00                	add    %al,(%eax)
     210:	00 00                	add    %al,(%eax)
     212:	00 00                	add    %al,(%eax)
     214:	44                   	inc    %esp
     215:	00 3a                	add    %bh,(%edx)
     217:	00 5b 01             	add    %bl,0x1(%ebx)
     21a:	00 00                	add    %al,(%eax)
     21c:	00 00                	add    %al,(%eax)
     21e:	00 00                	add    %al,(%eax)
     220:	44                   	inc    %esp
     221:	00 3b                	add    %bh,(%ebx)
     223:	00 84 01 00 00 00 00 	add    %al,0x0(%ecx,%eax,1)
     22a:	00 00                	add    %al,(%eax)
     22c:	44                   	inc    %esp
     22d:	00 3d 00 a5 01 00    	add    %bh,0x1a500
     233:	00 00                	add    %al,(%eax)
     235:	00 00                	add    %al,(%eax)
     237:	00 44 00 3d          	add    %al,0x3d(%eax,%eax,1)
     23b:	00 b2 01 00 00 00    	add    %dh,0x1(%edx)
     241:	00 00                	add    %al,(%eax)
     243:	00 44 00 3e          	add    %al,0x3e(%eax,%eax,1)
     247:	00 c9                	add    %cl,%cl
     249:	01 00                	add    %eax,(%eax)
     24b:	00 00                	add    %al,(%eax)
     24d:	00 00                	add    %al,(%eax)
     24f:	00 44 00 45          	add    %al,0x45(%eax,%eax,1)
     253:	00 ee                	add    %ch,%dh
     255:	01 00                	add    %eax,(%eax)
     257:	00 00                	add    %al,(%eax)
     259:	00 00                	add    %al,(%eax)
     25b:	00 44 00 46          	add    %al,0x46(%eax,%eax,1)
     25f:	00 ef                	add    %ch,%bh
     261:	01 00                	add    %eax,(%eax)
     263:	00 00                	add    %al,(%eax)
     265:	00 00                	add    %al,(%eax)
     267:	00 44 00 46          	add    %al,0x46(%eax,%eax,1)
     26b:	00 ff                	add    %bh,%bh
     26d:	01 00                	add    %eax,(%eax)
     26f:	00 00                	add    %al,(%eax)
     271:	00 00                	add    %al,(%eax)
     273:	00 44 00 46          	add    %al,0x46(%eax,%eax,1)
     277:	00 0b                	add    %cl,(%ebx)
     279:	02 00                	add    (%eax),%al
     27b:	00 00                	add    %al,(%eax)
     27d:	00 00                	add    %al,(%eax)
     27f:	00 44 00 47          	add    %al,0x47(%eax,%eax,1)
     283:	00 12                	add    %dl,(%edx)
     285:	02 00                	add    (%eax),%al
     287:	00 49 02             	add    %cl,0x2(%ecx)
     28a:	00 00                	add    %al,(%eax)
     28c:	84 00                	test   %al,(%eax)
     28e:	00 00                	add    %al,(%eax)
     290:	13 02                	adc    (%edx),%eax
     292:	28 00                	sub    %al,(%eax)
     294:	00 00                	add    %al,(%eax)
     296:	00 00                	add    %al,(%eax)
     298:	44                   	inc    %esp
     299:	00 47 00             	add    %al,0x0(%edi)
     29c:	13 02                	adc    (%edx),%eax
     29e:	00 00                	add    %al,(%eax)
     2a0:	00 00                	add    %al,(%eax)
     2a2:	00 00                	add    %al,(%eax)
     2a4:	44                   	inc    %esp
     2a5:	00 48 00             	add    %cl,0x0(%eax)
     2a8:	14 02                	adc    $0x2,%al
     2aa:	00 00                	add    %al,(%eax)
     2ac:	01 00                	add    %eax,(%eax)
     2ae:	00 00                	add    %al,(%eax)
     2b0:	84 00                	test   %al,(%eax)
     2b2:	00 00                	add    %al,(%eax)
     2b4:	19 02                	sbb    %eax,(%edx)
     2b6:	28 00                	sub    %al,(%eax)
     2b8:	00 00                	add    %al,(%eax)
     2ba:	00 00                	add    %al,(%eax)
     2bc:	44                   	inc    %esp
     2bd:	00 4a 00             	add    %cl,0x0(%edx)
     2c0:	19 02                	sbb    %eax,(%edx)
     2c2:	00 00                	add    %al,(%eax)
     2c4:	00 00                	add    %al,(%eax)
     2c6:	00 00                	add    %al,(%eax)
     2c8:	44                   	inc    %esp
     2c9:	00 4a 00             	add    %cl,0x0(%edx)
     2cc:	27                   	daa    
     2cd:	02 00                	add    (%eax),%al
     2cf:	00 00                	add    %al,(%eax)
     2d1:	00 00                	add    %al,(%eax)
     2d3:	00 44 00 4b          	add    %al,0x4b(%eax,%eax,1)
     2d7:	00 32                	add    %dh,(%edx)
     2d9:	02 00                	add    (%eax),%al
     2db:	00 00                	add    %al,(%eax)
     2dd:	00 00                	add    %al,(%eax)
     2df:	00 44 00 4c          	add    %al,0x4c(%eax,%eax,1)
     2e3:	00 50 02             	add    %dl,0x2(%eax)
     2e6:	00 00                	add    %al,(%eax)
     2e8:	00 00                	add    %al,(%eax)
     2ea:	00 00                	add    %al,(%eax)
     2ec:	44                   	inc    %esp
     2ed:	00 4d 00             	add    %cl,0x0(%ebp)
     2f0:	5e                   	pop    %esi
     2f1:	02 00                	add    (%eax),%al
     2f3:	00 00                	add    %al,(%eax)
     2f5:	00 00                	add    %al,(%eax)
     2f7:	00 44 00 4e          	add    %al,0x4e(%eax,%eax,1)
     2fb:	00 5f 02             	add    %bl,0x2(%edi)
     2fe:	00 00                	add    %al,(%eax)
     300:	00 00                	add    %al,(%eax)
     302:	00 00                	add    %al,(%eax)
     304:	44                   	inc    %esp
     305:	00 4f 00             	add    %cl,0x0(%edi)
     308:	76 02                	jbe    30c <bootmain-0x27fcf4>
     30a:	00 00                	add    %al,(%eax)
     30c:	00 00                	add    %al,(%eax)
     30e:	00 00                	add    %al,(%eax)
     310:	44                   	inc    %esp
     311:	00 50 00             	add    %dl,0x0(%eax)
     314:	96                   	xchg   %eax,%esi
     315:	02 00                	add    (%eax),%al
     317:	00 00                	add    %al,(%eax)
     319:	00 00                	add    %al,(%eax)
     31b:	00 44 00 52          	add    %al,0x52(%eax,%eax,1)
     31f:	00 b6 02 00 00 00    	add    %dh,0x2(%esi)
     325:	00 00                	add    %al,(%eax)
     327:	00 44 00 52          	add    %al,0x52(%eax,%eax,1)
     32b:	00 c5                	add    %al,%ch
     32d:	02 00                	add    (%eax),%al
     32f:	00 00                	add    %al,(%eax)
     331:	00 00                	add    %al,(%eax)
     333:	00 44 00 54          	add    %al,0x54(%eax,%eax,1)
     337:	00 d0                	add    %dl,%al
     339:	02 00                	add    (%eax),%al
     33b:	00 00                	add    %al,(%eax)
     33d:	00 00                	add    %al,(%eax)
     33f:	00 44 00 55          	add    %al,0x55(%eax,%eax,1)
     343:	00 d9                	add    %bl,%cl
     345:	02 00                	add    (%eax),%al
     347:	00 00                	add    %al,(%eax)
     349:	00 00                	add    %al,(%eax)
     34b:	00 44 00 56          	add    %al,0x56(%eax,%eax,1)
     34f:	00 da                	add    %bl,%dl
     351:	02 00                	add    (%eax),%al
     353:	00 00                	add    %al,(%eax)
     355:	00 00                	add    %al,(%eax)
     357:	00 44 00 56          	add    %al,0x56(%eax,%eax,1)
     35b:	00 ec                	add    %ch,%ah
     35d:	02 00                	add    (%eax),%al
     35f:	00 00                	add    %al,(%eax)
     361:	00 00                	add    %al,(%eax)
     363:	00 44 00 57          	add    %al,0x57(%eax,%eax,1)
     367:	00 f7                	add    %dh,%bh
     369:	02 00                	add    (%eax),%al
     36b:	00 00                	add    %al,(%eax)
     36d:	00 00                	add    %al,(%eax)
     36f:	00 44 00 58          	add    %al,0x58(%eax,%eax,1)
     373:	00 1a                	add    %bl,(%edx)
     375:	03 00                	add    (%eax),%eax
     377:	00 00                	add    %al,(%eax)
     379:	00 00                	add    %al,(%eax)
     37b:	00 44 00 58          	add    %al,0x58(%eax,%eax,1)
     37f:	00 20                	add    %ah,(%eax)
     381:	03 00                	add    (%eax),%eax
     383:	00 00                	add    %al,(%eax)
     385:	00 00                	add    %al,(%eax)
     387:	00 44 00 59          	add    %al,0x59(%eax,%eax,1)
     38b:	00 30                	add    %dh,(%eax)
     38d:	03 00                	add    (%eax),%eax
     38f:	00 00                	add    %al,(%eax)
     391:	00 00                	add    %al,(%eax)
     393:	00 44 00 59          	add    %al,0x59(%eax,%eax,1)
     397:	00 37                	add    %dh,(%edi)
     399:	03 00                	add    (%eax),%eax
     39b:	00 00                	add    %al,(%eax)
     39d:	00 00                	add    %al,(%eax)
     39f:	00 44 00 5a          	add    %al,0x5a(%eax,%eax,1)
     3a3:	00 39                	add    %bh,(%ecx)
     3a5:	03 00                	add    (%eax),%eax
     3a7:	00 00                	add    %al,(%eax)
     3a9:	00 00                	add    %al,(%eax)
     3ab:	00 44 00 5a          	add    %al,0x5a(%eax,%eax,1)
     3af:	00 40 03             	add    %al,0x3(%eax)
     3b2:	00 00                	add    %al,(%eax)
     3b4:	00 00                	add    %al,(%eax)
     3b6:	00 00                	add    %al,(%eax)
     3b8:	44                   	inc    %esp
     3b9:	00 5b 00             	add    %bl,0x0(%ebx)
     3bc:	42                   	inc    %edx
     3bd:	03 00                	add    (%eax),%eax
     3bf:	00 00                	add    %al,(%eax)
     3c1:	00 00                	add    %al,(%eax)
     3c3:	00 44 00 5d          	add    %al,0x5d(%eax,%eax,1)
     3c7:	00 49 03             	add    %cl,0x3(%ecx)
     3ca:	00 00                	add    %al,(%eax)
     3cc:	00 00                	add    %al,(%eax)
     3ce:	00 00                	add    %al,(%eax)
     3d0:	44                   	inc    %esp
     3d1:	00 5e 00             	add    %bl,0x0(%esi)
     3d4:	6a 03                	push   $0x3
     3d6:	00 00                	add    %al,(%eax)
     3d8:	00 00                	add    %al,(%eax)
     3da:	00 00                	add    %al,(%eax)
     3dc:	44                   	inc    %esp
     3dd:	00 60 00             	add    %ah,0x0(%eax)
     3e0:	87 03                	xchg   %eax,(%ebx)
     3e2:	00 00                	add    %al,(%eax)
     3e4:	00 00                	add    %al,(%eax)
     3e6:	00 00                	add    %al,(%eax)
     3e8:	44                   	inc    %esp
     3e9:	00 65 00             	add    %ah,0x0(%ebp)
     3ec:	d5 03                	aad    $0x3
     3ee:	00 00                	add    %al,(%eax)
     3f0:	00 00                	add    %al,(%eax)
     3f2:	00 00                	add    %al,(%eax)
     3f4:	44                   	inc    %esp
     3f5:	00 65 00             	add    %ah,0x0(%ebp)
     3f8:	e2 03                	loop   3fd <bootmain-0x27fc03>
     3fa:	00 00                	add    %al,(%eax)
     3fc:	00 00                	add    %al,(%eax)
     3fe:	00 00                	add    %al,(%eax)
     400:	44                   	inc    %esp
     401:	00 65 00             	add    %ah,0x0(%ebp)
     404:	e5 03                	in     $0x3,%eax
     406:	00 00                	add    %al,(%eax)
     408:	00 00                	add    %al,(%eax)
     40a:	00 00                	add    %al,(%eax)
     40c:	44                   	inc    %esp
     40d:	00 65 00             	add    %ah,0x0(%ebp)
     410:	e9 03 00 00 00       	jmp    418 <bootmain-0x27fbe8>
     415:	00 00                	add    %al,(%eax)
     417:	00 44 00 66          	add    %al,0x66(%eax,%eax,1)
     41b:	00 ec                	add    %ch,%ah
     41d:	03 00                	add    (%eax),%eax
     41f:	00 00                	add    %al,(%eax)
     421:	00 00                	add    %al,(%eax)
     423:	00 44 00 66          	add    %al,0x66(%eax,%eax,1)
     427:	00 f3                	add    %dh,%bl
     429:	03 00                	add    (%eax),%eax
     42b:	00 00                	add    %al,(%eax)
     42d:	00 00                	add    %al,(%eax)
     42f:	00 44 00 66          	add    %al,0x66(%eax,%eax,1)
     433:	00 f6                	add    %dh,%dh
     435:	03 00                	add    (%eax),%eax
     437:	00 00                	add    %al,(%eax)
     439:	00 00                	add    %al,(%eax)
     43b:	00 44 00 66          	add    %al,0x66(%eax,%eax,1)
     43f:	00 fe                	add    %bh,%dh
     441:	03 00                	add    (%eax),%eax
     443:	00 00                	add    %al,(%eax)
     445:	00 00                	add    %al,(%eax)
     447:	00 44 00 67          	add    %al,0x67(%eax,%eax,1)
     44b:	00 07                	add    %al,(%edi)
     44d:	04 00                	add    $0x0,%al
     44f:	00 00                	add    %al,(%eax)
     451:	00 00                	add    %al,(%eax)
     453:	00 44 00 68          	add    %al,0x68(%eax,%eax,1)
     457:	00 20                	add    %ah,(%eax)
     459:	04 00                	add    $0x0,%al
     45b:	00 00                	add    %al,(%eax)
     45d:	00 00                	add    %al,(%eax)
     45f:	00 44 00 69          	add    %al,0x69(%eax,%eax,1)
     463:	00 40 04             	add    %al,0x4(%eax)
     466:	00 00                	add    %al,(%eax)
     468:	00 00                	add    %al,(%eax)
     46a:	00 00                	add    %al,(%eax)
     46c:	44                   	inc    %esp
     46d:	00 6a 00             	add    %ch,0x0(%edx)
     470:	5d                   	pop    %ebp
     471:	04 00                	add    $0x0,%al
     473:	00 00                	add    %al,(%eax)
     475:	00 00                	add    %al,(%eax)
     477:	00 44 00 6e          	add    %al,0x6e(%eax,%eax,1)
     47b:	00 8a 04 00 00 00    	add    %cl,0x4(%edx)
     481:	00 00                	add    %al,(%eax)
     483:	00 44 00 6f          	add    %al,0x6f(%eax,%eax,1)
     487:	00 8b 04 00 00 00    	add    %cl,0x4(%ebx)
     48d:	00 00                	add    %al,(%eax)
     48f:	00 44 00 6e          	add    %al,0x6e(%eax,%eax,1)
     493:	00 91 04 00 00 00    	add    %dl,0x4(%ecx)
     499:	00 00                	add    %al,(%eax)
     49b:	00 44 00 6f          	add    %al,0x6f(%eax,%eax,1)
     49f:	00 a1 04 00 00 00    	add    %ah,0x4(%ecx)
     4a5:	00 00                	add    %al,(%eax)
     4a7:	00 44 00 6e          	add    %al,0x6e(%eax,%eax,1)
     4ab:	00 a4 04 00 00 00 00 	add    %ah,0x0(%esp,%eax,1)
     4b2:	00 00                	add    %al,(%eax)
     4b4:	44                   	inc    %esp
     4b5:	00 6f 00             	add    %ch,0x0(%edi)
     4b8:	a7                   	cmpsl  %es:(%edi),%ds:(%esi)
     4b9:	04 00                	add    $0x0,%al
     4bb:	00 00                	add    %al,(%eax)
     4bd:	00 00                	add    %al,(%eax)
     4bf:	00 44 00 70          	add    %al,0x70(%eax,%eax,1)
     4c3:	00 b5 04 00 00 51    	add    %dh,0x51000004(%ebp)
     4c9:	02 00                	add    (%eax),%al
     4cb:	00 80 00 00 00 50    	add    %al,0x50000000(%eax)
     4d1:	fe                   	(bad)  
     4d2:	ff                   	(bad)  
     4d3:	ff 6d 02             	ljmp   *0x2(%ebp)
     4d6:	00 00                	add    %al,(%eax)
     4d8:	80 00 00             	addb   $0x0,(%eax)
     4db:	00 f8                	add    %bh,%al
     4dd:	fe                   	(bad)  
     4de:	ff                   	(bad)  
     4df:	ff 90 02 00 00 80    	call   *-0x7ffffffe(%eax)
     4e5:	00 00                	add    %al,(%eax)
     4e7:	00 30                	add    %dh,(%eax)
     4e9:	fe                   	(bad)  
     4ea:	ff                   	(bad)  
     4eb:	ff c1                	inc    %ecx
     4ed:	02 00                	add    (%eax),%al
     4ef:	00 80 00 00 00 00    	add    %al,0x0(%eax)
     4f5:	00 00                	add    %al,(%eax)
     4f7:	00 d7                	add    %dl,%bh
     4f9:	02 00                	add    (%eax),%al
     4fb:	00 80 00 00 00 78    	add    %al,0x78000000(%eax)
     501:	fe                   	(bad)  
     502:	ff                   	(bad)  
     503:	ff                   	(bad)  
     504:	fc                   	cld    
     505:	02 00                	add    (%eax),%al
     507:	00 40 00             	add    %al,0x0(%eax)
     50a:	00 00                	add    %al,(%eax)
     50c:	06                   	push   %es
     50d:	00 00                	add    %al,(%eax)
     50f:	00 0d 03 00 00 80    	add    %cl,0x80000003
     515:	00 00                	add    %al,(%eax)
     517:	00 20                	add    %ah,(%eax)
     519:	fe                   	(bad)  
     51a:	ff                   	(bad)  
     51b:	ff 26                	jmp    *(%esi)
     51d:	03 00                	add    (%eax),%eax
     51f:	00 80 00 00 00 00    	add    %al,0x0(%eax)
     525:	00 00                	add    %al,(%eax)
     527:	00 00                	add    %al,(%eax)
     529:	00 00                	add    %al,(%eax)
     52b:	00 c0                	add    %al,%al
	...
     535:	00 00                	add    %al,(%eax)
     537:	00 e0                	add    %ah,%al
     539:	00 00                	add    %al,(%eax)
     53b:	00 bd 04 00 00 9e    	add    %bh,-0x61fffffc(%ebp)
     541:	03 00                	add    (%eax),%eax
     543:	00 20                	add    %ah,(%eax)
     545:	00 00                	add    %al,(%eax)
     547:	00 00                	add    %al,(%eax)
     549:	00 00                	add    %al,(%eax)
     54b:	00 c3                	add    %al,%bl
     54d:	03 00                	add    (%eax),%eax
     54f:	00 20                	add    %ah,(%eax)
     551:	00 00                	add    %al,(%eax)
     553:	00 00                	add    %al,(%eax)
     555:	00 00                	add    %al,(%eax)
     557:	00 fe                	add    %bh,%dh
     559:	03 00                	add    (%eax),%eax
     55b:	00 80 00 00 00 00    	add    %al,0x0(%eax)
     561:	00 00                	add    %al,(%eax)
     563:	00 00                	add    %al,(%eax)
     565:	00 00                	add    %al,(%eax)
     567:	00 64 00 00          	add    %ah,0x0(%eax,%eax,1)
     56b:	00 bd 04 28 00 19    	add    %bh,0x19002804(%ebp)
     571:	04 00                	add    $0x0,%al
     573:	00 64 00 02          	add    %ah,0x2(%eax,%eax,1)
     577:	00 bd 04 28 00 08    	add    %bh,0x8002804(%ebp)
     57d:	00 00                	add    %al,(%eax)
     57f:	00 3c 00             	add    %bh,(%eax,%eax,1)
     582:	00 00                	add    %al,(%eax)
     584:	00 00                	add    %al,(%eax)
     586:	00 00                	add    %al,(%eax)
     588:	22 04 00             	and    (%eax,%eax,1),%al
     58b:	00 24 00             	add    %ah,(%eax,%eax,1)
     58e:	00 00                	add    %al,(%eax)
     590:	bd 04 28 00 3c       	mov    $0x3c002804,%ebp
     595:	04 00                	add    $0x0,%al
     597:	00 80 00 00 00 00    	add    %al,0x0(%eax)
     59d:	00 00                	add    %al,(%eax)
     59f:	00 b2 01 00 00 80    	add    %dh,-0x7fffffff(%edx)
     5a5:	00 00                	add    %al,(%eax)
     5a7:	00 00                	add    %al,(%eax)
     5a9:	00 00                	add    %al,(%eax)
     5ab:	00 56 04             	add    %dl,0x4(%esi)
     5ae:	00 00                	add    %al,(%eax)
     5b0:	a0 00 00 00 08       	mov    0x8000000,%al
     5b5:	00 00                	add    %al,(%eax)
     5b7:	00 82 04 00 00 80    	add    %al,-0x7ffffffc(%edx)
	...
     5c5:	00 00                	add    %al,(%eax)
     5c7:	00 44 00 05          	add    %al,0x5(%eax,%eax,1)
	...
     5d3:	00 44 00 07          	add    %al,0x7(%eax,%eax,1)
     5d7:	00 01                	add    %al,(%ecx)
     5d9:	00 00                	add    %al,(%eax)
     5db:	00 00                	add    %al,(%eax)
     5dd:	00 00                	add    %al,(%eax)
     5df:	00 44 00 05          	add    %al,0x5(%eax,%eax,1)
     5e3:	00 06                	add    %al,(%esi)
     5e5:	00 00                	add    %al,(%eax)
     5e7:	00 00                	add    %al,(%eax)
     5e9:	00 00                	add    %al,(%eax)
     5eb:	00 44 00 05          	add    %al,0x5(%eax,%eax,1)
     5ef:	00 08                	add    %cl,(%eax)
     5f1:	00 00                	add    %al,(%eax)
     5f3:	00 00                	add    %al,(%eax)
     5f5:	00 00                	add    %al,(%eax)
     5f7:	00 44 00 09          	add    %al,0x9(%eax,%eax,1)
     5fb:	00 0b                	add    %cl,(%ebx)
     5fd:	00 00                	add    %al,(%eax)
     5ff:	00 00                	add    %al,(%eax)
     601:	00 00                	add    %al,(%eax)
     603:	00 44 00 07          	add    %al,0x7(%eax,%eax,1)
     607:	00 0d 00 00 00 00    	add    %cl,0x0
     60d:	00 00                	add    %al,(%eax)
     60f:	00 44 00 07          	add    %al,0x7(%eax,%eax,1)
     613:	00 0e                	add    %cl,(%esi)
     615:	00 00                	add    %al,(%eax)
     617:	00 00                	add    %al,(%eax)
     619:	00 00                	add    %al,(%eax)
     61b:	00 44 00 0c          	add    %al,0xc(%eax,%eax,1)
     61f:	00 15 00 00 00 8d    	add    %dl,0x8d000000
     625:	04 00                	add    $0x0,%al
     627:	00 40 00             	add    %al,0x0(%eax)
     62a:	00 00                	add    %al,(%eax)
     62c:	00 00                	add    %al,(%eax)
     62e:	00 00                	add    %al,(%eax)
     630:	96                   	xchg   %eax,%esi
     631:	04 00                	add    $0x0,%al
     633:	00 40 00             	add    %al,0x0(%eax)
     636:	00 00                	add    %al,(%eax)
     638:	02 00                	add    (%eax),%al
     63a:	00 00                	add    %al,(%eax)
     63c:	00 00                	add    %al,(%eax)
     63e:	00 00                	add    %al,(%eax)
     640:	c0 00 00             	rolb   $0x0,(%eax)
	...
     64b:	00 e0                	add    %ah,%al
     64d:	00 00                	add    %al,(%eax)
     64f:	00 17                	add    %dl,(%edi)
     651:	00 00                	add    %al,(%eax)
     653:	00 a3 04 00 00 24    	add    %ah,0x24000004(%ebx)
     659:	00 00                	add    %al,(%eax)
     65b:	00 d4                	add    %dl,%ah
     65d:	04 28                	add    $0x28,%al
     65f:	00 b7 04 00 00 a0    	add    %dh,-0x5ffffffc(%edi)
     665:	00 00                	add    %al,(%eax)
     667:	00 08                	add    %cl,(%eax)
     669:	00 00                	add    %al,(%eax)
     66b:	00 00                	add    %al,(%eax)
     66d:	00 00                	add    %al,(%eax)
     66f:	00 44 00 0f          	add    %al,0xf(%eax,%eax,1)
	...
     67b:	00 44 00 12          	add    %al,0x12(%eax,%eax,1)
	...
     687:	00 44 00 14          	add    %al,0x14(%eax,%eax,1)
     68b:	00 05 00 00 00 00    	add    %al,0x0
     691:	00 00                	add    %al,(%eax)
     693:	00 44 00 12          	add    %al,0x12(%eax,%eax,1)
     697:	00 07                	add    %al,(%edi)
     699:	00 00                	add    %al,(%eax)
     69b:	00 00                	add    %al,(%eax)
     69d:	00 00                	add    %al,(%eax)
     69f:	00 44 00 14          	add    %al,0x14(%eax,%eax,1)
     6a3:	00 08                	add    %cl,(%eax)
     6a5:	00 00                	add    %al,(%eax)
     6a7:	00 00                	add    %al,(%eax)
     6a9:	00 00                	add    %al,(%eax)
     6ab:	00 44 00 12          	add    %al,0x12(%eax,%eax,1)
     6af:	00 0e                	add    %cl,(%esi)
     6b1:	00 00                	add    %al,(%eax)
     6b3:	00 00                	add    %al,(%eax)
     6b5:	00 00                	add    %al,(%eax)
     6b7:	00 44 00 17          	add    %al,0x17(%eax,%eax,1)
     6bb:	00 15 00 00 00 8d    	add    %dl,0x8d000000
     6c1:	04 00                	add    $0x0,%al
     6c3:	00 40 00             	add    %al,0x0(%eax)
	...
     6ce:	00 00                	add    %al,(%eax)
     6d0:	c0 00 00             	rolb   $0x0,(%eax)
	...
     6db:	00 e0                	add    %ah,%al
     6dd:	00 00                	add    %al,(%eax)
     6df:	00 16                	add    %dl,(%esi)
     6e1:	00 00                	add    %al,(%eax)
     6e3:	00 c4                	add    %al,%ah
     6e5:	04 00                	add    $0x0,%al
     6e7:	00 24 00             	add    %ah,(%eax,%eax,1)
     6ea:	00 00                	add    %al,(%eax)
     6ec:	ea 04 28 00 d7 04 00 	ljmp   $0x4,$0xd7002804
     6f3:	00 a0 00 00 00 08    	add    %ah,0x8000000(%eax)
     6f9:	00 00                	add    %al,(%eax)
     6fb:	00 e4                	add    %ah,%ah
     6fd:	04 00                	add    $0x0,%al
     6ff:	00 a0 00 00 00 0c    	add    %ah,0xc000000(%eax)
     705:	00 00                	add    %al,(%eax)
     707:	00 ef                	add    %ch,%bh
     709:	04 00                	add    $0x0,%al
     70b:	00 a0 00 00 00 10    	add    %ah,0x10000000(%eax)
     711:	00 00                	add    %al,(%eax)
     713:	00 0f                	add    %cl,(%edi)
     715:	05 00 00 80 00       	add    $0x800000,%eax
	...
     722:	00 00                	add    %al,(%eax)
     724:	44                   	inc    %esp
     725:	00 19                	add    %bl,(%ecx)
	...
     72f:	00 44 00 19          	add    %al,0x19(%eax,%eax,1)
     733:	00 08                	add    %cl,(%eax)
     735:	00 00                	add    %al,(%eax)
     737:	00 49 02             	add    %cl,0x2(%ecx)
     73a:	00 00                	add    %al,(%eax)
     73c:	84 00                	test   %al,(%eax)
     73e:	00 00                	add    %al,(%eax)
     740:	f5                   	cmc    
     741:	04 28                	add    $0x28,%al
     743:	00 00                	add    %al,(%eax)
     745:	00 00                	add    %al,(%eax)
     747:	00 44 00 40          	add    %al,0x40(%eax,%eax,1)
     74b:	01 0b                	add    %ecx,(%ebx)
     74d:	00 00                	add    %al,(%eax)
     74f:	00 19                	add    %bl,(%ecx)
     751:	04 00                	add    $0x0,%al
     753:	00 84 00 00 00 f7 04 	add    %al,0x4f70000(%eax,%eax,1)
     75a:	28 00                	sub    %al,(%eax)
     75c:	00 00                	add    %al,(%eax)
     75e:	00 00                	add    %al,(%eax)
     760:	44                   	inc    %esp
     761:	00 1c 00             	add    %bl,(%eax,%eax,1)
     764:	0d 00 00 00 49       	or     $0x49000000,%eax
     769:	02 00                	add    (%eax),%al
     76b:	00 84 00 00 00 f8 04 	add    %al,0x4f80000(%eax,%eax,1)
     772:	28 00                	sub    %al,(%eax)
     774:	00 00                	add    %al,(%eax)
     776:	00 00                	add    %al,(%eax)
     778:	44                   	inc    %esp
     779:	00 6b 00             	add    %ch,0x0(%ebx)
     77c:	0e                   	push   %cs
     77d:	00 00                	add    %al,(%eax)
     77f:	00 19                	add    %bl,(%ecx)
     781:	04 00                	add    $0x0,%al
     783:	00 84 00 00 00 05 05 	add    %al,0x5050000(%eax,%eax,1)
     78a:	28 00                	sub    %al,(%eax)
     78c:	00 00                	add    %al,(%eax)
     78e:	00 00                	add    %al,(%eax)
     790:	44                   	inc    %esp
     791:	00 1e                	add    %bl,(%esi)
     793:	00 1b                	add    %bl,(%ebx)
     795:	00 00                	add    %al,(%eax)
     797:	00 00                	add    %al,(%eax)
     799:	00 00                	add    %al,(%eax)
     79b:	00 44 00 1f          	add    %al,0x1f(%eax,%eax,1)
     79f:	00 20                	add    %ah,(%eax)
     7a1:	00 00                	add    %al,(%eax)
     7a3:	00 49 02             	add    %cl,0x2(%ecx)
     7a6:	00 00                	add    %al,(%eax)
     7a8:	84 00                	test   %al,(%eax)
     7aa:	00 00                	add    %al,(%eax)
     7ac:	0f 05                	syscall 
     7ae:	28 00                	sub    %al,(%eax)
     7b0:	00 00                	add    %al,(%eax)
     7b2:	00 00                	add    %al,(%eax)
     7b4:	44                   	inc    %esp
     7b5:	00 6b 00             	add    %ch,0x0(%ebx)
     7b8:	25 00 00 00 19       	and    $0x19000000,%eax
     7bd:	04 00                	add    $0x0,%al
     7bf:	00 84 00 00 00 10 05 	add    %al,0x5100000(%eax,%eax,1)
     7c6:	28 00                	sub    %al,(%eax)
     7c8:	00 00                	add    %al,(%eax)
     7ca:	00 00                	add    %al,(%eax)
     7cc:	44                   	inc    %esp
     7cd:	00 20                	add    %ah,(%eax)
     7cf:	00 26                	add    %ah,(%esi)
     7d1:	00 00                	add    %al,(%eax)
     7d3:	00 49 02             	add    %cl,0x2(%ecx)
     7d6:	00 00                	add    %al,(%eax)
     7d8:	84 00                	test   %al,(%eax)
     7da:	00 00                	add    %al,(%eax)
     7dc:	16                   	push   %ss
     7dd:	05 28 00 00 00       	add    $0x28,%eax
     7e2:	00 00                	add    %al,(%eax)
     7e4:	44                   	inc    %esp
     7e5:	00 6b 00             	add    %ch,0x0(%ebx)
     7e8:	2c 00                	sub    $0x0,%al
     7ea:	00 00                	add    %al,(%eax)
     7ec:	19 04 00             	sbb    %eax,(%eax,%eax,1)
     7ef:	00 84 00 00 00 17 05 	add    %al,0x5170000(%eax,%eax,1)
     7f6:	28 00                	sub    %al,(%eax)
     7f8:	00 00                	add    %al,(%eax)
     7fa:	00 00                	add    %al,(%eax)
     7fc:	44                   	inc    %esp
     7fd:	00 21                	add    %ah,(%ecx)
     7ff:	00 2d 00 00 00 49    	add    %ch,0x49000000
     805:	02 00                	add    (%eax),%al
     807:	00 84 00 00 00 1d 05 	add    %al,0x51d0000(%eax,%eax,1)
     80e:	28 00                	sub    %al,(%eax)
     810:	00 00                	add    %al,(%eax)
     812:	00 00                	add    %al,(%eax)
     814:	44                   	inc    %esp
     815:	00 6b 00             	add    %ch,0x0(%ebx)
     818:	33 00                	xor    (%eax),%eax
     81a:	00 00                	add    %al,(%eax)
     81c:	19 04 00             	sbb    %eax,(%eax,%eax,1)
     81f:	00 84 00 00 00 1e 05 	add    %al,0x51e0000(%eax,%eax,1)
     826:	28 00                	sub    %al,(%eax)
     828:	00 00                	add    %al,(%eax)
     82a:	00 00                	add    %al,(%eax)
     82c:	44                   	inc    %esp
     82d:	00 22                	add    %ah,(%edx)
     82f:	00 34 00             	add    %dh,(%eax,%eax,1)
     832:	00 00                	add    %al,(%eax)
     834:	00 00                	add    %al,(%eax)
     836:	00 00                	add    %al,(%eax)
     838:	44                   	inc    %esp
     839:	00 1e                	add    %bl,(%esi)
     83b:	00 37                	add    %dh,(%edi)
     83d:	00 00                	add    %al,(%eax)
     83f:	00 49 02             	add    %cl,0x2(%ecx)
     842:	00 00                	add    %al,(%eax)
     844:	84 00                	test   %al,(%eax)
     846:	00 00                	add    %al,(%eax)
     848:	24 05                	and    $0x5,%al
     84a:	28 00                	sub    %al,(%eax)
     84c:	00 00                	add    %al,(%eax)
     84e:	00 00                	add    %al,(%eax)
     850:	44                   	inc    %esp
     851:	00 47 01             	add    %al,0x1(%edi)
     854:	3a 00                	cmp    (%eax),%al
     856:	00 00                	add    %al,(%eax)
     858:	19 04 00             	sbb    %eax,(%eax,%eax,1)
     85b:	00 84 00 00 00 26 05 	add    %al,0x5260000(%eax,%eax,1)
     862:	28 00                	sub    %al,(%eax)
     864:	00 00                	add    %al,(%eax)
     866:	00 00                	add    %al,(%eax)
     868:	44                   	inc    %esp
     869:	00 26                	add    %ah,(%esi)
     86b:	00 3c 00             	add    %bh,(%eax,%eax,1)
     86e:	00 00                	add    %al,(%eax)
     870:	8d 04 00             	lea    (%eax,%eax,1),%eax
     873:	00 40 00             	add    %al,0x0(%eax)
     876:	00 00                	add    %al,(%eax)
     878:	03 00                	add    (%eax),%eax
     87a:	00 00                	add    %al,(%eax)
     87c:	24 05                	and    $0x5,%al
     87e:	00 00                	add    %al,(%eax)
     880:	40                   	inc    %eax
     881:	00 00                	add    %al,(%eax)
     883:	00 03                	add    %al,(%ebx)
     885:	00 00                	add    %al,(%eax)
     887:	00 31                	add    %dh,(%ecx)
     889:	05 00 00 40 00       	add    $0x400000,%eax
     88e:	00 00                	add    %al,(%eax)
     890:	01 00                	add    %eax,(%eax)
     892:	00 00                	add    %al,(%eax)
     894:	00 00                	add    %al,(%eax)
     896:	00 00                	add    %al,(%eax)
     898:	c0 00 00             	rolb   $0x0,(%eax)
     89b:	00 00                	add    %al,(%eax)
     89d:	00 00                	add    %al,(%eax)
     89f:	00 3c 05 00 00 80 00 	add    %bh,0x800000(,%eax,1)
     8a6:	00 00                	add    %al,(%eax)
     8a8:	00 00                	add    %al,(%eax)
     8aa:	00 00                	add    %al,(%eax)
     8ac:	67 05 00 00 80 00    	addr16 add $0x800000,%eax
	...
     8ba:	00 00                	add    %al,(%eax)
     8bc:	e0 00                	loopne 8be <bootmain-0x27f742>
     8be:	00 00                	add    %al,(%eax)
     8c0:	40                   	inc    %eax
     8c1:	00 00                	add    %al,(%eax)
     8c3:	00 7b 05             	add    %bh,0x5(%ebx)
     8c6:	00 00                	add    %al,(%eax)
     8c8:	24 00                	and    $0x0,%al
     8ca:	00 00                	add    %al,(%eax)
     8cc:	2a 05 28 00 00 00    	sub    0x28,%al
     8d2:	00 00                	add    %al,(%eax)
     8d4:	44                   	inc    %esp
     8d5:	00 29                	add    %ch,(%ecx)
	...
     8df:	00 44 00 41          	add    %al,0x41(%eax,%eax,1)
     8e3:	00 10                	add    %dl,(%eax)
     8e5:	00 00                	add    %al,(%eax)
     8e7:	00 00                	add    %al,(%eax)
     8e9:	00 00                	add    %al,(%eax)
     8eb:	00 44 00 42          	add    %al,0x42(%eax,%eax,1)
     8ef:	00 20                	add    %ah,(%eax)
     8f1:	00 00                	add    %al,(%eax)
     8f3:	00 00                	add    %al,(%eax)
     8f5:	00 00                	add    %al,(%eax)
     8f7:	00 44 00 43          	add    %al,0x43(%eax,%eax,1)
     8fb:	00 23                	add    %ah,(%ebx)
     8fd:	00 00                	add    %al,(%eax)
     8ff:	00 8f 05 00 00 26    	add    %cl,0x26000005(%edi)
     905:	00 00                	add    %al,(%eax)
     907:	00 a0 32 28 00 00    	add    %ah,0x2832(%eax)
     90d:	00 00                	add    %al,(%eax)
     90f:	00 c0                	add    %al,%al
	...
     919:	00 00                	add    %al,(%eax)
     91b:	00 e0                	add    %ah,%al
     91d:	00 00                	add    %al,(%eax)
     91f:	00 25 00 00 00 c8    	add    %ah,0xc8000000
     925:	05 00 00 24 00       	add    $0x240000,%eax
     92a:	00 00                	add    %al,(%eax)
     92c:	4f                   	dec    %edi
     92d:	05 28 00 d8 05       	add    $0x5d80028,%eax
     932:	00 00                	add    %al,(%eax)
     934:	a0 00 00 00 08       	mov    0x8000000,%al
     939:	00 00                	add    %al,(%eax)
     93b:	00 ec                	add    %ch,%ah
     93d:	05 00 00 a0 00       	add    $0xa00000,%eax
     942:	00 00                	add    %al,(%eax)
     944:	0c 00                	or     $0x0,%al
     946:	00 00                	add    %al,(%eax)
     948:	f9                   	stc    
     949:	05 00 00 a0 00       	add    $0xa00000,%eax
     94e:	00 00                	add    %al,(%eax)
     950:	10 00                	adc    %al,(%eax)
     952:	00 00                	add    %al,(%eax)
     954:	02 06                	add    (%esi),%al
     956:	00 00                	add    %al,(%eax)
     958:	a0 00 00 00 14       	mov    0x14000000,%al
     95d:	00 00                	add    %al,(%eax)
     95f:	00 0c 06             	add    %cl,(%esi,%eax,1)
     962:	00 00                	add    %al,(%eax)
     964:	a0 00 00 00 18       	mov    0x18000000,%al
     969:	00 00                	add    %al,(%eax)
     96b:	00 16                	add    %dl,(%esi)
     96d:	06                   	push   %es
     96e:	00 00                	add    %al,(%eax)
     970:	a0 00 00 00 1c       	mov    0x1c000000,%al
     975:	00 00                	add    %al,(%eax)
     977:	00 20                	add    %ah,(%eax)
     979:	06                   	push   %es
     97a:	00 00                	add    %al,(%eax)
     97c:	a0 00 00 00 20       	mov    0x20000000,%al
     981:	00 00                	add    %al,(%eax)
     983:	00 00                	add    %al,(%eax)
     985:	00 00                	add    %al,(%eax)
     987:	00 44 00 45          	add    %al,0x45(%eax,%eax,1)
	...
     993:	00 44 00 45          	add    %al,0x45(%eax,%eax,1)
     997:	00 0c 00             	add    %cl,(%eax,%eax,1)
     99a:	00 00                	add    %al,(%eax)
     99c:	00 00                	add    %al,(%eax)
     99e:	00 00                	add    %al,(%eax)
     9a0:	44                   	inc    %esp
     9a1:	00 47 00             	add    %al,0x0(%edi)
     9a4:	14 00                	adc    $0x0,%al
     9a6:	00 00                	add    %al,(%eax)
     9a8:	00 00                	add    %al,(%eax)
     9aa:	00 00                	add    %al,(%eax)
     9ac:	44                   	inc    %esp
     9ad:	00 49 00             	add    %cl,0x0(%ecx)
     9b0:	19 00                	sbb    %eax,(%eax)
     9b2:	00 00                	add    %al,(%eax)
     9b4:	00 00                	add    %al,(%eax)
     9b6:	00 00                	add    %al,(%eax)
     9b8:	44                   	inc    %esp
     9b9:	00 48 00             	add    %cl,0x0(%eax)
     9bc:	1c 00                	sbb    $0x0,%al
     9be:	00 00                	add    %al,(%eax)
     9c0:	00 00                	add    %al,(%eax)
     9c2:	00 00                	add    %al,(%eax)
     9c4:	44                   	inc    %esp
     9c5:	00 49 00             	add    %cl,0x0(%ecx)
     9c8:	1f                   	pop    %ds
     9c9:	00 00                	add    %al,(%eax)
     9cb:	00 00                	add    %al,(%eax)
     9cd:	00 00                	add    %al,(%eax)
     9cf:	00 44 00 48          	add    %al,0x48(%eax,%eax,1)
     9d3:	00 21                	add    %ah,(%ecx)
     9d5:	00 00                	add    %al,(%eax)
     9d7:	00 00                	add    %al,(%eax)
     9d9:	00 00                	add    %al,(%eax)
     9db:	00 44 00 49          	add    %al,0x49(%eax,%eax,1)
     9df:	00 26                	add    %ah,(%esi)
     9e1:	00 00                	add    %al,(%eax)
     9e3:	00 00                	add    %al,(%eax)
     9e5:	00 00                	add    %al,(%eax)
     9e7:	00 44 00 48          	add    %al,0x48(%eax,%eax,1)
     9eb:	00 29                	add    %ch,(%ecx)
     9ed:	00 00                	add    %al,(%eax)
     9ef:	00 00                	add    %al,(%eax)
     9f1:	00 00                	add    %al,(%eax)
     9f3:	00 44 00 47          	add    %al,0x47(%eax,%eax,1)
     9f7:	00 2c 00             	add    %ch,(%eax,%eax,1)
     9fa:	00 00                	add    %al,(%eax)
     9fc:	00 00                	add    %al,(%eax)
     9fe:	00 00                	add    %al,(%eax)
     a00:	44                   	inc    %esp
     a01:	00 4d 00             	add    %cl,0x0(%ebp)
     a04:	31 00                	xor    %eax,(%eax)
     a06:	00 00                	add    %al,(%eax)
     a08:	2a 06                	sub    (%esi),%al
     a0a:	00 00                	add    %al,(%eax)
     a0c:	40                   	inc    %eax
     a0d:	00 00                	add    %al,(%eax)
     a0f:	00 02                	add    %al,(%edx)
     a11:	00 00                	add    %al,(%eax)
     a13:	00 33                	add    %dh,(%ebx)
     a15:	06                   	push   %es
     a16:	00 00                	add    %al,(%eax)
     a18:	40                   	inc    %eax
     a19:	00 00                	add    %al,(%eax)
     a1b:	00 00                	add    %al,(%eax)
     a1d:	00 00                	add    %al,(%eax)
     a1f:	00 3c 06             	add    %bh,(%esi,%eax,1)
     a22:	00 00                	add    %al,(%eax)
     a24:	40                   	inc    %eax
     a25:	00 00                	add    %al,(%eax)
     a27:	00 07                	add    %al,(%edi)
     a29:	00 00                	add    %al,(%eax)
     a2b:	00 49 06             	add    %cl,0x6(%ecx)
     a2e:	00 00                	add    %al,(%eax)
     a30:	40                   	inc    %eax
     a31:	00 00                	add    %al,(%eax)
     a33:	00 03                	add    %al,(%ebx)
     a35:	00 00                	add    %al,(%eax)
     a37:	00 52 06             	add    %dl,0x6(%edx)
     a3a:	00 00                	add    %al,(%eax)
     a3c:	40                   	inc    %eax
	...
     a45:	00 00                	add    %al,(%eax)
     a47:	00 c0                	add    %al,%al
	...
     a51:	00 00                	add    %al,(%eax)
     a53:	00 e0                	add    %ah,%al
     a55:	00 00                	add    %al,(%eax)
     a57:	00 36                	add    %dh,(%esi)
     a59:	00 00                	add    %al,(%eax)
     a5b:	00 5c 06 00          	add    %bl,0x0(%esi,%eax,1)
     a5f:	00 24 00             	add    %ah,(%eax,%eax,1)
     a62:	00 00                	add    %al,(%eax)
     a64:	85 05 28 00 70 06    	test   %eax,0x6700028
     a6a:	00 00                	add    %al,(%eax)
     a6c:	a0 00 00 00 08       	mov    0x8000000,%al
     a71:	00 00                	add    %al,(%eax)
     a73:	00 7d 06             	add    %bh,0x6(%ebp)
     a76:	00 00                	add    %al,(%eax)
     a78:	a0 00 00 00 0c       	mov    0xc000000,%al
     a7d:	00 00                	add    %al,(%eax)
     a7f:	00 86 06 00 00 a0    	add    %al,-0x5ffffffa(%esi)
     a85:	00 00                	add    %al,(%eax)
     a87:	00 10                	add    %dl,(%eax)
     a89:	00 00                	add    %al,(%eax)
     a8b:	00 00                	add    %al,(%eax)
     a8d:	00 00                	add    %al,(%eax)
     a8f:	00 44 00 57          	add    %al,0x57(%eax,%eax,1)
	...
     a9b:	00 44 00 57          	add    %al,0x57(%eax,%eax,1)
     a9f:	00 09                	add    %cl,(%ecx)
     aa1:	00 00                	add    %al,(%eax)
     aa3:	00 00                	add    %al,(%eax)
     aa5:	00 00                	add    %al,(%eax)
     aa7:	00 44 00 58          	add    %al,0x58(%eax,%eax,1)
     aab:	00 0f                	add    %cl,(%edi)
     aad:	00 00                	add    %al,(%eax)
     aaf:	00 00                	add    %al,(%eax)
     ab1:	00 00                	add    %al,(%eax)
     ab3:	00 44 00 59          	add    %al,0x59(%eax,%eax,1)
     ab7:	00 26                	add    %ah,(%esi)
     ab9:	00 00                	add    %al,(%eax)
     abb:	00 00                	add    %al,(%eax)
     abd:	00 00                	add    %al,(%eax)
     abf:	00 44 00 5a          	add    %al,0x5a(%eax,%eax,1)
     ac3:	00 3c 00             	add    %bh,(%eax,%eax,1)
     ac6:	00 00                	add    %al,(%eax)
     ac8:	00 00                	add    %al,(%eax)
     aca:	00 00                	add    %al,(%eax)
     acc:	44                   	inc    %esp
     acd:	00 5b 00             	add    %bl,0x0(%ebx)
     ad0:	52                   	push   %edx
     ad1:	00 00                	add    %al,(%eax)
     ad3:	00 00                	add    %al,(%eax)
     ad5:	00 00                	add    %al,(%eax)
     ad7:	00 44 00 5d          	add    %al,0x5d(%eax,%eax,1)
     adb:	00 5d 00             	add    %bl,0x0(%ebp)
     ade:	00 00                	add    %al,(%eax)
     ae0:	00 00                	add    %al,(%eax)
     ae2:	00 00                	add    %al,(%eax)
     ae4:	44                   	inc    %esp
     ae5:	00 5b 00             	add    %bl,0x0(%ebx)
     ae8:	60                   	pusha  
     ae9:	00 00                	add    %al,(%eax)
     aeb:	00 00                	add    %al,(%eax)
     aed:	00 00                	add    %al,(%eax)
     aef:	00 44 00 5d          	add    %al,0x5d(%eax,%eax,1)
     af3:	00 6e 00             	add    %ch,0x0(%esi)
     af6:	00 00                	add    %al,(%eax)
     af8:	00 00                	add    %al,(%eax)
     afa:	00 00                	add    %al,(%eax)
     afc:	44                   	inc    %esp
     afd:	00 5e 00             	add    %bl,0x0(%esi)
     b00:	82 00 00             	addb   $0x0,(%eax)
     b03:	00 00                	add    %al,(%eax)
     b05:	00 00                	add    %al,(%eax)
     b07:	00 44 00 5f          	add    %al,0x5f(%eax,%eax,1)
     b0b:	00 9c 00 00 00 00 00 	add    %bl,0x0(%eax,%eax,1)
     b12:	00 00                	add    %al,(%eax)
     b14:	44                   	inc    %esp
     b15:	00 60 00             	add    %ah,0x0(%eax)
     b18:	b6 00                	mov    $0x0,%dh
     b1a:	00 00                	add    %al,(%eax)
     b1c:	00 00                	add    %al,(%eax)
     b1e:	00 00                	add    %al,(%eax)
     b20:	44                   	inc    %esp
     b21:	00 61 00             	add    %ah,0x0(%ecx)
     b24:	c2 00 00             	ret    $0x0
     b27:	00 00                	add    %al,(%eax)
     b29:	00 00                	add    %al,(%eax)
     b2b:	00 44 00 60          	add    %al,0x60(%eax,%eax,1)
     b2f:	00 c5                	add    %al,%ch
     b31:	00 00                	add    %al,(%eax)
     b33:	00 00                	add    %al,(%eax)
     b35:	00 00                	add    %al,(%eax)
     b37:	00 44 00 61          	add    %al,0x61(%eax,%eax,1)
     b3b:	00 d8                	add    %bl,%al
     b3d:	00 00                	add    %al,(%eax)
     b3f:	00 00                	add    %al,(%eax)
     b41:	00 00                	add    %al,(%eax)
     b43:	00 44 00 62          	add    %al,0x62(%eax,%eax,1)
     b47:	00 ec                	add    %ch,%ah
     b49:	00 00                	add    %al,(%eax)
     b4b:	00 00                	add    %al,(%eax)
     b4d:	00 00                	add    %al,(%eax)
     b4f:	00 44 00 64          	add    %al,0x64(%eax,%eax,1)
     b53:	00 00                	add    %al,(%eax)
     b55:	01 00                	add    %eax,(%eax)
     b57:	00 00                	add    %al,(%eax)
     b59:	00 00                	add    %al,(%eax)
     b5b:	00 44 00 65          	add    %al,0x65(%eax,%eax,1)
     b5f:	00 1e                	add    %bl,(%esi)
     b61:	01 00                	add    %eax,(%eax)
     b63:	00 00                	add    %al,(%eax)
     b65:	00 00                	add    %al,(%eax)
     b67:	00 44 00 66          	add    %al,0x66(%eax,%eax,1)
     b6b:	00 3b                	add    %bh,(%ebx)
     b6d:	01 00                	add    %eax,(%eax)
     b6f:	00 00                	add    %al,(%eax)
     b71:	00 00                	add    %al,(%eax)
     b73:	00 44 00 67          	add    %al,0x67(%eax,%eax,1)
     b77:	00 53 01             	add    %dl,0x1(%ebx)
     b7a:	00 00                	add    %al,(%eax)
     b7c:	00 00                	add    %al,(%eax)
     b7e:	00 00                	add    %al,(%eax)
     b80:	44                   	inc    %esp
     b81:	00 68 00             	add    %ch,0x0(%eax)
     b84:	68 01 00 00 00       	push   $0x1
     b89:	00 00                	add    %al,(%eax)
     b8b:	00 44 00 69          	add    %al,0x69(%eax,%eax,1)
     b8f:	00 6b 01             	add    %ch,0x1(%ebx)
     b92:	00 00                	add    %al,(%eax)
     b94:	2a 06                	sub    (%esi),%al
     b96:	00 00                	add    %al,(%eax)
     b98:	40                   	inc    %eax
     b99:	00 00                	add    %al,(%eax)
     b9b:	00 03                	add    %al,(%ebx)
     b9d:	00 00                	add    %al,(%eax)
     b9f:	00 33                	add    %dh,(%ebx)
     ba1:	06                   	push   %es
     ba2:	00 00                	add    %al,(%eax)
     ba4:	40                   	inc    %eax
     ba5:	00 00                	add    %al,(%eax)
     ba7:	00 06                	add    %al,(%esi)
     ba9:	00 00                	add    %al,(%eax)
     bab:	00 8f 06 00 00 24    	add    %cl,0x24000006(%edi)
     bb1:	00 00                	add    %al,(%eax)
     bb3:	00 f8                	add    %bh,%al
     bb5:	06                   	push   %es
     bb6:	28 00                	sub    %al,(%eax)
     bb8:	70 06                	jo     bc0 <bootmain-0x27f440>
     bba:	00 00                	add    %al,(%eax)
     bbc:	a0 00 00 00 08       	mov    0x8000000,%al
     bc1:	00 00                	add    %al,(%eax)
     bc3:	00 ec                	add    %ch,%ah
     bc5:	05 00 00 a0 00       	add    $0xa00000,%eax
     bca:	00 00                	add    %al,(%eax)
     bcc:	0c 00                	or     $0x0,%al
     bce:	00 00                	add    %al,(%eax)
     bd0:	7d 06                	jge    bd8 <bootmain-0x27f428>
     bd2:	00 00                	add    %al,(%eax)
     bd4:	a0 00 00 00 10       	mov    0x10000000,%al
     bd9:	00 00                	add    %al,(%eax)
     bdb:	00 86 06 00 00 a0    	add    %al,-0x5ffffffa(%esi)
     be1:	00 00                	add    %al,(%eax)
     be3:	00 14 00             	add    %dl,(%eax,%eax,1)
     be6:	00 00                	add    %al,(%eax)
     be8:	f9                   	stc    
     be9:	05 00 00 a0 00       	add    $0xa00000,%eax
     bee:	00 00                	add    %al,(%eax)
     bf0:	18 00                	sbb    %al,(%eax)
     bf2:	00 00                	add    %al,(%eax)
     bf4:	9f                   	lahf   
     bf5:	06                   	push   %es
     bf6:	00 00                	add    %al,(%eax)
     bf8:	a0 00 00 00 1c       	mov    0x1c000000,%al
     bfd:	00 00                	add    %al,(%eax)
     bff:	00 00                	add    %al,(%eax)
     c01:	00 00                	add    %al,(%eax)
     c03:	00 44 00 6c          	add    %al,0x6c(%eax,%eax,1)
	...
     c0f:	00 44 00 6f          	add    %al,0x6f(%eax,%eax,1)
     c13:	00 04 00             	add    %al,(%eax,%eax,1)
     c16:	00 00                	add    %al,(%eax)
     c18:	00 00                	add    %al,(%eax)
     c1a:	00 00                	add    %al,(%eax)
     c1c:	44                   	inc    %esp
     c1d:	00 6c 00 06          	add    %ch,0x6(%eax,%eax,1)
     c21:	00 00                	add    %al,(%eax)
     c23:	00 00                	add    %al,(%eax)
     c25:	00 00                	add    %al,(%eax)
     c27:	00 44 00 6c          	add    %al,0x6c(%eax,%eax,1)
     c2b:	00 0d 00 00 00 00    	add    %cl,0x0
     c31:	00 00                	add    %al,(%eax)
     c33:	00 44 00 71          	add    %al,0x71(%eax,%eax,1)
     c37:	00 19                	add    %bl,(%ecx)
     c39:	00 00                	add    %al,(%eax)
     c3b:	00 00                	add    %al,(%eax)
     c3d:	00 00                	add    %al,(%eax)
     c3f:	00 44 00 72          	add    %al,0x72(%eax,%eax,1)
     c43:	00 1f                	add    %bl,(%edi)
     c45:	00 00                	add    %al,(%eax)
     c47:	00 00                	add    %al,(%eax)
     c49:	00 00                	add    %al,(%eax)
     c4b:	00 44 00 72          	add    %al,0x72(%eax,%eax,1)
     c4f:	00 23                	add    %ah,(%ebx)
     c51:	00 00                	add    %al,(%eax)
     c53:	00 00                	add    %al,(%eax)
     c55:	00 00                	add    %al,(%eax)
     c57:	00 44 00 73          	add    %al,0x73(%eax,%eax,1)
     c5b:	00 25 00 00 00 00    	add    %ah,0x0
     c61:	00 00                	add    %al,(%eax)
     c63:	00 44 00 73          	add    %al,0x73(%eax,%eax,1)
     c67:	00 2a                	add    %ch,(%edx)
     c69:	00 00                	add    %al,(%eax)
     c6b:	00 00                	add    %al,(%eax)
     c6d:	00 00                	add    %al,(%eax)
     c6f:	00 44 00 74          	add    %al,0x74(%eax,%eax,1)
     c73:	00 2d 00 00 00 00    	add    %ch,0x0
     c79:	00 00                	add    %al,(%eax)
     c7b:	00 44 00 74          	add    %al,0x74(%eax,%eax,1)
     c7f:	00 32                	add    %dh,(%edx)
     c81:	00 00                	add    %al,(%eax)
     c83:	00 00                	add    %al,(%eax)
     c85:	00 00                	add    %al,(%eax)
     c87:	00 44 00 75          	add    %al,0x75(%eax,%eax,1)
     c8b:	00 35 00 00 00 00    	add    %dh,0x0
     c91:	00 00                	add    %al,(%eax)
     c93:	00 44 00 75          	add    %al,0x75(%eax,%eax,1)
     c97:	00 3a                	add    %bh,(%edx)
     c99:	00 00                	add    %al,(%eax)
     c9b:	00 00                	add    %al,(%eax)
     c9d:	00 00                	add    %al,(%eax)
     c9f:	00 44 00 76          	add    %al,0x76(%eax,%eax,1)
     ca3:	00 3d 00 00 00 00    	add    %bh,0x0
     ca9:	00 00                	add    %al,(%eax)
     cab:	00 44 00 76          	add    %al,0x76(%eax,%eax,1)
     caf:	00 42 00             	add    %al,0x0(%edx)
     cb2:	00 00                	add    %al,(%eax)
     cb4:	00 00                	add    %al,(%eax)
     cb6:	00 00                	add    %al,(%eax)
     cb8:	44                   	inc    %esp
     cb9:	00 77 00             	add    %dh,0x0(%edi)
     cbc:	45                   	inc    %ebp
     cbd:	00 00                	add    %al,(%eax)
     cbf:	00 00                	add    %al,(%eax)
     cc1:	00 00                	add    %al,(%eax)
     cc3:	00 44 00 77          	add    %al,0x77(%eax,%eax,1)
     cc7:	00 4a 00             	add    %cl,0x0(%edx)
     cca:	00 00                	add    %al,(%eax)
     ccc:	00 00                	add    %al,(%eax)
     cce:	00 00                	add    %al,(%eax)
     cd0:	44                   	inc    %esp
     cd1:	00 78 00             	add    %bh,0x0(%eax)
     cd4:	4d                   	dec    %ebp
     cd5:	00 00                	add    %al,(%eax)
     cd7:	00 00                	add    %al,(%eax)
     cd9:	00 00                	add    %al,(%eax)
     cdb:	00 44 00 78          	add    %al,0x78(%eax,%eax,1)
     cdf:	00 52 00             	add    %dl,0x0(%edx)
     ce2:	00 00                	add    %al,(%eax)
     ce4:	00 00                	add    %al,(%eax)
     ce6:	00 00                	add    %al,(%eax)
     ce8:	44                   	inc    %esp
     ce9:	00 79 00             	add    %bh,0x0(%ecx)
     cec:	55                   	push   %ebp
     ced:	00 00                	add    %al,(%eax)
     cef:	00 00                	add    %al,(%eax)
     cf1:	00 00                	add    %al,(%eax)
     cf3:	00 44 00 79          	add    %al,0x79(%eax,%eax,1)
     cf7:	00 5a 00             	add    %bl,0x0(%edx)
     cfa:	00 00                	add    %al,(%eax)
     cfc:	00 00                	add    %al,(%eax)
     cfe:	00 00                	add    %al,(%eax)
     d00:	44                   	inc    %esp
     d01:	00 6f 00             	add    %ch,0x0(%edi)
     d04:	5d                   	pop    %ebp
     d05:	00 00                	add    %al,(%eax)
     d07:	00 00                	add    %al,(%eax)
     d09:	00 00                	add    %al,(%eax)
     d0b:	00 44 00 6f          	add    %al,0x6f(%eax,%eax,1)
     d0f:	00 5e 00             	add    %bl,0x0(%esi)
     d12:	00 00                	add    %al,(%eax)
     d14:	00 00                	add    %al,(%eax)
     d16:	00 00                	add    %al,(%eax)
     d18:	44                   	inc    %esp
     d19:	00 7c 00 65          	add    %bh,0x65(%eax,%eax,1)
     d1d:	00 00                	add    %al,(%eax)
     d1f:	00 8d 04 00 00 40    	add    %cl,0x40000004(%ebp)
     d25:	00 00                	add    %al,(%eax)
     d27:	00 06                	add    %al,(%esi)
     d29:	00 00                	add    %al,(%eax)
     d2b:	00 ac 06 00 00 40 00 	add    %ch,0x400000(%esi,%eax,1)
     d32:	00 00                	add    %al,(%eax)
     d34:	03 00                	add    (%eax),%eax
     d36:	00 00                	add    %al,(%eax)
     d38:	3c 06                	cmp    $0x6,%al
     d3a:	00 00                	add    %al,(%eax)
     d3c:	40                   	inc    %eax
     d3d:	00 00                	add    %al,(%eax)
     d3f:	00 01                	add    %al,(%ecx)
     d41:	00 00                	add    %al,(%eax)
     d43:	00 b5 06 00 00 40    	add    %dh,0x40000006(%ebp)
     d49:	00 00                	add    %al,(%eax)
     d4b:	00 02                	add    %al,(%edx)
     d4d:	00 00                	add    %al,(%eax)
     d4f:	00 00                	add    %al,(%eax)
     d51:	00 00                	add    %al,(%eax)
     d53:	00 c0                	add    %al,%al
	...
     d5d:	00 00                	add    %al,(%eax)
     d5f:	00 e0                	add    %ah,%al
     d61:	00 00                	add    %al,(%eax)
     d63:	00 69 00             	add    %ch,0x0(%ecx)
     d66:	00 00                	add    %al,(%eax)
     d68:	be 06 00 00 24       	mov    $0x24000006,%esi
     d6d:	00 00                	add    %al,(%eax)
     d6f:	00 61 07             	add    %ah,0x7(%ecx)
     d72:	28 00                	sub    %al,(%eax)
     d74:	70 06                	jo     d7c <bootmain-0x27f284>
     d76:	00 00                	add    %al,(%eax)
     d78:	a0 00 00 00 08       	mov    0x8000000,%al
     d7d:	00 00                	add    %al,(%eax)
     d7f:	00 ec                	add    %ch,%ah
     d81:	05 00 00 a0 00       	add    $0xa00000,%eax
     d86:	00 00                	add    %al,(%eax)
     d88:	0c 00                	or     $0x0,%al
     d8a:	00 00                	add    %al,(%eax)
     d8c:	7d 06                	jge    d94 <bootmain-0x27f26c>
     d8e:	00 00                	add    %al,(%eax)
     d90:	a0 00 00 00 10       	mov    0x10000000,%al
     d95:	00 00                	add    %al,(%eax)
     d97:	00 86 06 00 00 a0    	add    %al,-0x5ffffffa(%esi)
     d9d:	00 00                	add    %al,(%eax)
     d9f:	00 14 00             	add    %dl,(%eax,%eax,1)
     da2:	00 00                	add    %al,(%eax)
     da4:	f9                   	stc    
     da5:	05 00 00 a0 00       	add    $0xa00000,%eax
     daa:	00 00                	add    %al,(%eax)
     dac:	18 00                	sbb    %al,(%eax)
     dae:	00 00                	add    %al,(%eax)
     db0:	d3 06                	roll   %cl,(%esi)
     db2:	00 00                	add    %al,(%eax)
     db4:	a0 00 00 00 1c       	mov    0x1c000000,%al
     db9:	00 00                	add    %al,(%eax)
     dbb:	00 00                	add    %al,(%eax)
     dbd:	00 00                	add    %al,(%eax)
     dbf:	00 44 00 7e          	add    %al,0x7e(%eax,%eax,1)
	...
     dcb:	00 44 00 7e          	add    %al,0x7e(%eax,%eax,1)
     dcf:	00 13                	add    %dl,(%ebx)
     dd1:	00 00                	add    %al,(%eax)
     dd3:	00 00                	add    %al,(%eax)
     dd5:	00 00                	add    %al,(%eax)
     dd7:	00 44 00 82          	add    %al,-0x7e(%eax,%eax,1)
     ddb:	00 16                	add    %dl,(%esi)
     ddd:	00 00                	add    %al,(%eax)
     ddf:	00 00                	add    %al,(%eax)
     de1:	00 00                	add    %al,(%eax)
     de3:	00 44 00 81          	add    %al,-0x7f(%eax,%eax,1)
     de7:	00 20                	add    %ah,(%eax)
     de9:	00 00                	add    %al,(%eax)
     deb:	00 00                	add    %al,(%eax)
     ded:	00 00                	add    %al,(%eax)
     def:	00 44 00 81          	add    %al,-0x7f(%eax,%eax,1)
     df3:	00 26                	add    %ah,(%esi)
     df5:	00 00                	add    %al,(%eax)
     df7:	00 00                	add    %al,(%eax)
     df9:	00 00                	add    %al,(%eax)
     dfb:	00 44 00 82          	add    %al,-0x7e(%eax,%eax,1)
     dff:	00 2a                	add    %ch,(%edx)
     e01:	00 00                	add    %al,(%eax)
     e03:	00 00                	add    %al,(%eax)
     e05:	00 00                	add    %al,(%eax)
     e07:	00 44 00 82          	add    %al,-0x7e(%eax,%eax,1)
     e0b:	00 2d 00 00 00 00    	add    %ch,0x0
     e11:	00 00                	add    %al,(%eax)
     e13:	00 44 00 83          	add    %al,-0x7d(%eax,%eax,1)
     e17:	00 37                	add    %dh,(%edi)
     e19:	00 00                	add    %al,(%eax)
     e1b:	00 00                	add    %al,(%eax)
     e1d:	00 00                	add    %al,(%eax)
     e1f:	00 44 00 82          	add    %al,-0x7e(%eax,%eax,1)
     e23:	00 3a                	add    %bh,(%edx)
     e25:	00 00                	add    %al,(%eax)
     e27:	00 00                	add    %al,(%eax)
     e29:	00 00                	add    %al,(%eax)
     e2b:	00 44 00 81          	add    %al,-0x7f(%eax,%eax,1)
     e2f:	00 45 00             	add    %al,0x0(%ebp)
     e32:	00 00                	add    %al,(%eax)
     e34:	00 00                	add    %al,(%eax)
     e36:	00 00                	add    %al,(%eax)
     e38:	44                   	inc    %esp
     e39:	00 86 00 4d 00 00    	add    %al,0x4d00(%esi)
     e3f:	00 2a                	add    %ch,(%edx)
     e41:	06                   	push   %es
     e42:	00 00                	add    %al,(%eax)
     e44:	40                   	inc    %eax
     e45:	00 00                	add    %al,(%eax)
     e47:	00 06                	add    %al,(%esi)
     e49:	00 00                	add    %al,(%eax)
     e4b:	00 dd                	add    %bl,%ch
     e4d:	06                   	push   %es
     e4e:	00 00                	add    %al,(%eax)
     e50:	24 00                	and    $0x0,%al
     e52:	00 00                	add    %al,(%eax)
     e54:	b6 07                	mov    $0x7,%dh
     e56:	28 00                	sub    %al,(%eax)
     e58:	f7 06 00 00 a0 00    	testl  $0xa00000,(%esi)
     e5e:	00 00                	add    %al,(%eax)
     e60:	08 00                	or     %al,(%eax)
     e62:	00 00                	add    %al,(%eax)
     e64:	05 07 00 00 a0       	add    $0xa0000007,%eax
     e69:	00 00                	add    %al,(%eax)
     e6b:	00 0c 00             	add    %cl,(%eax,%eax,1)
     e6e:	00 00                	add    %al,(%eax)
     e70:	00 00                	add    %al,(%eax)
     e72:	00 00                	add    %al,(%eax)
     e74:	44                   	inc    %esp
     e75:	00 88 00 00 00 00    	add    %cl,0x0(%eax)
     e7b:	00 00                	add    %al,(%eax)
     e7d:	00 00                	add    %al,(%eax)
     e7f:	00 44 00 88          	add    %al,-0x78(%eax,%eax,1)
     e83:	00 07                	add    %al,(%edi)
     e85:	00 00                	add    %al,(%eax)
     e87:	00 00                	add    %al,(%eax)
     e89:	00 00                	add    %al,(%eax)
     e8b:	00 44 00 a1          	add    %al,-0x5f(%eax,%eax,1)
     e8f:	00 18                	add    %bl,(%eax)
     e91:	00 00                	add    %al,(%eax)
     e93:	00 00                	add    %al,(%eax)
     e95:	00 00                	add    %al,(%eax)
     e97:	00 44 00 a2          	add    %al,-0x5e(%eax,%eax,1)
     e9b:	00 1a                	add    %bl,(%edx)
     e9d:	00 00                	add    %al,(%eax)
     e9f:	00 00                	add    %al,(%eax)
     ea1:	00 00                	add    %al,(%eax)
     ea3:	00 44 00 a1          	add    %al,-0x5f(%eax,%eax,1)
     ea7:	00 23                	add    %ah,(%ebx)
     ea9:	00 00                	add    %al,(%eax)
     eab:	00 00                	add    %al,(%eax)
     ead:	00 00                	add    %al,(%eax)
     eaf:	00 44 00 a2          	add    %al,-0x5e(%eax,%eax,1)
     eb3:	00 25 00 00 00 00    	add    %ah,0x0
     eb9:	00 00                	add    %al,(%eax)
     ebb:	00 44 00 a2          	add    %al,-0x5e(%eax,%eax,1)
     ebf:	00 2d 00 00 00 00    	add    %ch,0x0
     ec5:	00 00                	add    %al,(%eax)
     ec7:	00 44 00 a4          	add    %al,-0x5c(%eax,%eax,1)
     ecb:	00 3c 00             	add    %bh,(%eax,%eax,1)
     ece:	00 00                	add    %al,(%eax)
     ed0:	00 00                	add    %al,(%eax)
     ed2:	00 00                	add    %al,(%eax)
     ed4:	44                   	inc    %esp
     ed5:	00 a4 00 3f 00 00 00 	add    %ah,0x3f(%eax,%eax,1)
     edc:	00 00                	add    %al,(%eax)
     ede:	00 00                	add    %al,(%eax)
     ee0:	44                   	inc    %esp
     ee1:	00 a3 00 41 00 00    	add    %ah,0x4100(%ebx)
     ee7:	00 00                	add    %al,(%eax)
     ee9:	00 00                	add    %al,(%eax)
     eeb:	00 44 00 a3          	add    %al,-0x5d(%eax,%eax,1)
     eef:	00 46 00             	add    %al,0x0(%esi)
     ef2:	00 00                	add    %al,(%eax)
     ef4:	00 00                	add    %al,(%eax)
     ef6:	00 00                	add    %al,(%eax)
     ef8:	44                   	inc    %esp
     ef9:	00 a5 00 48 00 00    	add    %ah,0x4800(%ebp)
     eff:	00 00                	add    %al,(%eax)
     f01:	00 00                	add    %al,(%eax)
     f03:	00 44 00 a1          	add    %al,-0x5f(%eax,%eax,1)
     f07:	00 4b 00             	add    %cl,0x0(%ebx)
     f0a:	00 00                	add    %al,(%eax)
     f0c:	00 00                	add    %al,(%eax)
     f0e:	00 00                	add    %al,(%eax)
     f10:	44                   	inc    %esp
     f11:	00 a1 00 4c 00 00    	add    %ah,0x4c00(%ecx)
     f17:	00 00                	add    %al,(%eax)
     f19:	00 00                	add    %al,(%eax)
     f1b:	00 44 00 a0          	add    %al,-0x60(%eax,%eax,1)
     f1f:	00 52 00             	add    %dl,0x0(%edx)
     f22:	00 00                	add    %al,(%eax)
     f24:	00 00                	add    %al,(%eax)
     f26:	00 00                	add    %al,(%eax)
     f28:	44                   	inc    %esp
     f29:	00 a9 00 5c 00 00    	add    %ch,0x5c00(%ecx)
     f2f:	00 0f                	add    %cl,(%edi)
     f31:	07                   	pop    %es
     f32:	00 00                	add    %al,(%eax)
     f34:	26 00 00             	add    %al,%es:(%eax)
     f37:	00 80 11 28 00 2a    	add    %al,0x2a002811(%eax)
     f3d:	06                   	push   %es
     f3e:	00 00                	add    %al,(%eax)
     f40:	40                   	inc    %eax
     f41:	00 00                	add    %al,(%eax)
     f43:	00 01                	add    %al,(%ecx)
     f45:	00 00                	add    %al,(%eax)
     f47:	00 00                	add    %al,(%eax)
     f49:	00 00                	add    %al,(%eax)
     f4b:	00 c0                	add    %al,%al
	...
     f55:	00 00                	add    %al,(%eax)
     f57:	00 e0                	add    %ah,%al
     f59:	00 00                	add    %al,(%eax)
     f5b:	00 62 00             	add    %ah,0x0(%edx)
     f5e:	00 00                	add    %al,(%eax)
     f60:	45                   	inc    %ebp
     f61:	07                   	pop    %es
     f62:	00 00                	add    %al,(%eax)
     f64:	24 00                	and    $0x0,%al
     f66:	00 00                	add    %al,(%eax)
     f68:	18 08                	sbb    %cl,(%eax)
     f6a:	28 00                	sub    %al,(%eax)
     f6c:	70 06                	jo     f74 <bootmain-0x27f08c>
     f6e:	00 00                	add    %al,(%eax)
     f70:	a0 00 00 00 08       	mov    0x8000000,%al
     f75:	00 00                	add    %al,(%eax)
     f77:	00 ec                	add    %ch,%ah
     f79:	05 00 00 a0 00       	add    $0xa00000,%eax
     f7e:	00 00                	add    %al,(%eax)
     f80:	0c 00                	or     $0x0,%al
     f82:	00 00                	add    %al,(%eax)
     f84:	58                   	pop    %eax
     f85:	07                   	pop    %es
     f86:	00 00                	add    %al,(%eax)
     f88:	a0 00 00 00 10       	mov    0x10000000,%al
     f8d:	00 00                	add    %al,(%eax)
     f8f:	00 66 07             	add    %ah,0x7(%esi)
     f92:	00 00                	add    %al,(%eax)
     f94:	a0 00 00 00 14       	mov    0x14000000,%al
     f99:	00 00                	add    %al,(%eax)
     f9b:	00 74 07 00          	add    %dh,0x0(%edi,%eax,1)
     f9f:	00 a0 00 00 00 18    	add    %ah,0x18000000(%eax)
     fa5:	00 00                	add    %al,(%eax)
     fa7:	00 7f 07             	add    %bh,0x7(%edi)
     faa:	00 00                	add    %al,(%eax)
     fac:	a0 00 00 00 1c       	mov    0x1c000000,%al
     fb1:	00 00                	add    %al,(%eax)
     fb3:	00 8a 07 00 00 a0    	add    %cl,-0x5ffffff9(%edx)
     fb9:	00 00                	add    %al,(%eax)
     fbb:	00 20                	add    %ah,(%eax)
     fbd:	00 00                	add    %al,(%eax)
     fbf:	00 96 07 00 00 a0    	add    %dl,-0x5ffffff9(%esi)
     fc5:	00 00                	add    %al,(%eax)
     fc7:	00 24 00             	add    %ah,(%eax,%eax,1)
     fca:	00 00                	add    %al,(%eax)
     fcc:	00 00                	add    %al,(%eax)
     fce:	00 00                	add    %al,(%eax)
     fd0:	44                   	inc    %esp
     fd1:	00 ab 00 00 00 00    	add    %ch,0x0(%ebx)
     fd7:	00 00                	add    %al,(%eax)
     fd9:	00 00                	add    %al,(%eax)
     fdb:	00 44 00 ae          	add    %al,-0x52(%eax,%eax,1)
     fdf:	00 01                	add    %al,(%ecx)
     fe1:	00 00                	add    %al,(%eax)
     fe3:	00 00                	add    %al,(%eax)
     fe5:	00 00                	add    %al,(%eax)
     fe7:	00 44 00 ab          	add    %al,-0x55(%eax,%eax,1)
     feb:	00 03                	add    %al,(%ebx)
     fed:	00 00                	add    %al,(%eax)
     fef:	00 00                	add    %al,(%eax)
     ff1:	00 00                	add    %al,(%eax)
     ff3:	00 44 00 b0          	add    %al,-0x50(%eax,%eax,1)
     ff7:	00 0b                	add    %cl,(%ebx)
     ff9:	00 00                	add    %al,(%eax)
     ffb:	00 00                	add    %al,(%eax)
     ffd:	00 00                	add    %al,(%eax)
     fff:	00 44 00 ae          	add    %al,-0x52(%eax,%eax,1)
    1003:	00 11                	add    %dl,(%ecx)
    1005:	00 00                	add    %al,(%eax)
    1007:	00 00                	add    %al,(%eax)
    1009:	00 00                	add    %al,(%eax)
    100b:	00 44 00 b0          	add    %al,-0x50(%eax,%eax,1)
    100f:	00 1f                	add    %bl,(%edi)
    1011:	00 00                	add    %al,(%eax)
    1013:	00 00                	add    %al,(%eax)
    1015:	00 00                	add    %al,(%eax)
    1017:	00 44 00 ae          	add    %al,-0x52(%eax,%eax,1)
    101b:	00 22                	add    %ah,(%edx)
    101d:	00 00                	add    %al,(%eax)
    101f:	00 00                	add    %al,(%eax)
    1021:	00 00                	add    %al,(%eax)
    1023:	00 44 00 b0          	add    %al,-0x50(%eax,%eax,1)
    1027:	00 2a                	add    %ch,(%edx)
    1029:	00 00                	add    %al,(%eax)
    102b:	00 00                	add    %al,(%eax)
    102d:	00 00                	add    %al,(%eax)
    102f:	00 44 00 af          	add    %al,-0x51(%eax,%eax,1)
    1033:	00 2d 00 00 00 00    	add    %ch,0x0
    1039:	00 00                	add    %al,(%eax)
    103b:	00 44 00 b0          	add    %al,-0x50(%eax,%eax,1)
    103f:	00 2f                	add    %ch,(%edi)
    1041:	00 00                	add    %al,(%eax)
    1043:	00 00                	add    %al,(%eax)
    1045:	00 00                	add    %al,(%eax)
    1047:	00 44 00 af          	add    %al,-0x51(%eax,%eax,1)
    104b:	00 32                	add    %dh,(%edx)
    104d:	00 00                	add    %al,(%eax)
    104f:	00 00                	add    %al,(%eax)
    1051:	00 00                	add    %al,(%eax)
    1053:	00 44 00 b0          	add    %al,-0x50(%eax,%eax,1)
    1057:	00 37                	add    %dh,(%edi)
    1059:	00 00                	add    %al,(%eax)
    105b:	00 00                	add    %al,(%eax)
    105d:	00 00                	add    %al,(%eax)
    105f:	00 44 00 af          	add    %al,-0x51(%eax,%eax,1)
    1063:	00 42 00             	add    %al,0x0(%edx)
    1066:	00 00                	add    %al,(%eax)
    1068:	00 00                	add    %al,(%eax)
    106a:	00 00                	add    %al,(%eax)
    106c:	44                   	inc    %esp
    106d:	00 ae 00 45 00 00    	add    %ch,0x4500(%esi)
    1073:	00 00                	add    %al,(%eax)
    1075:	00 00                	add    %al,(%eax)
    1077:	00 44 00 b3          	add    %al,-0x4d(%eax,%eax,1)
    107b:	00 50 00             	add    %dl,0x0(%eax)
    107e:	00 00                	add    %al,(%eax)
    1080:	2a 06                	sub    (%esi),%al
    1082:	00 00                	add    %al,(%eax)
    1084:	40                   	inc    %eax
    1085:	00 00                	add    %al,(%eax)
    1087:	00 00                	add    %al,(%eax)
    1089:	00 00                	add    %al,(%eax)
    108b:	00 a4 07 00 00 40 00 	add    %ah,0x400000(%edi,%eax,1)
	...
    109a:	00 00                	add    %al,(%eax)
    109c:	c0 00 00             	rolb   $0x0,(%eax)
	...
    10a7:	00 e0                	add    %ah,%al
    10a9:	00 00                	add    %al,(%eax)
    10ab:	00 57 00             	add    %dl,0x0(%edi)
    10ae:	00 00                	add    %al,(%eax)
    10b0:	af                   	scas   %es:(%edi),%eax
    10b1:	07                   	pop    %es
    10b2:	00 00                	add    %al,(%eax)
    10b4:	24 00                	and    $0x0,%al
    10b6:	00 00                	add    %al,(%eax)
    10b8:	6f                   	outsl  %ds:(%esi),(%dx)
    10b9:	08 28                	or     %ch,(%eax)
    10bb:	00 b7 04 00 00 a0    	add    %dh,-0x5ffffffc(%edi)
    10c1:	00 00                	add    %al,(%eax)
    10c3:	00 08                	add    %cl,(%eax)
    10c5:	00 00                	add    %al,(%eax)
    10c7:	00 02                	add    %al,(%edx)
    10c9:	06                   	push   %es
    10ca:	00 00                	add    %al,(%eax)
    10cc:	a0 00 00 00 0c       	mov    0xc000000,%al
    10d1:	00 00                	add    %al,(%eax)
    10d3:	00 0c 06             	add    %cl,(%esi,%eax,1)
    10d6:	00 00                	add    %al,(%eax)
    10d8:	a0 00 00 00 10       	mov    0x10000000,%al
    10dd:	00 00                	add    %al,(%eax)
    10df:	00 16                	add    %dl,(%esi)
    10e1:	06                   	push   %es
    10e2:	00 00                	add    %al,(%eax)
    10e4:	a0 00 00 00 14       	mov    0x14000000,%al
    10e9:	00 00                	add    %al,(%eax)
    10eb:	00 20                	add    %ah,(%eax)
    10ed:	06                   	push   %es
    10ee:	00 00                	add    %al,(%eax)
    10f0:	a0 00 00 00 18       	mov    0x18000000,%al
    10f5:	00 00                	add    %al,(%eax)
    10f7:	00 00                	add    %al,(%eax)
    10f9:	00 00                	add    %al,(%eax)
    10fb:	00 44 00 b5          	add    %al,-0x4b(%eax,%eax,1)
	...
    1107:	00 44 00 b6          	add    %al,-0x4a(%eax,%eax,1)
    110b:	00 06                	add    %al,(%esi)
    110d:	00 00                	add    %al,(%eax)
    110f:	00 00                	add    %al,(%eax)
    1111:	00 00                	add    %al,(%eax)
    1113:	00 44 00 b7          	add    %al,-0x49(%eax,%eax,1)
    1117:	00 26                	add    %ah,(%esi)
    1119:	00 00                	add    %al,(%eax)
    111b:	00 be 07 00 00 26    	add    %bh,0x26000007(%esi)
    1121:	00 00                	add    %al,(%eax)
    1123:	00 80 11 28 00 cd    	add    %al,-0x32ffd7ef(%eax)
    1129:	07                   	pop    %es
    112a:	00 00                	add    %al,(%eax)
    112c:	26 00 00             	add    %al,%es:(%eax)
    112f:	00 a0 32 28 00 00    	add    %ah,0x2832(%eax)
    1135:	00 00                	add    %al,(%eax)
    1137:	00 64 00 00          	add    %ah,0x0(%eax,%eax,1)
    113b:	00 9a 08 28 00 de    	add    %bl,-0x21ffd7f8(%edx)
    1141:	07                   	pop    %es
    1142:	00 00                	add    %al,(%eax)
    1144:	64 00 02             	add    %al,%fs:(%edx)
    1147:	00 9a 08 28 00 08    	add    %bl,0x8002808(%edx)
    114d:	00 00                	add    %al,(%eax)
    114f:	00 3c 00             	add    %bh,(%eax,%eax,1)
	...
    115a:	00 00                	add    %al,(%eax)
    115c:	64 00 00             	add    %al,%fs:(%eax)
    115f:	00 9a 08 28 00 e5    	add    %bl,-0x1affd7f8(%edx)
    1165:	07                   	pop    %es
    1166:	00 00                	add    %al,(%eax)
    1168:	64 00 02             	add    %al,%fs:(%edx)
    116b:	00 9a 08 28 00 08    	add    %bl,0x8002808(%edx)
    1171:	00 00                	add    %al,(%eax)
    1173:	00 3c 00             	add    %bh,(%eax,%eax,1)
    1176:	00 00                	add    %al,(%eax)
    1178:	00 00                	add    %al,(%eax)
    117a:	00 00                	add    %al,(%eax)
    117c:	ed                   	in     (%dx),%eax
    117d:	07                   	pop    %es
    117e:	00 00                	add    %al,(%eax)
    1180:	24 00                	and    $0x0,%al
    1182:	00 00                	add    %al,(%eax)
    1184:	9a 08 28 00 3c 04 00 	lcall  $0x4,$0x3c002808
    118b:	00 80 00 00 00 00    	add    %al,0x0(%eax)
    1191:	00 00                	add    %al,(%eax)
    1193:	00 b2 01 00 00 80    	add    %dh,-0x7fffffff(%edx)
	...
    11a1:	08 00                	or     %al,(%eax)
    11a3:	00 a0 00 00 00 08    	add    %ah,0x8000000(%eax)
    11a9:	00 00                	add    %al,(%eax)
    11ab:	00 13                	add    %dl,(%ebx)
    11ad:	08 00                	or     %al,(%eax)
    11af:	00 a0 00 00 00 0c    	add    %ah,0xc000000(%eax)
    11b5:	00 00                	add    %al,(%eax)
    11b7:	00 3f                	add    %bh,(%edi)
    11b9:	08 00                	or     %al,(%eax)
    11bb:	00 a0 00 00 00 10    	add    %ah,0x10000000(%eax)
    11c1:	00 00                	add    %al,(%eax)
    11c3:	00 48 08             	add    %cl,0x8(%eax)
    11c6:	00 00                	add    %al,(%eax)
    11c8:	a0 00 00 00 14       	mov    0x14000000,%al
    11cd:	00 00                	add    %al,(%eax)
    11cf:	00 51 08             	add    %dl,0x8(%ecx)
    11d2:	00 00                	add    %al,(%eax)
    11d4:	a0 00 00 00 18       	mov    0x18000000,%al
    11d9:	00 00                	add    %al,(%eax)
    11db:	00 5e 08             	add    %bl,0x8(%esi)
    11de:	00 00                	add    %al,(%eax)
    11e0:	a0 00 00 00 1c       	mov    0x1c000000,%al
    11e5:	00 00                	add    %al,(%eax)
    11e7:	00 6a 08             	add    %ch,0x8(%edx)
    11ea:	00 00                	add    %al,(%eax)
    11ec:	80 00 00             	addb   $0x0,(%eax)
	...
    11f7:	00 44 00 0d          	add    %al,0xd(%eax,%eax,1)
	...
    1203:	00 44 00 0d          	add    %al,0xd(%eax,%eax,1)
    1207:	00 14 00             	add    %dl,(%eax,%eax,1)
    120a:	00 00                	add    %al,(%eax)
    120c:	00 00                	add    %al,(%eax)
    120e:	00 00                	add    %al,(%eax)
    1210:	44                   	inc    %esp
    1211:	00 13                	add    %dl,(%ebx)
    1213:	00 1a                	add    %bl,(%edx)
    1215:	00 00                	add    %al,(%eax)
    1217:	00 00                	add    %al,(%eax)
    1219:	00 00                	add    %al,(%eax)
    121b:	00 44 00 0e          	add    %al,0xe(%eax,%eax,1)
    121f:	00 24 00             	add    %ah,(%eax,%eax,1)
    1222:	00 00                	add    %al,(%eax)
    1224:	00 00                	add    %al,(%eax)
    1226:	00 00                	add    %al,(%eax)
    1228:	44                   	inc    %esp
    1229:	00 0e                	add    %cl,(%esi)
    122b:	00 2a                	add    %ch,(%edx)
    122d:	00 00                	add    %al,(%eax)
    122f:	00 00                	add    %al,(%eax)
    1231:	00 00                	add    %al,(%eax)
    1233:	00 44 00 0f          	add    %al,0xf(%eax,%eax,1)
    1237:	00 2e                	add    %ch,(%esi)
    1239:	00 00                	add    %al,(%eax)
    123b:	00 00                	add    %al,(%eax)
    123d:	00 00                	add    %al,(%eax)
    123f:	00 44 00 11          	add    %al,0x11(%eax,%eax,1)
    1243:	00 32                	add    %dh,(%edx)
    1245:	00 00                	add    %al,(%eax)
    1247:	00 00                	add    %al,(%eax)
    1249:	00 00                	add    %al,(%eax)
    124b:	00 44 00 10          	add    %al,0x10(%eax,%eax,1)
    124f:	00 35 00 00 00 00    	add    %dh,0x0
    1255:	00 00                	add    %al,(%eax)
    1257:	00 44 00 13          	add    %al,0x13(%eax,%eax,1)
    125b:	00 39                	add    %bh,(%ecx)
    125d:	00 00                	add    %al,(%eax)
    125f:	00 00                	add    %al,(%eax)
    1261:	00 00                	add    %al,(%eax)
    1263:	00 44 00 13          	add    %al,0x13(%eax,%eax,1)
    1267:	00 3c 00             	add    %bh,(%eax,%eax,1)
    126a:	00 00                	add    %al,(%eax)
    126c:	00 00                	add    %al,(%eax)
    126e:	00 00                	add    %al,(%eax)
    1270:	44                   	inc    %esp
    1271:	00 14 00             	add    %dl,(%eax,%eax,1)
    1274:	4b                   	dec    %ebx
    1275:	00 00                	add    %al,(%eax)
    1277:	00 00                	add    %al,(%eax)
    1279:	00 00                	add    %al,(%eax)
    127b:	00 44 00 13          	add    %al,0x13(%eax,%eax,1)
    127f:	00 4e 00             	add    %cl,0x0(%esi)
    1282:	00 00                	add    %al,(%eax)
    1284:	00 00                	add    %al,(%eax)
    1286:	00 00                	add    %al,(%eax)
    1288:	44                   	inc    %esp
    1289:	00 15 00 59 00 00    	add    %dl,0x5900
    128f:	00 00                	add    %al,(%eax)
    1291:	00 00                	add    %al,(%eax)
    1293:	00 44 00 17          	add    %al,0x17(%eax,%eax,1)
    1297:	00 6a 00             	add    %ch,0x0(%edx)
    129a:	00 00                	add    %al,(%eax)
    129c:	00 00                	add    %al,(%eax)
    129e:	00 00                	add    %al,(%eax)
    12a0:	44                   	inc    %esp
    12a1:	00 16                	add    %dl,(%esi)
    12a3:	00 6d 00             	add    %ch,0x0(%ebp)
    12a6:	00 00                	add    %al,(%eax)
    12a8:	00 00                	add    %al,(%eax)
    12aa:	00 00                	add    %al,(%eax)
    12ac:	44                   	inc    %esp
    12ad:	00 18                	add    %bl,(%eax)
    12af:	00 6f 00             	add    %ch,0x0(%edi)
    12b2:	00 00                	add    %al,(%eax)
    12b4:	00 00                	add    %al,(%eax)
    12b6:	00 00                	add    %al,(%eax)
    12b8:	44                   	inc    %esp
    12b9:	00 1a                	add    %bl,(%edx)
    12bb:	00 77 00             	add    %dh,0x0(%edi)
    12be:	00 00                	add    %al,(%eax)
    12c0:	00 00                	add    %al,(%eax)
    12c2:	00 00                	add    %al,(%eax)
    12c4:	44                   	inc    %esp
    12c5:	00 1e                	add    %bl,(%esi)
    12c7:	00 79 00             	add    %bh,0x0(%ecx)
    12ca:	00 00                	add    %al,(%eax)
    12cc:	00 00                	add    %al,(%eax)
    12ce:	00 00                	add    %al,(%eax)
    12d0:	44                   	inc    %esp
    12d1:	00 20                	add    %ah,(%eax)
    12d3:	00 7e 00             	add    %bh,0x0(%esi)
    12d6:	00 00                	add    %al,(%eax)
    12d8:	75 08                	jne    12e2 <bootmain-0x27ed1e>
    12da:	00 00                	add    %al,(%eax)
    12dc:	40                   	inc    %eax
    12dd:	00 00                	add    %al,(%eax)
    12df:	00 07                	add    %al,(%edi)
    12e1:	00 00                	add    %al,(%eax)
    12e3:	00 7e 08             	add    %bh,0x8(%esi)
    12e6:	00 00                	add    %al,(%eax)
    12e8:	40                   	inc    %eax
    12e9:	00 00                	add    %al,(%eax)
    12eb:	00 06                	add    %al,(%esi)
    12ed:	00 00                	add    %al,(%eax)
    12ef:	00 87 08 00 00 24    	add    %al,0x24000008(%edi)
    12f5:	00 00                	add    %al,(%eax)
    12f7:	00 20                	add    %ah,(%eax)
    12f9:	09 28                	or     %ebp,(%eax)
    12fb:	00 93 08 00 00 a0    	add    %dl,-0x5ffffff8(%ebx)
    1301:	00 00                	add    %al,(%eax)
    1303:	00 08                	add    %cl,(%eax)
    1305:	00 00                	add    %al,(%eax)
    1307:	00 a0 08 00 00 a0    	add    %ah,-0x5ffffff8(%eax)
    130d:	00 00                	add    %al,(%eax)
    130f:	00 0c 00             	add    %cl,(%eax,%eax,1)
    1312:	00 00                	add    %al,(%eax)
    1314:	00 00                	add    %al,(%eax)
    1316:	00 00                	add    %al,(%eax)
    1318:	44                   	inc    %esp
    1319:	00 22                	add    %ah,(%edx)
	...
    1323:	00 44 00 23          	add    %al,0x23(%eax,%eax,1)
    1327:	00 01                	add    %al,(%ecx)
    1329:	00 00                	add    %al,(%eax)
    132b:	00 00                	add    %al,(%eax)
    132d:	00 00                	add    %al,(%eax)
    132f:	00 44 00 22          	add    %al,0x22(%eax,%eax,1)
    1333:	00 08                	add    %cl,(%eax)
    1335:	00 00                	add    %al,(%eax)
    1337:	00 00                	add    %al,(%eax)
    1339:	00 00                	add    %al,(%eax)
    133b:	00 44 00 23          	add    %al,0x23(%eax,%eax,1)
    133f:	00 0c 00             	add    %cl,(%eax,%eax,1)
    1342:	00 00                	add    %al,(%eax)
    1344:	00 00                	add    %al,(%eax)
    1346:	00 00                	add    %al,(%eax)
    1348:	44                   	inc    %esp
    1349:	00 22                	add    %ah,(%edx)
    134b:	00 0f                	add    %cl,(%edi)
    134d:	00 00                	add    %al,(%eax)
    134f:	00 00                	add    %al,(%eax)
    1351:	00 00                	add    %al,(%eax)
    1353:	00 44 00 22          	add    %al,0x22(%eax,%eax,1)
    1357:	00 13                	add    %dl,(%ebx)
    1359:	00 00                	add    %al,(%eax)
    135b:	00 00                	add    %al,(%eax)
    135d:	00 00                	add    %al,(%eax)
    135f:	00 44 00 23          	add    %al,0x23(%eax,%eax,1)
    1363:	00 19                	add    %bl,(%ecx)
    1365:	00 00                	add    %al,(%eax)
    1367:	00 00                	add    %al,(%eax)
    1369:	00 00                	add    %al,(%eax)
    136b:	00 44 00 25          	add    %al,0x25(%eax,%eax,1)
    136f:	00 22                	add    %ah,(%edx)
    1371:	00 00                	add    %al,(%eax)
    1373:	00 00                	add    %al,(%eax)
    1375:	00 00                	add    %al,(%eax)
    1377:	00 44 00 26          	add    %al,0x26(%eax,%eax,1)
    137b:	00 26                	add    %ah,(%esi)
    137d:	00 00                	add    %al,(%eax)
    137f:	00 00                	add    %al,(%eax)
    1381:	00 00                	add    %al,(%eax)
    1383:	00 44 00 27          	add    %al,0x27(%eax,%eax,1)
    1387:	00 29                	add    %ch,(%ecx)
    1389:	00 00                	add    %al,(%eax)
    138b:	00 00                	add    %al,(%eax)
    138d:	00 00                	add    %al,(%eax)
    138f:	00 44 00 26          	add    %al,0x26(%eax,%eax,1)
    1393:	00 2b                	add    %ch,(%ebx)
    1395:	00 00                	add    %al,(%eax)
    1397:	00 00                	add    %al,(%eax)
    1399:	00 00                	add    %al,(%eax)
    139b:	00 44 00 26          	add    %al,0x26(%eax,%eax,1)
    139f:	00 2c 00             	add    %ch,(%eax,%eax,1)
    13a2:	00 00                	add    %al,(%eax)
    13a4:	00 00                	add    %al,(%eax)
    13a6:	00 00                	add    %al,(%eax)
    13a8:	44                   	inc    %esp
    13a9:	00 2b                	add    %ch,(%ebx)
    13ab:	00 2f                	add    %ch,(%edi)
    13ad:	00 00                	add    %al,(%eax)
    13af:	00 00                	add    %al,(%eax)
    13b1:	00 00                	add    %al,(%eax)
    13b3:	00 44 00 2b          	add    %al,0x2b(%eax,%eax,1)
    13b7:	00 38                	add    %bh,(%eax)
    13b9:	00 00                	add    %al,(%eax)
    13bb:	00 00                	add    %al,(%eax)
    13bd:	00 00                	add    %al,(%eax)
    13bf:	00 44 00 2b          	add    %al,0x2b(%eax,%eax,1)
    13c3:	00 39                	add    %bh,(%ecx)
    13c5:	00 00                	add    %al,(%eax)
    13c7:	00 00                	add    %al,(%eax)
    13c9:	00 00                	add    %al,(%eax)
    13cb:	00 44 00 2b          	add    %al,0x2b(%eax,%eax,1)
    13cf:	00 3c 00             	add    %bh,(%eax,%eax,1)
    13d2:	00 00                	add    %al,(%eax)
    13d4:	00 00                	add    %al,(%eax)
    13d6:	00 00                	add    %al,(%eax)
    13d8:	44                   	inc    %esp
    13d9:	00 2c 00             	add    %ch,(%eax,%eax,1)
    13dc:	42                   	inc    %edx
    13dd:	00 00                	add    %al,(%eax)
    13df:	00 00                	add    %al,(%eax)
    13e1:	00 00                	add    %al,(%eax)
    13e3:	00 44 00 2d          	add    %al,0x2d(%eax,%eax,1)
    13e7:	00 44 00 00          	add    %al,0x0(%eax,%eax,1)
    13eb:	00 00                	add    %al,(%eax)
    13ed:	00 00                	add    %al,(%eax)
    13ef:	00 44 00 2d          	add    %al,0x2d(%eax,%eax,1)
    13f3:	00 4a 00             	add    %cl,0x0(%edx)
    13f6:	00 00                	add    %al,(%eax)
    13f8:	00 00                	add    %al,(%eax)
    13fa:	00 00                	add    %al,(%eax)
    13fc:	44                   	inc    %esp
    13fd:	00 2e                	add    %ch,(%esi)
    13ff:	00 4c 00 00          	add    %cl,0x0(%eax,%eax,1)
    1403:	00 00                	add    %al,(%eax)
    1405:	00 00                	add    %al,(%eax)
    1407:	00 44 00 2f          	add    %al,0x2f(%eax,%eax,1)
    140b:	00 50 00             	add    %dl,0x0(%eax)
    140e:	00 00                	add    %al,(%eax)
    1410:	00 00                	add    %al,(%eax)
    1412:	00 00                	add    %al,(%eax)
    1414:	44                   	inc    %esp
    1415:	00 30                	add    %dh,(%eax)
    1417:	00 5a 00             	add    %bl,0x0(%edx)
    141a:	00 00                	add    %al,(%eax)
    141c:	00 00                	add    %al,(%eax)
    141e:	00 00                	add    %al,(%eax)
    1420:	44                   	inc    %esp
    1421:	00 31                	add    %dh,(%ecx)
    1423:	00 60 00             	add    %ah,0x0(%eax)
    1426:	00 00                	add    %al,(%eax)
    1428:	ab                   	stos   %eax,%es:(%edi)
    1429:	08 00                	or     %al,(%eax)
    142b:	00 80 00 00 00 f6    	add    %al,-0xa000000(%eax)
    1431:	ff                   	(bad)  
    1432:	ff                   	(bad)  
    1433:	ff e0                	jmp    *%eax
    1435:	08 00                	or     %al,(%eax)
    1437:	00 40 00             	add    %al,0x0(%eax)
    143a:	00 00                	add    %al,(%eax)
    143c:	01 00                	add    %eax,(%eax)
    143e:	00 00                	add    %al,(%eax)
    1440:	eb 08                	jmp    144a <bootmain-0x27ebb6>
    1442:	00 00                	add    %al,(%eax)
    1444:	40                   	inc    %eax
    1445:	00 00                	add    %al,(%eax)
    1447:	00 02                	add    %al,(%edx)
    1449:	00 00                	add    %al,(%eax)
    144b:	00 f8                	add    %bh,%al
    144d:	08 00                	or     %al,(%eax)
    144f:	00 40 00             	add    %al,0x0(%eax)
    1452:	00 00                	add    %al,(%eax)
    1454:	03 00                	add    (%eax),%eax
    1456:	00 00                	add    %al,(%eax)
    1458:	00 00                	add    %al,(%eax)
    145a:	00 00                	add    %al,(%eax)
    145c:	c0 00 00             	rolb   $0x0,(%eax)
	...
    1467:	00 e0                	add    %ah,%al
    1469:	00 00                	add    %al,(%eax)
    146b:	00 68 00             	add    %ch,0x0(%eax)
    146e:	00 00                	add    %al,(%eax)
    1470:	03 09                	add    (%ecx),%ecx
    1472:	00 00                	add    %al,(%eax)
    1474:	24 00                	and    $0x0,%al
    1476:	00 00                	add    %al,(%eax)
    1478:	88 09                	mov    %cl,(%ecx)
    147a:	28 00                	sub    %al,(%eax)
    147c:	0f 09                	wbinvd 
    147e:	00 00                	add    %al,(%eax)
    1480:	a0 00 00 00 08       	mov    0x8000000,%al
    1485:	00 00                	add    %al,(%eax)
    1487:	00 a0 08 00 00 a0    	add    %ah,-0x5ffffff8(%eax)
    148d:	00 00                	add    %al,(%eax)
    148f:	00 0c 00             	add    %cl,(%eax,%eax,1)
    1492:	00 00                	add    %al,(%eax)
    1494:	67 05 00 00 80 00    	addr16 add $0x800000,%eax
	...
    14a2:	00 00                	add    %al,(%eax)
    14a4:	44                   	inc    %esp
    14a5:	00 76 00             	add    %dh,0x0(%esi)
	...
    14b0:	44                   	inc    %esp
    14b1:	00 77 00             	add    %dh,0x0(%edi)
    14b4:	01 00                	add    %eax,(%eax)
    14b6:	00 00                	add    %al,(%eax)
    14b8:	00 00                	add    %al,(%eax)
    14ba:	00 00                	add    %al,(%eax)
    14bc:	44                   	inc    %esp
    14bd:	00 76 00             	add    %dh,0x0(%esi)
    14c0:	08 00                	or     %al,(%eax)
    14c2:	00 00                	add    %al,(%eax)
    14c4:	00 00                	add    %al,(%eax)
    14c6:	00 00                	add    %al,(%eax)
    14c8:	44                   	inc    %esp
    14c9:	00 77 00             	add    %dh,0x0(%edi)
    14cc:	0c 00                	or     $0x0,%al
    14ce:	00 00                	add    %al,(%eax)
    14d0:	00 00                	add    %al,(%eax)
    14d2:	00 00                	add    %al,(%eax)
    14d4:	44                   	inc    %esp
    14d5:	00 76 00             	add    %dh,0x0(%esi)
    14d8:	0f 00 00             	sldt   (%eax)
    14db:	00 00                	add    %al,(%eax)
    14dd:	00 00                	add    %al,(%eax)
    14df:	00 44 00 76          	add    %al,0x76(%eax,%eax,1)
    14e3:	00 13                	add    %dl,(%ebx)
    14e5:	00 00                	add    %al,(%eax)
    14e7:	00 00                	add    %al,(%eax)
    14e9:	00 00                	add    %al,(%eax)
    14eb:	00 44 00 77          	add    %al,0x77(%eax,%eax,1)
    14ef:	00 19                	add    %bl,(%ecx)
    14f1:	00 00                	add    %al,(%eax)
    14f3:	00 00                	add    %al,(%eax)
    14f5:	00 00                	add    %al,(%eax)
    14f7:	00 44 00 78          	add    %al,0x78(%eax,%eax,1)
    14fb:	00 22                	add    %ah,(%edx)
    14fd:	00 00                	add    %al,(%eax)
    14ff:	00 00                	add    %al,(%eax)
    1501:	00 00                	add    %al,(%eax)
    1503:	00 44 00 7a          	add    %al,0x7a(%eax,%eax,1)
    1507:	00 25 00 00 00 00    	add    %ah,0x0
    150d:	00 00                	add    %al,(%eax)
    150f:	00 44 00 7e          	add    %al,0x7e(%eax,%eax,1)
    1513:	00 2c 00             	add    %ch,(%eax,%eax,1)
    1516:	00 00                	add    %al,(%eax)
    1518:	00 00                	add    %al,(%eax)
    151a:	00 00                	add    %al,(%eax)
    151c:	44                   	inc    %esp
    151d:	00 7e 00             	add    %bh,0x0(%esi)
    1520:	2e 00 00             	add    %al,%cs:(%eax)
    1523:	00 00                	add    %al,(%eax)
    1525:	00 00                	add    %al,(%eax)
    1527:	00 44 00 7e          	add    %al,0x7e(%eax,%eax,1)
    152b:	00 2f                	add    %ch,(%edi)
    152d:	00 00                	add    %al,(%eax)
    152f:	00 00                	add    %al,(%eax)
    1531:	00 00                	add    %al,(%eax)
    1533:	00 44 00 72          	add    %al,0x72(%eax,%eax,1)
    1537:	00 32                	add    %dh,(%edx)
    1539:	00 00                	add    %al,(%eax)
    153b:	00 00                	add    %al,(%eax)
    153d:	00 00                	add    %al,(%eax)
    153f:	00 44 00 6f          	add    %al,0x6f(%eax,%eax,1)
    1543:	00 35 00 00 00 00    	add    %dh,0x0
    1549:	00 00                	add    %al,(%eax)
    154b:	00 44 00 70          	add    %al,0x70(%eax,%eax,1)
    154f:	00 3a                	add    %bh,(%edx)
    1551:	00 00                	add    %al,(%eax)
    1553:	00 00                	add    %al,(%eax)
    1555:	00 00                	add    %al,(%eax)
    1557:	00 44 00 82          	add    %al,-0x7e(%eax,%eax,1)
    155b:	00 3d 00 00 00 00    	add    %bh,0x0
    1561:	00 00                	add    %al,(%eax)
    1563:	00 44 00 73          	add    %al,0x73(%eax,%eax,1)
    1567:	00 40 00             	add    %al,0x0(%eax)
    156a:	00 00                	add    %al,(%eax)
    156c:	00 00                	add    %al,(%eax)
    156e:	00 00                	add    %al,(%eax)
    1570:	44                   	inc    %esp
    1571:	00 82 00 43 00 00    	add    %al,0x4300(%edx)
    1577:	00 00                	add    %al,(%eax)
    1579:	00 00                	add    %al,(%eax)
    157b:	00 44 00 7e          	add    %al,0x7e(%eax,%eax,1)
    157f:	00 48 00             	add    %cl,0x0(%eax)
    1582:	00 00                	add    %al,(%eax)
    1584:	00 00                	add    %al,(%eax)
    1586:	00 00                	add    %al,(%eax)
    1588:	44                   	inc    %esp
    1589:	00 84 00 4a 00 00 00 	add    %al,0x4a(%eax,%eax,1)
    1590:	00 00                	add    %al,(%eax)
    1592:	00 00                	add    %al,(%eax)
    1594:	44                   	inc    %esp
    1595:	00 86 00 4e 00 00    	add    %al,0x4e00(%esi)
    159b:	00 00                	add    %al,(%eax)
    159d:	00 00                	add    %al,(%eax)
    159f:	00 44 00 85          	add    %al,-0x7b(%eax,%eax,1)
    15a3:	00 51 00             	add    %dl,0x0(%ecx)
    15a6:	00 00                	add    %al,(%eax)
    15a8:	00 00                	add    %al,(%eax)
    15aa:	00 00                	add    %al,(%eax)
    15ac:	44                   	inc    %esp
    15ad:	00 86 00 53 00 00    	add    %al,0x5300(%esi)
    15b3:	00 00                	add    %al,(%eax)
    15b5:	00 00                	add    %al,(%eax)
    15b7:	00 44 00 88          	add    %al,-0x78(%eax,%eax,1)
    15bb:	00 58 00             	add    %bl,0x0(%eax)
    15be:	00 00                	add    %al,(%eax)
    15c0:	00 00                	add    %al,(%eax)
    15c2:	00 00                	add    %al,(%eax)
    15c4:	44                   	inc    %esp
    15c5:	00 89 00 5f 00 00    	add    %cl,0x5f00(%ecx)
    15cb:	00 31                	add    %dh,(%ecx)
    15cd:	09 00                	or     %eax,(%eax)
    15cf:	00 80 00 00 00 e2    	add    %al,-0x1e000000(%eax)
    15d5:	ff                   	(bad)  
    15d6:	ff                   	(bad)  
    15d7:	ff 52 09             	call   *0x9(%edx)
    15da:	00 00                	add    %al,(%eax)
    15dc:	40                   	inc    %eax
    15dd:	00 00                	add    %al,(%eax)
    15df:	00 06                	add    %al,(%esi)
    15e1:	00 00                	add    %al,(%eax)
    15e3:	00 f8                	add    %bh,%al
    15e5:	08 00                	or     %al,(%eax)
    15e7:	00 40 00             	add    %al,0x0(%eax)
    15ea:	00 00                	add    %al,(%eax)
    15ec:	02 00                	add    (%eax),%al
    15ee:	00 00                	add    %al,(%eax)
    15f0:	00 00                	add    %al,(%eax)
    15f2:	00 00                	add    %al,(%eax)
    15f4:	c0 00 00             	rolb   $0x0,(%eax)
    15f7:	00 00                	add    %al,(%eax)
    15f9:	00 00                	add    %al,(%eax)
    15fb:	00 eb                	add    %ch,%bl
    15fd:	08 00                	or     %al,(%eax)
    15ff:	00 40 00             	add    %al,0x0(%eax)
    1602:	00 00                	add    %al,(%eax)
    1604:	03 00                	add    (%eax),%eax
    1606:	00 00                	add    %al,(%eax)
    1608:	00 00                	add    %al,(%eax)
    160a:	00 00                	add    %al,(%eax)
    160c:	c0 00 00             	rolb   $0x0,(%eax)
    160f:	00 32                	add    %dh,(%edx)
    1611:	00 00                	add    %al,(%eax)
    1613:	00 00                	add    %al,(%eax)
    1615:	00 00                	add    %al,(%eax)
    1617:	00 e0                	add    %ah,%al
    1619:	00 00                	add    %al,(%eax)
    161b:	00 3d 00 00 00 eb    	add    %bh,0xeb000000
    1621:	08 00                	or     %al,(%eax)
    1623:	00 40 00             	add    %al,0x0(%eax)
    1626:	00 00                	add    %al,(%eax)
    1628:	03 00                	add    (%eax),%eax
    162a:	00 00                	add    %al,(%eax)
    162c:	00 00                	add    %al,(%eax)
    162e:	00 00                	add    %al,(%eax)
    1630:	c0 00 00             	rolb   $0x0,(%eax)
    1633:	00 40 00             	add    %al,0x0(%eax)
    1636:	00 00                	add    %al,(%eax)
    1638:	00 00                	add    %al,(%eax)
    163a:	00 00                	add    %al,(%eax)
    163c:	e0 00                	loopne 163e <bootmain-0x27e9c2>
    163e:	00 00                	add    %al,(%eax)
    1640:	43                   	inc    %ebx
    1641:	00 00                	add    %al,(%eax)
    1643:	00 00                	add    %al,(%eax)
    1645:	00 00                	add    %al,(%eax)
    1647:	00 e0                	add    %ah,%al
    1649:	00 00                	add    %al,(%eax)
    164b:	00 67 00             	add    %ah,0x0(%edi)
    164e:	00 00                	add    %al,(%eax)
    1650:	5f                   	pop    %edi
    1651:	09 00                	or     %eax,(%eax)
    1653:	00 24 00             	add    %ah,(%eax,%eax,1)
    1656:	00 00                	add    %al,(%eax)
    1658:	ef                   	out    %eax,(%dx)
    1659:	09 28                	or     %ebp,(%eax)
    165b:	00 6e 09             	add    %ch,0x9(%esi)
    165e:	00 00                	add    %al,(%eax)
    1660:	a0 00 00 00 08       	mov    0x8000000,%al
    1665:	00 00                	add    %al,(%eax)
    1667:	00 79 09             	add    %bh,0x9(%ecx)
    166a:	00 00                	add    %al,(%eax)
    166c:	a0 00 00 00 0c       	mov    0xc000000,%al
    1671:	00 00                	add    %al,(%eax)
    1673:	00 00                	add    %al,(%eax)
    1675:	00 00                	add    %al,(%eax)
    1677:	00 44 00 4d          	add    %al,0x4d(%eax,%eax,1)
	...
    1683:	00 44 00 4e          	add    %al,0x4e(%eax,%eax,1)
    1687:	00 05 00 00 00 00    	add    %al,0x0
    168d:	00 00                	add    %al,(%eax)
    168f:	00 44 00 4d          	add    %al,0x4d(%eax,%eax,1)
    1693:	00 08                	add    %cl,(%eax)
    1695:	00 00                	add    %al,(%eax)
    1697:	00 00                	add    %al,(%eax)
    1699:	00 00                	add    %al,(%eax)
    169b:	00 44 00 4d          	add    %al,0x4d(%eax,%eax,1)
    169f:	00 0c 00             	add    %cl,(%eax,%eax,1)
    16a2:	00 00                	add    %al,(%eax)
    16a4:	00 00                	add    %al,(%eax)
    16a6:	00 00                	add    %al,(%eax)
    16a8:	44                   	inc    %esp
    16a9:	00 51 00             	add    %dl,0x0(%ecx)
    16ac:	0f 00 00             	sldt   (%eax)
    16af:	00 00                	add    %al,(%eax)
    16b1:	00 00                	add    %al,(%eax)
    16b3:	00 44 00 51          	add    %al,0x51(%eax,%eax,1)
    16b7:	00 14 00             	add    %dl,(%eax,%eax,1)
    16ba:	00 00                	add    %al,(%eax)
    16bc:	00 00                	add    %al,(%eax)
    16be:	00 00                	add    %al,(%eax)
    16c0:	44                   	inc    %esp
    16c1:	00 53 00             	add    %dl,0x0(%ebx)
    16c4:	18 00                	sbb    %al,(%eax)
    16c6:	00 00                	add    %al,(%eax)
    16c8:	00 00                	add    %al,(%eax)
    16ca:	00 00                	add    %al,(%eax)
    16cc:	44                   	inc    %esp
    16cd:	00 52 00             	add    %dl,0x0(%edx)
    16d0:	1e                   	push   %ds
    16d1:	00 00                	add    %al,(%eax)
    16d3:	00 00                	add    %al,(%eax)
    16d5:	00 00                	add    %al,(%eax)
    16d7:	00 44 00 53          	add    %al,0x53(%eax,%eax,1)
    16db:	00 22                	add    %ah,(%edx)
    16dd:	00 00                	add    %al,(%eax)
    16df:	00 00                	add    %al,(%eax)
    16e1:	00 00                	add    %al,(%eax)
    16e3:	00 44 00 53          	add    %al,0x53(%eax,%eax,1)
    16e7:	00 24 00             	add    %ah,(%eax,%eax,1)
    16ea:	00 00                	add    %al,(%eax)
    16ec:	00 00                	add    %al,(%eax)
    16ee:	00 00                	add    %al,(%eax)
    16f0:	44                   	inc    %esp
    16f1:	00 54 00 25          	add    %dl,0x25(%eax,%eax,1)
    16f5:	00 00                	add    %al,(%eax)
    16f7:	00 00                	add    %al,(%eax)
    16f9:	00 00                	add    %al,(%eax)
    16fb:	00 44 00 57          	add    %al,0x57(%eax,%eax,1)
    16ff:	00 27                	add    %ah,(%edi)
    1701:	00 00                	add    %al,(%eax)
    1703:	00 00                	add    %al,(%eax)
    1705:	00 00                	add    %al,(%eax)
    1707:	00 44 00 57          	add    %al,0x57(%eax,%eax,1)
    170b:	00 2a                	add    %ch,(%edx)
    170d:	00 00                	add    %al,(%eax)
    170f:	00 00                	add    %al,(%eax)
    1711:	00 00                	add    %al,(%eax)
    1713:	00 44 00 5a          	add    %al,0x5a(%eax,%eax,1)
    1717:	00 36                	add    %dh,(%esi)
    1719:	00 00                	add    %al,(%eax)
    171b:	00 00                	add    %al,(%eax)
    171d:	00 00                	add    %al,(%eax)
    171f:	00 44 00 5b          	add    %al,0x5b(%eax,%eax,1)
    1723:	00 44 00 00          	add    %al,0x0(%eax,%eax,1)
    1727:	00 00                	add    %al,(%eax)
    1729:	00 00                	add    %al,(%eax)
    172b:	00 44 00 5b          	add    %al,0x5b(%eax,%eax,1)
    172f:	00 49 00             	add    %cl,0x0(%ecx)
    1732:	00 00                	add    %al,(%eax)
    1734:	00 00                	add    %al,(%eax)
    1736:	00 00                	add    %al,(%eax)
    1738:	44                   	inc    %esp
    1739:	00 5b 00             	add    %bl,0x0(%ebx)
    173c:	4b                   	dec    %ebx
    173d:	00 00                	add    %al,(%eax)
    173f:	00 00                	add    %al,(%eax)
    1741:	00 00                	add    %al,(%eax)
    1743:	00 44 00 5b          	add    %al,0x5b(%eax,%eax,1)
    1747:	00 4f 00             	add    %cl,0x0(%edi)
    174a:	00 00                	add    %al,(%eax)
    174c:	00 00                	add    %al,(%eax)
    174e:	00 00                	add    %al,(%eax)
    1750:	44                   	inc    %esp
    1751:	00 5b 00             	add    %bl,0x0(%ebx)
    1754:	50                   	push   %eax
    1755:	00 00                	add    %al,(%eax)
    1757:	00 00                	add    %al,(%eax)
    1759:	00 00                	add    %al,(%eax)
    175b:	00 44 00 5b          	add    %al,0x5b(%eax,%eax,1)
    175f:	00 51 00             	add    %dl,0x0(%ecx)
    1762:	00 00                	add    %al,(%eax)
    1764:	00 00                	add    %al,(%eax)
    1766:	00 00                	add    %al,(%eax)
    1768:	44                   	inc    %esp
    1769:	00 5e 00             	add    %bl,0x0(%esi)
    176c:	56                   	push   %esi
    176d:	00 00                	add    %al,(%eax)
    176f:	00 00                	add    %al,(%eax)
    1771:	00 00                	add    %al,(%eax)
    1773:	00 44 00 5f          	add    %al,0x5f(%eax,%eax,1)
    1777:	00 64 00 00          	add    %ah,0x0(%eax,%eax,1)
    177b:	00 00                	add    %al,(%eax)
    177d:	00 00                	add    %al,(%eax)
    177f:	00 44 00 5f          	add    %al,0x5f(%eax,%eax,1)
    1783:	00 69 00             	add    %ch,0x0(%ecx)
    1786:	00 00                	add    %al,(%eax)
    1788:	00 00                	add    %al,(%eax)
    178a:	00 00                	add    %al,(%eax)
    178c:	44                   	inc    %esp
    178d:	00 5f 00             	add    %bl,0x0(%edi)
    1790:	6b 00 00             	imul   $0x0,(%eax),%eax
    1793:	00 00                	add    %al,(%eax)
    1795:	00 00                	add    %al,(%eax)
    1797:	00 44 00 5f          	add    %al,0x5f(%eax,%eax,1)
    179b:	00 6f 00             	add    %ch,0x0(%edi)
    179e:	00 00                	add    %al,(%eax)
    17a0:	00 00                	add    %al,(%eax)
    17a2:	00 00                	add    %al,(%eax)
    17a4:	44                   	inc    %esp
    17a5:	00 5f 00             	add    %bl,0x0(%edi)
    17a8:	70 00                	jo     17aa <bootmain-0x27e856>
    17aa:	00 00                	add    %al,(%eax)
    17ac:	00 00                	add    %al,(%eax)
    17ae:	00 00                	add    %al,(%eax)
    17b0:	44                   	inc    %esp
    17b1:	00 5f 00             	add    %bl,0x0(%edi)
    17b4:	71 00                	jno    17b6 <bootmain-0x27e84a>
    17b6:	00 00                	add    %al,(%eax)
    17b8:	00 00                	add    %al,(%eax)
    17ba:	00 00                	add    %al,(%eax)
    17bc:	44                   	inc    %esp
    17bd:	00 63 00             	add    %ah,0x0(%ebx)
    17c0:	76 00                	jbe    17c2 <bootmain-0x27e83e>
    17c2:	00 00                	add    %al,(%eax)
    17c4:	00 00                	add    %al,(%eax)
    17c6:	00 00                	add    %al,(%eax)
    17c8:	44                   	inc    %esp
    17c9:	00 63 00             	add    %ah,0x0(%ebx)
    17cc:	7a 00                	jp     17ce <bootmain-0x27e832>
    17ce:	00 00                	add    %al,(%eax)
    17d0:	00 00                	add    %al,(%eax)
    17d2:	00 00                	add    %al,(%eax)
    17d4:	44                   	inc    %esp
    17d5:	00 63 00             	add    %ah,0x0(%ebx)
    17d8:	7d 00                	jge    17da <bootmain-0x27e826>
    17da:	00 00                	add    %al,(%eax)
    17dc:	00 00                	add    %al,(%eax)
    17de:	00 00                	add    %al,(%eax)
    17e0:	44                   	inc    %esp
    17e1:	00 63 00             	add    %ah,0x0(%ebx)
    17e4:	81 00 00 00 00 00    	addl   $0x0,(%eax)
    17ea:	00 00                	add    %al,(%eax)
    17ec:	44                   	inc    %esp
    17ed:	00 63 00             	add    %ah,0x0(%ebx)
    17f0:	82 00 00             	addb   $0x0,(%eax)
    17f3:	00 00                	add    %al,(%eax)
    17f5:	00 00                	add    %al,(%eax)
    17f7:	00 44 00 68          	add    %al,0x68(%eax,%eax,1)
    17fb:	00 87 00 00 00 00    	add    %al,0x0(%edi)
    1801:	00 00                	add    %al,(%eax)
    1803:	00 44 00 67          	add    %al,0x67(%eax,%eax,1)
    1807:	00 8a 00 00 00 00    	add    %cl,0x0(%edx)
    180d:	00 00                	add    %al,(%eax)
    180f:	00 44 00 68          	add    %al,0x68(%eax,%eax,1)
    1813:	00 8d 00 00 00 00    	add    %cl,0x0(%ebp)
    1819:	00 00                	add    %al,(%eax)
    181b:	00 44 00 6b          	add    %al,0x6b(%eax,%eax,1)
    181f:	00 95 00 00 00 00    	add    %dl,0x0(%ebp)
    1825:	00 00                	add    %al,(%eax)
    1827:	00 44 00 6c          	add    %al,0x6c(%eax,%eax,1)
    182b:	00 98 00 00 00 87    	add    %bl,-0x79000000(%eax)
    1831:	09 00                	or     %eax,(%eax)
    1833:	00 40 00             	add    %al,0x0(%eax)
    1836:	00 00                	add    %al,(%eax)
    1838:	07                   	pop    %es
    1839:	00 00                	add    %al,(%eax)
    183b:	00 99 09 00 00 80    	add    %bl,-0x7ffffff7(%ecx)
    1841:	00 00                	add    %al,(%eax)
    1843:	00 f6                	add    %dh,%dh
    1845:	ff                   	(bad)  
    1846:	ff                   	(bad)  
    1847:	ff a6 09 00 00 40    	jmp    *0x40000009(%esi)
    184d:	00 00                	add    %al,(%eax)
    184f:	00 03                	add    %al,(%ebx)
    1851:	00 00                	add    %al,(%eax)
    1853:	00 00                	add    %al,(%eax)
    1855:	00 00                	add    %al,(%eax)
    1857:	00 c0                	add    %al,%al
	...
    1861:	00 00                	add    %al,(%eax)
    1863:	00 e0                	add    %ah,%al
    1865:	00 00                	add    %al,(%eax)
    1867:	00 a0 00 00 00 b1    	add    %ah,-0x4f000000(%eax)
    186d:	09 00                	or     %eax,(%eax)
    186f:	00 24 00             	add    %ah,(%eax,%eax,1)
    1872:	00 00                	add    %al,(%eax)
    1874:	8f 0a 28 00          	(bad)
    1878:	c3                   	ret    
    1879:	09 00                	or     %eax,(%eax)
    187b:	00 a0 00 00 00 08    	add    %ah,0x8000000(%eax)
    1881:	00 00                	add    %al,(%eax)
    1883:	00 3f                	add    %bh,(%edi)
    1885:	08 00                	or     %al,(%eax)
    1887:	00 a0 00 00 00 0c    	add    %ah,0xc000000(%eax)
    188d:	00 00                	add    %al,(%eax)
    188f:	00 00                	add    %al,(%eax)
    1891:	00 00                	add    %al,(%eax)
    1893:	00 44 00 06          	add    %al,0x6(%eax,%eax,1)
	...
    189f:	00 44 00 08          	add    %al,0x8(%eax,%eax,1)
    18a3:	00 0e                	add    %cl,(%esi)
    18a5:	00 00                	add    %al,(%eax)
    18a7:	00 00                	add    %al,(%eax)
    18a9:	00 00                	add    %al,(%eax)
    18ab:	00 44 00 06          	add    %al,0x6(%eax,%eax,1)
    18af:	00 11                	add    %dl,(%ecx)
    18b1:	00 00                	add    %al,(%eax)
    18b3:	00 00                	add    %al,(%eax)
    18b5:	00 00                	add    %al,(%eax)
    18b7:	00 44 00 08          	add    %al,0x8(%eax,%eax,1)
    18bb:	00 14 00             	add    %dl,(%eax,%eax,1)
    18be:	00 00                	add    %al,(%eax)
    18c0:	00 00                	add    %al,(%eax)
    18c2:	00 00                	add    %al,(%eax)
    18c4:	44                   	inc    %esp
    18c5:	00 09                	add    %cl,(%ecx)
    18c7:	00 24 00             	add    %ah,(%eax,%eax,1)
    18ca:	00 00                	add    %al,(%eax)
    18cc:	00 00                	add    %al,(%eax)
    18ce:	00 00                	add    %al,(%eax)
    18d0:	44                   	inc    %esp
    18d1:	00 0b                	add    %cl,(%ebx)
    18d3:	00 41 00             	add    %al,0x0(%ecx)
    18d6:	00 00                	add    %al,(%eax)
    18d8:	cc                   	int3   
    18d9:	09 00                	or     %eax,(%eax)
    18db:	00 80 00 00 00 da    	add    %al,-0x26000000(%eax)
    18e1:	ff                   	(bad)  
    18e2:	ff                   	(bad)  
    18e3:	ff 00                	incl   (%eax)
    18e5:	00 00                	add    %al,(%eax)
    18e7:	00 c0                	add    %al,%al
	...
    18f1:	00 00                	add    %al,(%eax)
    18f3:	00 e0                	add    %ah,%al
    18f5:	00 00                	add    %al,(%eax)
    18f7:	00 49 00             	add    %cl,0x0(%ecx)
    18fa:	00 00                	add    %al,(%eax)
    18fc:	00 00                	add    %al,(%eax)
    18fe:	00 00                	add    %al,(%eax)
    1900:	64 00 00             	add    %al,%fs:(%eax)
    1903:	00 d8                	add    %bl,%al
    1905:	0a 28                	or     (%eax),%ch
    1907:	00 d7                	add    %dl,%bh
    1909:	09 00                	or     %eax,(%eax)
    190b:	00 64 00 02          	add    %ah,0x2(%eax,%eax,1)
    190f:	00 d8                	add    %bl,%al
    1911:	0a 28                	or     (%eax),%ch
    1913:	00 08                	add    %cl,(%eax)
    1915:	00 00                	add    %al,(%eax)
    1917:	00 3c 00             	add    %bh,(%eax,%eax,1)
    191a:	00 00                	add    %al,(%eax)
    191c:	00 00                	add    %al,(%eax)
    191e:	00 00                	add    %al,(%eax)
    1920:	e0 09                	loopne 192b <bootmain-0x27e6d5>
    1922:	00 00                	add    %al,(%eax)
    1924:	24 00                	and    $0x0,%al
    1926:	00 00                	add    %al,(%eax)
    1928:	d8 0a                	fmuls  (%edx)
    192a:	28 00                	sub    %al,(%eax)
    192c:	b2 01                	mov    $0x1,%dl
    192e:	00 00                	add    %al,(%eax)
    1930:	80 00 00             	addb   $0x0,(%eax)
    1933:	00 00                	add    %al,(%eax)
    1935:	00 00                	add    %al,(%eax)
    1937:	00 fa                	add    %bh,%dl
    1939:	09 00                	or     %eax,(%eax)
    193b:	00 a0 00 00 00 08    	add    %ah,0x8000000(%eax)
    1941:	00 00                	add    %al,(%eax)
    1943:	00 21                	add    %ah,(%ecx)
    1945:	0a 00                	or     (%eax),%al
    1947:	00 a0 00 00 00 0c    	add    %ah,0xc000000(%eax)
    194d:	00 00                	add    %al,(%eax)
    194f:	00 43 0a             	add    %al,0xa(%ebx)
    1952:	00 00                	add    %al,(%eax)
    1954:	a0 00 00 00 10       	mov    0x10000000,%al
    1959:	00 00                	add    %al,(%eax)
    195b:	00 6e 0a             	add    %ch,0xa(%esi)
    195e:	00 00                	add    %al,(%eax)
    1960:	a0 00 00 00 14       	mov    0x14000000,%al
    1965:	00 00                	add    %al,(%eax)
    1967:	00 78 0a             	add    %bh,0xa(%eax)
    196a:	00 00                	add    %al,(%eax)
    196c:	80 00 00             	addb   $0x0,(%eax)
    196f:	00 00                	add    %al,(%eax)
    1971:	00 00                	add    %al,(%eax)
    1973:	00 3a                	add    %bh,(%edx)
    1975:	0b 00                	or     (%eax),%eax
    1977:	00 80 00 00 00 00    	add    %al,0x0(%eax)
    197d:	00 00                	add    %al,(%eax)
    197f:	00 4e 0b             	add    %cl,0xb(%esi)
    1982:	00 00                	add    %al,(%eax)
    1984:	80 00 00             	addb   $0x0,(%eax)
    1987:	00 00                	add    %al,(%eax)
    1989:	00 00                	add    %al,(%eax)
    198b:	00 59 0b             	add    %bl,0xb(%ecx)
    198e:	00 00                	add    %al,(%eax)
    1990:	80 00 00             	addb   $0x0,(%eax)
    1993:	00 00                	add    %al,(%eax)
    1995:	00 00                	add    %al,(%eax)
    1997:	00 6a 0b             	add    %ch,0xb(%edx)
    199a:	00 00                	add    %al,(%eax)
    199c:	80 00 00             	addb   $0x0,(%eax)
	...
    19a7:	00 44 00 31          	add    %al,0x31(%eax,%eax,1)
	...
    19b3:	00 44 00 31          	add    %al,0x31(%eax,%eax,1)
    19b7:	00 0c 00             	add    %cl,(%eax,%eax,1)
    19ba:	00 00                	add    %al,(%eax)
    19bc:	00 00                	add    %al,(%eax)
    19be:	00 00                	add    %al,(%eax)
    19c0:	44                   	inc    %esp
    19c1:	00 32                	add    %dh,(%edx)
    19c3:	00 12                	add    %dl,(%edx)
    19c5:	00 00                	add    %al,(%eax)
    19c7:	00 00                	add    %al,(%eax)
    19c9:	00 00                	add    %al,(%eax)
    19cb:	00 44 00 33          	add    %al,0x33(%eax,%eax,1)
    19cf:	00 1a                	add    %bl,(%edx)
    19d1:	00 00                	add    %al,(%eax)
    19d3:	00 00                	add    %al,(%eax)
    19d5:	00 00                	add    %al,(%eax)
    19d7:	00 44 00 34          	add    %al,0x34(%eax,%eax,1)
    19db:	00 20                	add    %ah,(%eax)
    19dd:	00 00                	add    %al,(%eax)
    19df:	00 00                	add    %al,(%eax)
    19e1:	00 00                	add    %al,(%eax)
    19e3:	00 44 00 38          	add    %al,0x38(%eax,%eax,1)
    19e7:	00 23                	add    %ah,(%ebx)
    19e9:	00 00                	add    %al,(%eax)
    19eb:	00 00                	add    %al,(%eax)
    19ed:	00 00                	add    %al,(%eax)
    19ef:	00 44 00 36          	add    %al,0x36(%eax,%eax,1)
    19f3:	00 25 00 00 00 00    	add    %ah,0x0
    19f9:	00 00                	add    %al,(%eax)
    19fb:	00 44 00 3a          	add    %al,0x3a(%eax,%eax,1)
    19ff:	00 28                	add    %ch,(%eax)
    1a01:	00 00                	add    %al,(%eax)
    1a03:	00 00                	add    %al,(%eax)
    1a05:	00 00                	add    %al,(%eax)
    1a07:	00 44 00 38          	add    %al,0x38(%eax,%eax,1)
    1a0b:	00 2b                	add    %ch,(%ebx)
    1a0d:	00 00                	add    %al,(%eax)
    1a0f:	00 00                	add    %al,(%eax)
    1a11:	00 00                	add    %al,(%eax)
    1a13:	00 44 00 37          	add    %al,0x37(%eax,%eax,1)
    1a17:	00 2e                	add    %ch,(%esi)
    1a19:	00 00                	add    %al,(%eax)
    1a1b:	00 00                	add    %al,(%eax)
    1a1d:	00 00                	add    %al,(%eax)
    1a1f:	00 44 00 3b          	add    %al,0x3b(%eax,%eax,1)
    1a23:	00 32                	add    %dh,(%edx)
    1a25:	00 00                	add    %al,(%eax)
    1a27:	00 00                	add    %al,(%eax)
    1a29:	00 00                	add    %al,(%eax)
    1a2b:	00 44 00 38          	add    %al,0x38(%eax,%eax,1)
    1a2f:	00 35 00 00 00 00    	add    %dh,0x0
    1a35:	00 00                	add    %al,(%eax)
    1a37:	00 44 00 3b          	add    %al,0x3b(%eax,%eax,1)
    1a3b:	00 37                	add    %dh,(%edi)
    1a3d:	00 00                	add    %al,(%eax)
    1a3f:	00 00                	add    %al,(%eax)
    1a41:	00 00                	add    %al,(%eax)
    1a43:	00 44 00 38          	add    %al,0x38(%eax,%eax,1)
    1a47:	00 3a                	add    %bh,(%edx)
    1a49:	00 00                	add    %al,(%eax)
    1a4b:	00 00                	add    %al,(%eax)
    1a4d:	00 00                	add    %al,(%eax)
    1a4f:	00 44 00 39          	add    %al,0x39(%eax,%eax,1)
    1a53:	00 3d 00 00 00 00    	add    %bh,0x0
    1a59:	00 00                	add    %al,(%eax)
    1a5b:	00 44 00 3a          	add    %al,0x3a(%eax,%eax,1)
    1a5f:	00 42 00             	add    %al,0x0(%edx)
    1a62:	00 00                	add    %al,(%eax)
    1a64:	00 00                	add    %al,(%eax)
    1a66:	00 00                	add    %al,(%eax)
    1a68:	44                   	inc    %esp
    1a69:	00 3a                	add    %bh,(%edx)
    1a6b:	00 47 00             	add    %al,0x0(%edi)
    1a6e:	00 00                	add    %al,(%eax)
    1a70:	00 00                	add    %al,(%eax)
    1a72:	00 00                	add    %al,(%eax)
    1a74:	44                   	inc    %esp
    1a75:	00 3a                	add    %bh,(%edx)
    1a77:	00 4a 00             	add    %cl,0x0(%edx)
    1a7a:	00 00                	add    %al,(%eax)
    1a7c:	00 00                	add    %al,(%eax)
    1a7e:	00 00                	add    %al,(%eax)
    1a80:	44                   	inc    %esp
    1a81:	00 3d 00 4f 00 00    	add    %bh,0x4f00
    1a87:	00 76 0b             	add    %dh,0xb(%esi)
    1a8a:	00 00                	add    %al,(%eax)
    1a8c:	40                   	inc    %eax
    1a8d:	00 00                	add    %al,(%eax)
    1a8f:	00 02                	add    %al,(%edx)
    1a91:	00 00                	add    %al,(%eax)
    1a93:	00 80 0b 00 00 40    	add    %al,0x4000000b(%eax)
    1a99:	00 00                	add    %al,(%eax)
    1a9b:	00 03                	add    %al,(%ebx)
    1a9d:	00 00                	add    %al,(%eax)
    1a9f:	00 8d 0b 00 00 40    	add    %cl,0x4000000b(%ebp)
    1aa5:	00 00                	add    %al,(%eax)
    1aa7:	00 01                	add    %al,(%ecx)
    1aa9:	00 00                	add    %al,(%eax)
    1aab:	00 99 0b 00 00 40    	add    %bl,0x4000000b(%ecx)
    1ab1:	00 00                	add    %al,(%eax)
    1ab3:	00 07                	add    %al,(%edi)
    1ab5:	00 00                	add    %al,(%eax)
    1ab7:	00 a3 0b 00 00 24    	add    %ah,0x2400000b(%ebx)
    1abd:	00 00                	add    %al,(%eax)
    1abf:	00 2c 0b             	add    %ch,(%ebx,%ecx,1)
    1ac2:	28 00                	sub    %al,(%eax)
    1ac4:	b7 0b                	mov    $0xb,%bh
    1ac6:	00 00                	add    %al,(%eax)
    1ac8:	a0 00 00 00 08       	mov    0x8000000,%al
    1acd:	00 00                	add    %al,(%eax)
    1acf:	00 db                	add    %bl,%bl
    1ad1:	0b 00                	or     (%eax),%eax
    1ad3:	00 a0 00 00 00 0c    	add    %ah,0xc000000(%eax)
    1ad9:	00 00                	add    %al,(%eax)
    1adb:	00 e9                	add    %ch,%cl
    1add:	0b 00                	or     (%eax),%eax
    1adf:	00 a0 00 00 00 10    	add    %ah,0x10000000(%eax)
    1ae5:	00 00                	add    %al,(%eax)
    1ae7:	00 6e 0a             	add    %ch,0xa(%esi)
    1aea:	00 00                	add    %al,(%eax)
    1aec:	a0 00 00 00 14       	mov    0x14000000,%al
    1af1:	00 00                	add    %al,(%eax)
    1af3:	00 f9                	add    %bh,%cl
    1af5:	0b 00                	or     (%eax),%eax
    1af7:	00 80 00 00 00 00    	add    %al,0x0(%eax)
    1afd:	00 00                	add    %al,(%eax)
    1aff:	00 00                	add    %al,(%eax)
    1b01:	00 00                	add    %al,(%eax)
    1b03:	00 44 00 3f          	add    %al,0x3f(%eax,%eax,1)
	...
    1b0f:	00 44 00 3f          	add    %al,0x3f(%eax,%eax,1)
    1b13:	00 03                	add    %al,(%ebx)
    1b15:	00 00                	add    %al,(%eax)
    1b17:	00 00                	add    %al,(%eax)
    1b19:	00 00                	add    %al,(%eax)
    1b1b:	00 44 00 41          	add    %al,0x41(%eax,%eax,1)
    1b1f:	00 06                	add    %al,(%esi)
    1b21:	00 00                	add    %al,(%eax)
    1b23:	00 00                	add    %al,(%eax)
    1b25:	00 00                	add    %al,(%eax)
    1b27:	00 44 00 3f          	add    %al,0x3f(%eax,%eax,1)
    1b2b:	00 09                	add    %cl,(%ecx)
    1b2d:	00 00                	add    %al,(%eax)
    1b2f:	00 00                	add    %al,(%eax)
    1b31:	00 00                	add    %al,(%eax)
    1b33:	00 44 00 41          	add    %al,0x41(%eax,%eax,1)
    1b37:	00 0c 00             	add    %cl,(%eax,%eax,1)
    1b3a:	00 00                	add    %al,(%eax)
    1b3c:	00 00                	add    %al,(%eax)
    1b3e:	00 00                	add    %al,(%eax)
    1b40:	44                   	inc    %esp
    1b41:	00 42 00             	add    %al,0x0(%edx)
    1b44:	10 00                	adc    %al,(%eax)
    1b46:	00 00                	add    %al,(%eax)
    1b48:	00 00                	add    %al,(%eax)
    1b4a:	00 00                	add    %al,(%eax)
    1b4c:	44                   	inc    %esp
    1b4d:	00 40 00             	add    %al,0x0(%eax)
    1b50:	13 00                	adc    (%eax),%eax
    1b52:	00 00                	add    %al,(%eax)
    1b54:	00 00                	add    %al,(%eax)
    1b56:	00 00                	add    %al,(%eax)
    1b58:	44                   	inc    %esp
    1b59:	00 44 00 16          	add    %al,0x16(%eax,%eax,1)
    1b5d:	00 00                	add    %al,(%eax)
    1b5f:	00 00                	add    %al,(%eax)
    1b61:	00 00                	add    %al,(%eax)
    1b63:	00 44 00 42          	add    %al,0x42(%eax,%eax,1)
    1b67:	00 19                	add    %bl,(%ecx)
    1b69:	00 00                	add    %al,(%eax)
    1b6b:	00 00                	add    %al,(%eax)
    1b6d:	00 00                	add    %al,(%eax)
    1b6f:	00 44 00 44          	add    %al,0x44(%eax,%eax,1)
    1b73:	00 1b                	add    %bl,(%ebx)
    1b75:	00 00                	add    %al,(%eax)
    1b77:	00 00                	add    %al,(%eax)
    1b79:	00 00                	add    %al,(%eax)
    1b7b:	00 44 00 42          	add    %al,0x42(%eax,%eax,1)
    1b7f:	00 1f                	add    %bl,(%edi)
    1b81:	00 00                	add    %al,(%eax)
    1b83:	00 00                	add    %al,(%eax)
    1b85:	00 00                	add    %al,(%eax)
    1b87:	00 44 00 46          	add    %al,0x46(%eax,%eax,1)
    1b8b:	00 23                	add    %ah,(%ebx)
    1b8d:	00 00                	add    %al,(%eax)
    1b8f:	00 83 0c 00 00 40    	add    %al,0x4000000c(%ebx)
    1b95:	00 00                	add    %al,(%eax)
    1b97:	00 00                	add    %al,(%eax)
    1b99:	00 00                	add    %al,(%eax)
    1b9b:	00 8d 0c 00 00 40    	add    %cl,0x4000000c(%ebp)
    1ba1:	00 00                	add    %al,(%eax)
    1ba3:	00 02                	add    %al,(%edx)
    1ba5:	00 00                	add    %al,(%eax)
    1ba7:	00 9b 0c 00 00 40    	add    %bl,0x4000000c(%ebx)
    1bad:	00 00                	add    %al,(%eax)
    1baf:	00 01                	add    %al,(%ecx)
    1bb1:	00 00                	add    %al,(%eax)
    1bb3:	00 ab 0c 00 00 24    	add    %ch,0x2400000c(%ebx)
    1bb9:	00 00                	add    %al,(%eax)
    1bbb:	00 51 0b             	add    %dl,0xb(%ecx)
    1bbe:	28 00                	sub    %al,(%eax)
    1bc0:	00 00                	add    %al,(%eax)
    1bc2:	00 00                	add    %al,(%eax)
    1bc4:	44                   	inc    %esp
    1bc5:	00 48 00             	add    %cl,0x0(%eax)
	...
    1bd0:	44                   	inc    %esp
    1bd1:	00 4f 00             	add    %cl,0x0(%edi)
    1bd4:	15 00 00 00 00       	adc    $0x0,%eax
    1bd9:	00 00                	add    %al,(%eax)
    1bdb:	00 44 00 4e          	add    %al,0x4e(%eax,%eax,1)
    1bdf:	00 1c 00             	add    %bl,(%eax,%eax,1)
    1be2:	00 00                	add    %al,(%eax)
    1be4:	00 00                	add    %al,(%eax)
    1be6:	00 00                	add    %al,(%eax)
    1be8:	44                   	inc    %esp
    1be9:	00 4f 00             	add    %cl,0x0(%edi)
    1bec:	1f                   	pop    %ds
    1bed:	00 00                	add    %al,(%eax)
    1bef:	00 00                	add    %al,(%eax)
    1bf1:	00 00                	add    %al,(%eax)
    1bf3:	00 44 00 4e          	add    %al,0x4e(%eax,%eax,1)
    1bf7:	00 24 00             	add    %ah,(%eax,%eax,1)
    1bfa:	00 00                	add    %al,(%eax)
    1bfc:	00 00                	add    %al,(%eax)
    1bfe:	00 00                	add    %al,(%eax)
    1c00:	44                   	inc    %esp
    1c01:	00 51 00             	add    %dl,0x0(%ecx)
    1c04:	2f                   	das    
    1c05:	00 00                	add    %al,(%eax)
    1c07:	00 00                	add    %al,(%eax)
    1c09:	00 00                	add    %al,(%eax)
    1c0b:	00 44 00 52          	add    %al,0x52(%eax,%eax,1)
    1c0f:	00 42 00             	add    %al,0x0(%edx)
    1c12:	00 00                	add    %al,(%eax)
    1c14:	00 00                	add    %al,(%eax)
    1c16:	00 00                	add    %al,(%eax)
    1c18:	44                   	inc    %esp
    1c19:	00 53 00             	add    %dl,0x0(%ebx)
    1c1c:	58                   	pop    %eax
    1c1d:	00 00                	add    %al,(%eax)
    1c1f:	00 00                	add    %al,(%eax)
    1c21:	00 00                	add    %al,(%eax)
    1c23:	00 44 00 55          	add    %al,0x55(%eax,%eax,1)
    1c27:	00 74 00 00          	add    %dh,0x0(%eax,%eax,1)
    1c2b:	00 00                	add    %al,(%eax)
    1c2d:	00 00                	add    %al,(%eax)
    1c2f:	00 44 00 40          	add    %al,0x40(%eax,%eax,1)
    1c33:	00 8d 00 00 00 00    	add    %cl,0x0(%ebp)
    1c39:	00 00                	add    %al,(%eax)
    1c3b:	00 44 00 59          	add    %al,0x59(%eax,%eax,1)
    1c3f:	00 93 00 00 00 00    	add    %dl,0x0(%ebx)
    1c45:	00 00                	add    %al,(%eax)
    1c47:	00 44 00 42          	add    %al,0x42(%eax,%eax,1)
    1c4b:	00 96 00 00 00 00    	add    %dl,0x0(%esi)
    1c51:	00 00                	add    %al,(%eax)
    1c53:	00 44 00 59          	add    %al,0x59(%eax,%eax,1)
    1c57:	00 9d 00 00 00 00    	add    %bl,0x0(%ebp)
    1c5d:	00 00                	add    %al,(%eax)
    1c5f:	00 44 00 44          	add    %al,0x44(%eax,%eax,1)
    1c63:	00 a4 00 00 00 00 00 	add    %ah,0x0(%eax,%eax,1)
    1c6a:	00 00                	add    %al,(%eax)
    1c6c:	44                   	inc    %esp
    1c6d:	00 44 00 aa          	add    %al,-0x56(%eax,%eax,1)
    1c71:	00 00                	add    %al,(%eax)
    1c73:	00 00                	add    %al,(%eax)
    1c75:	00 00                	add    %al,(%eax)
    1c77:	00 44 00 40          	add    %al,0x40(%eax,%eax,1)
    1c7b:	00 b4 00 00 00 00 00 	add    %dh,0x0(%eax,%eax,1)
    1c82:	00 00                	add    %al,(%eax)
    1c84:	44                   	inc    %esp
    1c85:	00 5d 00             	add    %bl,0x0(%ebp)
    1c88:	b7 00                	mov    $0x0,%bh
    1c8a:	00 00                	add    %al,(%eax)
    1c8c:	00 00                	add    %al,(%eax)
    1c8e:	00 00                	add    %al,(%eax)
    1c90:	44                   	inc    %esp
    1c91:	00 41 00             	add    %al,0x0(%ecx)
    1c94:	ba 00 00 00 00       	mov    $0x0,%edx
    1c99:	00 00                	add    %al,(%eax)
    1c9b:	00 44 00 44          	add    %al,0x44(%eax,%eax,1)
    1c9f:	00 c1                	add    %al,%cl
    1ca1:	00 00                	add    %al,(%eax)
    1ca3:	00 00                	add    %al,(%eax)
    1ca5:	00 00                	add    %al,(%eax)
    1ca7:	00 44 00 5d          	add    %al,0x5d(%eax,%eax,1)
    1cab:	00 c5                	add    %al,%ch
    1cad:	00 00                	add    %al,(%eax)
    1caf:	00 00                	add    %al,(%eax)
    1cb1:	00 00                	add    %al,(%eax)
    1cb3:	00 44 00 41          	add    %al,0x41(%eax,%eax,1)
    1cb7:	00 cd                	add    %cl,%ch
    1cb9:	00 00                	add    %al,(%eax)
    1cbb:	00 00                	add    %al,(%eax)
    1cbd:	00 00                	add    %al,(%eax)
    1cbf:	00 44 00 60          	add    %al,0x60(%eax,%eax,1)
    1cc3:	00 d7                	add    %dl,%bh
    1cc5:	00 00                	add    %al,(%eax)
    1cc7:	00 00                	add    %al,(%eax)
    1cc9:	00 00                	add    %al,(%eax)
    1ccb:	00 44 00 40          	add    %al,0x40(%eax,%eax,1)
    1ccf:	00 dc                	add    %bl,%ah
    1cd1:	00 00                	add    %al,(%eax)
    1cd3:	00 00                	add    %al,(%eax)
    1cd5:	00 00                	add    %al,(%eax)
    1cd7:	00 44 00 44          	add    %al,0x44(%eax,%eax,1)
    1cdb:	00 e2                	add    %ah,%dl
    1cdd:	00 00                	add    %al,(%eax)
    1cdf:	00 00                	add    %al,(%eax)
    1ce1:	00 00                	add    %al,(%eax)
    1ce3:	00 44 00 44          	add    %al,0x44(%eax,%eax,1)
    1ce7:	00 e5                	add    %ah,%ch
    1ce9:	00 00                	add    %al,(%eax)
    1ceb:	00 00                	add    %al,(%eax)
    1ced:	00 00                	add    %al,(%eax)
    1cef:	00 44 00 40          	add    %al,0x40(%eax,%eax,1)
    1cf3:	00 eb                	add    %ch,%bl
    1cf5:	00 00                	add    %al,(%eax)
    1cf7:	00 00                	add    %al,(%eax)
    1cf9:	00 00                	add    %al,(%eax)
    1cfb:	00 44 00 41          	add    %al,0x41(%eax,%eax,1)
    1cff:	00 f1                	add    %dh,%cl
    1d01:	00 00                	add    %al,(%eax)
    1d03:	00 00                	add    %al,(%eax)
    1d05:	00 00                	add    %al,(%eax)
    1d07:	00 44 00 40          	add    %al,0x40(%eax,%eax,1)
    1d0b:	00 fb                	add    %bh,%bl
    1d0d:	00 00                	add    %al,(%eax)
    1d0f:	00 00                	add    %al,(%eax)
    1d11:	00 00                	add    %al,(%eax)
    1d13:	00 44 00 44          	add    %al,0x44(%eax,%eax,1)
    1d17:	00 01                	add    %al,(%ecx)
    1d19:	01 00                	add    %eax,(%eax)
    1d1b:	00 00                	add    %al,(%eax)
    1d1d:	00 00                	add    %al,(%eax)
    1d1f:	00 44 00 44          	add    %al,0x44(%eax,%eax,1)
    1d23:	00 04 01             	add    %al,(%ecx,%eax,1)
    1d26:	00 00                	add    %al,(%eax)
    1d28:	00 00                	add    %al,(%eax)
    1d2a:	00 00                	add    %al,(%eax)
    1d2c:	44                   	inc    %esp
    1d2d:	00 63 00             	add    %ah,0x0(%ebx)
    1d30:	0a 01                	or     (%ecx),%al
    1d32:	00 00                	add    %al,(%eax)
    1d34:	00 00                	add    %al,(%eax)
    1d36:	00 00                	add    %al,(%eax)
    1d38:	44                   	inc    %esp
    1d39:	00 65 00             	add    %ah,0x0(%ebp)
    1d3c:	1b 01                	sbb    (%ecx),%eax
    1d3e:	00 00                	add    %al,(%eax)
    1d40:	00 00                	add    %al,(%eax)
    1d42:	00 00                	add    %al,(%eax)
    1d44:	44                   	inc    %esp
    1d45:	00 66 00             	add    %ah,0x0(%esi)
    1d48:	1e                   	push   %ds
    1d49:	01 00                	add    %eax,(%eax)
    1d4b:	00 00                	add    %al,(%eax)
    1d4d:	00 00                	add    %al,(%eax)
    1d4f:	00 64 00 00          	add    %ah,0x0(%eax,%eax,1)
    1d53:	00 76 0c             	add    %dh,0xc(%esi)
    1d56:	28 00                	sub    %al,(%eax)
    1d58:	be 0c 00 00 64       	mov    $0x6400000c,%esi
    1d5d:	00 02                	add    %al,(%edx)
    1d5f:	00 76 0c             	add    %dh,0xc(%esi)
    1d62:	28 00                	sub    %al,(%eax)
    1d64:	08 00                	or     %al,(%eax)
    1d66:	00 00                	add    %al,(%eax)
    1d68:	3c 00                	cmp    $0x0,%al
    1d6a:	00 00                	add    %al,(%eax)
    1d6c:	00 00                	add    %al,(%eax)
    1d6e:	00 00                	add    %al,(%eax)
    1d70:	c4 0c 00             	les    (%eax,%eax,1),%ecx
    1d73:	00 24 00             	add    %ah,(%eax,%eax,1)
    1d76:	00 00                	add    %al,(%eax)
    1d78:	76 0c                	jbe    1d86 <bootmain-0x27e27a>
    1d7a:	28 00                	sub    %al,(%eax)
    1d7c:	b2 01                	mov    $0x1,%dl
    1d7e:	00 00                	add    %al,(%eax)
    1d80:	80 00 00             	addb   $0x0,(%eax)
	...
    1d8b:	00 44 00 09          	add    %al,0x9(%eax,%eax,1)
    1d8f:	00 00                	add    %al,(%eax)
    1d91:	00 00                	add    %al,(%eax)
    1d93:	00 49 02             	add    %cl,0x2(%ecx)
    1d96:	00 00                	add    %al,(%eax)
    1d98:	84 00                	test   %al,(%eax)
    1d9a:	00 00                	add    %al,(%eax)
    1d9c:	7b 0c                	jnp    1daa <bootmain-0x27e256>
    1d9e:	28 00                	sub    %al,(%eax)
    1da0:	00 00                	add    %al,(%eax)
    1da2:	00 00                	add    %al,(%eax)
    1da4:	44                   	inc    %esp
    1da5:	00 6b 00             	add    %ch,0x0(%ebx)
    1da8:	05 00 00 00 be       	add    $0xbe000000,%eax
    1dad:	0c 00                	or     $0x0,%al
    1daf:	00 84 00 00 00 80 0c 	add    %al,0xc800000(%eax,%eax,1)
    1db6:	28 00                	sub    %al,(%eax)
    1db8:	00 00                	add    %al,(%eax)
    1dba:	00 00                	add    %al,(%eax)
    1dbc:	44                   	inc    %esp
    1dbd:	00 09                	add    %cl,(%ecx)
    1dbf:	00 0a                	add    %cl,(%edx)
    1dc1:	00 00                	add    %al,(%eax)
    1dc3:	00 49 02             	add    %cl,0x2(%ecx)
    1dc6:	00 00                	add    %al,(%eax)
    1dc8:	84 00                	test   %al,(%eax)
    1dca:	00 00                	add    %al,(%eax)
    1dcc:	81 0c 28 00 00 00 00 	orl    $0x0,(%eax,%ebp,1)
    1dd3:	00 44 00 6b          	add    %al,0x6b(%eax,%eax,1)
    1dd7:	00 0b                	add    %cl,(%ebx)
    1dd9:	00 00                	add    %al,(%eax)
    1ddb:	00 be 0c 00 00 84    	add    %bh,-0x7bfffff4(%esi)
    1de1:	00 00                	add    %al,(%eax)
    1de3:	00 c8                	add    %cl,%al
    1de5:	0c 28                	or     $0x28,%al
    1de7:	00 00                	add    %al,(%eax)
    1de9:	00 00                	add    %al,(%eax)
    1deb:	00 44 00 1b          	add    %al,0x1b(%eax,%eax,1)
    1def:	00 52 00             	add    %dl,0x0(%edx)
    1df2:	00 00                	add    %al,(%eax)
    1df4:	da 0c 00             	fimull (%eax,%eax,1)
    1df7:	00 24 00             	add    %ah,(%eax,%eax,1)
    1dfa:	00 00                	add    %al,(%eax)
    1dfc:	cd 0c                	int    $0xc
    1dfe:	28 00                	sub    %al,(%eax)
    1e00:	ee                   	out    %al,(%dx)
    1e01:	0c 00                	or     $0x0,%al
    1e03:	00 a0 00 00 00 08    	add    %ah,0x8000000(%eax)
    1e09:	00 00                	add    %al,(%eax)
    1e0b:	00 82 04 00 00 80    	add    %al,-0x7ffffffc(%edx)
	...
    1e19:	00 00                	add    %al,(%eax)
    1e1b:	00 44 00 1e          	add    %al,0x1e(%eax,%eax,1)
    1e1f:	00 00                	add    %al,(%eax)
    1e21:	00 00                	add    %al,(%eax)
    1e23:	00 49 02             	add    %cl,0x2(%ecx)
    1e26:	00 00                	add    %al,(%eax)
    1e28:	84 00                	test   %al,(%eax)
    1e2a:	00 00                	add    %al,(%eax)
    1e2c:	ce                   	into   
    1e2d:	0c 28                	or     $0x28,%al
    1e2f:	00 00                	add    %al,(%eax)
    1e31:	00 00                	add    %al,(%eax)
    1e33:	00 44 00 6b          	add    %al,0x6b(%eax,%eax,1)
    1e37:	00 01                	add    %al,(%ecx)
    1e39:	00 00                	add    %al,(%eax)
    1e3b:	00 be 0c 00 00 84    	add    %bh,-0x7bfffff4(%esi)
    1e41:	00 00                	add    %al,(%eax)
    1e43:	00 d5                	add    %dl,%ch
    1e45:	0c 28                	or     $0x28,%al
    1e47:	00 00                	add    %al,(%eax)
    1e49:	00 00                	add    %al,(%eax)
    1e4b:	00 44 00 1e          	add    %al,0x1e(%eax,%eax,1)
    1e4f:	00 08                	add    %cl,(%eax)
    1e51:	00 00                	add    %al,(%eax)
    1e53:	00 49 02             	add    %cl,0x2(%ecx)
    1e56:	00 00                	add    %al,(%eax)
    1e58:	84 00                	test   %al,(%eax)
    1e5a:	00 00                	add    %al,(%eax)
    1e5c:	e6 0c                	out    %al,$0xc
    1e5e:	28 00                	sub    %al,(%eax)
    1e60:	00 00                	add    %al,(%eax)
    1e62:	00 00                	add    %al,(%eax)
    1e64:	44                   	inc    %esp
    1e65:	00 6b 00             	add    %ch,0x0(%ebx)
    1e68:	19 00                	sbb    %eax,(%eax)
    1e6a:	00 00                	add    %al,(%eax)
    1e6c:	00 00                	add    %al,(%eax)
    1e6e:	00 00                	add    %al,(%eax)
    1e70:	44                   	inc    %esp
    1e71:	00 52 00             	add    %dl,0x0(%edx)
    1e74:	1a 00                	sbb    (%eax),%al
    1e76:	00 00                	add    %al,(%eax)
    1e78:	be 0c 00 00 84       	mov    $0x8400000c,%esi
    1e7d:	00 00                	add    %al,(%eax)
    1e7f:	00 ed                	add    %ch,%ch
    1e81:	0c 28                	or     $0x28,%al
    1e83:	00 00                	add    %al,(%eax)
    1e85:	00 00                	add    %al,(%eax)
    1e87:	00 44 00 2f          	add    %al,0x2f(%eax,%eax,1)
    1e8b:	00 20                	add    %ah,(%eax)
    1e8d:	00 00                	add    %al,(%eax)
    1e8f:	00 00                	add    %al,(%eax)
    1e91:	00 00                	add    %al,(%eax)
    1e93:	00 44 00 35          	add    %al,0x35(%eax,%eax,1)
    1e97:	00 30                	add    %dh,(%eax)
    1e99:	00 00                	add    %al,(%eax)
    1e9b:	00 00                	add    %al,(%eax)
    1e9d:	00 00                	add    %al,(%eax)
    1e9f:	00 44 00 34          	add    %al,0x34(%eax,%eax,1)
    1ea3:	00 33                	add    %dh,(%ebx)
    1ea5:	00 00                	add    %al,(%eax)
    1ea7:	00 00                	add    %al,(%eax)
    1ea9:	00 00                	add    %al,(%eax)
    1eab:	00 44 00 35          	add    %al,0x35(%eax,%eax,1)
    1eaf:	00 36                	add    %dh,(%esi)
    1eb1:	00 00                	add    %al,(%eax)
    1eb3:	00 1f                	add    %bl,(%edi)
    1eb5:	0d 00 00 80 00       	or     $0x800000,%eax
    1eba:	00 00                	add    %al,(%eax)
    1ebc:	00 00                	add    %al,(%eax)
    1ebe:	00 00                	add    %al,(%eax)
    1ec0:	0f 05                	syscall 
    1ec2:	00 00                	add    %al,(%eax)
    1ec4:	80 00 00             	addb   $0x0,(%eax)
    1ec7:	00 00                	add    %al,(%eax)
    1ec9:	00 00                	add    %al,(%eax)
    1ecb:	00 42 0d             	add    %al,0xd(%edx)
    1ece:	00 00                	add    %al,(%eax)
    1ed0:	24 00                	and    $0x0,%al
    1ed2:	00 00                	add    %al,(%eax)
    1ed4:	05 0d 28 00 56       	add    $0x5600280d,%eax
    1ed9:	0d 00 00 a0 00       	or     $0xa00000,%eax
    1ede:	00 00                	add    %al,(%eax)
    1ee0:	08 00                	or     %al,(%eax)
    1ee2:	00 00                	add    %al,(%eax)
    1ee4:	00 00                	add    %al,(%eax)
    1ee6:	00 00                	add    %al,(%eax)
    1ee8:	44                   	inc    %esp
    1ee9:	00 53 00             	add    %dl,0x0(%ebx)
    1eec:	00 00                	add    %al,(%eax)
    1eee:	00 00                	add    %al,(%eax)
    1ef0:	49                   	dec    %ecx
    1ef1:	02 00                	add    (%eax),%al
    1ef3:	00 84 00 00 00 06 0d 	add    %al,0xd060000(%eax,%eax,1)
    1efa:	28 00                	sub    %al,(%eax)
    1efc:	00 00                	add    %al,(%eax)
    1efe:	00 00                	add    %al,(%eax)
    1f00:	44                   	inc    %esp
    1f01:	00 6b 00             	add    %ch,0x0(%ebx)
    1f04:	01 00                	add    %eax,(%eax)
    1f06:	00 00                	add    %al,(%eax)
    1f08:	be 0c 00 00 84       	mov    $0x8400000c,%esi
    1f0d:	00 00                	add    %al,(%eax)
    1f0f:	00 0d 0d 28 00 00    	add    %cl,0x280d
    1f15:	00 00                	add    %al,(%eax)
    1f17:	00 44 00 53          	add    %al,0x53(%eax,%eax,1)
    1f1b:	00 08                	add    %cl,(%eax)
    1f1d:	00 00                	add    %al,(%eax)
    1f1f:	00 49 02             	add    %cl,0x2(%ecx)
    1f22:	00 00                	add    %al,(%eax)
    1f24:	84 00                	test   %al,(%eax)
    1f26:	00 00                	add    %al,(%eax)
    1f28:	1e                   	push   %ds
    1f29:	0d 28 00 00 00       	or     $0x28,%eax
    1f2e:	00 00                	add    %al,(%eax)
    1f30:	44                   	inc    %esp
    1f31:	00 6b 00             	add    %ch,0x0(%ebx)
    1f34:	19 00                	sbb    %eax,(%eax)
    1f36:	00 00                	add    %al,(%eax)
    1f38:	00 00                	add    %al,(%eax)
    1f3a:	00 00                	add    %al,(%eax)
    1f3c:	44                   	inc    %esp
    1f3d:	00 52 00             	add    %dl,0x0(%edx)
    1f40:	22 00                	and    (%eax),%al
    1f42:	00 00                	add    %al,(%eax)
    1f44:	be 0c 00 00 84       	mov    $0x8400000c,%esi
    1f49:	00 00                	add    %al,(%eax)
    1f4b:	00 2d 0d 28 00 00    	add    %ch,0x280d
    1f51:	00 00                	add    %al,(%eax)
    1f53:	00 44 00 58          	add    %al,0x58(%eax,%eax,1)
    1f57:	00 28                	add    %ch,(%eax)
    1f59:	00 00                	add    %al,(%eax)
    1f5b:	00 00                	add    %al,(%eax)
    1f5d:	00 00                	add    %al,(%eax)
    1f5f:	00 44 00 61          	add    %al,0x61(%eax,%eax,1)
    1f63:	00 38                	add    %bh,(%eax)
    1f65:	00 00                	add    %al,(%eax)
    1f67:	00 00                	add    %al,(%eax)
    1f69:	00 00                	add    %al,(%eax)
    1f6b:	00 44 00 59          	add    %al,0x59(%eax,%eax,1)
    1f6f:	00 3b                	add    %bh,(%ebx)
    1f71:	00 00                	add    %al,(%eax)
    1f73:	00 00                	add    %al,(%eax)
    1f75:	00 00                	add    %al,(%eax)
    1f77:	00 44 00 61          	add    %al,0x61(%eax,%eax,1)
    1f7b:	00 3e                	add    %bh,(%esi)
    1f7d:	00 00                	add    %al,(%eax)
    1f7f:	00 61 0d             	add    %ah,0xd(%ecx)
    1f82:	00 00                	add    %al,(%eax)
    1f84:	20 00                	and    %al,(%eax)
    1f86:	00 00                	add    %al,(%eax)
    1f88:	00 00                	add    %al,(%eax)
    1f8a:	00 00                	add    %al,(%eax)
    1f8c:	7b 0d                	jnp    1f9b <bootmain-0x27e065>
    1f8e:	00 00                	add    %al,(%eax)
    1f90:	80 00 00             	addb   $0x0,(%eax)
    1f93:	00 00                	add    %al,(%eax)
    1f95:	00 00                	add    %al,(%eax)
    1f97:	00 f5                	add    %dh,%ch
    1f99:	0d 00 00 20 00       	or     $0x200000,%eax
    1f9e:	00 00                	add    %al,(%eax)
    1fa0:	00 00                	add    %al,(%eax)
    1fa2:	00 00                	add    %al,(%eax)
    1fa4:	04 0e                	add    $0xe,%al
    1fa6:	00 00                	add    %al,(%eax)
    1fa8:	20 00                	and    %al,(%eax)
    1faa:	00 00                	add    %al,(%eax)
    1fac:	00 00                	add    %al,(%eax)
    1fae:	00 00                	add    %al,(%eax)
    1fb0:	1c 0e                	sbb    $0xe,%al
    1fb2:	00 00                	add    %al,(%eax)
    1fb4:	80 00 00             	addb   $0x0,(%eax)
	...
    1fbf:	00 64 00 00          	add    %ah,0x0(%eax,%eax,1)
    1fc3:	00 45 0d             	add    %al,0xd(%ebp)
    1fc6:	28 00                	sub    %al,(%eax)
    1fc8:	a3 0e 00 00 64       	mov    %eax,0x6400000e
    1fcd:	00 00                	add    %al,(%eax)
    1fcf:	00 45 0d             	add    %al,0xd(%ebp)
    1fd2:	28 00                	sub    %al,(%eax)
    1fd4:	b3 0e                	mov    $0xe,%bl
    1fd6:	00 00                	add    %al,(%eax)
    1fd8:	84 00                	test   %al,(%eax)
    1fda:	00 00                	add    %al,(%eax)
    1fdc:	45                   	inc    %ebp
    1fdd:	0d 28 00 00 00       	or     $0x28,%eax
    1fe2:	00 00                	add    %al,(%eax)
    1fe4:	44                   	inc    %esp
    1fe5:	00 08                	add    %cl,(%eax)
    1fe7:	00 45 0d             	add    %al,0xd(%ebp)
    1fea:	28 00                	sub    %al,(%eax)
    1fec:	00 00                	add    %al,(%eax)
    1fee:	00 00                	add    %al,(%eax)
    1ff0:	44                   	inc    %esp
    1ff1:	00 09                	add    %cl,(%ecx)
    1ff3:	00 47 0d             	add    %al,0xd(%edi)
    1ff6:	28 00                	sub    %al,(%eax)
    1ff8:	00 00                	add    %al,(%eax)
    1ffa:	00 00                	add    %al,(%eax)
    1ffc:	44                   	inc    %esp
    1ffd:	00 0a                	add    %cl,(%edx)
    1fff:	00 49 0d             	add    %cl,0xd(%ecx)
    2002:	28 00                	sub    %al,(%eax)
    2004:	00 00                	add    %al,(%eax)
    2006:	00 00                	add    %al,(%eax)
    2008:	44                   	inc    %esp
    2009:	00 0b                	add    %cl,(%ebx)
    200b:	00 4a 0d             	add    %cl,0xd(%edx)
    200e:	28 00                	sub    %al,(%eax)
    2010:	00 00                	add    %al,(%eax)
    2012:	00 00                	add    %al,(%eax)
    2014:	44                   	inc    %esp
    2015:	00 0c 00             	add    %cl,(%eax,%eax,1)
    2018:	4c                   	dec    %esp
    2019:	0d 28 00 00 00       	or     $0x28,%eax
    201e:	00 00                	add    %al,(%eax)
    2020:	44                   	inc    %esp
    2021:	00 0d 00 4d 0d 28    	add    %cl,0x280d4d00
    2027:	00 00                	add    %al,(%eax)
    2029:	00 00                	add    %al,(%eax)
    202b:	00 44 00 0e          	add    %al,0xe(%eax,%eax,1)
    202f:	00 50 0d             	add    %dl,0xd(%eax)
    2032:	28 00                	sub    %al,(%eax)
    2034:	00 00                	add    %al,(%eax)
    2036:	00 00                	add    %al,(%eax)
    2038:	44                   	inc    %esp
    2039:	00 0f                	add    %cl,(%edi)
    203b:	00 52 0d             	add    %dl,0xd(%edx)
    203e:	28 00                	sub    %al,(%eax)
    2040:	00 00                	add    %al,(%eax)
    2042:	00 00                	add    %al,(%eax)
    2044:	44                   	inc    %esp
    2045:	00 10                	add    %dl,(%eax)
    2047:	00 54 0d 28          	add    %dl,0x28(%ebp,%ecx,1)
    204b:	00 00                	add    %al,(%eax)
    204d:	00 00                	add    %al,(%eax)
    204f:	00 44 00 12          	add    %al,0x12(%eax,%eax,1)
    2053:	00 59 0d             	add    %bl,0xd(%ecx)
    2056:	28 00                	sub    %al,(%eax)
    2058:	00 00                	add    %al,(%eax)
    205a:	00 00                	add    %al,(%eax)
    205c:	44                   	inc    %esp
    205d:	00 13                	add    %dl,(%ebx)
    205f:	00 5a 0d             	add    %bl,0xd(%edx)
    2062:	28 00                	sub    %al,(%eax)
    2064:	00 00                	add    %al,(%eax)
    2066:	00 00                	add    %al,(%eax)
    2068:	44                   	inc    %esp
    2069:	00 14 00             	add    %dl,(%eax,%eax,1)
    206c:	5b                   	pop    %ebx
    206d:	0d 28 00 00 00       	or     $0x28,%eax
    2072:	00 00                	add    %al,(%eax)
    2074:	44                   	inc    %esp
    2075:	00 15 00 5d 0d 28    	add    %dl,0x280d5d00
    207b:	00 00                	add    %al,(%eax)
    207d:	00 00                	add    %al,(%eax)
    207f:	00 44 00 16          	add    %al,0x16(%eax,%eax,1)
    2083:	00 5f 0d             	add    %bl,0xd(%edi)
    2086:	28 00                	sub    %al,(%eax)
    2088:	00 00                	add    %al,(%eax)
    208a:	00 00                	add    %al,(%eax)
    208c:	44                   	inc    %esp
    208d:	00 19                	add    %bl,(%ecx)
    208f:	00 60 0d             	add    %ah,0xd(%eax)
    2092:	28 00                	sub    %al,(%eax)
    2094:	00 00                	add    %al,(%eax)
    2096:	00 00                	add    %al,(%eax)
    2098:	44                   	inc    %esp
    2099:	00 1a                	add    %bl,(%edx)
    209b:	00 62 0d             	add    %ah,0xd(%edx)
    209e:	28 00                	sub    %al,(%eax)
    20a0:	00 00                	add    %al,(%eax)
    20a2:	00 00                	add    %al,(%eax)
    20a4:	44                   	inc    %esp
    20a5:	00 1b                	add    %bl,(%ebx)
    20a7:	00 64 0d 28          	add    %ah,0x28(%ebp,%ecx,1)
    20ab:	00 00                	add    %al,(%eax)
    20ad:	00 00                	add    %al,(%eax)
    20af:	00 44 00 1c          	add    %al,0x1c(%eax,%eax,1)
    20b3:	00 65 0d             	add    %ah,0xd(%ebp)
    20b6:	28 00                	sub    %al,(%eax)
    20b8:	00 00                	add    %al,(%eax)
    20ba:	00 00                	add    %al,(%eax)
    20bc:	44                   	inc    %esp
    20bd:	00 1d 00 67 0d 28    	add    %bl,0x280d6700
    20c3:	00 00                	add    %al,(%eax)
    20c5:	00 00                	add    %al,(%eax)
    20c7:	00 44 00 1e          	add    %al,0x1e(%eax,%eax,1)
    20cb:	00 68 0d             	add    %ch,0xd(%eax)
    20ce:	28 00                	sub    %al,(%eax)
    20d0:	00 00                	add    %al,(%eax)
    20d2:	00 00                	add    %al,(%eax)
    20d4:	44                   	inc    %esp
    20d5:	00 1f                	add    %bl,(%edi)
    20d7:	00 6b 0d             	add    %ch,0xd(%ebx)
    20da:	28 00                	sub    %al,(%eax)
    20dc:	00 00                	add    %al,(%eax)
    20de:	00 00                	add    %al,(%eax)
    20e0:	44                   	inc    %esp
    20e1:	00 20                	add    %ah,(%eax)
    20e3:	00 6d 0d             	add    %ch,0xd(%ebp)
    20e6:	28 00                	sub    %al,(%eax)
    20e8:	00 00                	add    %al,(%eax)
    20ea:	00 00                	add    %al,(%eax)
    20ec:	44                   	inc    %esp
    20ed:	00 21                	add    %ah,(%ecx)
    20ef:	00 6f 0d             	add    %ch,0xd(%edi)
    20f2:	28 00                	sub    %al,(%eax)
    20f4:	00 00                	add    %al,(%eax)
    20f6:	00 00                	add    %al,(%eax)
    20f8:	44                   	inc    %esp
    20f9:	00 23                	add    %ah,(%ebx)
    20fb:	00 74 0d 28          	add    %dh,0x28(%ebp,%ecx,1)
    20ff:	00 00                	add    %al,(%eax)
    2101:	00 00                	add    %al,(%eax)
    2103:	00 44 00 24          	add    %al,0x24(%eax,%eax,1)
    2107:	00 75 0d             	add    %dh,0xd(%ebp)
    210a:	28 00                	sub    %al,(%eax)
    210c:	00 00                	add    %al,(%eax)
    210e:	00 00                	add    %al,(%eax)
    2110:	44                   	inc    %esp
    2111:	00 25 00 76 0d 28    	add    %ah,0x280d7600
    2117:	00 00                	add    %al,(%eax)
    2119:	00 00                	add    %al,(%eax)
    211b:	00 44 00 26          	add    %al,0x26(%eax,%eax,1)
    211f:	00 78 0d             	add    %bh,0xd(%eax)
    2122:	28 00                	sub    %al,(%eax)
    2124:	00 00                	add    %al,(%eax)
    2126:	00 00                	add    %al,(%eax)
    2128:	44                   	inc    %esp
    2129:	00 27                	add    %ah,(%edi)
    212b:	00 7a 0d             	add    %bh,0xd(%edx)
    212e:	28 00                	sub    %al,(%eax)
    2130:	00 00                	add    %al,(%eax)
    2132:	00 00                	add    %al,(%eax)
    2134:	44                   	inc    %esp
    2135:	00 2b                	add    %ch,(%ebx)
    2137:	00 7b 0d             	add    %bh,0xd(%ebx)
    213a:	28 00                	sub    %al,(%eax)
    213c:	00 00                	add    %al,(%eax)
    213e:	00 00                	add    %al,(%eax)
    2140:	44                   	inc    %esp
    2141:	00 2c 00             	add    %ch,(%eax,%eax,1)
    2144:	80 0d 28 00 00 00 00 	orb    $0x0,0x28
    214b:	00 44 00 2d          	add    %al,0x2d(%eax,%eax,1)
    214f:	00 85 0d 28 00 00    	add    %al,0x280d(%ebp)
    2155:	00 00                	add    %al,(%eax)
    2157:	00 44 00 2e          	add    %al,0x2e(%eax,%eax,1)
    215b:	00 8a 0d 28 00 00    	add    %cl,0x280d(%edx)
    2161:	00 00                	add    %al,(%eax)
    2163:	00 44 00 32          	add    %al,0x32(%eax,%eax,1)
    2167:	00 8b 0d 28 00 00    	add    %cl,0x280d(%ebx)
    216d:	00 00                	add    %al,(%eax)
    216f:	00 44 00 33          	add    %al,0x33(%eax,%eax,1)
    2173:	00 90 0d 28 00 00    	add    %dl,0x280d(%eax)
    2179:	00 00                	add    %al,(%eax)
    217b:	00 44 00 34          	add    %al,0x34(%eax,%eax,1)
    217f:	00 95 0d 28 00 00    	add    %dl,0x280d(%ebp)
    2185:	00 00                	add    %al,(%eax)
    2187:	00 44 00 35          	add    %al,0x35(%eax,%eax,1)
    218b:	00 9a 0d 28 00 be    	add    %bl,-0x41ffd7f3(%edx)
    2191:	0e                   	push   %cs
    2192:	00 00                	add    %al,(%eax)
    2194:	64 00 02             	add    %al,%fs:(%edx)
    2197:	00 9b 0d 28 00 08    	add    %bl,0x800280d(%ebx)
    219d:	00 00                	add    %al,(%eax)
    219f:	00 3c 00             	add    %bh,(%eax,%eax,1)
    21a2:	00 00                	add    %al,(%eax)
    21a4:	00 00                	add    %al,(%eax)
    21a6:	00 00                	add    %al,(%eax)
    21a8:	c5 0e                	lds    (%esi),%ecx
    21aa:	00 00                	add    %al,(%eax)
    21ac:	24 00                	and    $0x0,%al
    21ae:	00 00                	add    %al,(%eax)
    21b0:	9b                   	fwait
    21b1:	0d 28 00 b2 01       	or     $0x1b20028,%eax
    21b6:	00 00                	add    %al,(%eax)
    21b8:	80 00 00             	addb   $0x0,(%eax)
    21bb:	00 00                	add    %al,(%eax)
    21bd:	00 00                	add    %al,(%eax)
    21bf:	00 dd                	add    %bl,%ch
    21c1:	0e                   	push   %cs
    21c2:	00 00                	add    %al,(%eax)
    21c4:	a0 00 00 00 08       	mov    0x8000000,%al
    21c9:	00 00                	add    %al,(%eax)
    21cb:	00 f9                	add    %bh,%cl
    21cd:	0e                   	push   %cs
    21ce:	00 00                	add    %al,(%eax)
    21d0:	a0 00 00 00 0c       	mov    0xc000000,%al
    21d5:	00 00                	add    %al,(%eax)
    21d7:	00 24 0f             	add    %ah,(%edi,%ecx,1)
    21da:	00 00                	add    %al,(%eax)
    21dc:	a0 00 00 00 10       	mov    0x10000000,%al
    21e1:	00 00                	add    %al,(%eax)
    21e3:	00 44 0f 00          	add    %al,0x0(%edi,%ecx,1)
    21e7:	00 80 00 00 00 00    	add    %al,0x0(%eax)
    21ed:	00 00                	add    %al,(%eax)
    21ef:	00 6a 08             	add    %ch,0x8(%edx)
    21f2:	00 00                	add    %al,(%eax)
    21f4:	80 00 00             	addb   $0x0,(%eax)
    21f7:	00 00                	add    %al,(%eax)
    21f9:	00 00                	add    %al,(%eax)
    21fb:	00 b7 0f 00 00 80    	add    %dh,-0x7ffffff1(%edi)
	...
    2209:	00 00                	add    %al,(%eax)
    220b:	00 44 00 12          	add    %al,0x12(%eax,%eax,1)
	...
    2217:	00 44 00 12          	add    %al,0x12(%eax,%eax,1)
    221b:	00 03                	add    %al,(%ebx)
    221d:	00 00                	add    %al,(%eax)
    221f:	00 00                	add    %al,(%eax)
    2221:	00 00                	add    %al,(%eax)
    2223:	00 44 00 14          	add    %al,0x14(%eax,%eax,1)
    2227:	00 09                	add    %cl,(%ecx)
    2229:	00 00                	add    %al,(%eax)
    222b:	00 00                	add    %al,(%eax)
    222d:	00 00                	add    %al,(%eax)
    222f:	00 44 00 13          	add    %al,0x13(%eax,%eax,1)
    2233:	00 0c 00             	add    %cl,(%eax,%eax,1)
    2236:	00 00                	add    %al,(%eax)
    2238:	00 00                	add    %al,(%eax)
    223a:	00 00                	add    %al,(%eax)
    223c:	44                   	inc    %esp
    223d:	00 14 00             	add    %dl,(%eax,%eax,1)
    2240:	0f 00 00             	sldt   (%eax)
    2243:	00 00                	add    %al,(%eax)
    2245:	00 00                	add    %al,(%eax)
    2247:	00 44 00 15          	add    %al,0x15(%eax,%eax,1)
    224b:	00 11                	add    %dl,(%ecx)
    224d:	00 00                	add    %al,(%eax)
    224f:	00 00                	add    %al,(%eax)
    2251:	00 00                	add    %al,(%eax)
    2253:	00 44 00 16          	add    %al,0x16(%eax,%eax,1)
    2257:	00 14 00             	add    %dl,(%eax,%eax,1)
    225a:	00 00                	add    %al,(%eax)
    225c:	00 00                	add    %al,(%eax)
    225e:	00 00                	add    %al,(%eax)
    2260:	44                   	inc    %esp
    2261:	00 17                	add    %dl,(%edi)
    2263:	00 1b                	add    %bl,(%ebx)
    2265:	00 00                	add    %al,(%eax)
    2267:	00 00                	add    %al,(%eax)
    2269:	00 00                	add    %al,(%eax)
    226b:	00 44 00 18          	add    %al,0x18(%eax,%eax,1)
    226f:	00 22                	add    %ah,(%edx)
    2271:	00 00                	add    %al,(%eax)
    2273:	00 00                	add    %al,(%eax)
    2275:	00 00                	add    %al,(%eax)
    2277:	00 44 00 1a          	add    %al,0x1a(%eax,%eax,1)
    227b:	00 29                	add    %ch,(%ecx)
    227d:	00 00                	add    %al,(%eax)
    227f:	00 cc                	add    %cl,%ah
    2281:	0f 00 00             	sldt   (%eax)
    2284:	40                   	inc    %eax
    2285:	00 00                	add    %al,(%eax)
    2287:	00 00                	add    %al,(%eax)
    2289:	00 00                	add    %al,(%eax)
    228b:	00 d8                	add    %bl,%al
    228d:	0f 00 00             	sldt   (%eax)
    2290:	40                   	inc    %eax
    2291:	00 00                	add    %al,(%eax)
    2293:	00 02                	add    %al,(%edx)
    2295:	00 00                	add    %al,(%eax)
    2297:	00 e4                	add    %ah,%ah
    2299:	0f 00 00             	sldt   (%eax)
    229c:	40                   	inc    %eax
    229d:	00 00                	add    %al,(%eax)
    229f:	00 01                	add    %al,(%ecx)
    22a1:	00 00                	add    %al,(%eax)
    22a3:	00 ef                	add    %ch,%bh
    22a5:	0f 00 00             	sldt   (%eax)
    22a8:	24 00                	and    $0x0,%al
    22aa:	00 00                	add    %al,(%eax)
    22ac:	c6                   	(bad)  
    22ad:	0d 28 00 00 10       	or     $0x10000028,%eax
    22b2:	00 00                	add    %al,(%eax)
    22b4:	a0 00 00 00 08       	mov    0x8000000,%al
    22b9:	00 00                	add    %al,(%eax)
    22bb:	00 0c 10             	add    %cl,(%eax,%edx,1)
    22be:	00 00                	add    %al,(%eax)
    22c0:	a0 00 00 00 0c       	mov    0xc000000,%al
    22c5:	00 00                	add    %al,(%eax)
    22c7:	00 00                	add    %al,(%eax)
    22c9:	00 00                	add    %al,(%eax)
    22cb:	00 44 00 1c          	add    %al,0x1c(%eax,%eax,1)
	...
    22d7:	00 44 00 1c          	add    %al,0x1c(%eax,%eax,1)
    22db:	00 04 00             	add    %al,(%eax,%eax,1)
    22de:	00 00                	add    %al,(%eax)
    22e0:	00 00                	add    %al,(%eax)
    22e2:	00 00                	add    %al,(%eax)
    22e4:	44                   	inc    %esp
    22e5:	00 1d 00 0a 00 00    	add    %bl,0xa00
    22eb:	00 00                	add    %al,(%eax)
    22ed:	00 00                	add    %al,(%eax)
    22ef:	00 44 00 1e          	add    %al,0x1e(%eax,%eax,1)
    22f3:	00 10                	add    %dl,(%eax)
    22f5:	00 00                	add    %al,(%eax)
    22f7:	00 00                	add    %al,(%eax)
    22f9:	00 00                	add    %al,(%eax)
    22fb:	00 44 00 1f          	add    %al,0x1f(%eax,%eax,1)
    22ff:	00 14 00             	add    %dl,(%eax,%eax,1)
    2302:	00 00                	add    %al,(%eax)
    2304:	00 00                	add    %al,(%eax)
    2306:	00 00                	add    %al,(%eax)
    2308:	44                   	inc    %esp
    2309:	00 21                	add    %ah,(%ecx)
    230b:	00 19                	add    %bl,(%ecx)
    230d:	00 00                	add    %al,(%eax)
    230f:	00 00                	add    %al,(%eax)
    2311:	00 00                	add    %al,(%eax)
    2313:	00 44 00 22          	add    %al,0x22(%eax,%eax,1)
    2317:	00 21                	add    %ah,(%ecx)
    2319:	00 00                	add    %al,(%eax)
    231b:	00 00                	add    %al,(%eax)
    231d:	00 00                	add    %al,(%eax)
    231f:	00 44 00 23          	add    %al,0x23(%eax,%eax,1)
    2323:	00 2a                	add    %ch,(%edx)
    2325:	00 00                	add    %al,(%eax)
    2327:	00 00                	add    %al,(%eax)
    2329:	00 00                	add    %al,(%eax)
    232b:	00 44 00 24          	add    %al,0x24(%eax,%eax,1)
    232f:	00 2f                	add    %ch,(%edi)
    2331:	00 00                	add    %al,(%eax)
    2333:	00 00                	add    %al,(%eax)
    2335:	00 00                	add    %al,(%eax)
    2337:	00 44 00 26          	add    %al,0x26(%eax,%eax,1)
    233b:	00 36                	add    %dh,(%esi)
    233d:	00 00                	add    %al,(%eax)
    233f:	00 00                	add    %al,(%eax)
    2341:	00 00                	add    %al,(%eax)
    2343:	00 44 00 27          	add    %al,0x27(%eax,%eax,1)
    2347:	00 39                	add    %bh,(%ecx)
    2349:	00 00                	add    %al,(%eax)
    234b:	00 00                	add    %al,(%eax)
    234d:	00 00                	add    %al,(%eax)
    234f:	00 44 00 28          	add    %al,0x28(%eax,%eax,1)
    2353:	00 3b                	add    %bh,(%ebx)
    2355:	00 00                	add    %al,(%eax)
    2357:	00 cc                	add    %cl,%ah
    2359:	0f 00 00             	sldt   (%eax)
    235c:	40                   	inc    %eax
    235d:	00 00                	add    %al,(%eax)
    235f:	00 00                	add    %al,(%eax)
    2361:	00 00                	add    %al,(%eax)
    2363:	00 18                	add    %bl,(%eax)
    2365:	10 00                	adc    %al,(%eax)
    2367:	00 24 00             	add    %ah,(%eax,%eax,1)
    236a:	00 00                	add    %al,(%eax)
    236c:	04 0e                	add    $0xe,%al
    236e:	28 00                	sub    %al,(%eax)
    2370:	00 10                	add    %dl,(%eax)
    2372:	00 00                	add    %al,(%eax)
    2374:	a0 00 00 00 08       	mov    0x8000000,%al
    2379:	00 00                	add    %al,(%eax)
    237b:	00 00                	add    %al,(%eax)
    237d:	00 00                	add    %al,(%eax)
    237f:	00 44 00 2a          	add    %al,0x2a(%eax,%eax,1)
	...
    238b:	00 44 00 2c          	add    %al,0x2c(%eax,%eax,1)
    238f:	00 0b                	add    %cl,(%ebx)
    2391:	00 00                	add    %al,(%eax)
    2393:	00 00                	add    %al,(%eax)
    2395:	00 00                	add    %al,(%eax)
    2397:	00 44 00 2c          	add    %al,0x2c(%eax,%eax,1)
    239b:	00 0e                	add    %cl,(%esi)
    239d:	00 00                	add    %al,(%eax)
    239f:	00 00                	add    %al,(%eax)
    23a1:	00 00                	add    %al,(%eax)
    23a3:	00 44 00 2c          	add    %al,0x2c(%eax,%eax,1)
    23a7:	00 11                	add    %dl,(%ecx)
    23a9:	00 00                	add    %al,(%eax)
    23ab:	00 00                	add    %al,(%eax)
    23ad:	00 00                	add    %al,(%eax)
    23af:	00 44 00 2f          	add    %al,0x2f(%eax,%eax,1)
    23b3:	00 15 00 00 00 00    	add    %dl,0x0
    23b9:	00 00                	add    %al,(%eax)
    23bb:	00 44 00 2f          	add    %al,0x2f(%eax,%eax,1)
    23bf:	00 18                	add    %bl,(%eax)
    23c1:	00 00                	add    %al,(%eax)
    23c3:	00 00                	add    %al,(%eax)
    23c5:	00 00                	add    %al,(%eax)
    23c7:	00 44 00 2f          	add    %al,0x2f(%eax,%eax,1)
    23cb:	00 1a                	add    %bl,(%edx)
    23cd:	00 00                	add    %al,(%eax)
    23cf:	00 00                	add    %al,(%eax)
    23d1:	00 00                	add    %al,(%eax)
    23d3:	00 44 00 30          	add    %al,0x30(%eax,%eax,1)
    23d7:	00 1e                	add    %bl,(%esi)
    23d9:	00 00                	add    %al,(%eax)
    23db:	00 00                	add    %al,(%eax)
    23dd:	00 00                	add    %al,(%eax)
    23df:	00 44 00 34          	add    %al,0x34(%eax,%eax,1)
    23e3:	00 29                	add    %ch,(%ecx)
    23e5:	00 00                	add    %al,(%eax)
    23e7:	00 00                	add    %al,(%eax)
    23e9:	00 00                	add    %al,(%eax)
    23eb:	00 44 00 30          	add    %al,0x30(%eax,%eax,1)
    23ef:	00 2d 00 00 00 00    	add    %ch,0x0
    23f5:	00 00                	add    %al,(%eax)
    23f7:	00 44 00 36          	add    %al,0x36(%eax,%eax,1)
    23fb:	00 30                	add    %dh,(%eax)
    23fd:	00 00                	add    %al,(%eax)
    23ff:	00 29                	add    %ch,(%ecx)
    2401:	10 00                	adc    %al,(%eax)
    2403:	00 40 00             	add    %al,0x0(%eax)
    2406:	00 00                	add    %al,(%eax)
    2408:	03 00                	add    (%eax),%eax
    240a:	00 00                	add    %al,(%eax)
    240c:	cc                   	int3   
    240d:	0f 00 00             	sldt   (%eax)
    2410:	40                   	inc    %eax
    2411:	00 00                	add    %al,(%eax)
    2413:	00 02                	add    %al,(%edx)
    2415:	00 00                	add    %al,(%eax)
    2417:	00 00                	add    %al,(%eax)
    2419:	00 00                	add    %al,(%eax)
    241b:	00 c0                	add    %al,%al
	...
    2425:	00 00                	add    %al,(%eax)
    2427:	00 e0                	add    %ah,%al
    2429:	00 00                	add    %al,(%eax)
    242b:	00 36                	add    %dh,(%esi)
    242d:	00 00                	add    %al,(%eax)
    242f:	00 35 10 00 00 24    	add    %dh,0x24000010
    2435:	00 00                	add    %al,(%eax)
    2437:	00 3a                	add    %bh,(%edx)
    2439:	0e                   	push   %cs
    243a:	28 00                	sub    %al,(%eax)
    243c:	00 10                	add    %dl,(%eax)
    243e:	00 00                	add    %al,(%eax)
    2440:	a0 00 00 00 08       	mov    0x8000000,%al
    2445:	00 00                	add    %al,(%eax)
    2447:	00 00                	add    %al,(%eax)
    2449:	00 00                	add    %al,(%eax)
    244b:	00 44 00 38          	add    %al,0x38(%eax,%eax,1)
	...
    2457:	00 44 00 38          	add    %al,0x38(%eax,%eax,1)
    245b:	00 03                	add    %al,(%ebx)
    245d:	00 00                	add    %al,(%eax)
    245f:	00 00                	add    %al,(%eax)
    2461:	00 00                	add    %al,(%eax)
    2463:	00 44 00 3a          	add    %al,0x3a(%eax,%eax,1)
    2467:	00 06                	add    %al,(%esi)
    2469:	00 00                	add    %al,(%eax)
    246b:	00 00                	add    %al,(%eax)
    246d:	00 00                	add    %al,(%eax)
    246f:	00 44 00 39          	add    %al,0x39(%eax,%eax,1)
    2473:	00 07                	add    %al,(%edi)
    2475:	00 00                	add    %al,(%eax)
    2477:	00 00                	add    %al,(%eax)
    2479:	00 00                	add    %al,(%eax)
    247b:	00 44 00 3a          	add    %al,0x3a(%eax,%eax,1)
    247f:	00 0d 00 00 00 cc    	add    %cl,0xcc000000
    2485:	0f 00 00             	sldt   (%eax)
    2488:	40                   	inc    %eax
    2489:	00 00                	add    %al,(%eax)
    248b:	00 02                	add    %al,(%edx)
    248d:	00 00                	add    %al,(%eax)
    248f:	00 00                	add    %al,(%eax)
    2491:	00 00                	add    %al,(%eax)
    2493:	00 64 00 00          	add    %ah,0x0(%eax,%eax,1)
    2497:	00 48 0e             	add    %cl,0xe(%eax)
    249a:	28 00                	sub    %al,(%eax)
    249c:	49                   	dec    %ecx
    249d:	10 00                	adc    %al,(%eax)
    249f:	00 64 00 02          	add    %ah,0x2(%eax,%eax,1)
    24a3:	00 48 0e             	add    %cl,0xe(%eax)
    24a6:	28 00                	sub    %al,(%eax)
    24a8:	08 00                	or     %al,(%eax)
    24aa:	00 00                	add    %al,(%eax)
    24ac:	3c 00                	cmp    $0x0,%al
    24ae:	00 00                	add    %al,(%eax)
    24b0:	00 00                	add    %al,(%eax)
    24b2:	00 00                	add    %al,(%eax)
    24b4:	51                   	push   %ecx
    24b5:	10 00                	adc    %al,(%eax)
    24b7:	00 24 00             	add    %ah,(%eax,%eax,1)
    24ba:	00 00                	add    %al,(%eax)
    24bc:	48                   	dec    %eax
    24bd:	0e                   	push   %cs
    24be:	28 00                	sub    %al,(%eax)
    24c0:	b2 01                	mov    $0x1,%dl
    24c2:	00 00                	add    %al,(%eax)
    24c4:	80 00 00             	addb   $0x0,(%eax)
	...
    24cf:	00 44 00 10          	add    %al,0x10(%eax,%eax,1)
    24d3:	00 00                	add    %al,(%eax)
    24d5:	00 00                	add    %al,(%eax)
    24d7:	00 49 02             	add    %cl,0x2(%ecx)
    24da:	00 00                	add    %al,(%eax)
    24dc:	84 00                	test   %al,(%eax)
    24de:	00 00                	add    %al,(%eax)
    24e0:	48                   	dec    %eax
    24e1:	0e                   	push   %cs
    24e2:	28 00                	sub    %al,(%eax)
    24e4:	00 00                	add    %al,(%eax)
    24e6:	00 00                	add    %al,(%eax)
    24e8:	44                   	inc    %esp
    24e9:	00 52 00             	add    %dl,0x0(%edx)
    24ec:	00 00                	add    %al,(%eax)
    24ee:	00 00                	add    %al,(%eax)
    24f0:	49                   	dec    %ecx
    24f1:	10 00                	adc    %al,(%eax)
    24f3:	00 84 00 00 00 4e 0e 	add    %al,0xe4e0000(%eax,%eax,1)
    24fa:	28 00                	sub    %al,(%eax)
    24fc:	00 00                	add    %al,(%eax)
    24fe:	00 00                	add    %al,(%eax)
    2500:	44                   	inc    %esp
    2501:	00 12                	add    %dl,(%edx)
    2503:	00 06                	add    %al,(%esi)
    2505:	00 00                	add    %al,(%eax)
    2507:	00 00                	add    %al,(%eax)
    2509:	00 00                	add    %al,(%eax)
    250b:	00 44 00 17          	add    %al,0x17(%eax,%eax,1)
    250f:	00 0a                	add    %cl,(%edx)
    2511:	00 00                	add    %al,(%eax)
    2513:	00 71 10             	add    %dh,0x10(%ecx)
    2516:	00 00                	add    %al,(%eax)
    2518:	80 00 00             	addb   $0x0,(%eax)
    251b:	00 00                	add    %al,(%eax)
    251d:	00 00                	add    %al,(%eax)
    251f:	00 94 10 00 00 80 00 	add    %dl,0x800000(%eax,%edx,1)
    2526:	00 00                	add    %al,(%eax)
    2528:	00 00                	add    %al,(%eax)
    252a:	00 00                	add    %al,(%eax)
    252c:	a9 10 00 00 24       	test   $0x24000010,%eax
    2531:	00 00                	add    %al,(%eax)
    2533:	00 53 0e             	add    %dl,0xe(%ebx)
    2536:	28 00                	sub    %al,(%eax)
    2538:	00 00                	add    %al,(%eax)
    253a:	00 00                	add    %al,(%eax)
    253c:	44                   	inc    %esp
    253d:	00 19                	add    %bl,(%ecx)
	...
    2547:	00 44 00 1a          	add    %al,0x1a(%eax,%eax,1)
    254b:	00 06                	add    %al,(%esi)
    254d:	00 00                	add    %al,(%eax)
    254f:	00 49 02             	add    %cl,0x2(%ecx)
    2552:	00 00                	add    %al,(%eax)
    2554:	84 00                	test   %al,(%eax)
    2556:	00 00                	add    %al,(%eax)
    2558:	5e                   	pop    %esi
    2559:	0e                   	push   %cs
    255a:	28 00                	sub    %al,(%eax)
    255c:	00 00                	add    %al,(%eax)
    255e:	00 00                	add    %al,(%eax)
    2560:	44                   	inc    %esp
    2561:	00 6b 00             	add    %ch,0x0(%ebx)
    2564:	0b 00                	or     (%eax),%eax
    2566:	00 00                	add    %al,(%eax)
    2568:	49                   	dec    %ecx
    2569:	10 00                	adc    %al,(%eax)
    256b:	00 84 00 00 00 66 0e 	add    %al,0xe660000(%eax,%eax,1)
    2572:	28 00                	sub    %al,(%eax)
    2574:	00 00                	add    %al,(%eax)
    2576:	00 00                	add    %al,(%eax)
    2578:	44                   	inc    %esp
    2579:	00 1c 00             	add    %bl,(%eax,%eax,1)
    257c:	13 00                	adc    (%eax),%eax
    257e:	00 00                	add    %al,(%eax)
    2580:	49                   	dec    %ecx
    2581:	02 00                	add    (%eax),%al
    2583:	00 84 00 00 00 6b 0e 	add    %al,0xe6b0000(%eax,%eax,1)
    258a:	28 00                	sub    %al,(%eax)
    258c:	00 00                	add    %al,(%eax)
    258e:	00 00                	add    %al,(%eax)
    2590:	44                   	inc    %esp
    2591:	00 6b 00             	add    %ch,0x0(%ebx)
    2594:	18 00                	sbb    %al,(%eax)
    2596:	00 00                	add    %al,(%eax)
    2598:	49                   	dec    %ecx
    2599:	10 00                	adc    %al,(%eax)
    259b:	00 84 00 00 00 73 0e 	add    %al,0xe730000(%eax,%eax,1)
    25a2:	28 00                	sub    %al,(%eax)
    25a4:	00 00                	add    %al,(%eax)
    25a6:	00 00                	add    %al,(%eax)
    25a8:	44                   	inc    %esp
    25a9:	00 1f                	add    %bl,(%edi)
    25ab:	00 20                	add    %ah,(%eax)
    25ad:	00 00                	add    %al,(%eax)
    25af:	00 be 10 00 00 24    	add    %bh,0x24000010(%esi)
    25b5:	00 00                	add    %al,(%eax)
    25b7:	00 75 0e             	add    %dh,0xe(%ebp)
    25ba:	28 00                	sub    %al,(%eax)
    25bc:	d2 10                	rclb   %cl,(%eax)
    25be:	00 00                	add    %al,(%eax)
    25c0:	a0 00 00 00 08       	mov    0x8000000,%al
    25c5:	00 00                	add    %al,(%eax)
    25c7:	00 f2                	add    %dh,%dl
    25c9:	10 00                	adc    %al,(%eax)
    25cb:	00 80 00 00 00 00    	add    %al,0x0(%eax)
    25d1:	00 00                	add    %al,(%eax)
    25d3:	00 9a 11 00 00 80    	add    %bl,-0x7fffffef(%edx)
	...
    25e1:	00 00                	add    %al,(%eax)
    25e3:	00 44 00 2a          	add    %al,0x2a(%eax,%eax,1)
	...
    25ef:	00 44 00 2b          	add    %al,0x2b(%eax,%eax,1)
    25f3:	00 06                	add    %al,(%esi)
    25f5:	00 00                	add    %al,(%eax)
    25f7:	00 49 02             	add    %cl,0x2(%ecx)
    25fa:	00 00                	add    %al,(%eax)
    25fc:	84 00                	test   %al,(%eax)
    25fe:	00 00                	add    %al,(%eax)
    2600:	80 0e 28             	orb    $0x28,(%esi)
    2603:	00 00                	add    %al,(%eax)
    2605:	00 00                	add    %al,(%eax)
    2607:	00 44 00 6b          	add    %al,0x6b(%eax,%eax,1)
    260b:	00 0b                	add    %cl,(%ebx)
    260d:	00 00                	add    %al,(%eax)
    260f:	00 49 10             	add    %cl,0x10(%ecx)
    2612:	00 00                	add    %al,(%eax)
    2614:	84 00                	test   %al,(%eax)
    2616:	00 00                	add    %al,(%eax)
    2618:	88 0e                	mov    %cl,(%esi)
    261a:	28 00                	sub    %al,(%eax)
    261c:	00 00                	add    %al,(%eax)
    261e:	00 00                	add    %al,(%eax)
    2620:	44                   	inc    %esp
    2621:	00 2d 00 13 00 00    	add    %ch,0x1300
    2627:	00 49 02             	add    %cl,0x2(%ecx)
    262a:	00 00                	add    %al,(%eax)
    262c:	84 00                	test   %al,(%eax)
    262e:	00 00                	add    %al,(%eax)
    2630:	8d 0e                	lea    (%esi),%ecx
    2632:	28 00                	sub    %al,(%eax)
    2634:	00 00                	add    %al,(%eax)
    2636:	00 00                	add    %al,(%eax)
    2638:	44                   	inc    %esp
    2639:	00 6b 00             	add    %ch,0x0(%ebx)
    263c:	18 00                	sbb    %al,(%eax)
    263e:	00 00                	add    %al,(%eax)
    2640:	49                   	dec    %ecx
    2641:	10 00                	adc    %al,(%eax)
    2643:	00 84 00 00 00 95 0e 	add    %al,0xe950000(%eax,%eax,1)
    264a:	28 00                	sub    %al,(%eax)
    264c:	00 00                	add    %al,(%eax)
    264e:	00 00                	add    %al,(%eax)
    2650:	44                   	inc    %esp
    2651:	00 2f                	add    %ch,(%edi)
    2653:	00 20                	add    %ah,(%eax)
    2655:	00 00                	add    %al,(%eax)
    2657:	00 00                	add    %al,(%eax)
    2659:	00 00                	add    %al,(%eax)
    265b:	00 44 00 31          	add    %al,0x31(%eax,%eax,1)
    265f:	00 27                	add    %ah,(%edi)
    2661:	00 00                	add    %al,(%eax)
    2663:	00 a5 11 00 00 40    	add    %ah,0x40000011(%ebp)
    2669:	00 00                	add    %al,(%eax)
    266b:	00 00                	add    %al,(%eax)
    266d:	00 00                	add    %al,(%eax)
    266f:	00 b1 11 00 00 24    	add    %dh,0x24000011(%ecx)
    2675:	00 00                	add    %al,(%eax)
    2677:	00 9e 0e 28 00 c5    	add    %bl,-0x3affd7f2(%esi)
    267d:	11 00                	adc    %eax,(%eax)
    267f:	00 a0 00 00 00 08    	add    %ah,0x8000000(%eax)
    2685:	00 00                	add    %al,(%eax)
    2687:	00 d1                	add    %dl,%cl
    2689:	11 00                	adc    %eax,(%eax)
    268b:	00 a0 00 00 00 0c    	add    %ah,0xc000000(%eax)
    2691:	00 00                	add    %al,(%eax)
    2693:	00 00                	add    %al,(%eax)
    2695:	00 00                	add    %al,(%eax)
    2697:	00 44 00 33          	add    %al,0x33(%eax,%eax,1)
	...
    26a3:	00 44 00 33          	add    %al,0x33(%eax,%eax,1)
    26a7:	00 04 00             	add    %al,(%eax,%eax,1)
    26aa:	00 00                	add    %al,(%eax)
    26ac:	00 00                	add    %al,(%eax)
    26ae:	00 00                	add    %al,(%eax)
    26b0:	44                   	inc    %esp
    26b1:	00 34 00             	add    %dh,(%eax,%eax,1)
    26b4:	0a 00                	or     (%eax),%al
    26b6:	00 00                	add    %al,(%eax)
    26b8:	00 00                	add    %al,(%eax)
    26ba:	00 00                	add    %al,(%eax)
    26bc:	44                   	inc    %esp
    26bd:	00 34 00             	add    %dh,(%eax,%eax,1)
    26c0:	0d 00 00 00 00       	or     $0x0,%eax
    26c5:	00 00                	add    %al,(%eax)
    26c7:	00 44 00 38          	add    %al,0x38(%eax,%eax,1)
    26cb:	00 11                	add    %dl,(%ecx)
    26cd:	00 00                	add    %al,(%eax)
    26cf:	00 00                	add    %al,(%eax)
    26d1:	00 00                	add    %al,(%eax)
    26d3:	00 44 00 35          	add    %al,0x35(%eax,%eax,1)
    26d7:	00 13                	add    %dl,(%ebx)
    26d9:	00 00                	add    %al,(%eax)
    26db:	00 00                	add    %al,(%eax)
    26dd:	00 00                	add    %al,(%eax)
    26df:	00 44 00 36          	add    %al,0x36(%eax,%eax,1)
    26e3:	00 18                	add    %bl,(%eax)
    26e5:	00 00                	add    %al,(%eax)
    26e7:	00 00                	add    %al,(%eax)
    26e9:	00 00                	add    %al,(%eax)
    26eb:	00 44 00 3a          	add    %al,0x3a(%eax,%eax,1)
    26ef:	00 1e                	add    %bl,(%esi)
    26f1:	00 00                	add    %al,(%eax)
    26f3:	00 00                	add    %al,(%eax)
    26f5:	00 00                	add    %al,(%eax)
    26f7:	00 44 00 3b          	add    %al,0x3b(%eax,%eax,1)
    26fb:	00 23                	add    %ah,(%ebx)
    26fd:	00 00                	add    %al,(%eax)
    26ff:	00 00                	add    %al,(%eax)
    2701:	00 00                	add    %al,(%eax)
    2703:	00 44 00 38          	add    %al,0x38(%eax,%eax,1)
    2707:	00 25 00 00 00 00    	add    %ah,0x0
    270d:	00 00                	add    %al,(%eax)
    270f:	00 44 00 3b          	add    %al,0x3b(%eax,%eax,1)
    2713:	00 27                	add    %ah,(%edi)
    2715:	00 00                	add    %al,(%eax)
    2717:	00 00                	add    %al,(%eax)
    2719:	00 00                	add    %al,(%eax)
    271b:	00 44 00 3c          	add    %al,0x3c(%eax,%eax,1)
    271f:	00 2f                	add    %ch,(%edi)
    2721:	00 00                	add    %al,(%eax)
    2723:	00 00                	add    %al,(%eax)
    2725:	00 00                	add    %al,(%eax)
    2727:	00 44 00 3d          	add    %al,0x3d(%eax,%eax,1)
    272b:	00 31                	add    %dh,(%ecx)
    272d:	00 00                	add    %al,(%eax)
    272f:	00 00                	add    %al,(%eax)
    2731:	00 00                	add    %al,(%eax)
    2733:	00 44 00 41          	add    %al,0x41(%eax,%eax,1)
    2737:	00 37                	add    %dh,(%edi)
    2739:	00 00                	add    %al,(%eax)
    273b:	00 00                	add    %al,(%eax)
    273d:	00 00                	add    %al,(%eax)
    273f:	00 44 00 42          	add    %al,0x42(%eax,%eax,1)
    2743:	00 3c 00             	add    %bh,(%eax,%eax,1)
    2746:	00 00                	add    %al,(%eax)
    2748:	00 00                	add    %al,(%eax)
    274a:	00 00                	add    %al,(%eax)
    274c:	44                   	inc    %esp
    274d:	00 44 00 3f          	add    %al,0x3f(%eax,%eax,1)
    2751:	00 00                	add    %al,(%eax)
    2753:	00 00                	add    %al,(%eax)
    2755:	00 00                	add    %al,(%eax)
    2757:	00 44 00 43          	add    %al,0x43(%eax,%eax,1)
    275b:	00 41 00             	add    %al,0x0(%ecx)
    275e:	00 00                	add    %al,(%eax)
    2760:	00 00                	add    %al,(%eax)
    2762:	00 00                	add    %al,(%eax)
    2764:	44                   	inc    %esp
    2765:	00 44 00 45          	add    %al,0x45(%eax,%eax,1)
    2769:	00 00                	add    %al,(%eax)
    276b:	00 00                	add    %al,(%eax)
    276d:	00 00                	add    %al,(%eax)
    276f:	00 44 00 56          	add    %al,0x56(%eax,%eax,1)
    2773:	00 47 00             	add    %al,0x0(%edi)
    2776:	00 00                	add    %al,(%eax)
    2778:	00 00                	add    %al,(%eax)
    277a:	00 00                	add    %al,(%eax)
    277c:	44                   	inc    %esp
    277d:	00 46 00             	add    %al,0x0(%esi)
    2780:	4a                   	dec    %edx
    2781:	00 00                	add    %al,(%eax)
    2783:	00 00                	add    %al,(%eax)
    2785:	00 00                	add    %al,(%eax)
    2787:	00 44 00 49          	add    %al,0x49(%eax,%eax,1)
    278b:	00 4f 00             	add    %cl,0x0(%edi)
    278e:	00 00                	add    %al,(%eax)
    2790:	00 00                	add    %al,(%eax)
    2792:	00 00                	add    %al,(%eax)
    2794:	44                   	inc    %esp
    2795:	00 47 00             	add    %al,0x0(%edi)
    2798:	51                   	push   %ecx
    2799:	00 00                	add    %al,(%eax)
    279b:	00 00                	add    %al,(%eax)
    279d:	00 00                	add    %al,(%eax)
    279f:	00 44 00 4c          	add    %al,0x4c(%eax,%eax,1)
    27a3:	00 54 00 00          	add    %dl,0x0(%eax,%eax,1)
    27a7:	00 00                	add    %al,(%eax)
    27a9:	00 00                	add    %al,(%eax)
    27ab:	00 44 00 48          	add    %al,0x48(%eax,%eax,1)
    27af:	00 57 00             	add    %dl,0x0(%edi)
    27b2:	00 00                	add    %al,(%eax)
    27b4:	00 00                	add    %al,(%eax)
    27b6:	00 00                	add    %al,(%eax)
    27b8:	44                   	inc    %esp
    27b9:	00 49 00             	add    %cl,0x0(%ecx)
    27bc:	5b                   	pop    %ebx
    27bd:	00 00                	add    %al,(%eax)
    27bf:	00 00                	add    %al,(%eax)
    27c1:	00 00                	add    %al,(%eax)
    27c3:	00 44 00 4c          	add    %al,0x4c(%eax,%eax,1)
    27c7:	00 5d 00             	add    %bl,0x0(%ebp)
    27ca:	00 00                	add    %al,(%eax)
    27cc:	00 00                	add    %al,(%eax)
    27ce:	00 00                	add    %al,(%eax)
    27d0:	44                   	inc    %esp
    27d1:	00 49 00             	add    %cl,0x0(%ecx)
    27d4:	60                   	pusha  
    27d5:	00 00                	add    %al,(%eax)
    27d7:	00 00                	add    %al,(%eax)
    27d9:	00 00                	add    %al,(%eax)
    27db:	00 44 00 4a          	add    %al,0x4a(%eax,%eax,1)
    27df:	00 66 00             	add    %ah,0x0(%esi)
    27e2:	00 00                	add    %al,(%eax)
    27e4:	00 00                	add    %al,(%eax)
    27e6:	00 00                	add    %al,(%eax)
    27e8:	44                   	inc    %esp
    27e9:	00 4d 00             	add    %cl,0x0(%ebp)
    27ec:	6d                   	insl   (%dx),%es:(%edi)
    27ed:	00 00                	add    %al,(%eax)
    27ef:	00 00                	add    %al,(%eax)
    27f1:	00 00                	add    %al,(%eax)
    27f3:	00 44 00 4e          	add    %al,0x4e(%eax,%eax,1)
    27f7:	00 72 00             	add    %dh,0x0(%edx)
    27fa:	00 00                	add    %al,(%eax)
    27fc:	00 00                	add    %al,(%eax)
    27fe:	00 00                	add    %al,(%eax)
    2800:	44                   	inc    %esp
    2801:	00 50 00             	add    %dl,0x0(%eax)
    2804:	7b 00                	jnp    2806 <bootmain-0x27d7fa>
    2806:	00 00                	add    %al,(%eax)
    2808:	00 00                	add    %al,(%eax)
    280a:	00 00                	add    %al,(%eax)
    280c:	44                   	inc    %esp
    280d:	00 51 00             	add    %dl,0x0(%ecx)
    2810:	80 00 00             	addb   $0x0,(%eax)
    2813:	00 00                	add    %al,(%eax)
    2815:	00 00                	add    %al,(%eax)
    2817:	00 44 00 53          	add    %al,0x53(%eax,%eax,1)
    281b:	00 89 00 00 00 00    	add    %cl,0x0(%ecx)
    2821:	00 00                	add    %al,(%eax)
    2823:	00 44 00 54          	add    %al,0x54(%eax,%eax,1)
    2827:	00 8c 00 00 00 00 00 	add    %cl,0x0(%eax,%eax,1)
    282e:	00 00                	add    %al,(%eax)
    2830:	44                   	inc    %esp
    2831:	00 57 00             	add    %dl,0x0(%edi)
    2834:	91                   	xchg   %eax,%ecx
    2835:	00 00                	add    %al,(%eax)
    2837:	00 a5 11 00 00 40    	add    %ah,0x40000011(%ebp)
	...
    2845:	00 00                	add    %al,(%eax)
    2847:	00 64 00 00          	add    %ah,0x0(%eax,%eax,1)
    284b:	00 34 0f             	add    %dh,(%edi,%ecx,1)
    284e:	28 00                	sub    %al,(%eax)
    2850:	dc 11                	fcoml  (%ecx)
    2852:	00 00                	add    %al,(%eax)
    2854:	64 00 02             	add    %al,%fs:(%edx)
    2857:	00 34 0f             	add    %dh,(%edi,%ecx,1)
    285a:	28 00                	sub    %al,(%eax)
    285c:	08 00                	or     %al,(%eax)
    285e:	00 00                	add    %al,(%eax)
    2860:	3c 00                	cmp    $0x0,%al
    2862:	00 00                	add    %al,(%eax)
    2864:	00 00                	add    %al,(%eax)
    2866:	00 00                	add    %al,(%eax)
    2868:	e5 11                	in     $0x11,%eax
    286a:	00 00                	add    %al,(%eax)
    286c:	24 00                	and    $0x0,%al
    286e:	00 00                	add    %al,(%eax)
    2870:	34 0f                	xor    $0xf,%al
    2872:	28 00                	sub    %al,(%eax)
    2874:	0d 12 00 00 80       	or     $0x80000012,%eax
    2879:	00 00                	add    %al,(%eax)
    287b:	00 00                	add    %al,(%eax)
    287d:	00 00                	add    %al,(%eax)
    287f:	00 21                	add    %ah,(%ecx)
    2881:	12 00                	adc    (%eax),%al
    2883:	00 a0 00 00 00 08    	add    %ah,0x8000000(%eax)
    2889:	00 00                	add    %al,(%eax)
    288b:	00 2e                	add    %ch,(%esi)
    288d:	12 00                	adc    (%eax),%al
    288f:	00 a0 00 00 00 0c    	add    %ah,0xc000000(%eax)
    2895:	00 00                	add    %al,(%eax)
    2897:	00 00                	add    %al,(%eax)
    2899:	00 00                	add    %al,(%eax)
    289b:	00 44 00 2e          	add    %al,0x2e(%eax,%eax,1)
	...
    28a7:	00 44 00 31          	add    %al,0x31(%eax,%eax,1)
    28ab:	00 04 00             	add    %al,(%eax,%eax,1)
    28ae:	00 00                	add    %al,(%eax)
    28b0:	00 00                	add    %al,(%eax)
    28b2:	00 00                	add    %al,(%eax)
    28b4:	44                   	inc    %esp
    28b5:	00 31                	add    %dh,(%ecx)
    28b7:	00 07                	add    %al,(%edi)
    28b9:	00 00                	add    %al,(%eax)
    28bb:	00 00                	add    %al,(%eax)
    28bd:	00 00                	add    %al,(%eax)
    28bf:	00 44 00 33          	add    %al,0x33(%eax,%eax,1)
    28c3:	00 0c 00             	add    %cl,(%eax,%eax,1)
    28c6:	00 00                	add    %al,(%eax)
    28c8:	00 00                	add    %al,(%eax)
    28ca:	00 00                	add    %al,(%eax)
    28cc:	44                   	inc    %esp
    28cd:	00 34 00             	add    %dh,(%eax,%eax,1)
    28d0:	18 00                	sbb    %al,(%eax)
    28d2:	00 00                	add    %al,(%eax)
    28d4:	00 00                	add    %al,(%eax)
    28d6:	00 00                	add    %al,(%eax)
    28d8:	44                   	inc    %esp
    28d9:	00 35 00 22 00 00    	add    %dh,0x2200
    28df:	00 00                	add    %al,(%eax)
    28e1:	00 00                	add    %al,(%eax)
    28e3:	00 44 00 36          	add    %al,0x36(%eax,%eax,1)
    28e7:	00 30                	add    %dh,(%eax)
    28e9:	00 00                	add    %al,(%eax)
    28eb:	00 00                	add    %al,(%eax)
    28ed:	00 00                	add    %al,(%eax)
    28ef:	00 44 00 36          	add    %al,0x36(%eax,%eax,1)
    28f3:	00 36                	add    %dh,(%esi)
    28f5:	00 00                	add    %al,(%eax)
    28f7:	00 00                	add    %al,(%eax)
    28f9:	00 00                	add    %al,(%eax)
    28fb:	00 44 00 38          	add    %al,0x38(%eax,%eax,1)
    28ff:	00 3e                	add    %bh,(%esi)
    2901:	00 00                	add    %al,(%eax)
    2903:	00 00                	add    %al,(%eax)
    2905:	00 00                	add    %al,(%eax)
    2907:	00 44 00 39          	add    %al,0x39(%eax,%eax,1)
    290b:	00 40 00             	add    %al,0x0(%eax)
    290e:	00 00                	add    %al,(%eax)
    2910:	00 00                	add    %al,(%eax)
    2912:	00 00                	add    %al,(%eax)
    2914:	44                   	inc    %esp
    2915:	00 3b                	add    %bh,(%ebx)
    2917:	00 42 00             	add    %al,0x0(%edx)
    291a:	00 00                	add    %al,(%eax)
    291c:	00 00                	add    %al,(%eax)
    291e:	00 00                	add    %al,(%eax)
    2920:	44                   	inc    %esp
    2921:	00 3c 00             	add    %bh,(%eax,%eax,1)
    2924:	50                   	push   %eax
    2925:	00 00                	add    %al,(%eax)
    2927:	00 00                	add    %al,(%eax)
    2929:	00 00                	add    %al,(%eax)
    292b:	00 44 00 3c          	add    %al,0x3c(%eax,%eax,1)
    292f:	00 56 00             	add    %dl,0x0(%esi)
    2932:	00 00                	add    %al,(%eax)
    2934:	00 00                	add    %al,(%eax)
    2936:	00 00                	add    %al,(%eax)
    2938:	44                   	inc    %esp
    2939:	00 3f                	add    %bh,(%edi)
    293b:	00 5e 00             	add    %bl,0x0(%esi)
    293e:	00 00                	add    %al,(%eax)
    2940:	00 00                	add    %al,(%eax)
    2942:	00 00                	add    %al,(%eax)
    2944:	44                   	inc    %esp
    2945:	00 31                	add    %dh,(%ecx)
    2947:	00 60 00             	add    %ah,0x0(%eax)
    294a:	00 00                	add    %al,(%eax)
    294c:	00 00                	add    %al,(%eax)
    294e:	00 00                	add    %al,(%eax)
    2950:	44                   	inc    %esp
    2951:	00 42 00             	add    %al,0x0(%edx)
    2954:	67 00 00             	add    %al,(%bx,%si)
    2957:	00 39                	add    %bh,(%ecx)
    2959:	12 00                	adc    (%eax),%al
    295b:	00 40 00             	add    %al,0x0(%eax)
    295e:	00 00                	add    %al,(%eax)
    2960:	00 00                	add    %al,(%eax)
    2962:	00 00                	add    %al,(%eax)
    2964:	42                   	inc    %edx
    2965:	12 00                	adc    (%eax),%al
    2967:	00 40 00             	add    %al,0x0(%eax)
    296a:	00 00                	add    %al,(%eax)
    296c:	03 00                	add    (%eax),%eax
    296e:	00 00                	add    %al,(%eax)
    2970:	00 00                	add    %al,(%eax)
    2972:	00 00                	add    %al,(%eax)
    2974:	c0 00 00             	rolb   $0x0,(%eax)
	...
    297f:	00 e0                	add    %ah,%al
    2981:	00 00                	add    %al,(%eax)
    2983:	00 6a 00             	add    %ch,0x0(%edx)
    2986:	00 00                	add    %al,(%eax)
    2988:	4d                   	dec    %ebp
    2989:	12 00                	adc    (%eax),%al
    298b:	00 24 00             	add    %ah,(%eax,%eax,1)
    298e:	00 00                	add    %al,(%eax)
    2990:	9e                   	sahf   
    2991:	0f 28 00             	movaps (%eax),%xmm0
    2994:	21 12                	and    %edx,(%edx)
    2996:	00 00                	add    %al,(%eax)
    2998:	a0 00 00 00 08       	mov    0x8000000,%al
    299d:	00 00                	add    %al,(%eax)
    299f:	00 2e                	add    %ch,(%esi)
    29a1:	12 00                	adc    (%eax),%al
    29a3:	00 a0 00 00 00 0c    	add    %ah,0xc000000(%eax)
    29a9:	00 00                	add    %al,(%eax)
    29ab:	00 00                	add    %al,(%eax)
    29ad:	00 00                	add    %al,(%eax)
    29af:	00 44 00 11          	add    %al,0x11(%eax,%eax,1)
    29b3:	00 00                	add    %al,(%eax)
    29b5:	00 00                	add    %al,(%eax)
    29b7:	00 49 02             	add    %cl,0x2(%ecx)
    29ba:	00 00                	add    %al,(%eax)
    29bc:	84 00                	test   %al,(%eax)
    29be:	00 00                	add    %al,(%eax)
    29c0:	a3 0f 28 00 00       	mov    %eax,0x280f
    29c5:	00 00                	add    %al,(%eax)
    29c7:	00 44 00 40          	add    %al,0x40(%eax,%eax,1)
    29cb:	01 05 00 00 00 dc    	add    %eax,0xdc000000
    29d1:	11 00                	adc    %eax,(%eax)
    29d3:	00 84 00 00 00 a5 0f 	add    %al,0xfa50000(%eax,%eax,1)
    29da:	28 00                	sub    %al,(%eax)
    29dc:	00 00                	add    %al,(%eax)
    29de:	00 00                	add    %al,(%eax)
    29e0:	44                   	inc    %esp
    29e1:	00 15 00 07 00 00    	add    %dl,0x700
    29e7:	00 49 02             	add    %cl,0x2(%ecx)
    29ea:	00 00                	add    %al,(%eax)
    29ec:	84 00                	test   %al,(%eax)
    29ee:	00 00                	add    %al,(%eax)
    29f0:	aa                   	stos   %al,%es:(%edi)
    29f1:	0f 28 00             	movaps (%eax),%xmm0
    29f4:	00 00                	add    %al,(%eax)
    29f6:	00 00                	add    %al,(%eax)
    29f8:	44                   	inc    %esp
    29f9:	00 47 01             	add    %al,0x1(%edi)
    29fc:	0c 00                	or     $0x0,%al
    29fe:	00 00                	add    %al,(%eax)
    2a00:	00 00                	add    %al,(%eax)
    2a02:	00 00                	add    %al,(%eax)
    2a04:	44                   	inc    %esp
    2a05:	00 40 01             	add    %al,0x1(%eax)
    2a08:	0e                   	push   %cs
    2a09:	00 00                	add    %al,(%eax)
    2a0b:	00 dc                	add    %bl,%ah
    2a0d:	11 00                	adc    %eax,(%eax)
    2a0f:	00 84 00 00 00 ae 0f 	add    %al,0xfae0000(%eax,%eax,1)
    2a16:	28 00                	sub    %al,(%eax)
    2a18:	00 00                	add    %al,(%eax)
    2a1a:	00 00                	add    %al,(%eax)
    2a1c:	44                   	inc    %esp
    2a1d:	00 18                	add    %bl,(%eax)
    2a1f:	00 10                	add    %dl,(%eax)
    2a21:	00 00                	add    %al,(%eax)
    2a23:	00 00                	add    %al,(%eax)
    2a25:	00 00                	add    %al,(%eax)
    2a27:	00 44 00 1b          	add    %al,0x1b(%eax,%eax,1)
    2a2b:	00 12                	add    %dl,(%edx)
    2a2d:	00 00                	add    %al,(%eax)
    2a2f:	00 00                	add    %al,(%eax)
    2a31:	00 00                	add    %al,(%eax)
    2a33:	00 44 00 18          	add    %al,0x18(%eax,%eax,1)
    2a37:	00 17                	add    %dl,(%edi)
    2a39:	00 00                	add    %al,(%eax)
    2a3b:	00 49 02             	add    %cl,0x2(%ecx)
    2a3e:	00 00                	add    %al,(%eax)
    2a40:	84 00                	test   %al,(%eax)
    2a42:	00 00                	add    %al,(%eax)
    2a44:	bb 0f 28 00 00       	mov    $0x280f,%ebx
    2a49:	00 00                	add    %al,(%eax)
    2a4b:	00 44 00 47          	add    %al,0x47(%eax,%eax,1)
    2a4f:	01 1d 00 00 00 dc    	add    %ebx,0xdc000000
    2a55:	11 00                	adc    %eax,(%eax)
    2a57:	00 84 00 00 00 bd 0f 	add    %al,0xfbd0000(%eax,%eax,1)
    2a5e:	28 00                	sub    %al,(%eax)
    2a60:	00 00                	add    %al,(%eax)
    2a62:	00 00                	add    %al,(%eax)
    2a64:	44                   	inc    %esp
    2a65:	00 1e                	add    %bl,(%esi)
    2a67:	00 1f                	add    %bl,(%edi)
    2a69:	00 00                	add    %al,(%eax)
    2a6b:	00 49 02             	add    %cl,0x2(%ecx)
    2a6e:	00 00                	add    %al,(%eax)
    2a70:	84 00                	test   %al,(%eax)
    2a72:	00 00                	add    %al,(%eax)
    2a74:	c1 0f 28             	rorl   $0x28,(%edi)
    2a77:	00 00                	add    %al,(%eax)
    2a79:	00 00                	add    %al,(%eax)
    2a7b:	00 44 00 e0          	add    %al,-0x20(%eax,%eax,1)
    2a7f:	00 23                	add    %ah,(%ebx)
    2a81:	00 00                	add    %al,(%eax)
    2a83:	00 dc                	add    %bl,%ah
    2a85:	11 00                	adc    %eax,(%eax)
    2a87:	00 84 00 00 00 c4 0f 	add    %al,0xfc40000(%eax,%eax,1)
    2a8e:	28 00                	sub    %al,(%eax)
    2a90:	00 00                	add    %al,(%eax)
    2a92:	00 00                	add    %al,(%eax)
    2a94:	44                   	inc    %esp
    2a95:	00 20                	add    %ah,(%eax)
    2a97:	00 26                	add    %ah,(%esi)
    2a99:	00 00                	add    %al,(%eax)
    2a9b:	00 49 02             	add    %cl,0x2(%ecx)
    2a9e:	00 00                	add    %al,(%eax)
    2aa0:	84 00                	test   %al,(%eax)
    2aa2:	00 00                	add    %al,(%eax)
    2aa4:	c9                   	leave  
    2aa5:	0f 28 00             	movaps (%eax),%xmm0
    2aa8:	00 00                	add    %al,(%eax)
    2aaa:	00 00                	add    %al,(%eax)
    2aac:	44                   	inc    %esp
    2aad:	00 d9                	add    %bl,%cl
    2aaf:	00 2b                	add    %ch,(%ebx)
    2ab1:	00 00                	add    %al,(%eax)
    2ab3:	00 dc                	add    %bl,%ah
    2ab5:	11 00                	adc    %eax,(%eax)
    2ab7:	00 84 00 00 00 cc 0f 	add    %al,0xfcc0000(%eax,%eax,1)
    2abe:	28 00                	sub    %al,(%eax)
    2ac0:	00 00                	add    %al,(%eax)
    2ac2:	00 00                	add    %al,(%eax)
    2ac4:	44                   	inc    %esp
    2ac5:	00 24 00             	add    %ah,(%eax,%eax,1)
    2ac8:	2e 00 00             	add    %al,%cs:(%eax)
    2acb:	00 00                	add    %al,(%eax)
    2acd:	00 00                	add    %al,(%eax)
    2acf:	00 44 00 26          	add    %al,0x26(%eax,%eax,1)
    2ad3:	00 3b                	add    %bh,(%ebx)
    2ad5:	00 00                	add    %al,(%eax)
    2ad7:	00 49 02             	add    %cl,0x2(%ecx)
    2ada:	00 00                	add    %al,(%eax)
    2adc:	84 00                	test   %al,(%eax)
    2ade:	00 00                	add    %al,(%eax)
    2ae0:	e0 0f                	loopne 2af1 <bootmain-0x27d50f>
    2ae2:	28 00                	sub    %al,(%eax)
    2ae4:	00 00                	add    %al,(%eax)
    2ae6:	00 00                	add    %al,(%eax)
    2ae8:	44                   	inc    %esp
    2ae9:	00 e0                	add    %ah,%al
    2aeb:	00 42 00             	add    %al,0x0(%edx)
    2aee:	00 00                	add    %al,(%eax)
    2af0:	dc 11                	fcoml  (%ecx)
    2af2:	00 00                	add    %al,(%eax)
    2af4:	84 00                	test   %al,(%eax)
    2af6:	00 00                	add    %al,(%eax)
    2af8:	e3 0f                	jecxz  2b09 <bootmain-0x27d4f7>
    2afa:	28 00                	sub    %al,(%eax)
    2afc:	00 00                	add    %al,(%eax)
    2afe:	00 00                	add    %al,(%eax)
    2b00:	44                   	inc    %esp
    2b01:	00 28                	add    %ch,(%eax)
    2b03:	00 45 00             	add    %al,0x0(%ebp)
    2b06:	00 00                	add    %al,(%eax)
    2b08:	49                   	dec    %ecx
    2b09:	02 00                	add    (%eax),%al
    2b0b:	00 84 00 00 00 e9 0f 	add    %al,0xfe90000(%eax,%eax,1)
    2b12:	28 00                	sub    %al,(%eax)
    2b14:	00 00                	add    %al,(%eax)
    2b16:	00 00                	add    %al,(%eax)
    2b18:	44                   	inc    %esp
    2b19:	00 d9                	add    %bl,%cl
    2b1b:	00 4b 00             	add    %cl,0x0(%ebx)
    2b1e:	00 00                	add    %al,(%eax)
    2b20:	dc 11                	fcoml  (%ecx)
    2b22:	00 00                	add    %al,(%eax)
    2b24:	84 00                	test   %al,(%eax)
    2b26:	00 00                	add    %al,(%eax)
    2b28:	ec                   	in     (%dx),%al
    2b29:	0f 28 00             	movaps (%eax),%xmm0
    2b2c:	00 00                	add    %al,(%eax)
    2b2e:	00 00                	add    %al,(%eax)
    2b30:	44                   	inc    %esp
    2b31:	00 2c 00             	add    %ch,(%eax,%eax,1)
    2b34:	4e                   	dec    %esi
    2b35:	00 00                	add    %al,(%eax)
    2b37:	00 39                	add    %bh,(%ecx)
    2b39:	12 00                	adc    (%eax),%al
    2b3b:	00 40 00             	add    %al,0x0(%eax)
	...
    2b46:	00 00                	add    %al,(%eax)
    2b48:	c0 00 00             	rolb   $0x0,(%eax)
    2b4b:	00 00                	add    %al,(%eax)
    2b4d:	00 00                	add    %al,(%eax)
    2b4f:	00 5c 12 00          	add    %bl,0x0(%edx,%edx,1)
    2b53:	00 80 00 00 00 00    	add    %al,0x0(%eax)
    2b59:	00 00                	add    %al,(%eax)
    2b5b:	00 00                	add    %al,(%eax)
    2b5d:	00 00                	add    %al,(%eax)
    2b5f:	00 e0                	add    %ah,%al
    2b61:	00 00                	add    %al,(%eax)
    2b63:	00 53 00             	add    %dl,0x0(%ebx)
    2b66:	00 00                	add    %al,(%eax)
    2b68:	72 12                	jb     2b7c <bootmain-0x27d484>
    2b6a:	00 00                	add    %al,(%eax)
    2b6c:	24 00                	and    $0x0,%al
    2b6e:	00 00                	add    %al,(%eax)
    2b70:	f1                   	icebp  
    2b71:	0f 28 00             	movaps (%eax),%xmm0
    2b74:	8b 12                	mov    (%edx),%edx
    2b76:	00 00                	add    %al,(%eax)
    2b78:	80 00 00             	addb   $0x0,(%eax)
    2b7b:	00 00                	add    %al,(%eax)
    2b7d:	00 00                	add    %al,(%eax)
    2b7f:	00 97 12 00 00 a0    	add    %dl,-0x5fffffee(%edi)
    2b85:	00 00                	add    %al,(%eax)
    2b87:	00 08                	add    %cl,(%eax)
    2b89:	00 00                	add    %al,(%eax)
    2b8b:	00 b3 12 00 00 80    	add    %dh,-0x7fffffee(%ebx)
    2b91:	00 00                	add    %al,(%eax)
    2b93:	00 00                	add    %al,(%eax)
    2b95:	00 00                	add    %al,(%eax)
    2b97:	00 81 13 00 00 80    	add    %al,-0x7fffffed(%ecx)
    2b9d:	00 00                	add    %al,(%eax)
    2b9f:	00 00                	add    %al,(%eax)
    2ba1:	00 00                	add    %al,(%eax)
    2ba3:	00 8c 13 00 00 80 00 	add    %cl,0x800000(%ebx,%edx,1)
	...
    2bb2:	00 00                	add    %al,(%eax)
    2bb4:	44                   	inc    %esp
    2bb5:	00 44 00 00          	add    %al,0x0(%eax,%eax,1)
    2bb9:	00 00                	add    %al,(%eax)
    2bbb:	00 00                	add    %al,(%eax)
    2bbd:	00 00                	add    %al,(%eax)
    2bbf:	00 44 00 44          	add    %al,0x44(%eax,%eax,1)
    2bc3:	00 03                	add    %al,(%ebx)
    2bc5:	00 00                	add    %al,(%eax)
    2bc7:	00 00                	add    %al,(%eax)
    2bc9:	00 00                	add    %al,(%eax)
    2bcb:	00 44 00 45          	add    %al,0x45(%eax,%eax,1)
    2bcf:	00 06                	add    %al,(%esi)
    2bd1:	00 00                	add    %al,(%eax)
    2bd3:	00 00                	add    %al,(%eax)
    2bd5:	00 00                	add    %al,(%eax)
    2bd7:	00 44 00 46          	add    %al,0x46(%eax,%eax,1)
    2bdb:	00 0c 00             	add    %cl,(%eax,%eax,1)
    2bde:	00 00                	add    %al,(%eax)
    2be0:	00 00                	add    %al,(%eax)
    2be2:	00 00                	add    %al,(%eax)
    2be4:	44                   	inc    %esp
    2be5:	00 47 00             	add    %al,0x0(%edi)
    2be8:	13 00                	adc    (%eax),%eax
    2bea:	00 00                	add    %al,(%eax)
    2bec:	00 00                	add    %al,(%eax)
    2bee:	00 00                	add    %al,(%eax)
    2bf0:	44                   	inc    %esp
    2bf1:	00 48 00             	add    %cl,0x0(%eax)
    2bf4:	1a 00                	sbb    (%eax),%al
    2bf6:	00 00                	add    %al,(%eax)
    2bf8:	00 00                	add    %al,(%eax)
    2bfa:	00 00                	add    %al,(%eax)
    2bfc:	44                   	inc    %esp
    2bfd:	00 4a 00             	add    %cl,0x0(%edx)
    2c00:	21 00                	and    %eax,(%eax)
    2c02:	00 00                	add    %al,(%eax)
    2c04:	c1 13 00             	rcll   $0x0,(%ebx)
    2c07:	00 40 00             	add    %al,0x0(%eax)
    2c0a:	00 00                	add    %al,(%eax)
    2c0c:	00 00                	add    %al,(%eax)
    2c0e:	00 00                	add    %al,(%eax)
    2c10:	cc                   	int3   
    2c11:	13 00                	adc    (%eax),%eax
    2c13:	00 24 00             	add    %ah,(%eax,%eax,1)
    2c16:	00 00                	add    %al,(%eax)
    2c18:	14 10                	adc    $0x10,%al
    2c1a:	28 00                	sub    %al,(%eax)
    2c1c:	e0 13                	loopne 2c31 <bootmain-0x27d3cf>
    2c1e:	00 00                	add    %al,(%eax)
    2c20:	a0 00 00 00 08       	mov    0x8000000,%al
    2c25:	00 00                	add    %al,(%eax)
    2c27:	00 00                	add    %al,(%eax)
    2c29:	00 00                	add    %al,(%eax)
    2c2b:	00 44 00 4c          	add    %al,0x4c(%eax,%eax,1)
	...
    2c37:	00 44 00 4d          	add    %al,0x4d(%eax,%eax,1)
    2c3b:	00 01                	add    %al,(%ecx)
    2c3d:	00 00                	add    %al,(%eax)
    2c3f:	00 00                	add    %al,(%eax)
    2c41:	00 00                	add    %al,(%eax)
    2c43:	00 44 00 4e          	add    %al,0x4e(%eax,%eax,1)
    2c47:	00 03                	add    %al,(%ebx)
    2c49:	00 00                	add    %al,(%eax)
    2c4b:	00 00                	add    %al,(%eax)
    2c4d:	00 00                	add    %al,(%eax)
    2c4f:	00 44 00 4c          	add    %al,0x4c(%eax,%eax,1)
    2c53:	00 05 00 00 00 00    	add    %al,0x0
    2c59:	00 00                	add    %al,(%eax)
    2c5b:	00 44 00 4c          	add    %al,0x4c(%eax,%eax,1)
    2c5f:	00 08                	add    %cl,(%eax)
    2c61:	00 00                	add    %al,(%eax)
    2c63:	00 00                	add    %al,(%eax)
    2c65:	00 00                	add    %al,(%eax)
    2c67:	00 44 00 4e          	add    %al,0x4e(%eax,%eax,1)
    2c6b:	00 0b                	add    %cl,(%ebx)
    2c6d:	00 00                	add    %al,(%eax)
    2c6f:	00 00                	add    %al,(%eax)
    2c71:	00 00                	add    %al,(%eax)
    2c73:	00 44 00 4e          	add    %al,0x4e(%eax,%eax,1)
    2c77:	00 0d 00 00 00 00    	add    %cl,0x0
    2c7d:	00 00                	add    %al,(%eax)
    2c7f:	00 44 00 4f          	add    %al,0x4f(%eax,%eax,1)
    2c83:	00 11                	add    %dl,(%ecx)
    2c85:	00 00                	add    %al,(%eax)
    2c87:	00 00                	add    %al,(%eax)
    2c89:	00 00                	add    %al,(%eax)
    2c8b:	00 44 00 4e          	add    %al,0x4e(%eax,%eax,1)
    2c8f:	00 15 00 00 00 00    	add    %dl,0x0
    2c95:	00 00                	add    %al,(%eax)
    2c97:	00 44 00 52          	add    %al,0x52(%eax,%eax,1)
    2c9b:	00 18                	add    %bl,(%eax)
    2c9d:	00 00                	add    %al,(%eax)
    2c9f:	00 39                	add    %bh,(%ecx)
    2ca1:	12 00                	adc    (%eax),%al
    2ca3:	00 40 00             	add    %al,0x0(%eax)
    2ca6:	00 00                	add    %al,(%eax)
    2ca8:	00 00                	add    %al,(%eax)
    2caa:	00 00                	add    %al,(%eax)
    2cac:	eb 13                	jmp    2cc1 <bootmain-0x27d33f>
    2cae:	00 00                	add    %al,(%eax)
    2cb0:	40                   	inc    %eax
    2cb1:	00 00                	add    %al,(%eax)
    2cb3:	00 02                	add    %al,(%edx)
    2cb5:	00 00                	add    %al,(%eax)
    2cb7:	00 c1                	add    %al,%cl
    2cb9:	13 00                	adc    (%eax),%eax
    2cbb:	00 40 00             	add    %al,0x0(%eax)
    2cbe:	00 00                	add    %al,(%eax)
    2cc0:	01 00                	add    %eax,(%eax)
    2cc2:	00 00                	add    %al,(%eax)
    2cc4:	00 00                	add    %al,(%eax)
    2cc6:	00 00                	add    %al,(%eax)
    2cc8:	c0 00 00             	rolb   $0x0,(%eax)
	...
    2cd3:	00 e0                	add    %ah,%al
    2cd5:	00 00                	add    %al,(%eax)
    2cd7:	00 1d 00 00 00 f4    	add    %bl,0xf4000000
    2cdd:	13 00                	adc    (%eax),%eax
    2cdf:	00 24 00             	add    %ah,(%eax,%eax,1)
    2ce2:	00 00                	add    %al,(%eax)
    2ce4:	31 10                	xor    %edx,(%eax)
    2ce6:	28 00                	sub    %al,(%eax)
    2ce8:	e0 13                	loopne 2cfd <bootmain-0x27d303>
    2cea:	00 00                	add    %al,(%eax)
    2cec:	a0 00 00 00 08       	mov    0x8000000,%al
    2cf1:	00 00                	add    %al,(%eax)
    2cf3:	00 08                	add    %cl,(%eax)
    2cf5:	14 00                	adc    $0x0,%al
    2cf7:	00 a0 00 00 00 0c    	add    %ah,0xc000000(%eax)
    2cfd:	00 00                	add    %al,(%eax)
    2cff:	00 00                	add    %al,(%eax)
    2d01:	00 00                	add    %al,(%eax)
    2d03:	00 44 00 54          	add    %al,0x54(%eax,%eax,1)
	...
    2d0f:	00 44 00 54          	add    %al,0x54(%eax,%eax,1)
    2d13:	00 09                	add    %cl,(%ecx)
    2d15:	00 00                	add    %al,(%eax)
    2d17:	00 00                	add    %al,(%eax)
    2d19:	00 00                	add    %al,(%eax)
    2d1b:	00 44 00 56          	add    %al,0x56(%eax,%eax,1)
    2d1f:	00 0c 00             	add    %cl,(%eax,%eax,1)
    2d22:	00 00                	add    %al,(%eax)
    2d24:	00 00                	add    %al,(%eax)
    2d26:	00 00                	add    %al,(%eax)
    2d28:	44                   	inc    %esp
    2d29:	00 56 00             	add    %dl,0x0(%esi)
    2d2c:	11 00                	adc    %eax,(%eax)
    2d2e:	00 00                	add    %al,(%eax)
    2d30:	00 00                	add    %al,(%eax)
    2d32:	00 00                	add    %al,(%eax)
    2d34:	44                   	inc    %esp
    2d35:	00 56 00             	add    %dl,0x0(%esi)
    2d38:	13 00                	adc    (%eax),%eax
    2d3a:	00 00                	add    %al,(%eax)
    2d3c:	00 00                	add    %al,(%eax)
    2d3e:	00 00                	add    %al,(%eax)
    2d40:	44                   	inc    %esp
    2d41:	00 57 00             	add    %dl,0x0(%edi)
    2d44:	18 00                	sbb    %al,(%eax)
    2d46:	00 00                	add    %al,(%eax)
    2d48:	00 00                	add    %al,(%eax)
    2d4a:	00 00                	add    %al,(%eax)
    2d4c:	44                   	inc    %esp
    2d4d:	00 57 00             	add    %dl,0x0(%edi)
    2d50:	1c 00                	sbb    $0x0,%al
    2d52:	00 00                	add    %al,(%eax)
    2d54:	00 00                	add    %al,(%eax)
    2d56:	00 00                	add    %al,(%eax)
    2d58:	44                   	inc    %esp
    2d59:	00 59 00             	add    %bl,0x0(%ecx)
    2d5c:	24 00                	and    $0x0,%al
    2d5e:	00 00                	add    %al,(%eax)
    2d60:	00 00                	add    %al,(%eax)
    2d62:	00 00                	add    %al,(%eax)
    2d64:	44                   	inc    %esp
    2d65:	00 58 00             	add    %bl,0x0(%eax)
    2d68:	27                   	daa    
    2d69:	00 00                	add    %al,(%eax)
    2d6b:	00 00                	add    %al,(%eax)
    2d6d:	00 00                	add    %al,(%eax)
    2d6f:	00 44 00 59          	add    %al,0x59(%eax,%eax,1)
    2d73:	00 2a                	add    %ch,(%edx)
    2d75:	00 00                	add    %al,(%eax)
    2d77:	00 00                	add    %al,(%eax)
    2d79:	00 00                	add    %al,(%eax)
    2d7b:	00 44 00 5a          	add    %al,0x5a(%eax,%eax,1)
    2d7f:	00 2c 00             	add    %ch,(%eax,%eax,1)
    2d82:	00 00                	add    %al,(%eax)
    2d84:	00 00                	add    %al,(%eax)
    2d86:	00 00                	add    %al,(%eax)
    2d88:	44                   	inc    %esp
    2d89:	00 59 00             	add    %bl,0x0(%ecx)
    2d8c:	2f                   	das    
    2d8d:	00 00                	add    %al,(%eax)
    2d8f:	00 00                	add    %al,(%eax)
    2d91:	00 00                	add    %al,(%eax)
    2d93:	00 44 00 5a          	add    %al,0x5a(%eax,%eax,1)
    2d97:	00 32                	add    %dh,(%edx)
    2d99:	00 00                	add    %al,(%eax)
    2d9b:	00 00                	add    %al,(%eax)
    2d9d:	00 00                	add    %al,(%eax)
    2d9f:	00 44 00 5b          	add    %al,0x5b(%eax,%eax,1)
    2da3:	00 35 00 00 00 00    	add    %dh,0x0
    2da9:	00 00                	add    %al,(%eax)
    2dab:	00 44 00 5c          	add    %al,0x5c(%eax,%eax,1)
    2daf:	00 37                	add    %dh,(%edi)
    2db1:	00 00                	add    %al,(%eax)
    2db3:	00 00                	add    %al,(%eax)
    2db5:	00 00                	add    %al,(%eax)
    2db7:	00 44 00 5d          	add    %al,0x5d(%eax,%eax,1)
    2dbb:	00 3d 00 00 00 00    	add    %bh,0x0
    2dc1:	00 00                	add    %al,(%eax)
    2dc3:	00 44 00 5e          	add    %al,0x5e(%eax,%eax,1)
    2dc7:	00 41 00             	add    %al,0x0(%ecx)
    2dca:	00 00                	add    %al,(%eax)
    2dcc:	00 00                	add    %al,(%eax)
    2dce:	00 00                	add    %al,(%eax)
    2dd0:	44                   	inc    %esp
    2dd1:	00 5e 00             	add    %bl,0x0(%esi)
    2dd4:	42                   	inc    %edx
    2dd5:	00 00                	add    %al,(%eax)
    2dd7:	00 00                	add    %al,(%eax)
    2dd9:	00 00                	add    %al,(%eax)
    2ddb:	00 44 00 56          	add    %al,0x56(%eax,%eax,1)
    2ddf:	00 50 00             	add    %dl,0x0(%eax)
    2de2:	00 00                	add    %al,(%eax)
    2de4:	00 00                	add    %al,(%eax)
    2de6:	00 00                	add    %al,(%eax)
    2de8:	44                   	inc    %esp
    2de9:	00 64 00 53          	add    %ah,0x53(%eax,%eax,1)
    2ded:	00 00                	add    %al,(%eax)
    2def:	00 00                	add    %al,(%eax)
    2df1:	00 00                	add    %al,(%eax)
    2df3:	00 44 00 65          	add    %al,0x65(%eax,%eax,1)
    2df7:	00 55 00             	add    %dl,0x0(%ebp)
    2dfa:	00 00                	add    %al,(%eax)
    2dfc:	39 12                	cmp    %edx,(%edx)
    2dfe:	00 00                	add    %al,(%eax)
    2e00:	40                   	inc    %eax
    2e01:	00 00                	add    %al,(%eax)
    2e03:	00 00                	add    %al,(%eax)
    2e05:	00 00                	add    %al,(%eax)
    2e07:	00 14 14             	add    %dl,(%esp,%edx,1)
    2e0a:	00 00                	add    %al,(%eax)
    2e0c:	40                   	inc    %eax
    2e0d:	00 00                	add    %al,(%eax)
    2e0f:	00 03                	add    %al,(%ebx)
    2e11:	00 00                	add    %al,(%eax)
    2e13:	00 c1                	add    %al,%cl
    2e15:	13 00                	adc    (%eax),%eax
    2e17:	00 40 00             	add    %al,0x0(%eax)
    2e1a:	00 00                	add    %al,(%eax)
    2e1c:	02 00                	add    (%eax),%al
    2e1e:	00 00                	add    %al,(%eax)
    2e20:	00 00                	add    %al,(%eax)
    2e22:	00 00                	add    %al,(%eax)
    2e24:	c0 00 00             	rolb   $0x0,(%eax)
	...
    2e2f:	00 e0                	add    %ah,%al
    2e31:	00 00                	add    %al,(%eax)
    2e33:	00 5f 00             	add    %bl,0x0(%edi)
    2e36:	00 00                	add    %al,(%eax)
    2e38:	1d 14 00 00 24       	sbb    $0x24000014,%eax
    2e3d:	00 00                	add    %al,(%eax)
    2e3f:	00 90 10 28 00 e0    	add    %dl,-0x1fffd7f0(%eax)
    2e45:	13 00                	adc    (%eax),%eax
    2e47:	00 a0 00 00 00 08    	add    %ah,0x8000000(%eax)
    2e4d:	00 00                	add    %al,(%eax)
    2e4f:	00 30                	add    %dh,(%eax)
    2e51:	14 00                	adc    $0x0,%al
    2e53:	00 a0 00 00 00 0c    	add    %ah,0xc000000(%eax)
    2e59:	00 00                	add    %al,(%eax)
    2e5b:	00 08                	add    %cl,(%eax)
    2e5d:	14 00                	adc    $0x0,%al
    2e5f:	00 a0 00 00 00 10    	add    %ah,0x10000000(%eax)
    2e65:	00 00                	add    %al,(%eax)
    2e67:	00 00                	add    %al,(%eax)
    2e69:	00 00                	add    %al,(%eax)
    2e6b:	00 44 00 67          	add    %al,0x67(%eax,%eax,1)
	...
    2e77:	00 44 00 69          	add    %al,0x69(%eax,%eax,1)
    2e7b:	00 01                	add    %al,(%ecx)
    2e7d:	00 00                	add    %al,(%eax)
    2e7f:	00 00                	add    %al,(%eax)
    2e81:	00 00                	add    %al,(%eax)
    2e83:	00 44 00 67          	add    %al,0x67(%eax,%eax,1)
    2e87:	00 03                	add    %al,(%ebx)
    2e89:	00 00                	add    %al,(%eax)
    2e8b:	00 00                	add    %al,(%eax)
    2e8d:	00 00                	add    %al,(%eax)
    2e8f:	00 44 00 69          	add    %al,0x69(%eax,%eax,1)
    2e93:	00 0b                	add    %cl,(%ebx)
    2e95:	00 00                	add    %al,(%eax)
    2e97:	00 00                	add    %al,(%eax)
    2e99:	00 00                	add    %al,(%eax)
    2e9b:	00 44 00 69          	add    %al,0x69(%eax,%eax,1)
    2e9f:	00 0d 00 00 00 00    	add    %cl,0x0
    2ea5:	00 00                	add    %al,(%eax)
    2ea7:	00 44 00 6a          	add    %al,0x6a(%eax,%eax,1)
    2eab:	00 11                	add    %dl,(%ecx)
    2ead:	00 00                	add    %al,(%eax)
    2eaf:	00 00                	add    %al,(%eax)
    2eb1:	00 00                	add    %al,(%eax)
    2eb3:	00 44 00 69          	add    %al,0x69(%eax,%eax,1)
    2eb7:	00 1e                	add    %bl,(%esi)
    2eb9:	00 00                	add    %al,(%eax)
    2ebb:	00 00                	add    %al,(%eax)
    2ebd:	00 00                	add    %al,(%eax)
    2ebf:	00 44 00 6e          	add    %al,0x6e(%eax,%eax,1)
    2ec3:	00 21                	add    %ah,(%ecx)
    2ec5:	00 00                	add    %al,(%eax)
    2ec7:	00 00                	add    %al,(%eax)
    2ec9:	00 00                	add    %al,(%eax)
    2ecb:	00 44 00 6f          	add    %al,0x6f(%eax,%eax,1)
    2ecf:	00 28                	add    %ch,(%eax)
    2ed1:	00 00                	add    %al,(%eax)
    2ed3:	00 00                	add    %al,(%eax)
    2ed5:	00 00                	add    %al,(%eax)
    2ed7:	00 44 00 6f          	add    %al,0x6f(%eax,%eax,1)
    2edb:	00 2b                	add    %ch,(%ebx)
    2edd:	00 00                	add    %al,(%eax)
    2edf:	00 00                	add    %al,(%eax)
    2ee1:	00 00                	add    %al,(%eax)
    2ee3:	00 44 00 6f          	add    %al,0x6f(%eax,%eax,1)
    2ee7:	00 30                	add    %dh,(%eax)
    2ee9:	00 00                	add    %al,(%eax)
    2eeb:	00 00                	add    %al,(%eax)
    2eed:	00 00                	add    %al,(%eax)
    2eef:	00 44 00 70          	add    %al,0x70(%eax,%eax,1)
    2ef3:	00 35 00 00 00 00    	add    %dh,0x0
    2ef9:	00 00                	add    %al,(%eax)
    2efb:	00 44 00 71          	add    %al,0x71(%eax,%eax,1)
    2eff:	00 3b                	add    %bh,(%ebx)
    2f01:	00 00                	add    %al,(%eax)
    2f03:	00 00                	add    %al,(%eax)
    2f05:	00 00                	add    %al,(%eax)
    2f07:	00 44 00 72          	add    %al,0x72(%eax,%eax,1)
    2f0b:	00 3f                	add    %bh,(%edi)
    2f0d:	00 00                	add    %al,(%eax)
    2f0f:	00 00                	add    %al,(%eax)
    2f11:	00 00                	add    %al,(%eax)
    2f13:	00 44 00 72          	add    %al,0x72(%eax,%eax,1)
    2f17:	00 45 00             	add    %al,0x0(%ebp)
    2f1a:	00 00                	add    %al,(%eax)
    2f1c:	00 00                	add    %al,(%eax)
    2f1e:	00 00                	add    %al,(%eax)
    2f20:	44                   	inc    %esp
    2f21:	00 73 00             	add    %dh,0x0(%ebx)
    2f24:	4a                   	dec    %edx
    2f25:	00 00                	add    %al,(%eax)
    2f27:	00 00                	add    %al,(%eax)
    2f29:	00 00                	add    %al,(%eax)
    2f2b:	00 44 00 74          	add    %al,0x74(%eax,%eax,1)
    2f2f:	00 4d 00             	add    %cl,0x0(%ebp)
    2f32:	00 00                	add    %al,(%eax)
    2f34:	00 00                	add    %al,(%eax)
    2f36:	00 00                	add    %al,(%eax)
    2f38:	44                   	inc    %esp
    2f39:	00 73 00             	add    %dh,0x0(%ebx)
    2f3c:	4e                   	dec    %esi
    2f3d:	00 00                	add    %al,(%eax)
    2f3f:	00 00                	add    %al,(%eax)
    2f41:	00 00                	add    %al,(%eax)
    2f43:	00 44 00 74          	add    %al,0x74(%eax,%eax,1)
    2f47:	00 51 00             	add    %dl,0x0(%ecx)
    2f4a:	00 00                	add    %al,(%eax)
    2f4c:	00 00                	add    %al,(%eax)
    2f4e:	00 00                	add    %al,(%eax)
    2f50:	44                   	inc    %esp
    2f51:	00 75 00             	add    %dh,0x0(%ebp)
    2f54:	53                   	push   %ebx
    2f55:	00 00                	add    %al,(%eax)
    2f57:	00 00                	add    %al,(%eax)
    2f59:	00 00                	add    %al,(%eax)
    2f5b:	00 44 00 76          	add    %al,0x76(%eax,%eax,1)
    2f5f:	00 57 00             	add    %dl,0x0(%edi)
    2f62:	00 00                	add    %al,(%eax)
    2f64:	00 00                	add    %al,(%eax)
    2f66:	00 00                	add    %al,(%eax)
    2f68:	44                   	inc    %esp
    2f69:	00 76 00             	add    %dh,0x0(%esi)
    2f6c:	58                   	pop    %eax
    2f6d:	00 00                	add    %al,(%eax)
    2f6f:	00 00                	add    %al,(%eax)
    2f71:	00 00                	add    %al,(%eax)
    2f73:	00 44 00 7d          	add    %al,0x7d(%eax,%eax,1)
    2f77:	00 66 00             	add    %ah,0x0(%esi)
    2f7a:	00 00                	add    %al,(%eax)
    2f7c:	00 00                	add    %al,(%eax)
    2f7e:	00 00                	add    %al,(%eax)
    2f80:	44                   	inc    %esp
    2f81:	00 7e 00             	add    %bh,0x0(%esi)
    2f84:	6a 00                	push   $0x0
    2f86:	00 00                	add    %al,(%eax)
    2f88:	00 00                	add    %al,(%eax)
    2f8a:	00 00                	add    %al,(%eax)
    2f8c:	44                   	inc    %esp
    2f8d:	00 7e 00             	add    %bh,0x0(%esi)
    2f90:	70 00                	jo     2f92 <bootmain-0x27d06e>
    2f92:	00 00                	add    %al,(%eax)
    2f94:	00 00                	add    %al,(%eax)
    2f96:	00 00                	add    %al,(%eax)
    2f98:	44                   	inc    %esp
    2f99:	00 7f 00             	add    %bh,0x0(%edi)
    2f9c:	75 00                	jne    2f9e <bootmain-0x27d062>
    2f9e:	00 00                	add    %al,(%eax)
    2fa0:	00 00                	add    %al,(%eax)
    2fa2:	00 00                	add    %al,(%eax)
    2fa4:	44                   	inc    %esp
    2fa5:	00 80 00 7b 00 00    	add    %al,0x7b00(%eax)
    2fab:	00 00                	add    %al,(%eax)
    2fad:	00 00                	add    %al,(%eax)
    2faf:	00 44 00 81          	add    %al,-0x7f(%eax,%eax,1)
    2fb3:	00 81 00 00 00 00    	add    %al,0x0(%ecx)
    2fb9:	00 00                	add    %al,(%eax)
    2fbb:	00 44 00 84          	add    %al,-0x7c(%eax,%eax,1)
    2fbf:	00 85 00 00 00 00    	add    %al,0x0(%ebp)
    2fc5:	00 00                	add    %al,(%eax)
    2fc7:	00 44 00 85          	add    %al,-0x7b(%eax,%eax,1)
    2fcb:	00 8f 00 00 00 00    	add    %cl,0x0(%edi)
    2fd1:	00 00                	add    %al,(%eax)
    2fd3:	00 44 00 86          	add    %al,-0x7a(%eax,%eax,1)
    2fd7:	00 93 00 00 00 00    	add    %dl,0x0(%ebx)
    2fdd:	00 00                	add    %al,(%eax)
    2fdf:	00 44 00 86          	add    %al,-0x7a(%eax,%eax,1)
    2fe3:	00 94 00 00 00 00 00 	add    %dl,0x0(%eax,%eax,1)
    2fea:	00 00                	add    %al,(%eax)
    2fec:	44                   	inc    %esp
    2fed:	00 88 00 a2 00 00    	add    %cl,0xa200(%eax)
    2ff3:	00 00                	add    %al,(%eax)
    2ff5:	00 00                	add    %al,(%eax)
    2ff7:	00 44 00 89          	add    %al,-0x77(%eax,%eax,1)
    2ffb:	00 a5 00 00 00 00    	add    %ah,0x0(%ebp)
    3001:	00 00                	add    %al,(%eax)
    3003:	00 44 00 8a          	add    %al,-0x76(%eax,%eax,1)
    3007:	00 aa 00 00 00 00    	add    %ch,0x0(%edx)
    300d:	00 00                	add    %al,(%eax)
    300f:	00 44 00 8c          	add    %al,-0x74(%eax,%eax,1)
    3013:	00 ad 00 00 00 00    	add    %ch,0x0(%ebp)
    3019:	00 00                	add    %al,(%eax)
    301b:	00 44 00 8d          	add    %al,-0x73(%eax,%eax,1)
    301f:	00 b3 00 00 00 00    	add    %dh,0x0(%ebx)
    3025:	00 00                	add    %al,(%eax)
    3027:	00 44 00 8f          	add    %al,-0x71(%eax,%eax,1)
    302b:	00 b9 00 00 00 00    	add    %bh,0x0(%ecx)
    3031:	00 00                	add    %al,(%eax)
    3033:	00 44 00 90          	add    %al,-0x70(%eax,%eax,1)
    3037:	00 bc 00 00 00 00 00 	add    %bh,0x0(%eax,%eax,1)
    303e:	00 00                	add    %al,(%eax)
    3040:	44                   	inc    %esp
    3041:	00 91 00 c2 00 00    	add    %dl,0xc200(%ecx)
    3047:	00 00                	add    %al,(%eax)
    3049:	00 00                	add    %al,(%eax)
    304b:	00 44 00 6e          	add    %al,0x6e(%eax,%eax,1)
    304f:	00 c7                	add    %al,%bh
    3051:	00 00                	add    %al,(%eax)
    3053:	00 00                	add    %al,(%eax)
    3055:	00 00                	add    %al,(%eax)
    3057:	00 44 00 92          	add    %al,-0x6e(%eax,%eax,1)
    305b:	00 d0                	add    %dl,%al
    305d:	00 00                	add    %al,(%eax)
    305f:	00 3c 14             	add    %bh,(%esp,%edx,1)
    3062:	00 00                	add    %al,(%eax)
    3064:	40                   	inc    %eax
    3065:	00 00                	add    %al,(%eax)
    3067:	00 01                	add    %al,(%ecx)
    3069:	00 00                	add    %al,(%eax)
    306b:	00 45 14             	add    %al,0x14(%ebp)
    306e:	00 00                	add    %al,(%eax)
    3070:	40                   	inc    %eax
    3071:	00 00                	add    %al,(%eax)
    3073:	00 01                	add    %al,(%ecx)
    3075:	00 00                	add    %al,(%eax)
    3077:	00 c1                	add    %al,%cl
    3079:	13 00                	adc    (%eax),%eax
    307b:	00 40 00             	add    %al,0x0(%eax)
	...
    3086:	00 00                	add    %al,(%eax)
    3088:	c0 00 00             	rolb   $0x0,(%eax)
	...
    3093:	00 e0                	add    %ah,%al
    3095:	00 00                	add    %al,(%eax)
    3097:	00 d5                	add    %dl,%ch
    3099:	00 00                	add    %al,(%eax)
    309b:	00 00                	add    %al,(%eax)
    309d:	00 00                	add    %al,(%eax)
    309f:	00 64 00 00          	add    %ah,0x0(%eax,%eax,1)
    30a3:	00 65 11             	add    %ah,0x11(%ebp)
    30a6:	28 00                	sub    %al,(%eax)

Disassembly of section .comment:

00000000 <.comment>:
   0:	47                   	inc    %edi
   1:	43                   	inc    %ebx
   2:	43                   	inc    %ebx
   3:	3a 20                	cmp    (%eax),%ah
   5:	28 47 4e             	sub    %al,0x4e(%edi)
   8:	55                   	push   %ebp
   9:	29 20                	sub    %esp,(%eax)
   b:	31 30                	xor    %esi,(%eax)
   d:	2e 32 2e             	xor    %cs:(%esi),%ch
  10:	30 00                	xor    %al,(%eax)

Disassembly of section .stabstr:

00000000 <.stabstr>:
       0:	00 6d 61             	add    %ch,0x61(%ebp)
       3:	69 6e 2e 63 00 67 63 	imul   $0x63670063,0x2e(%esi),%ebp
       a:	63 32                	arpl   %si,(%edx)
       c:	5f                   	pop    %edi
       d:	63 6f 6d             	arpl   %bp,0x6d(%edi)
      10:	70 69                	jo     7b <bootmain-0x27ff85>
      12:	6c                   	insb   (%dx),%es:(%edi)
      13:	65 64 2e 00 62 6f    	gs fs add %ah,%cs:0x6f(%edx)
      19:	6f                   	outsl  %ds:(%esi),(%dx)
      1a:	74 6d                	je     89 <bootmain-0x27ff77>
      1c:	61                   	popa   
      1d:	69 6e 3a 46 28 30 2c 	imul   $0x2c302846,0x3a(%esi),%ebp
      24:	31 29                	xor    %ebp,(%ecx)
      26:	3d 28 30 2c 31       	cmp    $0x312c3028,%eax
      2b:	29 00                	sub    %eax,(%eax)
      2d:	42                   	inc    %edx
      2e:	4f                   	dec    %edi
      2f:	4f                   	dec    %edi
      30:	54                   	push   %esp
      31:	49                   	dec    %ecx
      32:	4e                   	dec    %esi
      33:	46                   	inc    %esi
      34:	4f                   	dec    %edi
      35:	3a 54 28 30          	cmp    0x30(%eax,%ebp,1),%dl
      39:	2c 32                	sub    $0x32,%al
      3b:	29 3d 73 31 32 63    	sub    %edi,0x63323173
      41:	79 6c                	jns    af <bootmain-0x27ff51>
      43:	73 3a                	jae    7f <bootmain-0x27ff81>
      45:	28 30                	sub    %dh,(%eax)
      47:	2c 33                	sub    $0x33,%al
      49:	29 3d 72 28 30 2c    	sub    %edi,0x2c302872
      4f:	33 29                	xor    (%ecx),%ebp
      51:	3b 30                	cmp    (%eax),%esi
      53:	3b 31                	cmp    (%ecx),%esi
      55:	32 37                	xor    (%edi),%dh
      57:	3b 2c 30             	cmp    (%eax,%esi,1),%ebp
      5a:	2c 38                	sub    $0x38,%al
      5c:	3b 6c 65 64          	cmp    0x64(%ebp,%eiz,2),%ebp
      60:	73 3a                	jae    9c <bootmain-0x27ff64>
      62:	28 30                	sub    %dh,(%eax)
      64:	2c 33                	sub    $0x33,%al
      66:	29 2c 38             	sub    %ebp,(%eax,%edi,1)
      69:	2c 38                	sub    $0x38,%al
      6b:	3b 76 6d             	cmp    0x6d(%esi),%esi
      6e:	6f                   	outsl  %ds:(%esi),(%dx)
      6f:	64 65 3a 28          	fs cmp %gs:(%eax),%ch
      73:	30 2c 33             	xor    %ch,(%ebx,%esi,1)
      76:	29 2c 31             	sub    %ebp,(%ecx,%esi,1)
      79:	36 2c 38             	ss sub $0x38,%al
      7c:	3b 72 65             	cmp    0x65(%edx),%esi
      7f:	73 65                	jae    e6 <bootmain-0x27ff1a>
      81:	72 76                	jb     f9 <bootmain-0x27ff07>
      83:	65 3a 28             	cmp    %gs:(%eax),%ch
      86:	30 2c 33             	xor    %ch,(%ebx,%esi,1)
      89:	29 2c 32             	sub    %ebp,(%edx,%esi,1)
      8c:	34 2c                	xor    $0x2c,%al
      8e:	38 3b                	cmp    %bh,(%ebx)
      90:	73 63                	jae    f5 <bootmain-0x27ff0b>
      92:	72 6e                	jb     102 <bootmain-0x27fefe>
      94:	78 3a                	js     d0 <bootmain-0x27ff30>
      96:	28 30                	sub    %dh,(%eax)
      98:	2c 34                	sub    $0x34,%al
      9a:	29 3d 72 28 30 2c    	sub    %edi,0x2c302872
      a0:	34 29                	xor    $0x29,%al
      a2:	3b 2d 33 32 37 36    	cmp    0x36373233,%ebp
      a8:	38 3b                	cmp    %bh,(%ebx)
      aa:	33 32                	xor    (%edx),%esi
      ac:	37                   	aaa    
      ad:	36 37                	ss aaa 
      af:	3b 2c 33             	cmp    (%ebx,%esi,1),%ebp
      b2:	32 2c 31             	xor    (%ecx,%esi,1),%ch
      b5:	36 3b 73 63          	cmp    %ss:0x63(%ebx),%esi
      b9:	72 6e                	jb     129 <bootmain-0x27fed7>
      bb:	79 3a                	jns    f7 <bootmain-0x27ff09>
      bd:	28 30                	sub    %dh,(%eax)
      bf:	2c 34                	sub    $0x34,%al
      c1:	29 2c 34             	sub    %ebp,(%esp,%esi,1)
      c4:	38 2c 31             	cmp    %ch,(%ecx,%esi,1)
      c7:	36 3b 76 72          	cmp    %ss:0x72(%esi),%esi
      cb:	61                   	popa   
      cc:	6d                   	insl   (%dx),%es:(%edi)
      cd:	3a 28                	cmp    (%eax),%ch
      cf:	30 2c 35 29 3d 2a 28 	xor    %ch,0x282a3d29(,%esi,1)
      d6:	30 2c 33             	xor    %ch,(%ebx,%esi,1)
      d9:	29 2c 36             	sub    %ebp,(%esi,%esi,1)
      dc:	34 2c                	xor    $0x2c,%al
      de:	33 32                	xor    (%edx),%esi
      e0:	3b 3b                	cmp    (%ebx),%edi
      e2:	00 4d 45             	add    %cl,0x45(%ebp)
      e5:	4d                   	dec    %ebp
      e6:	4d                   	dec    %ebp
      e7:	41                   	inc    %ecx
      e8:	4e                   	dec    %esi
      e9:	3a 54 28 30          	cmp    0x30(%eax,%ebp,1),%dl
      ed:	2c 36                	sub    $0x36,%al
      ef:	29 3d 73 33 32 37    	sub    %edi,0x37323373
      f5:	33 36                	xor    (%esi),%esi
      f7:	66 72 65             	data16 jb 15f <bootmain-0x27fea1>
      fa:	65 73 3a             	gs jae 137 <bootmain-0x27fec9>
      fd:	28 30                	sub    %dh,(%eax)
      ff:	2c 37                	sub    $0x37,%al
     101:	29 3d 72 28 30 2c    	sub    %edi,0x2c302872
     107:	37                   	aaa    
     108:	29 3b                	sub    %edi,(%ebx)
     10a:	2d 32 31 34 37       	sub    $0x37343132,%eax
     10f:	34 38                	xor    $0x38,%al
     111:	33 36                	xor    (%esi),%esi
     113:	34 38                	xor    $0x38,%al
     115:	3b 32                	cmp    (%edx),%esi
     117:	31 34 37             	xor    %esi,(%edi,%esi,1)
     11a:	34 38                	xor    $0x38,%al
     11c:	33 36                	xor    (%esi),%esi
     11e:	34 37                	xor    $0x37,%al
     120:	3b 2c 30             	cmp    (%eax,%esi,1),%ebp
     123:	2c 33                	sub    $0x33,%al
     125:	32 3b                	xor    (%ebx),%bh
     127:	6d                   	insl   (%dx),%es:(%edi)
     128:	61                   	popa   
     129:	78 66                	js     191 <bootmain-0x27fe6f>
     12b:	72 65                	jb     192 <bootmain-0x27fe6e>
     12d:	65 73 3a             	gs jae 16a <bootmain-0x27fe96>
     130:	28 30                	sub    %dh,(%eax)
     132:	2c 37                	sub    $0x37,%al
     134:	29 2c 33             	sub    %ebp,(%ebx,%esi,1)
     137:	32 2c 33             	xor    (%ebx,%esi,1),%ch
     13a:	32 3b                	xor    (%ebx),%bh
     13c:	6c                   	insb   (%dx),%es:(%edi)
     13d:	6f                   	outsl  %ds:(%esi),(%dx)
     13e:	73 74                	jae    1b4 <bootmain-0x27fe4c>
     140:	73 69                	jae    1ab <bootmain-0x27fe55>
     142:	7a 65                	jp     1a9 <bootmain-0x27fe57>
     144:	3a 28                	cmp    (%eax),%ch
     146:	30 2c 37             	xor    %ch,(%edi,%esi,1)
     149:	29 2c 36             	sub    %ebp,(%esi,%esi,1)
     14c:	34 2c                	xor    $0x2c,%al
     14e:	33 32                	xor    (%edx),%esi
     150:	3b 6c 6f 73          	cmp    0x73(%edi,%ebp,2),%ebp
     154:	74 73                	je     1c9 <bootmain-0x27fe37>
     156:	3a 28                	cmp    (%eax),%ch
     158:	30 2c 37             	xor    %ch,(%edi,%esi,1)
     15b:	29 2c 39             	sub    %ebp,(%ecx,%edi,1)
     15e:	36 2c 33             	ss sub $0x33,%al
     161:	32 3b                	xor    (%ebx),%bh
     163:	66 72 65             	data16 jb 1cb <bootmain-0x27fe35>
     166:	65 3a 28             	cmp    %gs:(%eax),%ch
     169:	30 2c 38             	xor    %ch,(%eax,%edi,1)
     16c:	29 3d 61 72 28 30    	sub    %edi,0x30287261
     172:	2c 39                	sub    $0x39,%al
     174:	29 3d 72 28 30 2c    	sub    %edi,0x2c302872
     17a:	39 29                	cmp    %ebp,(%ecx)
     17c:	3b 30                	cmp    (%eax),%esi
     17e:	3b 34 32             	cmp    (%edx,%esi,1),%esi
     181:	39 34 39             	cmp    %esi,(%ecx,%edi,1)
     184:	36 37                	ss aaa 
     186:	32 39                	xor    (%ecx),%bh
     188:	35 3b 3b 30 3b       	xor    $0x3b303b3b,%eax
     18d:	34 30                	xor    $0x30,%al
     18f:	38 39                	cmp    %bh,(%ecx)
     191:	3b 28                	cmp    (%eax),%ebp
     193:	30 2c 31             	xor    %ch,(%ecx,%esi,1)
     196:	30 29                	xor    %ch,(%ecx)
     198:	3d 78 73 46 52       	cmp    $0x52467378,%eax
     19d:	45                   	inc    %ebp
     19e:	45                   	inc    %ebp
     19f:	49                   	dec    %ecx
     1a0:	4e                   	dec    %esi
     1a1:	46                   	inc    %esi
     1a2:	4f                   	dec    %edi
     1a3:	3a 2c 31             	cmp    (%ecx,%esi,1),%ch
     1a6:	32 38                	xor    (%eax),%bh
     1a8:	2c 32                	sub    $0x32,%al
     1aa:	36 31 37             	xor    %esi,%ss:(%edi)
     1ad:	36 30 3b             	xor    %bh,%ss:(%ebx)
     1b0:	3b 00                	cmp    (%eax),%eax
     1b2:	76 6f                	jbe    223 <bootmain-0x27fddd>
     1b4:	69 64 3a 74 28 30 2c 	imul   $0x312c3028,0x74(%edx,%edi,1),%esp
     1bb:	31 
     1bc:	29 00                	sub    %eax,(%eax)
     1be:	63 68 61             	arpl   %bp,0x61(%eax)
     1c1:	72 3a                	jb     1fd <bootmain-0x27fe03>
     1c3:	74 28                	je     1ed <bootmain-0x27fe13>
     1c5:	30 2c 33             	xor    %ch,(%ebx,%esi,1)
     1c8:	29 00                	sub    %eax,(%eax)
     1ca:	73 68                	jae    234 <bootmain-0x27fdcc>
     1cc:	6f                   	outsl  %ds:(%esi),(%dx)
     1cd:	72 74                	jb     243 <bootmain-0x27fdbd>
     1cf:	20 69 6e             	and    %ch,0x6e(%ecx)
     1d2:	74 3a                	je     20e <bootmain-0x27fdf2>
     1d4:	74 28                	je     1fe <bootmain-0x27fe02>
     1d6:	30 2c 34             	xor    %ch,(%esp,%esi,1)
     1d9:	29 00                	sub    %eax,(%eax)
     1db:	69 6e 74 3a 74 28 30 	imul   $0x3028743a,0x74(%esi),%ebp
     1e2:	2c 37                	sub    $0x37,%al
     1e4:	29 00                	sub    %eax,(%eax)
     1e6:	46                   	inc    %esi
     1e7:	52                   	push   %edx
     1e8:	45                   	inc    %ebp
     1e9:	45                   	inc    %ebp
     1ea:	49                   	dec    %ecx
     1eb:	4e                   	dec    %esi
     1ec:	46                   	inc    %esi
     1ed:	4f                   	dec    %edi
     1ee:	3a 54 28 30          	cmp    0x30(%eax,%ebp,1),%dl
     1f2:	2c 31                	sub    $0x31,%al
     1f4:	30 29                	xor    %ch,(%ecx)
     1f6:	3d 73 38 61 64       	cmp    $0x64613873,%eax
     1fb:	64 72 3a             	fs jb  238 <bootmain-0x27fdc8>
     1fe:	28 30                	sub    %dh,(%eax)
     200:	2c 31                	sub    $0x31,%al
     202:	31 29                	xor    %ebp,(%ecx)
     204:	3d 72 28 30 2c       	cmp    $0x2c302872,%eax
     209:	31 31                	xor    %esi,(%ecx)
     20b:	29 3b                	sub    %edi,(%ebx)
     20d:	30 3b                	xor    %bh,(%ebx)
     20f:	34 32                	xor    $0x32,%al
     211:	39 34 39             	cmp    %esi,(%ecx,%edi,1)
     214:	36 37                	ss aaa 
     216:	32 39                	xor    (%ecx),%bh
     218:	35 3b 2c 30 2c       	xor    $0x2c302c3b,%eax
     21d:	33 32                	xor    (%edx),%esi
     21f:	3b 73 69             	cmp    0x69(%ebx),%esi
     222:	7a 65                	jp     289 <bootmain-0x27fd77>
     224:	3a 28                	cmp    (%eax),%ch
     226:	30 2c 31             	xor    %ch,(%ecx,%esi,1)
     229:	31 29                	xor    %ebp,(%ecx)
     22b:	2c 33                	sub    $0x33,%al
     22d:	32 2c 33             	xor    (%ebx,%esi,1),%ch
     230:	32 3b                	xor    (%ebx),%bh
     232:	3b 00                	cmp    (%eax),%eax
     234:	75 6e                	jne    2a4 <bootmain-0x27fd5c>
     236:	73 69                	jae    2a1 <bootmain-0x27fd5f>
     238:	67 6e                	outsb  %ds:(%si),(%dx)
     23a:	65 64 20 69 6e       	gs and %ch,%fs:0x6e(%ecx)
     23f:	74 3a                	je     27b <bootmain-0x27fd85>
     241:	74 28                	je     26b <bootmain-0x27fd95>
     243:	30 2c 31             	xor    %ch,(%ecx,%esi,1)
     246:	31 29                	xor    %ebp,(%ecx)
     248:	00 2e                	add    %ch,(%esi)
     24a:	2f                   	das    
     24b:	78 38                	js     285 <bootmain-0x27fd7b>
     24d:	36 2e 68 00 73 3a 28 	ss cs push $0x283a7300
     254:	30 2c 31             	xor    %ch,(%ecx,%esi,1)
     257:	32 29                	xor    (%ecx),%ch
     259:	3d 61 72 28 30       	cmp    $0x30287261,%eax
     25e:	2c 39                	sub    $0x39,%al
     260:	29 3b                	sub    %edi,(%ebx)
     262:	30 3b                	xor    %bh,(%ebx)
     264:	33 39                	xor    (%ecx),%edi
     266:	3b 28                	cmp    (%eax),%ebp
     268:	30 2c 33             	xor    %ch,(%ebx,%esi,1)
     26b:	29 00                	sub    %eax,(%eax)
     26d:	6d                   	insl   (%dx),%es:(%edi)
     26e:	63 75 72             	arpl   %si,0x72(%ebp)
     271:	73 6f                	jae    2e2 <bootmain-0x27fd1e>
     273:	72 3a                	jb     2af <bootmain-0x27fd51>
     275:	28 30                	sub    %dh,(%eax)
     277:	2c 31                	sub    $0x31,%al
     279:	33 29                	xor    (%ecx),%ebp
     27b:	3d 61 72 28 30       	cmp    $0x30287261,%eax
     280:	2c 39                	sub    $0x39,%al
     282:	29 3b                	sub    %edi,(%ebx)
     284:	30 3b                	xor    %bh,(%ebx)
     286:	32 35 35 3b 28 30    	xor    0x30283b35,%dh
     28c:	2c 33                	sub    $0x33,%al
     28e:	29 00                	sub    %eax,(%eax)
     290:	6b 65 79 62          	imul   $0x62,0x79(%ebp),%esp
     294:	75 66                	jne    2fc <bootmain-0x27fd04>
     296:	3a 28                	cmp    (%eax),%ch
     298:	30 2c 31             	xor    %ch,(%ecx,%esi,1)
     29b:	34 29                	xor    $0x29,%al
     29d:	3d 61 72 28 30       	cmp    $0x30287261,%eax
     2a2:	2c 39                	sub    $0x39,%al
     2a4:	29 3b                	sub    %edi,(%ebx)
     2a6:	30 3b                	xor    %bh,(%ebx)
     2a8:	33 31                	xor    (%ecx),%esi
     2aa:	3b 28                	cmp    (%eax),%ebp
     2ac:	30 2c 31             	xor    %ch,(%ecx,%esi,1)
     2af:	35 29 3d 72 28       	xor    $0x28723d29,%eax
     2b4:	30 2c 31             	xor    %ch,(%ecx,%esi,1)
     2b7:	35 29 3b 30 3b       	xor    $0x3b303b29,%eax
     2bc:	32 35 35 3b 00 75    	xor    0x75003b35,%dh
     2c2:	6e                   	outsb  %ds:(%esi),(%dx)
     2c3:	73 69                	jae    32e <bootmain-0x27fcd2>
     2c5:	67 6e                	outsb  %ds:(%si),(%dx)
     2c7:	65 64 20 63 68       	gs and %ah,%fs:0x68(%ebx)
     2cc:	61                   	popa   
     2cd:	72 3a                	jb     309 <bootmain-0x27fcf7>
     2cf:	74 28                	je     2f9 <bootmain-0x27fd07>
     2d1:	30 2c 31             	xor    %ch,(%ecx,%esi,1)
     2d4:	35 29 00 6d 6f       	xor    $0x6f6d0029,%eax
     2d9:	75 73                	jne    34e <bootmain-0x27fcb2>
     2db:	65 62 75 66          	bound  %esi,%gs:0x66(%ebp)
     2df:	3a 28                	cmp    (%eax),%ch
     2e1:	30 2c 31             	xor    %ch,(%ecx,%esi,1)
     2e4:	36 29 3d 61 72 28 30 	sub    %edi,%ss:0x30287261
     2eb:	2c 39                	sub    $0x39,%al
     2ed:	29 3b                	sub    %edi,(%ebx)
     2ef:	30 3b                	xor    %bh,(%ebx)
     2f1:	31 32                	xor    %esi,(%edx)
     2f3:	37                   	aaa    
     2f4:	3b 28                	cmp    (%eax),%ebp
     2f6:	30 2c 31             	xor    %ch,(%ecx,%esi,1)
     2f9:	35 29 00 6d 65       	xor    $0x656d0029,%eax
     2fe:	6d                   	insl   (%dx),%es:(%edi)
     2ff:	74 6f                	je     370 <bootmain-0x27fc90>
     301:	74 61                	je     364 <bootmain-0x27fc9c>
     303:	6c                   	insb   (%dx),%es:(%edi)
     304:	3a 72 28             	cmp    0x28(%edx),%dh
     307:	30 2c 31             	xor    %ch,(%ecx,%esi,1)
     30a:	31 29                	xor    %ebp,(%ecx)
     30c:	00 6d 64             	add    %ch,0x64(%ebp)
     30f:	65 63 3a             	arpl   %di,%gs:(%edx)
     312:	28 30                	sub    %dh,(%eax)
     314:	2c 31                	sub    $0x31,%al
     316:	37                   	aaa    
     317:	29 3d 78 73 4d 4f    	sub    %edi,0x4f4d7378
     31d:	55                   	push   %ebp
     31e:	53                   	push   %ebx
     31f:	45                   	inc    %ebp
     320:	5f                   	pop    %edi
     321:	44                   	inc    %esp
     322:	45                   	inc    %ebp
     323:	43                   	inc    %ebx
     324:	3a 00                	cmp    (%eax),%al
     326:	4d                   	dec    %ebp
     327:	4f                   	dec    %edi
     328:	55                   	push   %ebp
     329:	53                   	push   %ebx
     32a:	45                   	inc    %ebp
     32b:	5f                   	pop    %edi
     32c:	44                   	inc    %esp
     32d:	45                   	inc    %ebp
     32e:	43                   	inc    %ebx
     32f:	3a 54 28 30          	cmp    0x30(%eax,%ebp,1),%dl
     333:	2c 31                	sub    $0x31,%al
     335:	37                   	aaa    
     336:	29 3d 73 31 36 62    	sub    %edi,0x62363173
     33c:	75 66                	jne    3a4 <bootmain-0x27fc5c>
     33e:	3a 28                	cmp    (%eax),%ch
     340:	30 2c 31             	xor    %ch,(%ecx,%esi,1)
     343:	38 29                	cmp    %ch,(%ecx)
     345:	3d 61 72 28 30       	cmp    $0x30287261,%eax
     34a:	2c 39                	sub    $0x39,%al
     34c:	29 3b                	sub    %edi,(%ebx)
     34e:	30 3b                	xor    %bh,(%ebx)
     350:	32 3b                	xor    (%ebx),%bh
     352:	28 30                	sub    %dh,(%eax)
     354:	2c 31                	sub    $0x31,%al
     356:	35 29 2c 30 2c       	xor    $0x2c302c29,%eax
     35b:	32 34 3b             	xor    (%ebx,%edi,1),%dh
     35e:	70 68                	jo     3c8 <bootmain-0x27fc38>
     360:	61                   	popa   
     361:	73 65                	jae    3c8 <bootmain-0x27fc38>
     363:	3a 28                	cmp    (%eax),%ch
     365:	30 2c 31             	xor    %ch,(%ecx,%esi,1)
     368:	35 29 2c 32 34       	xor    $0x34322c29,%eax
     36d:	2c 38                	sub    $0x38,%al
     36f:	3b 78 3a             	cmp    0x3a(%eax),%edi
     372:	28 30                	sub    %dh,(%eax)
     374:	2c 37                	sub    $0x37,%al
     376:	29 2c 33             	sub    %ebp,(%ebx,%esi,1)
     379:	32 2c 33             	xor    (%ebx,%esi,1),%ch
     37c:	32 3b                	xor    (%ebx),%bh
     37e:	79 3a                	jns    3ba <bootmain-0x27fc46>
     380:	28 30                	sub    %dh,(%eax)
     382:	2c 37                	sub    $0x37,%al
     384:	29 2c 36             	sub    %ebp,(%esi,%esi,1)
     387:	34 2c                	xor    $0x2c,%al
     389:	33 32                	xor    (%edx),%esi
     38b:	3b 62 74             	cmp    0x74(%edx),%esp
     38e:	6e                   	outsb  %ds:(%esi),(%dx)
     38f:	3a 28                	cmp    (%eax),%ch
     391:	30 2c 37             	xor    %ch,(%edi,%esi,1)
     394:	29 2c 39             	sub    %ebp,(%ecx,%edi,1)
     397:	36 2c 33             	ss sub $0x33,%al
     39a:	32 3b                	xor    (%ebx),%bh
     39c:	3b 00                	cmp    (%eax),%eax
     39e:	68 61 6e 6b 61       	push   $0x616b6e61
     3a3:	6b 75 3a 47          	imul   $0x47,0x3a(%ebp),%esi
     3a7:	28 30                	sub    %dh,(%eax)
     3a9:	2c 31                	sub    $0x31,%al
     3ab:	39 29                	cmp    %ebp,(%ecx)
     3ad:	3d 61 72 28 30       	cmp    $0x30287261,%eax
     3b2:	2c 39                	sub    $0x39,%al
     3b4:	29 3b                	sub    %edi,(%ebx)
     3b6:	30 3b                	xor    %bh,(%ebx)
     3b8:	32 30                	xor    (%eax),%dh
     3ba:	34 37                	xor    $0x37,%al
     3bc:	3b 28                	cmp    (%eax),%ebp
     3be:	30 2c 33             	xor    %ch,(%ebx,%esi,1)
     3c1:	29 00                	sub    %eax,(%eax)
     3c3:	41                   	inc    %ecx
     3c4:	53                   	push   %ebx
     3c5:	43                   	inc    %ebx
     3c6:	49                   	dec    %ecx
     3c7:	49                   	dec    %ecx
     3c8:	5f                   	pop    %edi
     3c9:	54                   	push   %esp
     3ca:	61                   	popa   
     3cb:	62 6c 65 3a          	bound  %ebp,0x3a(%ebp,%eiz,2)
     3cf:	47                   	inc    %edi
     3d0:	28 30                	sub    %dh,(%eax)
     3d2:	2c 32                	sub    $0x32,%al
     3d4:	30 29                	xor    %ch,(%ecx)
     3d6:	3d 61 72 28 30       	cmp    $0x30287261,%eax
     3db:	2c 39                	sub    $0x39,%al
     3dd:	29 3b                	sub    %edi,(%ebx)
     3df:	30 3b                	xor    %bh,(%ebx)
     3e1:	32 32                	xor    (%edx),%dh
     3e3:	37                   	aaa    
     3e4:	39 3b                	cmp    %edi,(%ebx)
     3e6:	28 30                	sub    %dh,(%eax)
     3e8:	2c 32                	sub    $0x32,%al
     3ea:	31 29                	xor    %ebp,(%ecx)
     3ec:	3d 72 28 30 2c       	cmp    $0x2c302872,%eax
     3f1:	32 31                	xor    (%ecx),%dh
     3f3:	29 3b                	sub    %edi,(%ebx)
     3f5:	30 3b                	xor    %bh,(%ebx)
     3f7:	36 35 35 33 35 3b    	ss xor $0x3b353335,%eax
     3fd:	00 73 68             	add    %dh,0x68(%ebx)
     400:	6f                   	outsl  %ds:(%esi),(%dx)
     401:	72 74                	jb     477 <bootmain-0x27fb89>
     403:	20 75 6e             	and    %dh,0x6e(%ebp)
     406:	73 69                	jae    471 <bootmain-0x27fb8f>
     408:	67 6e                	outsb  %ds:(%si),(%dx)
     40a:	65 64 20 69 6e       	gs and %ch,%fs:0x6e(%ecx)
     40f:	74 3a                	je     44b <bootmain-0x27fbb5>
     411:	74 28                	je     43b <bootmain-0x27fbc5>
     413:	30 2c 32             	xor    %ch,(%edx,%esi,1)
     416:	31 29                	xor    %ebp,(%ecx)
     418:	00 73 63             	add    %dh,0x63(%ebx)
     41b:	72 65                	jb     482 <bootmain-0x27fb7e>
     41d:	65 6e                	outsb  %gs:(%esi),(%dx)
     41f:	2e 63 00             	arpl   %ax,%cs:(%eax)
     422:	63 6c 65 61          	arpl   %bp,0x61(%ebp,%eiz,2)
     426:	72 5f                	jb     487 <bootmain-0x27fb79>
     428:	73 63                	jae    48d <bootmain-0x27fb73>
     42a:	72 65                	jb     491 <bootmain-0x27fb6f>
     42c:	65 6e                	outsb  %gs:(%esi),(%dx)
     42e:	3a 46 28             	cmp    0x28(%esi),%al
     431:	30 2c 31             	xor    %ch,(%ecx,%esi,1)
     434:	29 3d 28 30 2c 31    	sub    %edi,0x312c3028
     43a:	29 00                	sub    %eax,(%eax)
     43c:	63 68 61             	arpl   %bp,0x61(%eax)
     43f:	72 3a                	jb     47b <bootmain-0x27fb85>
     441:	74 28                	je     46b <bootmain-0x27fb95>
     443:	30 2c 32             	xor    %ch,(%edx,%esi,1)
     446:	29 3d 72 28 30 2c    	sub    %edi,0x2c302872
     44c:	32 29                	xor    (%ecx),%ch
     44e:	3b 30                	cmp    (%eax),%esi
     450:	3b 31                	cmp    (%ecx),%esi
     452:	32 37                	xor    (%edi),%dh
     454:	3b 00                	cmp    (%eax),%eax
     456:	63 6f 6c             	arpl   %bp,0x6c(%edi)
     459:	6f                   	outsl  %ds:(%esi),(%dx)
     45a:	72 3a                	jb     496 <bootmain-0x27fb6a>
     45c:	70 28                	jo     486 <bootmain-0x27fb7a>
     45e:	30 2c 33             	xor    %ch,(%ebx,%esi,1)
     461:	29 3d 72 28 30 2c    	sub    %edi,0x2c302872
     467:	33 29                	xor    (%ecx),%ebp
     469:	3b 2d 32 31 34 37    	cmp    0x37343132,%ebp
     46f:	34 38                	xor    $0x38,%al
     471:	33 36                	xor    (%esi),%esi
     473:	34 38                	xor    $0x38,%al
     475:	3b 32                	cmp    (%edx),%esi
     477:	31 34 37             	xor    %esi,(%edi,%esi,1)
     47a:	34 38                	xor    $0x38,%al
     47c:	33 36                	xor    (%esi),%esi
     47e:	34 37                	xor    $0x37,%al
     480:	3b 00                	cmp    (%eax),%eax
     482:	69 6e 74 3a 74 28 30 	imul   $0x3028743a,0x74(%esi),%ebp
     489:	2c 33                	sub    $0x33,%al
     48b:	29 00                	sub    %eax,(%eax)
     48d:	69 3a 72 28 30 2c    	imul   $0x2c302872,(%edx),%edi
     493:	33 29                	xor    (%ecx),%ebp
     495:	00 63 6f             	add    %ah,0x6f(%ebx)
     498:	6c                   	insb   (%dx),%es:(%edi)
     499:	6f                   	outsl  %ds:(%esi),(%dx)
     49a:	72 3a                	jb     4d6 <bootmain-0x27fb2a>
     49c:	72 28                	jb     4c6 <bootmain-0x27fb3a>
     49e:	30 2c 32             	xor    %ch,(%edx,%esi,1)
     4a1:	29 00                	sub    %eax,(%eax)
     4a3:	63 6f 6c             	arpl   %bp,0x6c(%edi)
     4a6:	6f                   	outsl  %ds:(%esi),(%dx)
     4a7:	72 5f                	jb     508 <bootmain-0x27faf8>
     4a9:	73 63                	jae    50e <bootmain-0x27faf2>
     4ab:	72 65                	jb     512 <bootmain-0x27faee>
     4ad:	65 6e                	outsb  %gs:(%esi),(%dx)
     4af:	3a 46 28             	cmp    0x28(%esi),%al
     4b2:	30 2c 31             	xor    %ch,(%ecx,%esi,1)
     4b5:	29 00                	sub    %eax,(%eax)
     4b7:	63 6f 6c             	arpl   %bp,0x6c(%edi)
     4ba:	6f                   	outsl  %ds:(%esi),(%dx)
     4bb:	72 3a                	jb     4f7 <bootmain-0x27fb09>
     4bd:	70 28                	jo     4e7 <bootmain-0x27fb19>
     4bf:	30 2c 33             	xor    %ch,(%ebx,%esi,1)
     4c2:	29 00                	sub    %eax,(%eax)
     4c4:	73 65                	jae    52b <bootmain-0x27fad5>
     4c6:	74 5f                	je     527 <bootmain-0x27fad9>
     4c8:	70 61                	jo     52b <bootmain-0x27fad5>
     4ca:	6c                   	insb   (%dx),%es:(%edi)
     4cb:	65 74 74             	gs je  542 <bootmain-0x27fabe>
     4ce:	65 3a 46 28          	cmp    %gs:0x28(%esi),%al
     4d2:	30 2c 31             	xor    %ch,(%ecx,%esi,1)
     4d5:	29 00                	sub    %eax,(%eax)
     4d7:	73 74                	jae    54d <bootmain-0x27fab3>
     4d9:	61                   	popa   
     4da:	72 74                	jb     550 <bootmain-0x27fab0>
     4dc:	3a 70 28             	cmp    0x28(%eax),%dh
     4df:	30 2c 33             	xor    %ch,(%ebx,%esi,1)
     4e2:	29 00                	sub    %eax,(%eax)
     4e4:	65 6e                	outsb  %gs:(%esi),(%dx)
     4e6:	64 3a 70 28          	cmp    %fs:0x28(%eax),%dh
     4ea:	30 2c 33             	xor    %ch,(%ebx,%esi,1)
     4ed:	29 00                	sub    %eax,(%eax)
     4ef:	72 67                	jb     558 <bootmain-0x27faa8>
     4f1:	62 3a                	bound  %edi,(%edx)
     4f3:	70 28                	jo     51d <bootmain-0x27fae3>
     4f5:	30 2c 34             	xor    %ch,(%esp,%esi,1)
     4f8:	29 3d 2a 28 30 2c    	sub    %edi,0x2c30282a
     4fe:	35 29 3d 72 28       	xor    $0x28723d29,%eax
     503:	30 2c 35 29 3b 30 3b 	xor    %ch,0x3b303b29(,%esi,1)
     50a:	32 35 35 3b 00 75    	xor    0x75003b35,%dh
     510:	6e                   	outsb  %ds:(%esi),(%dx)
     511:	73 69                	jae    57c <bootmain-0x27fa84>
     513:	67 6e                	outsb  %ds:(%si),(%dx)
     515:	65 64 20 63 68       	gs and %ah,%fs:0x68(%ebx)
     51a:	61                   	popa   
     51b:	72 3a                	jb     557 <bootmain-0x27faa9>
     51d:	74 28                	je     547 <bootmain-0x27fab9>
     51f:	30 2c 35 29 00 73 74 	xor    %ch,0x74730029(,%esi,1)
     526:	61                   	popa   
     527:	72 74                	jb     59d <bootmain-0x27fa63>
     529:	3a 72 28             	cmp    0x28(%edx),%dh
     52c:	30 2c 33             	xor    %ch,(%ebx,%esi,1)
     52f:	29 00                	sub    %eax,(%eax)
     531:	72 67                	jb     59a <bootmain-0x27fa66>
     533:	62 3a                	bound  %edi,(%edx)
     535:	72 28                	jb     55f <bootmain-0x27faa1>
     537:	30 2c 34             	xor    %ch,(%esp,%esi,1)
     53a:	29 00                	sub    %eax,(%eax)
     53c:	75 69                	jne    5a7 <bootmain-0x27fa59>
     53e:	6e                   	outsb  %ds:(%esi),(%dx)
     53f:	74 33                	je     574 <bootmain-0x27fa8c>
     541:	32 5f 74             	xor    0x74(%edi),%bl
     544:	3a 74 28 30          	cmp    0x30(%eax,%ebp,1),%dh
     548:	2c 36                	sub    $0x36,%al
     54a:	29 3d 28 30 2c 37    	sub    %edi,0x372c3028
     550:	29 3d 72 28 30 2c    	sub    %edi,0x2c302872
     556:	37                   	aaa    
     557:	29 3b                	sub    %edi,(%ebx)
     559:	30 3b                	xor    %bh,(%ebx)
     55b:	34 32                	xor    $0x32,%al
     55d:	39 34 39             	cmp    %esi,(%ecx,%edi,1)
     560:	36 37                	ss aaa 
     562:	32 39                	xor    (%ecx),%bh
     564:	35 3b 00 75 6e       	xor    $0x6e75003b,%eax
     569:	73 69                	jae    5d4 <bootmain-0x27fa2c>
     56b:	67 6e                	outsb  %ds:(%si),(%dx)
     56d:	65 64 20 69 6e       	gs and %ch,%fs:0x6e(%ecx)
     572:	74 3a                	je     5ae <bootmain-0x27fa52>
     574:	74 28                	je     59e <bootmain-0x27fa62>
     576:	30 2c 37             	xor    %ch,(%edi,%esi,1)
     579:	29 00                	sub    %eax,(%eax)
     57b:	69 6e 69 74 5f 70 61 	imul   $0x61705f74,0x69(%esi),%ebp
     582:	6c                   	insb   (%dx),%es:(%edi)
     583:	65 74 74             	gs je  5fa <bootmain-0x27fa06>
     586:	65 3a 46 28          	cmp    %gs:0x28(%esi),%al
     58a:	30 2c 31             	xor    %ch,(%ecx,%esi,1)
     58d:	29 00                	sub    %eax,(%eax)
     58f:	74 61                	je     5f2 <bootmain-0x27fa0e>
     591:	62 6c 65 5f          	bound  %ebp,0x5f(%ebp,%eiz,2)
     595:	72 67                	jb     5fe <bootmain-0x27fa02>
     597:	62 3a                	bound  %edi,(%edx)
     599:	56                   	push   %esi
     59a:	28 30                	sub    %dh,(%eax)
     59c:	2c 38                	sub    $0x38,%al
     59e:	29 3d 61 72 28 30    	sub    %edi,0x30287261
     5a4:	2c 39                	sub    $0x39,%al
     5a6:	29 3d 72 28 30 2c    	sub    %edi,0x2c302872
     5ac:	39 29                	cmp    %ebp,(%ecx)
     5ae:	3b 30                	cmp    (%eax),%esi
     5b0:	3b 34 32             	cmp    (%edx,%esi,1),%esi
     5b3:	39 34 39             	cmp    %esi,(%ecx,%edi,1)
     5b6:	36 37                	ss aaa 
     5b8:	32 39                	xor    (%ecx),%bh
     5ba:	35 3b 3b 30 3b       	xor    $0x3b303b3b,%eax
     5bf:	34 37                	xor    $0x37,%al
     5c1:	3b 28                	cmp    (%eax),%ebp
     5c3:	30 2c 35 29 00 62 6f 	xor    %ch,0x6f620029(,%esi,1)
     5ca:	78 66                	js     632 <bootmain-0x27f9ce>
     5cc:	69 6c 6c 38 3a 46 28 	imul   $0x3028463a,0x38(%esp,%ebp,2),%ebp
     5d3:	30 
     5d4:	2c 31                	sub    $0x31,%al
     5d6:	29 00                	sub    %eax,(%eax)
     5d8:	76 72                	jbe    64c <bootmain-0x27f9b4>
     5da:	61                   	popa   
     5db:	6d                   	insl   (%dx),%es:(%edi)
     5dc:	3a 70 28             	cmp    0x28(%eax),%dh
     5df:	30 2c 31             	xor    %ch,(%ecx,%esi,1)
     5e2:	30 29                	xor    %ch,(%ecx)
     5e4:	3d 2a 28 30 2c       	cmp    $0x2c30282a,%eax
     5e9:	32 29                	xor    (%ecx),%ch
     5eb:	00 78 73             	add    %bh,0x73(%eax)
     5ee:	69 7a 65 3a 70 28 30 	imul   $0x3028703a,0x65(%edx),%edi
     5f5:	2c 33                	sub    $0x33,%al
     5f7:	29 00                	sub    %eax,(%eax)
     5f9:	63 3a                	arpl   %di,(%edx)
     5fb:	70 28                	jo     625 <bootmain-0x27f9db>
     5fd:	30 2c 33             	xor    %ch,(%ebx,%esi,1)
     600:	29 00                	sub    %eax,(%eax)
     602:	78 30                	js     634 <bootmain-0x27f9cc>
     604:	3a 70 28             	cmp    0x28(%eax),%dh
     607:	30 2c 33             	xor    %ch,(%ebx,%esi,1)
     60a:	29 00                	sub    %eax,(%eax)
     60c:	79 30                	jns    63e <bootmain-0x27f9c2>
     60e:	3a 70 28             	cmp    0x28(%eax),%dh
     611:	30 2c 33             	xor    %ch,(%ebx,%esi,1)
     614:	29 00                	sub    %eax,(%eax)
     616:	78 31                	js     649 <bootmain-0x27f9b7>
     618:	3a 70 28             	cmp    0x28(%eax),%dh
     61b:	30 2c 33             	xor    %ch,(%ebx,%esi,1)
     61e:	29 00                	sub    %eax,(%eax)
     620:	79 31                	jns    653 <bootmain-0x27f9ad>
     622:	3a 70 28             	cmp    0x28(%eax),%dh
     625:	30 2c 33             	xor    %ch,(%ebx,%esi,1)
     628:	29 00                	sub    %eax,(%eax)
     62a:	78 3a                	js     666 <bootmain-0x27f99a>
     62c:	72 28                	jb     656 <bootmain-0x27f9aa>
     62e:	30 2c 33             	xor    %ch,(%ebx,%esi,1)
     631:	29 00                	sub    %eax,(%eax)
     633:	79 3a                	jns    66f <bootmain-0x27f991>
     635:	72 28                	jb     65f <bootmain-0x27f9a1>
     637:	30 2c 33             	xor    %ch,(%ebx,%esi,1)
     63a:	29 00                	sub    %eax,(%eax)
     63c:	78 73                	js     6b1 <bootmain-0x27f94f>
     63e:	69 7a 65 3a 72 28 30 	imul   $0x3028723a,0x65(%edx),%edi
     645:	2c 33                	sub    $0x33,%al
     647:	29 00                	sub    %eax,(%eax)
     649:	63 3a                	arpl   %di,(%edx)
     64b:	72 28                	jb     675 <bootmain-0x27f98b>
     64d:	30 2c 35 29 00 79 30 	xor    %ch,0x30790029(,%esi,1)
     654:	3a 72 28             	cmp    0x28(%edx),%dh
     657:	30 2c 33             	xor    %ch,(%ebx,%esi,1)
     65a:	29 00                	sub    %eax,(%eax)
     65c:	69 6e 69 74 5f 73 63 	imul   $0x63735f74,0x69(%esi),%ebp
     663:	72 65                	jb     6ca <bootmain-0x27f936>
     665:	65 6e                	outsb  %gs:(%esi),(%dx)
     667:	38 3a                	cmp    %bh,(%edx)
     669:	46                   	inc    %esi
     66a:	28 30                	sub    %dh,(%eax)
     66c:	2c 31                	sub    $0x31,%al
     66e:	29 00                	sub    %eax,(%eax)
     670:	76 72                	jbe    6e4 <bootmain-0x27f91c>
     672:	61                   	popa   
     673:	6d                   	insl   (%dx),%es:(%edi)
     674:	3a 70 28             	cmp    0x28(%eax),%dh
     677:	30 2c 31             	xor    %ch,(%ecx,%esi,1)
     67a:	30 29                	xor    %ch,(%ecx)
     67c:	00 78 3a             	add    %bh,0x3a(%eax)
     67f:	70 28                	jo     6a9 <bootmain-0x27f957>
     681:	30 2c 33             	xor    %ch,(%ebx,%esi,1)
     684:	29 00                	sub    %eax,(%eax)
     686:	79 3a                	jns    6c2 <bootmain-0x27f93e>
     688:	70 28                	jo     6b2 <bootmain-0x27f94e>
     68a:	30 2c 33             	xor    %ch,(%ebx,%esi,1)
     68d:	29 00                	sub    %eax,(%eax)
     68f:	70 75                	jo     706 <bootmain-0x27f8fa>
     691:	74 66                	je     6f9 <bootmain-0x27f907>
     693:	6f                   	outsl  %ds:(%esi),(%dx)
     694:	6e                   	outsb  %ds:(%esi),(%dx)
     695:	74 38                	je     6cf <bootmain-0x27f931>
     697:	3a 46 28             	cmp    0x28(%esi),%al
     69a:	30 2c 31             	xor    %ch,(%ecx,%esi,1)
     69d:	29 00                	sub    %eax,(%eax)
     69f:	66 6f                	outsw  %ds:(%esi),(%dx)
     6a1:	6e                   	outsb  %ds:(%esi),(%dx)
     6a2:	74 3a                	je     6de <bootmain-0x27f922>
     6a4:	70 28                	jo     6ce <bootmain-0x27f932>
     6a6:	30 2c 31             	xor    %ch,(%ecx,%esi,1)
     6a9:	30 29                	xor    %ch,(%ecx)
     6ab:	00 64 3a 72          	add    %ah,0x72(%edx,%edi,1)
     6af:	28 30                	sub    %dh,(%eax)
     6b1:	2c 32                	sub    $0x32,%al
     6b3:	29 00                	sub    %eax,(%eax)
     6b5:	63 3a                	arpl   %di,(%edx)
     6b7:	72 28                	jb     6e1 <bootmain-0x27f91f>
     6b9:	30 2c 32             	xor    %ch,(%edx,%esi,1)
     6bc:	29 00                	sub    %eax,(%eax)
     6be:	70 75                	jo     735 <bootmain-0x27f8cb>
     6c0:	74 66                	je     728 <bootmain-0x27f8d8>
     6c2:	6f                   	outsl  %ds:(%esi),(%dx)
     6c3:	6e                   	outsb  %ds:(%esi),(%dx)
     6c4:	74 73                	je     739 <bootmain-0x27f8c7>
     6c6:	38 5f 61             	cmp    %bl,0x61(%edi)
     6c9:	73 63                	jae    72e <bootmain-0x27f8d2>
     6cb:	3a 46 28             	cmp    0x28(%esi),%al
     6ce:	30 2c 31             	xor    %ch,(%ecx,%esi,1)
     6d1:	29 00                	sub    %eax,(%eax)
     6d3:	73 3a                	jae    70f <bootmain-0x27f8f1>
     6d5:	70 28                	jo     6ff <bootmain-0x27f901>
     6d7:	30 2c 31             	xor    %ch,(%ecx,%esi,1)
     6da:	30 29                	xor    %ch,(%ecx)
     6dc:	00 69 6e             	add    %ch,0x6e(%ecx)
     6df:	69 74 5f 6d 6f 75 73 	imul   $0x6573756f,0x6d(%edi,%ebx,2),%esi
     6e6:	65 
     6e7:	5f                   	pop    %edi
     6e8:	63 75 72             	arpl   %si,0x72(%ebp)
     6eb:	73 6f                	jae    75c <bootmain-0x27f8a4>
     6ed:	72 38                	jb     727 <bootmain-0x27f8d9>
     6ef:	3a 46 28             	cmp    0x28(%esi),%al
     6f2:	30 2c 31             	xor    %ch,(%ecx,%esi,1)
     6f5:	29 00                	sub    %eax,(%eax)
     6f7:	6d                   	insl   (%dx),%es:(%edi)
     6f8:	6f                   	outsl  %ds:(%esi),(%dx)
     6f9:	75 73                	jne    76e <bootmain-0x27f892>
     6fb:	65 3a 70 28          	cmp    %gs:0x28(%eax),%dh
     6ff:	30 2c 31             	xor    %ch,(%ecx,%esi,1)
     702:	30 29                	xor    %ch,(%ecx)
     704:	00 62 67             	add    %ah,0x67(%edx)
     707:	3a 70 28             	cmp    0x28(%eax),%dh
     70a:	30 2c 33             	xor    %ch,(%ebx,%esi,1)
     70d:	29 00                	sub    %eax,(%eax)
     70f:	63 75 72             	arpl   %si,0x72(%ebp)
     712:	73 6f                	jae    783 <bootmain-0x27f87d>
     714:	72 3a                	jb     750 <bootmain-0x27f8b0>
     716:	56                   	push   %esi
     717:	28 30                	sub    %dh,(%eax)
     719:	2c 31                	sub    $0x31,%al
     71b:	31 29                	xor    %ebp,(%ecx)
     71d:	3d 61 72 28 30       	cmp    $0x30287261,%eax
     722:	2c 39                	sub    $0x39,%al
     724:	29 3b                	sub    %edi,(%ebx)
     726:	30 3b                	xor    %bh,(%ebx)
     728:	31 35 3b 28 30 2c    	xor    %esi,0x2c30283b
     72e:	31 32                	xor    %esi,(%edx)
     730:	29 3d 61 72 28 30    	sub    %edi,0x30287261
     736:	2c 39                	sub    $0x39,%al
     738:	29 3b                	sub    %edi,(%ebx)
     73a:	30 3b                	xor    %bh,(%ebx)
     73c:	31 35 3b 28 30 2c    	xor    %esi,0x2c30283b
     742:	32 29                	xor    (%ecx),%ch
     744:	00 70 75             	add    %dh,0x75(%eax)
     747:	74 62                	je     7ab <bootmain-0x27f855>
     749:	6c                   	insb   (%dx),%es:(%edi)
     74a:	6f                   	outsl  %ds:(%esi),(%dx)
     74b:	63 6b 38             	arpl   %bp,0x38(%ebx)
     74e:	5f                   	pop    %edi
     74f:	38 3a                	cmp    %bh,(%edx)
     751:	46                   	inc    %esi
     752:	28 30                	sub    %dh,(%eax)
     754:	2c 31                	sub    $0x31,%al
     756:	29 00                	sub    %eax,(%eax)
     758:	70 78                	jo     7d2 <bootmain-0x27f82e>
     75a:	73 69                	jae    7c5 <bootmain-0x27f83b>
     75c:	7a 65                	jp     7c3 <bootmain-0x27f83d>
     75e:	3a 70 28             	cmp    0x28(%eax),%dh
     761:	30 2c 33             	xor    %ch,(%ebx,%esi,1)
     764:	29 00                	sub    %eax,(%eax)
     766:	70 79                	jo     7e1 <bootmain-0x27f81f>
     768:	73 69                	jae    7d3 <bootmain-0x27f82d>
     76a:	7a 65                	jp     7d1 <bootmain-0x27f82f>
     76c:	3a 70 28             	cmp    0x28(%eax),%dh
     76f:	30 2c 33             	xor    %ch,(%ebx,%esi,1)
     772:	29 00                	sub    %eax,(%eax)
     774:	70 78                	jo     7ee <bootmain-0x27f812>
     776:	30 3a                	xor    %bh,(%edx)
     778:	70 28                	jo     7a2 <bootmain-0x27f85e>
     77a:	30 2c 33             	xor    %ch,(%ebx,%esi,1)
     77d:	29 00                	sub    %eax,(%eax)
     77f:	70 79                	jo     7fa <bootmain-0x27f806>
     781:	30 3a                	xor    %bh,(%edx)
     783:	70 28                	jo     7ad <bootmain-0x27f853>
     785:	30 2c 33             	xor    %ch,(%ebx,%esi,1)
     788:	29 00                	sub    %eax,(%eax)
     78a:	62 75 66             	bound  %esi,0x66(%ebp)
     78d:	3a 70 28             	cmp    0x28(%eax),%dh
     790:	30 2c 31             	xor    %ch,(%ecx,%esi,1)
     793:	30 29                	xor    %ch,(%ecx)
     795:	00 62 78             	add    %ah,0x78(%edx)
     798:	73 69                	jae    803 <bootmain-0x27f7fd>
     79a:	7a 65                	jp     801 <bootmain-0x27f7ff>
     79c:	3a 70 28             	cmp    0x28(%eax),%dh
     79f:	30 2c 33             	xor    %ch,(%ebx,%esi,1)
     7a2:	29 00                	sub    %eax,(%eax)
     7a4:	70 78                	jo     81e <bootmain-0x27f7e2>
     7a6:	30 3a                	xor    %bh,(%edx)
     7a8:	72 28                	jb     7d2 <bootmain-0x27f82e>
     7aa:	30 2c 33             	xor    %ch,(%ebx,%esi,1)
     7ad:	29 00                	sub    %eax,(%eax)
     7af:	62 6f 78             	bound  %ebp,0x78(%edi)
     7b2:	66 69 6c 6c 3a 46 28 	imul   $0x2846,0x3a(%esp,%ebp,2),%bp
     7b9:	30 2c 31             	xor    %ch,(%ecx,%esi,1)
     7bc:	29 00                	sub    %eax,(%eax)
     7be:	63 75 72             	arpl   %si,0x72(%ebp)
     7c1:	73 6f                	jae    832 <bootmain-0x27f7ce>
     7c3:	72 3a                	jb     7ff <bootmain-0x27f801>
     7c5:	56                   	push   %esi
     7c6:	28 30                	sub    %dh,(%eax)
     7c8:	2c 31                	sub    $0x31,%al
     7ca:	31 29                	xor    %ebp,(%ecx)
     7cc:	00 74 61 62          	add    %dh,0x62(%ecx,%eiz,2)
     7d0:	6c                   	insb   (%dx),%es:(%edi)
     7d1:	65 5f                	gs pop %edi
     7d3:	72 67                	jb     83c <bootmain-0x27f7c4>
     7d5:	62 3a                	bound  %edi,(%edx)
     7d7:	56                   	push   %esi
     7d8:	28 30                	sub    %dh,(%eax)
     7da:	2c 38                	sub    $0x38,%al
     7dc:	29 00                	sub    %eax,(%eax)
     7de:	66 6f                	outsw  %ds:(%esi),(%dx)
     7e0:	6e                   	outsb  %ds:(%esi),(%dx)
     7e1:	74 2e                	je     811 <bootmain-0x27f7ef>
     7e3:	63 00                	arpl   %ax,(%eax)
     7e5:	70 72                	jo     859 <bootmain-0x27f7a7>
     7e7:	69 6e 74 2e 63 00 70 	imul   $0x7000632e,0x74(%esi),%ebp
     7ee:	75 74                	jne    864 <bootmain-0x27f79c>
     7f0:	73 38                	jae    82a <bootmain-0x27f7d6>
     7f2:	3a 46 28             	cmp    0x28(%esi),%al
     7f5:	30 2c 31             	xor    %ch,(%ecx,%esi,1)
     7f8:	29 3d 28 30 2c 31    	sub    %edi,0x312c3028
     7fe:	29 00                	sub    %eax,(%eax)
     800:	76 72                	jbe    874 <bootmain-0x27f78c>
     802:	61                   	popa   
     803:	6d                   	insl   (%dx),%es:(%edi)
     804:	3a 70 28             	cmp    0x28(%eax),%dh
     807:	30 2c 33             	xor    %ch,(%ebx,%esi,1)
     80a:	29 3d 2a 28 30 2c    	sub    %edi,0x2c30282a
     810:	32 29                	xor    (%ecx),%ch
     812:	00 78 73             	add    %bh,0x73(%eax)
     815:	69 7a 65 3a 70 28 30 	imul   $0x3028703a,0x65(%edx),%edi
     81c:	2c 34                	sub    $0x34,%al
     81e:	29 3d 72 28 30 2c    	sub    %edi,0x2c302872
     824:	34 29                	xor    $0x29,%al
     826:	3b 2d 32 31 34 37    	cmp    0x37343132,%ebp
     82c:	34 38                	xor    $0x38,%al
     82e:	33 36                	xor    (%esi),%esi
     830:	34 38                	xor    $0x38,%al
     832:	3b 32                	cmp    (%edx),%esi
     834:	31 34 37             	xor    %esi,(%edi,%esi,1)
     837:	34 38                	xor    $0x38,%al
     839:	33 36                	xor    (%esi),%esi
     83b:	34 37                	xor    $0x37,%al
     83d:	3b 00                	cmp    (%eax),%eax
     83f:	78 3a                	js     87b <bootmain-0x27f785>
     841:	70 28                	jo     86b <bootmain-0x27f795>
     843:	30 2c 34             	xor    %ch,(%esp,%esi,1)
     846:	29 00                	sub    %eax,(%eax)
     848:	79 3a                	jns    884 <bootmain-0x27f77c>
     84a:	70 28                	jo     874 <bootmain-0x27f78c>
     84c:	30 2c 34             	xor    %ch,(%esp,%esi,1)
     84f:	29 00                	sub    %eax,(%eax)
     851:	63 6f 6c             	arpl   %bp,0x6c(%edi)
     854:	6f                   	outsl  %ds:(%esi),(%dx)
     855:	72 3a                	jb     891 <bootmain-0x27f76f>
     857:	70 28                	jo     881 <bootmain-0x27f77f>
     859:	30 2c 34             	xor    %ch,(%esp,%esi,1)
     85c:	29 00                	sub    %eax,(%eax)
     85e:	66 6f                	outsw  %ds:(%esi),(%dx)
     860:	6e                   	outsb  %ds:(%esi),(%dx)
     861:	74 3a                	je     89d <bootmain-0x27f763>
     863:	70 28                	jo     88d <bootmain-0x27f773>
     865:	30 2c 33             	xor    %ch,(%ebx,%esi,1)
     868:	29 00                	sub    %eax,(%eax)
     86a:	69 6e 74 3a 74 28 30 	imul   $0x3028743a,0x74(%esi),%ebp
     871:	2c 34                	sub    $0x34,%al
     873:	29 00                	sub    %eax,(%eax)
     875:	78 3a                	js     8b1 <bootmain-0x27f74f>
     877:	72 28                	jb     8a1 <bootmain-0x27f75f>
     879:	30 2c 34             	xor    %ch,(%esp,%esi,1)
     87c:	29 00                	sub    %eax,(%eax)
     87e:	79 3a                	jns    8ba <bootmain-0x27f746>
     880:	72 28                	jb     8aa <bootmain-0x27f756>
     882:	30 2c 34             	xor    %ch,(%esp,%esi,1)
     885:	29 00                	sub    %eax,(%eax)
     887:	69 74 6f 61 3a 46 28 	imul   $0x3028463a,0x61(%edi,%ebp,2),%esi
     88e:	30 
     88f:	2c 31                	sub    $0x31,%al
     891:	29 00                	sub    %eax,(%eax)
     893:	76 61                	jbe    8f6 <bootmain-0x27f70a>
     895:	6c                   	insb   (%dx),%es:(%edi)
     896:	75 65                	jne    8fd <bootmain-0x27f703>
     898:	3a 70 28             	cmp    0x28(%eax),%dh
     89b:	30 2c 34             	xor    %ch,(%esp,%esi,1)
     89e:	29 00                	sub    %eax,(%eax)
     8a0:	62 75 66             	bound  %esi,0x66(%ebp)
     8a3:	3a 70 28             	cmp    0x28(%eax),%dh
     8a6:	30 2c 33             	xor    %ch,(%ebx,%esi,1)
     8a9:	29 00                	sub    %eax,(%eax)
     8ab:	74 6d                	je     91a <bootmain-0x27f6e6>
     8ad:	70 5f                	jo     90e <bootmain-0x27f6f2>
     8af:	62 75 66             	bound  %esi,0x66(%ebp)
     8b2:	3a 28                	cmp    (%eax),%ch
     8b4:	30 2c 35 29 3d 61 72 	xor    %ch,0x72613d29(,%esi,1)
     8bb:	28 30                	sub    %dh,(%eax)
     8bd:	2c 36                	sub    $0x36,%al
     8bf:	29 3d 72 28 30 2c    	sub    %edi,0x2c302872
     8c5:	36 29 3b             	sub    %edi,%ss:(%ebx)
     8c8:	30 3b                	xor    %bh,(%ebx)
     8ca:	34 32                	xor    $0x32,%al
     8cc:	39 34 39             	cmp    %esi,(%ecx,%edi,1)
     8cf:	36 37                	ss aaa 
     8d1:	32 39                	xor    (%ecx),%bh
     8d3:	35 3b 3b 30 3b       	xor    $0x3b303b3b,%eax
     8d8:	39 3b                	cmp    %edi,(%ebx)
     8da:	28 30                	sub    %dh,(%eax)
     8dc:	2c 32                	sub    $0x32,%al
     8de:	29 00                	sub    %eax,(%eax)
     8e0:	74 62                	je     944 <bootmain-0x27f6bc>
     8e2:	70 3a                	jo     91e <bootmain-0x27f6e2>
     8e4:	72 28                	jb     90e <bootmain-0x27f6f2>
     8e6:	30 2c 33             	xor    %ch,(%ebx,%esi,1)
     8e9:	29 00                	sub    %eax,(%eax)
     8eb:	76 61                	jbe    94e <bootmain-0x27f6b2>
     8ed:	6c                   	insb   (%dx),%es:(%edi)
     8ee:	75 65                	jne    955 <bootmain-0x27f6ab>
     8f0:	3a 72 28             	cmp    0x28(%edx),%dh
     8f3:	30 2c 34             	xor    %ch,(%esp,%esi,1)
     8f6:	29 00                	sub    %eax,(%eax)
     8f8:	62 75 66             	bound  %esi,0x66(%ebp)
     8fb:	3a 72 28             	cmp    0x28(%edx),%dh
     8fe:	30 2c 33             	xor    %ch,(%ebx,%esi,1)
     901:	29 00                	sub    %eax,(%eax)
     903:	78 74                	js     979 <bootmain-0x27f687>
     905:	6f                   	outsl  %ds:(%esi),(%dx)
     906:	61                   	popa   
     907:	3a 46 28             	cmp    0x28(%esi),%al
     90a:	30 2c 31             	xor    %ch,(%ecx,%esi,1)
     90d:	29 00                	sub    %eax,(%eax)
     90f:	76 61                	jbe    972 <bootmain-0x27f68e>
     911:	6c                   	insb   (%dx),%es:(%edi)
     912:	75 65                	jne    979 <bootmain-0x27f687>
     914:	3a 70 28             	cmp    0x28(%eax),%dh
     917:	30 2c 37             	xor    %ch,(%edi,%esi,1)
     91a:	29 3d 72 28 30 2c    	sub    %edi,0x2c302872
     920:	37                   	aaa    
     921:	29 3b                	sub    %edi,(%ebx)
     923:	30 3b                	xor    %bh,(%ebx)
     925:	34 32                	xor    $0x32,%al
     927:	39 34 39             	cmp    %esi,(%ecx,%edi,1)
     92a:	36 37                	ss aaa 
     92c:	32 39                	xor    (%ecx),%bh
     92e:	35 3b 00 74 6d       	xor    $0x6d74003b,%eax
     933:	70 5f                	jo     994 <bootmain-0x27f66c>
     935:	62 75 66             	bound  %esi,0x66(%ebp)
     938:	3a 28                	cmp    (%eax),%ch
     93a:	30 2c 38             	xor    %ch,(%eax,%edi,1)
     93d:	29 3d 61 72 28 30    	sub    %edi,0x30287261
     943:	2c 36                	sub    $0x36,%al
     945:	29 3b                	sub    %edi,(%ebx)
     947:	30 3b                	xor    %bh,(%ebx)
     949:	32 39                	xor    (%ecx),%bh
     94b:	3b 28                	cmp    (%eax),%ebp
     94d:	30 2c 32             	xor    %ch,(%edx,%esi,1)
     950:	29 00                	sub    %eax,(%eax)
     952:	76 61                	jbe    9b5 <bootmain-0x27f64b>
     954:	6c                   	insb   (%dx),%es:(%edi)
     955:	75 65                	jne    9bc <bootmain-0x27f644>
     957:	3a 72 28             	cmp    0x28(%edx),%dh
     95a:	30 2c 37             	xor    %ch,(%edi,%esi,1)
     95d:	29 00                	sub    %eax,(%eax)
     95f:	73 70                	jae    9d1 <bootmain-0x27f62f>
     961:	72 69                	jb     9cc <bootmain-0x27f634>
     963:	6e                   	outsb  %ds:(%esi),(%dx)
     964:	74 66                	je     9cc <bootmain-0x27f634>
     966:	3a 46 28             	cmp    0x28(%esi),%al
     969:	30 2c 31             	xor    %ch,(%ecx,%esi,1)
     96c:	29 00                	sub    %eax,(%eax)
     96e:	73 74                	jae    9e4 <bootmain-0x27f61c>
     970:	72 3a                	jb     9ac <bootmain-0x27f654>
     972:	70 28                	jo     99c <bootmain-0x27f664>
     974:	30 2c 33             	xor    %ch,(%ebx,%esi,1)
     977:	29 00                	sub    %eax,(%eax)
     979:	66 6f                	outsw  %ds:(%esi),(%dx)
     97b:	72 6d                	jb     9ea <bootmain-0x27f616>
     97d:	61                   	popa   
     97e:	74 3a                	je     9ba <bootmain-0x27f646>
     980:	70 28                	jo     9aa <bootmain-0x27f656>
     982:	30 2c 33             	xor    %ch,(%ebx,%esi,1)
     985:	29 00                	sub    %eax,(%eax)
     987:	76 61                	jbe    9ea <bootmain-0x27f616>
     989:	72 3a                	jb     9c5 <bootmain-0x27f63b>
     98b:	72 28                	jb     9b5 <bootmain-0x27f64b>
     98d:	30 2c 39             	xor    %ch,(%ecx,%edi,1)
     990:	29 3d 2a 28 30 2c    	sub    %edi,0x2c30282a
     996:	34 29                	xor    $0x29,%al
     998:	00 62 75             	add    %ah,0x75(%edx)
     99b:	66 66 65 72 3a       	data16 data16 gs jb 9da <bootmain-0x27f626>
     9a0:	28 30                	sub    %dh,(%eax)
     9a2:	2c 35                	sub    $0x35,%al
     9a4:	29 00                	sub    %eax,(%eax)
     9a6:	73 74                	jae    a1c <bootmain-0x27f5e4>
     9a8:	72 3a                	jb     9e4 <bootmain-0x27f61c>
     9aa:	72 28                	jb     9d4 <bootmain-0x27f62c>
     9ac:	30 2c 33             	xor    %ch,(%ebx,%esi,1)
     9af:	29 00                	sub    %eax,(%eax)
     9b1:	70 72                	jo     a25 <bootmain-0x27f5db>
     9b3:	69 6e 74 64 65 62 75 	imul   $0x75626564,0x74(%esi),%ebp
     9ba:	67 3a 46 28          	cmp    0x28(%bp),%al
     9be:	30 2c 31             	xor    %ch,(%ecx,%esi,1)
     9c1:	29 00                	sub    %eax,(%eax)
     9c3:	69 3a 70 28 30 2c    	imul   $0x2c302870,(%edx),%edi
     9c9:	34 29                	xor    $0x29,%al
     9cb:	00 66 6f             	add    %ah,0x6f(%esi)
     9ce:	6e                   	outsb  %ds:(%esi),(%dx)
     9cf:	74 3a                	je     a0b <bootmain-0x27f5f5>
     9d1:	28 30                	sub    %dh,(%eax)
     9d3:	2c 38                	sub    $0x38,%al
     9d5:	29 00                	sub    %eax,(%eax)
     9d7:	69 64 74 67 64 74 2e 	imul   $0x632e7464,0x67(%esp,%esi,2),%esp
     9de:	63 
     9df:	00 73 65             	add    %dh,0x65(%ebx)
     9e2:	74 5f                	je     a43 <bootmain-0x27f5bd>
     9e4:	73 65                	jae    a4b <bootmain-0x27f5b5>
     9e6:	67 6d                	insl   (%dx),%es:(%di)
     9e8:	64 65 73 63          	fs gs jae a4f <bootmain-0x27f5b1>
     9ec:	3a 46 28             	cmp    0x28(%esi),%al
     9ef:	30 2c 31             	xor    %ch,(%ecx,%esi,1)
     9f2:	29 3d 28 30 2c 31    	sub    %edi,0x312c3028
     9f8:	29 00                	sub    %eax,(%eax)
     9fa:	73 64                	jae    a60 <bootmain-0x27f5a0>
     9fc:	3a 70 28             	cmp    0x28(%eax),%dh
     9ff:	30 2c 32             	xor    %ch,(%edx,%esi,1)
     a02:	29 3d 2a 28 30 2c    	sub    %edi,0x2c30282a
     a08:	33 29                	xor    (%ecx),%ebp
     a0a:	3d 78 73 53 45       	cmp    $0x45537378,%eax
     a0f:	47                   	inc    %edi
     a10:	4d                   	dec    %ebp
     a11:	45                   	inc    %ebp
     a12:	4e                   	dec    %esi
     a13:	54                   	push   %esp
     a14:	5f                   	pop    %edi
     a15:	44                   	inc    %esp
     a16:	45                   	inc    %ebp
     a17:	53                   	push   %ebx
     a18:	43                   	inc    %ebx
     a19:	52                   	push   %edx
     a1a:	49                   	dec    %ecx
     a1b:	50                   	push   %eax
     a1c:	54                   	push   %esp
     a1d:	4f                   	dec    %edi
     a1e:	52                   	push   %edx
     a1f:	3a 00                	cmp    (%eax),%al
     a21:	6c                   	insb   (%dx),%es:(%edi)
     a22:	69 6d 69 74 3a 70 28 	imul   $0x28703a74,0x69(%ebp),%ebp
     a29:	30 2c 34             	xor    %ch,(%esp,%esi,1)
     a2c:	29 3d 72 28 30 2c    	sub    %edi,0x2c302872
     a32:	34 29                	xor    $0x29,%al
     a34:	3b 30                	cmp    (%eax),%esi
     a36:	3b 34 32             	cmp    (%edx,%esi,1),%esi
     a39:	39 34 39             	cmp    %esi,(%ecx,%edi,1)
     a3c:	36 37                	ss aaa 
     a3e:	32 39                	xor    (%ecx),%bh
     a40:	35 3b 00 62 61       	xor    $0x6162003b,%eax
     a45:	73 65                	jae    aac <bootmain-0x27f554>
     a47:	3a 70 28             	cmp    0x28(%eax),%dh
     a4a:	30 2c 35 29 3d 72 28 	xor    %ch,0x28723d29(,%esi,1)
     a51:	30 2c 35 29 3b 2d 32 	xor    %ch,0x322d3b29(,%esi,1)
     a58:	31 34 37             	xor    %esi,(%edi,%esi,1)
     a5b:	34 38                	xor    $0x38,%al
     a5d:	33 36                	xor    (%esi),%esi
     a5f:	34 38                	xor    $0x38,%al
     a61:	3b 32                	cmp    (%edx),%esi
     a63:	31 34 37             	xor    %esi,(%edi,%esi,1)
     a66:	34 38                	xor    $0x38,%al
     a68:	33 36                	xor    (%esi),%esi
     a6a:	34 37                	xor    $0x37,%al
     a6c:	3b 00                	cmp    (%eax),%eax
     a6e:	61                   	popa   
     a6f:	72 3a                	jb     aab <bootmain-0x27f555>
     a71:	70 28                	jo     a9b <bootmain-0x27f565>
     a73:	30 2c 35 29 00 53 45 	xor    %ch,0x45530029(,%esi,1)
     a7a:	47                   	inc    %edi
     a7b:	4d                   	dec    %ebp
     a7c:	45                   	inc    %ebp
     a7d:	4e                   	dec    %esi
     a7e:	54                   	push   %esp
     a7f:	5f                   	pop    %edi
     a80:	44                   	inc    %esp
     a81:	45                   	inc    %ebp
     a82:	53                   	push   %ebx
     a83:	43                   	inc    %ebx
     a84:	52                   	push   %edx
     a85:	49                   	dec    %ecx
     a86:	50                   	push   %eax
     a87:	54                   	push   %esp
     a88:	4f                   	dec    %edi
     a89:	52                   	push   %edx
     a8a:	3a 54 28 30          	cmp    0x30(%eax,%ebp,1),%dl
     a8e:	2c 33                	sub    $0x33,%al
     a90:	29 3d 73 38 6c 69    	sub    %edi,0x696c3873
     a96:	6d                   	insl   (%dx),%es:(%edi)
     a97:	69 74 5f 6c 6f 77 3a 	imul   $0x283a776f,0x6c(%edi,%ebx,2),%esi
     a9e:	28 
     a9f:	30 2c 36             	xor    %ch,(%esi,%esi,1)
     aa2:	29 3d 72 28 30 2c    	sub    %edi,0x2c302872
     aa8:	36 29 3b             	sub    %edi,%ss:(%ebx)
     aab:	2d 33 32 37 36       	sub    $0x36373233,%eax
     ab0:	38 3b                	cmp    %bh,(%ebx)
     ab2:	33 32                	xor    (%edx),%esi
     ab4:	37                   	aaa    
     ab5:	36 37                	ss aaa 
     ab7:	3b 2c 30             	cmp    (%eax,%esi,1),%ebp
     aba:	2c 31                	sub    $0x31,%al
     abc:	36 3b 62 61          	cmp    %ss:0x61(%edx),%esp
     ac0:	73 65                	jae    b27 <bootmain-0x27f4d9>
     ac2:	5f                   	pop    %edi
     ac3:	6c                   	insb   (%dx),%es:(%edi)
     ac4:	6f                   	outsl  %ds:(%esi),(%dx)
     ac5:	77 3a                	ja     b01 <bootmain-0x27f4ff>
     ac7:	28 30                	sub    %dh,(%eax)
     ac9:	2c 36                	sub    $0x36,%al
     acb:	29 2c 31             	sub    %ebp,(%ecx,%esi,1)
     ace:	36 2c 31             	ss sub $0x31,%al
     ad1:	36 3b 62 61          	cmp    %ss:0x61(%edx),%esp
     ad5:	73 65                	jae    b3c <bootmain-0x27f4c4>
     ad7:	5f                   	pop    %edi
     ad8:	6d                   	insl   (%dx),%es:(%edi)
     ad9:	69 64 3a 28 30 2c 37 	imul   $0x29372c30,0x28(%edx,%edi,1),%esp
     ae0:	29 
     ae1:	3d 72 28 30 2c       	cmp    $0x2c302872,%eax
     ae6:	37                   	aaa    
     ae7:	29 3b                	sub    %edi,(%ebx)
     ae9:	30 3b                	xor    %bh,(%ebx)
     aeb:	31 32                	xor    %esi,(%edx)
     aed:	37                   	aaa    
     aee:	3b 2c 33             	cmp    (%ebx,%esi,1),%ebp
     af1:	32 2c 38             	xor    (%eax,%edi,1),%ch
     af4:	3b 61 63             	cmp    0x63(%ecx),%esp
     af7:	63 65 73             	arpl   %sp,0x73(%ebp)
     afa:	73 5f                	jae    b5b <bootmain-0x27f4a5>
     afc:	72 69                	jb     b67 <bootmain-0x27f499>
     afe:	67 68 74 3a 28 30    	addr16 push $0x30283a74
     b04:	2c 37                	sub    $0x37,%al
     b06:	29 2c 34             	sub    %ebp,(%esp,%esi,1)
     b09:	30 2c 38             	xor    %ch,(%eax,%edi,1)
     b0c:	3b 6c 69 6d          	cmp    0x6d(%ecx,%ebp,2),%ebp
     b10:	69 74 5f 68 69 67 68 	imul   $0x3a686769,0x68(%edi,%ebx,2),%esi
     b17:	3a 
     b18:	28 30                	sub    %dh,(%eax)
     b1a:	2c 37                	sub    $0x37,%al
     b1c:	29 2c 34             	sub    %ebp,(%esp,%esi,1)
     b1f:	38 2c 38             	cmp    %ch,(%eax,%edi,1)
     b22:	3b 62 61             	cmp    0x61(%edx),%esp
     b25:	73 65                	jae    b8c <bootmain-0x27f474>
     b27:	5f                   	pop    %edi
     b28:	68 69 67 68 3a       	push   $0x3a686769
     b2d:	28 30                	sub    %dh,(%eax)
     b2f:	2c 37                	sub    $0x37,%al
     b31:	29 2c 35 36 2c 38 3b 	sub    %ebp,0x3b382c36(,%esi,1)
     b38:	3b 00                	cmp    (%eax),%eax
     b3a:	75 6e                	jne    baa <bootmain-0x27f456>
     b3c:	73 69                	jae    ba7 <bootmain-0x27f459>
     b3e:	67 6e                	outsb  %ds:(%si),(%dx)
     b40:	65 64 20 69 6e       	gs and %ch,%fs:0x6e(%ecx)
     b45:	74 3a                	je     b81 <bootmain-0x27f47f>
     b47:	74 28                	je     b71 <bootmain-0x27f48f>
     b49:	30 2c 34             	xor    %ch,(%esp,%esi,1)
     b4c:	29 00                	sub    %eax,(%eax)
     b4e:	69 6e 74 3a 74 28 30 	imul   $0x3028743a,0x74(%esi),%ebp
     b55:	2c 35                	sub    $0x35,%al
     b57:	29 00                	sub    %eax,(%eax)
     b59:	73 68                	jae    bc3 <bootmain-0x27f43d>
     b5b:	6f                   	outsl  %ds:(%esi),(%dx)
     b5c:	72 74                	jb     bd2 <bootmain-0x27f42e>
     b5e:	20 69 6e             	and    %ch,0x6e(%ecx)
     b61:	74 3a                	je     b9d <bootmain-0x27f463>
     b63:	74 28                	je     b8d <bootmain-0x27f473>
     b65:	30 2c 36             	xor    %ch,(%esi,%esi,1)
     b68:	29 00                	sub    %eax,(%eax)
     b6a:	63 68 61             	arpl   %bp,0x61(%eax)
     b6d:	72 3a                	jb     ba9 <bootmain-0x27f457>
     b6f:	74 28                	je     b99 <bootmain-0x27f467>
     b71:	30 2c 37             	xor    %ch,(%edi,%esi,1)
     b74:	29 00                	sub    %eax,(%eax)
     b76:	73 64                	jae    bdc <bootmain-0x27f424>
     b78:	3a 72 28             	cmp    0x28(%edx),%dh
     b7b:	30 2c 32             	xor    %ch,(%edx,%esi,1)
     b7e:	29 00                	sub    %eax,(%eax)
     b80:	6c                   	insb   (%dx),%es:(%edi)
     b81:	69 6d 69 74 3a 72 28 	imul   $0x28723a74,0x69(%ebp),%ebp
     b88:	30 2c 34             	xor    %ch,(%esp,%esi,1)
     b8b:	29 00                	sub    %eax,(%eax)
     b8d:	62 61 73             	bound  %esp,0x73(%ecx)
     b90:	65 3a 72 28          	cmp    %gs:0x28(%edx),%dh
     b94:	30 2c 35 29 00 61 72 	xor    %ch,0x72610029(,%esi,1)
     b9b:	3a 72 28             	cmp    0x28(%edx),%dh
     b9e:	30 2c 35 29 00 73 65 	xor    %ch,0x65730029(,%esi,1)
     ba5:	74 5f                	je     c06 <bootmain-0x27f3fa>
     ba7:	67 61                	addr16 popa 
     ba9:	74 65                	je     c10 <bootmain-0x27f3f0>
     bab:	64 65 73 63          	fs gs jae c12 <bootmain-0x27f3ee>
     baf:	3a 46 28             	cmp    0x28(%esi),%al
     bb2:	30 2c 31             	xor    %ch,(%ecx,%esi,1)
     bb5:	29 00                	sub    %eax,(%eax)
     bb7:	67 64 3a 70 28       	cmp    %fs:0x28(%bx,%si),%dh
     bbc:	30 2c 38             	xor    %ch,(%eax,%edi,1)
     bbf:	29 3d 2a 28 30 2c    	sub    %edi,0x2c30282a
     bc5:	39 29                	cmp    %ebp,(%ecx)
     bc7:	3d 78 73 47 41       	cmp    $0x41477378,%eax
     bcc:	54                   	push   %esp
     bcd:	45                   	inc    %ebp
     bce:	5f                   	pop    %edi
     bcf:	44                   	inc    %esp
     bd0:	45                   	inc    %ebp
     bd1:	53                   	push   %ebx
     bd2:	43                   	inc    %ebx
     bd3:	52                   	push   %edx
     bd4:	49                   	dec    %ecx
     bd5:	50                   	push   %eax
     bd6:	54                   	push   %esp
     bd7:	4f                   	dec    %edi
     bd8:	52                   	push   %edx
     bd9:	3a 00                	cmp    (%eax),%al
     bdb:	6f                   	outsl  %ds:(%esi),(%dx)
     bdc:	66 66 73 65          	data16 data16 jae c45 <bootmain-0x27f3bb>
     be0:	74 3a                	je     c1c <bootmain-0x27f3e4>
     be2:	70 28                	jo     c0c <bootmain-0x27f3f4>
     be4:	30 2c 35 29 00 73 65 	xor    %ch,0x65730029(,%esi,1)
     beb:	6c                   	insb   (%dx),%es:(%edi)
     bec:	65 63 74 6f 72       	arpl   %si,%gs:0x72(%edi,%ebp,2)
     bf1:	3a 70 28             	cmp    0x28(%eax),%dh
     bf4:	30 2c 35 29 00 47 41 	xor    %ch,0x41470029(,%esi,1)
     bfb:	54                   	push   %esp
     bfc:	45                   	inc    %ebp
     bfd:	5f                   	pop    %edi
     bfe:	44                   	inc    %esp
     bff:	45                   	inc    %ebp
     c00:	53                   	push   %ebx
     c01:	43                   	inc    %ebx
     c02:	52                   	push   %edx
     c03:	49                   	dec    %ecx
     c04:	50                   	push   %eax
     c05:	54                   	push   %esp
     c06:	4f                   	dec    %edi
     c07:	52                   	push   %edx
     c08:	3a 54 28 30          	cmp    0x30(%eax,%ebp,1),%dl
     c0c:	2c 39                	sub    $0x39,%al
     c0e:	29 3d 73 38 6f 66    	sub    %edi,0x666f3873
     c14:	66 73 65             	data16 jae c7c <bootmain-0x27f384>
     c17:	74 5f                	je     c78 <bootmain-0x27f388>
     c19:	6c                   	insb   (%dx),%es:(%edi)
     c1a:	6f                   	outsl  %ds:(%esi),(%dx)
     c1b:	77 3a                	ja     c57 <bootmain-0x27f3a9>
     c1d:	28 30                	sub    %dh,(%eax)
     c1f:	2c 36                	sub    $0x36,%al
     c21:	29 2c 30             	sub    %ebp,(%eax,%esi,1)
     c24:	2c 31                	sub    $0x31,%al
     c26:	36 3b 73 65          	cmp    %ss:0x65(%ebx),%esi
     c2a:	6c                   	insb   (%dx),%es:(%edi)
     c2b:	65 63 74 6f 72       	arpl   %si,%gs:0x72(%edi,%ebp,2)
     c30:	3a 28                	cmp    (%eax),%ch
     c32:	30 2c 36             	xor    %ch,(%esi,%esi,1)
     c35:	29 2c 31             	sub    %ebp,(%ecx,%esi,1)
     c38:	36 2c 31             	ss sub $0x31,%al
     c3b:	36 3b 64 77 5f       	cmp    %ss:0x5f(%edi,%esi,2),%esp
     c40:	63 6f 75             	arpl   %bp,0x75(%edi)
     c43:	6e                   	outsb  %ds:(%esi),(%dx)
     c44:	74 3a                	je     c80 <bootmain-0x27f380>
     c46:	28 30                	sub    %dh,(%eax)
     c48:	2c 37                	sub    $0x37,%al
     c4a:	29 2c 33             	sub    %ebp,(%ebx,%esi,1)
     c4d:	32 2c 38             	xor    (%eax,%edi,1),%ch
     c50:	3b 61 63             	cmp    0x63(%ecx),%esp
     c53:	63 65 73             	arpl   %sp,0x73(%ebp)
     c56:	73 5f                	jae    cb7 <bootmain-0x27f349>
     c58:	72 69                	jb     cc3 <bootmain-0x27f33d>
     c5a:	67 68 74 3a 28 30    	addr16 push $0x30283a74
     c60:	2c 37                	sub    $0x37,%al
     c62:	29 2c 34             	sub    %ebp,(%esp,%esi,1)
     c65:	30 2c 38             	xor    %ch,(%eax,%edi,1)
     c68:	3b 6f 66             	cmp    0x66(%edi),%ebp
     c6b:	66 73 65             	data16 jae cd3 <bootmain-0x27f32d>
     c6e:	74 5f                	je     ccf <bootmain-0x27f331>
     c70:	68 69 67 68 3a       	push   $0x3a686769
     c75:	28 30                	sub    %dh,(%eax)
     c77:	2c 36                	sub    $0x36,%al
     c79:	29 2c 34             	sub    %ebp,(%esp,%esi,1)
     c7c:	38 2c 31             	cmp    %ch,(%ecx,%esi,1)
     c7f:	36 3b 3b             	cmp    %ss:(%ebx),%edi
     c82:	00 67 64             	add    %ah,0x64(%edi)
     c85:	3a 72 28             	cmp    0x28(%edx),%dh
     c88:	30 2c 38             	xor    %ch,(%eax,%edi,1)
     c8b:	29 00                	sub    %eax,(%eax)
     c8d:	6f                   	outsl  %ds:(%esi),(%dx)
     c8e:	66 66 73 65          	data16 data16 jae cf7 <bootmain-0x27f309>
     c92:	74 3a                	je     cce <bootmain-0x27f332>
     c94:	72 28                	jb     cbe <bootmain-0x27f342>
     c96:	30 2c 35 29 00 73 65 	xor    %ch,0x65730029(,%esi,1)
     c9d:	6c                   	insb   (%dx),%es:(%edi)
     c9e:	65 63 74 6f 72       	arpl   %si,%gs:0x72(%edi,%ebp,2)
     ca3:	3a 72 28             	cmp    0x28(%edx),%dh
     ca6:	30 2c 35 29 00 69 6e 	xor    %ch,0x6e690029(,%esi,1)
     cad:	69 74 5f 67 64 74 69 	imul   $0x64697464,0x67(%edi,%ebx,2),%esi
     cb4:	64 
     cb5:	74 3a                	je     cf1 <bootmain-0x27f30f>
     cb7:	46                   	inc    %esi
     cb8:	28 30                	sub    %dh,(%eax)
     cba:	2c 31                	sub    $0x31,%al
     cbc:	29 00                	sub    %eax,(%eax)
     cbe:	69 6e 74 2e 63 00 69 	imul   $0x6900632e,0x74(%esi),%ebp
     cc5:	6e                   	outsb  %ds:(%esi),(%dx)
     cc6:	69 74 5f 70 69 63 3a 	imul   $0x463a6369,0x70(%edi,%ebx,2),%esi
     ccd:	46 
     cce:	28 30                	sub    %dh,(%eax)
     cd0:	2c 31                	sub    $0x31,%al
     cd2:	29 3d 28 30 2c 31    	sub    %edi,0x312c3028
     cd8:	29 00                	sub    %eax,(%eax)
     cda:	69 6e 74 68 61 6e 64 	imul   $0x646e6168,0x74(%esi),%ebp
     ce1:	6c                   	insb   (%dx),%es:(%edi)
     ce2:	65 72 32             	gs jb  d17 <bootmain-0x27f2e9>
     ce5:	31 3a                	xor    %edi,(%edx)
     ce7:	46                   	inc    %esi
     ce8:	28 30                	sub    %dh,(%eax)
     cea:	2c 31                	sub    $0x31,%al
     cec:	29 00                	sub    %eax,(%eax)
     cee:	65 73 70             	gs jae d61 <bootmain-0x27f29f>
     cf1:	3a 70 28             	cmp    0x28(%eax),%dh
     cf4:	30 2c 32             	xor    %ch,(%edx,%esi,1)
     cf7:	29 3d 2a 28 30 2c    	sub    %edi,0x2c30282a
     cfd:	33 29                	xor    (%ecx),%ebp
     cff:	3d 72 28 30 2c       	cmp    $0x2c302872,%eax
     d04:	33 29                	xor    (%ecx),%ebp
     d06:	3b 2d 32 31 34 37    	cmp    0x37343132,%ebp
     d0c:	34 38                	xor    $0x38,%al
     d0e:	33 36                	xor    (%esi),%esi
     d10:	34 38                	xor    $0x38,%al
     d12:	3b 32                	cmp    (%edx),%esi
     d14:	31 34 37             	xor    %esi,(%edi,%esi,1)
     d17:	34 38                	xor    $0x38,%al
     d19:	33 36                	xor    (%esi),%esi
     d1b:	34 37                	xor    $0x37,%al
     d1d:	3b 00                	cmp    (%eax),%eax
     d1f:	75 69                	jne    d8a <bootmain-0x27f276>
     d21:	6e                   	outsb  %ds:(%esi),(%dx)
     d22:	74 38                	je     d5c <bootmain-0x27f2a4>
     d24:	5f                   	pop    %edi
     d25:	74 3a                	je     d61 <bootmain-0x27f29f>
     d27:	74 28                	je     d51 <bootmain-0x27f2af>
     d29:	30 2c 34             	xor    %ch,(%esp,%esi,1)
     d2c:	29 3d 28 30 2c 35    	sub    %edi,0x352c3028
     d32:	29 3d 72 28 30 2c    	sub    %edi,0x2c302872
     d38:	35 29 3b 30 3b       	xor    $0x3b303b29,%eax
     d3d:	32 35 35 3b 00 69    	xor    0x69003b35,%dh
     d43:	6e                   	outsb  %ds:(%esi),(%dx)
     d44:	74 68                	je     dae <bootmain-0x27f252>
     d46:	61                   	popa   
     d47:	6e                   	outsb  %ds:(%esi),(%dx)
     d48:	64 6c                	fs insb (%dx),%es:(%edi)
     d4a:	65 72 32             	gs jb  d7f <bootmain-0x27f281>
     d4d:	63 3a                	arpl   %di,(%edx)
     d4f:	46                   	inc    %esi
     d50:	28 30                	sub    %dh,(%eax)
     d52:	2c 31                	sub    $0x31,%al
     d54:	29 00                	sub    %eax,(%eax)
     d56:	65 73 70             	gs jae dc9 <bootmain-0x27f237>
     d59:	3a 70 28             	cmp    0x28(%eax),%dh
     d5c:	30 2c 32             	xor    %ch,(%edx,%esi,1)
     d5f:	29 00                	sub    %eax,(%eax)
     d61:	6d                   	insl   (%dx),%es:(%edi)
     d62:	6f                   	outsl  %ds:(%esi),(%dx)
     d63:	75 73                	jne    dd8 <bootmain-0x27f228>
     d65:	65 66 69 66 6f 3a 47 	imul   $0x473a,%gs:0x6f(%esi),%sp
     d6c:	28 30                	sub    %dh,(%eax)
     d6e:	2c 36                	sub    $0x36,%al
     d70:	29 3d 78 73 46 49    	sub    %edi,0x49467378
     d76:	46                   	inc    %esi
     d77:	4f                   	dec    %edi
     d78:	38 3a                	cmp    %bh,(%edx)
     d7a:	00 46 49             	add    %al,0x49(%esi)
     d7d:	46                   	inc    %esi
     d7e:	4f                   	dec    %edi
     d7f:	38 3a                	cmp    %bh,(%edx)
     d81:	54                   	push   %esp
     d82:	28 30                	sub    %dh,(%eax)
     d84:	2c 36                	sub    $0x36,%al
     d86:	29 3d 73 32 34 62    	sub    %edi,0x62343273
     d8c:	75 66                	jne    df4 <bootmain-0x27f20c>
     d8e:	3a 28                	cmp    (%eax),%ch
     d90:	30 2c 37             	xor    %ch,(%edi,%esi,1)
     d93:	29 3d 2a 28 30 2c    	sub    %edi,0x2c30282a
     d99:	35 29 2c 30 2c       	xor    $0x2c302c29,%eax
     d9e:	33 32                	xor    (%edx),%esi
     da0:	3b 70 3a             	cmp    0x3a(%eax),%esi
     da3:	28 30                	sub    %dh,(%eax)
     da5:	2c 33                	sub    $0x33,%al
     da7:	29 2c 33             	sub    %ebp,(%ebx,%esi,1)
     daa:	32 2c 33             	xor    (%ebx,%esi,1),%ch
     dad:	32 3b                	xor    (%ebx),%bh
     daf:	71 3a                	jno    deb <bootmain-0x27f215>
     db1:	28 30                	sub    %dh,(%eax)
     db3:	2c 33                	sub    $0x33,%al
     db5:	29 2c 36             	sub    %ebp,(%esi,%esi,1)
     db8:	34 2c                	xor    $0x2c,%al
     dba:	33 32                	xor    (%edx),%esi
     dbc:	3b 73 69             	cmp    0x69(%ebx),%esi
     dbf:	7a 65                	jp     e26 <bootmain-0x27f1da>
     dc1:	3a 28                	cmp    (%eax),%ch
     dc3:	30 2c 33             	xor    %ch,(%ebx,%esi,1)
     dc6:	29 2c 39             	sub    %ebp,(%ecx,%edi,1)
     dc9:	36 2c 33             	ss sub $0x33,%al
     dcc:	32 3b                	xor    (%ebx),%bh
     dce:	66 72 65             	data16 jb e36 <bootmain-0x27f1ca>
     dd1:	65 3a 28             	cmp    %gs:(%eax),%ch
     dd4:	30 2c 33             	xor    %ch,(%ebx,%esi,1)
     dd7:	29 2c 31             	sub    %ebp,(%ecx,%esi,1)
     dda:	32 38                	xor    (%eax),%bh
     ddc:	2c 33                	sub    $0x33,%al
     dde:	32 3b                	xor    (%ebx),%bh
     de0:	66 6c                	data16 insb (%dx),%es:(%edi)
     de2:	61                   	popa   
     de3:	67 73 3a             	addr16 jae e20 <bootmain-0x27f1e0>
     de6:	28 30                	sub    %dh,(%eax)
     de8:	2c 33                	sub    $0x33,%al
     dea:	29 2c 31             	sub    %ebp,(%ecx,%esi,1)
     ded:	36 30 2c 33          	xor    %ch,%ss:(%ebx,%esi,1)
     df1:	32 3b                	xor    (%ebx),%bh
     df3:	3b 00                	cmp    (%eax),%eax
     df5:	6b 65 79 66          	imul   $0x66,0x79(%ebp),%esp
     df9:	69 66 6f 3a 47 28 30 	imul   $0x3028473a,0x6f(%esi),%esp
     e00:	2c 36                	sub    $0x36,%al
     e02:	29 00                	sub    %eax,(%eax)
     e04:	6b 65 79 62          	imul   $0x62,0x79(%ebp),%esp
     e08:	75 66                	jne    e70 <bootmain-0x27f190>
     e0a:	3a 47 28             	cmp    0x28(%edi),%al
     e0d:	30 2c 38             	xor    %ch,(%eax,%edi,1)
     e10:	29 3d 78 73 4b 45    	sub    %edi,0x454b7378
     e16:	59                   	pop    %ecx
     e17:	42                   	inc    %edx
     e18:	55                   	push   %ebp
     e19:	46                   	inc    %esi
     e1a:	3a 00                	cmp    (%eax),%al
     e1c:	4b                   	dec    %ebx
     e1d:	45                   	inc    %ebp
     e1e:	59                   	pop    %ecx
     e1f:	42                   	inc    %edx
     e20:	55                   	push   %ebp
     e21:	46                   	inc    %esi
     e22:	3a 54 28 30          	cmp    0x30(%eax,%ebp,1),%dl
     e26:	2c 38                	sub    $0x38,%al
     e28:	29 3d 73 34 34 64    	sub    %edi,0x64343473
     e2e:	61                   	popa   
     e2f:	74 61                	je     e92 <bootmain-0x27f16e>
     e31:	3a 28                	cmp    (%eax),%ch
     e33:	30 2c 39             	xor    %ch,(%ecx,%edi,1)
     e36:	29 3d 61 72 28 30    	sub    %edi,0x30287261
     e3c:	2c 31                	sub    $0x31,%al
     e3e:	30 29                	xor    %ch,(%ecx)
     e40:	3d 72 28 30 2c       	cmp    $0x2c302872,%eax
     e45:	31 30                	xor    %esi,(%eax)
     e47:	29 3b                	sub    %edi,(%ebx)
     e49:	30 3b                	xor    %bh,(%ebx)
     e4b:	34 32                	xor    $0x32,%al
     e4d:	39 34 39             	cmp    %esi,(%ecx,%edi,1)
     e50:	36 37                	ss aaa 
     e52:	32 39                	xor    (%ecx),%bh
     e54:	35 3b 3b 30 3b       	xor    $0x3b303b3b,%eax
     e59:	33 31                	xor    (%ecx),%esi
     e5b:	3b 28                	cmp    (%eax),%ebp
     e5d:	30 2c 35 29 2c 30 2c 	xor    %ch,0x2c302c29(,%esi,1)
     e64:	32 35 36 3b 6e 65    	xor    0x656e3b36,%dh
     e6a:	78 74                	js     ee0 <bootmain-0x27f120>
     e6c:	5f                   	pop    %edi
     e6d:	72 3a                	jb     ea9 <bootmain-0x27f157>
     e6f:	28 30                	sub    %dh,(%eax)
     e71:	2c 33                	sub    $0x33,%al
     e73:	29 2c 32             	sub    %ebp,(%edx,%esi,1)
     e76:	35 36 2c 33 32       	xor    $0x32332c36,%eax
     e7b:	3b 6e 65             	cmp    0x65(%esi),%ebp
     e7e:	78 74                	js     ef4 <bootmain-0x27f10c>
     e80:	5f                   	pop    %edi
     e81:	77 3a                	ja     ebd <bootmain-0x27f143>
     e83:	28 30                	sub    %dh,(%eax)
     e85:	2c 33                	sub    $0x33,%al
     e87:	29 2c 32             	sub    %ebp,(%edx,%esi,1)
     e8a:	38 38                	cmp    %bh,(%eax)
     e8c:	2c 33                	sub    $0x33,%al
     e8e:	32 3b                	xor    (%ebx),%bh
     e90:	6c                   	insb   (%dx),%es:(%edi)
     e91:	65 6e                	outsb  %gs:(%esi),(%dx)
     e93:	3a 28                	cmp    (%eax),%ch
     e95:	30 2c 33             	xor    %ch,(%ebx,%esi,1)
     e98:	29 2c 33             	sub    %ebp,(%ebx,%esi,1)
     e9b:	32 30                	xor    (%eax),%dh
     e9d:	2c 33                	sub    $0x33,%al
     e9f:	32 3b                	xor    (%ebx),%bh
     ea1:	3b 00                	cmp    (%eax),%eax
     ea3:	2f                   	das    
     ea4:	74 6d                	je     f13 <bootmain-0x27f0ed>
     ea6:	70 2f                	jo     ed7 <bootmain-0x27f129>
     ea8:	63 63 51             	arpl   %sp,0x51(%ebx)
     eab:	5a                   	pop    %edx
     eac:	73 67                	jae    f15 <bootmain-0x27f0eb>
     eae:	77 48                	ja     ef8 <bootmain-0x27f108>
     eb0:	2e 73 00             	jae,pn eb3 <bootmain-0x27f14d>
     eb3:	61                   	popa   
     eb4:	73 6d                	jae    f23 <bootmain-0x27f0dd>
     eb6:	69 6e 74 33 32 2e 53 	imul   $0x532e3233,0x74(%esi),%ebp
     ebd:	00 66 69             	add    %ah,0x69(%esi)
     ec0:	66 6f                	outsw  %ds:(%esi),(%dx)
     ec2:	2e 63 00             	arpl   %ax,%cs:(%eax)
     ec5:	66 69 66 6f 38 5f    	imul   $0x5f38,0x6f(%esi),%sp
     ecb:	69 6e 69 74 3a 46 28 	imul   $0x28463a74,0x69(%esi),%ebp
     ed2:	30 2c 31             	xor    %ch,(%ecx,%esi,1)
     ed5:	29 3d 28 30 2c 31    	sub    %edi,0x312c3028
     edb:	29 00                	sub    %eax,(%eax)
     edd:	66 69 66 6f 3a 70    	imul   $0x703a,0x6f(%esi),%sp
     ee3:	28 30                	sub    %dh,(%eax)
     ee5:	2c 32                	sub    $0x32,%al
     ee7:	29 3d 2a 28 30 2c    	sub    %edi,0x2c30282a
     eed:	33 29                	xor    (%ecx),%ebp
     eef:	3d 78 73 46 49       	cmp    $0x49467378,%eax
     ef4:	46                   	inc    %esi
     ef5:	4f                   	dec    %edi
     ef6:	38 3a                	cmp    %bh,(%edx)
     ef8:	00 73 69             	add    %dh,0x69(%ebx)
     efb:	7a 65                	jp     f62 <bootmain-0x27f09e>
     efd:	3a 70 28             	cmp    0x28(%eax),%dh
     f00:	30 2c 34             	xor    %ch,(%esp,%esi,1)
     f03:	29 3d 72 28 30 2c    	sub    %edi,0x2c302872
     f09:	34 29                	xor    $0x29,%al
     f0b:	3b 2d 32 31 34 37    	cmp    0x37343132,%ebp
     f11:	34 38                	xor    $0x38,%al
     f13:	33 36                	xor    (%esi),%esi
     f15:	34 38                	xor    $0x38,%al
     f17:	3b 32                	cmp    (%edx),%esi
     f19:	31 34 37             	xor    %esi,(%edi,%esi,1)
     f1c:	34 38                	xor    $0x38,%al
     f1e:	33 36                	xor    (%esi),%esi
     f20:	34 37                	xor    $0x37,%al
     f22:	3b 00                	cmp    (%eax),%eax
     f24:	62 75 66             	bound  %esi,0x66(%ebp)
     f27:	3a 70 28             	cmp    0x28(%eax),%dh
     f2a:	30 2c 35 29 3d 2a 28 	xor    %ch,0x282a3d29(,%esi,1)
     f31:	30 2c 36             	xor    %ch,(%esi,%esi,1)
     f34:	29 3d 72 28 30 2c    	sub    %edi,0x2c302872
     f3a:	36 29 3b             	sub    %edi,%ss:(%ebx)
     f3d:	30 3b                	xor    %bh,(%ebx)
     f3f:	32 35 35 3b 00 46    	xor    0x46003b35,%dh
     f45:	49                   	dec    %ecx
     f46:	46                   	inc    %esi
     f47:	4f                   	dec    %edi
     f48:	38 3a                	cmp    %bh,(%edx)
     f4a:	54                   	push   %esp
     f4b:	28 30                	sub    %dh,(%eax)
     f4d:	2c 33                	sub    $0x33,%al
     f4f:	29 3d 73 32 34 62    	sub    %edi,0x62343273
     f55:	75 66                	jne    fbd <bootmain-0x27f043>
     f57:	3a 28                	cmp    (%eax),%ch
     f59:	30 2c 35 29 2c 30 2c 	xor    %ch,0x2c302c29(,%esi,1)
     f60:	33 32                	xor    (%edx),%esi
     f62:	3b 70 3a             	cmp    0x3a(%eax),%esi
     f65:	28 30                	sub    %dh,(%eax)
     f67:	2c 34                	sub    $0x34,%al
     f69:	29 2c 33             	sub    %ebp,(%ebx,%esi,1)
     f6c:	32 2c 33             	xor    (%ebx,%esi,1),%ch
     f6f:	32 3b                	xor    (%ebx),%bh
     f71:	71 3a                	jno    fad <bootmain-0x27f053>
     f73:	28 30                	sub    %dh,(%eax)
     f75:	2c 34                	sub    $0x34,%al
     f77:	29 2c 36             	sub    %ebp,(%esi,%esi,1)
     f7a:	34 2c                	xor    $0x2c,%al
     f7c:	33 32                	xor    (%edx),%esi
     f7e:	3b 73 69             	cmp    0x69(%ebx),%esi
     f81:	7a 65                	jp     fe8 <bootmain-0x27f018>
     f83:	3a 28                	cmp    (%eax),%ch
     f85:	30 2c 34             	xor    %ch,(%esp,%esi,1)
     f88:	29 2c 39             	sub    %ebp,(%ecx,%edi,1)
     f8b:	36 2c 33             	ss sub $0x33,%al
     f8e:	32 3b                	xor    (%ebx),%bh
     f90:	66 72 65             	data16 jb ff8 <bootmain-0x27f008>
     f93:	65 3a 28             	cmp    %gs:(%eax),%ch
     f96:	30 2c 34             	xor    %ch,(%esp,%esi,1)
     f99:	29 2c 31             	sub    %ebp,(%ecx,%esi,1)
     f9c:	32 38                	xor    (%eax),%bh
     f9e:	2c 33                	sub    $0x33,%al
     fa0:	32 3b                	xor    (%ebx),%bh
     fa2:	66 6c                	data16 insb (%dx),%es:(%edi)
     fa4:	61                   	popa   
     fa5:	67 73 3a             	addr16 jae fe2 <bootmain-0x27f01e>
     fa8:	28 30                	sub    %dh,(%eax)
     faa:	2c 34                	sub    $0x34,%al
     fac:	29 2c 31             	sub    %ebp,(%ecx,%esi,1)
     faf:	36 30 2c 33          	xor    %ch,%ss:(%ebx,%esi,1)
     fb3:	32 3b                	xor    (%ebx),%bh
     fb5:	3b 00                	cmp    (%eax),%eax
     fb7:	75 6e                	jne    1027 <bootmain-0x27efd9>
     fb9:	73 69                	jae    1024 <bootmain-0x27efdc>
     fbb:	67 6e                	outsb  %ds:(%si),(%dx)
     fbd:	65 64 20 63 68       	gs and %ah,%fs:0x68(%ebx)
     fc2:	61                   	popa   
     fc3:	72 3a                	jb     fff <bootmain-0x27f001>
     fc5:	74 28                	je     fef <bootmain-0x27f011>
     fc7:	30 2c 36             	xor    %ch,(%esi,%esi,1)
     fca:	29 00                	sub    %eax,(%eax)
     fcc:	66 69 66 6f 3a 72    	imul   $0x723a,0x6f(%esi),%sp
     fd2:	28 30                	sub    %dh,(%eax)
     fd4:	2c 32                	sub    $0x32,%al
     fd6:	29 00                	sub    %eax,(%eax)
     fd8:	73 69                	jae    1043 <bootmain-0x27efbd>
     fda:	7a 65                	jp     1041 <bootmain-0x27efbf>
     fdc:	3a 72 28             	cmp    0x28(%edx),%dh
     fdf:	30 2c 34             	xor    %ch,(%esp,%esi,1)
     fe2:	29 00                	sub    %eax,(%eax)
     fe4:	62 75 66             	bound  %esi,0x66(%ebp)
     fe7:	3a 72 28             	cmp    0x28(%edx),%dh
     fea:	30 2c 35 29 00 66 69 	xor    %ch,0x69660029(,%esi,1)
     ff1:	66 6f                	outsw  %ds:(%esi),(%dx)
     ff3:	38 5f 70             	cmp    %bl,0x70(%edi)
     ff6:	75 74                	jne    106c <bootmain-0x27ef94>
     ff8:	3a 46 28             	cmp    0x28(%esi),%al
     ffb:	30 2c 34             	xor    %ch,(%esp,%esi,1)
     ffe:	29 00                	sub    %eax,(%eax)
    1000:	66 69 66 6f 3a 70    	imul   $0x703a,0x6f(%esi),%sp
    1006:	28 30                	sub    %dh,(%eax)
    1008:	2c 32                	sub    $0x32,%al
    100a:	29 00                	sub    %eax,(%eax)
    100c:	64 61                	fs popa 
    100e:	74 61                	je     1071 <bootmain-0x27ef8f>
    1010:	3a 70 28             	cmp    0x28(%eax),%dh
    1013:	30 2c 34             	xor    %ch,(%esp,%esi,1)
    1016:	29 00                	sub    %eax,(%eax)
    1018:	66 69 66 6f 38 5f    	imul   $0x5f38,0x6f(%esi),%sp
    101e:	67 65 74 3a          	addr16 gs je 105c <bootmain-0x27efa4>
    1022:	46                   	inc    %esi
    1023:	28 30                	sub    %dh,(%eax)
    1025:	2c 34                	sub    $0x34,%al
    1027:	29 00                	sub    %eax,(%eax)
    1029:	64 61                	fs popa 
    102b:	74 61                	je     108e <bootmain-0x27ef72>
    102d:	3a 72 28             	cmp    0x28(%edx),%dh
    1030:	30 2c 34             	xor    %ch,(%esp,%esi,1)
    1033:	29 00                	sub    %eax,(%eax)
    1035:	66 69 66 6f 38 5f    	imul   $0x5f38,0x6f(%esi),%sp
    103b:	73 74                	jae    10b1 <bootmain-0x27ef4f>
    103d:	61                   	popa   
    103e:	74 75                	je     10b5 <bootmain-0x27ef4b>
    1040:	73 3a                	jae    107c <bootmain-0x27ef84>
    1042:	46                   	inc    %esi
    1043:	28 30                	sub    %dh,(%eax)
    1045:	2c 34                	sub    $0x34,%al
    1047:	29 00                	sub    %eax,(%eax)
    1049:	6d                   	insl   (%dx),%es:(%edi)
    104a:	6f                   	outsl  %ds:(%esi),(%dx)
    104b:	75 73                	jne    10c0 <bootmain-0x27ef40>
    104d:	65 2e 63 00          	gs arpl %ax,%cs:(%eax)
    1051:	77 61                	ja     10b4 <bootmain-0x27ef4c>
    1053:	69 74 5f 4b 42 43 5f 	imul   $0x735f4342,0x4b(%edi,%ebx,2),%esi
    105a:	73 
    105b:	65 6e                	outsb  %gs:(%esi),(%dx)
    105d:	64 72 65             	fs jb  10c5 <bootmain-0x27ef3b>
    1060:	61                   	popa   
    1061:	64 79 3a             	fs jns 109e <bootmain-0x27ef62>
    1064:	46                   	inc    %esi
    1065:	28 30                	sub    %dh,(%eax)
    1067:	2c 31                	sub    $0x31,%al
    1069:	29 3d 28 30 2c 31    	sub    %edi,0x312c3028
    106f:	29 00                	sub    %eax,(%eax)
    1071:	75 69                	jne    10dc <bootmain-0x27ef24>
    1073:	6e                   	outsb  %ds:(%esi),(%dx)
    1074:	74 38                	je     10ae <bootmain-0x27ef52>
    1076:	5f                   	pop    %edi
    1077:	74 3a                	je     10b3 <bootmain-0x27ef4d>
    1079:	74 28                	je     10a3 <bootmain-0x27ef5d>
    107b:	30 2c 32             	xor    %ch,(%edx,%esi,1)
    107e:	29 3d 28 30 2c 33    	sub    %edi,0x332c3028
    1084:	29 3d 72 28 30 2c    	sub    %edi,0x2c302872
    108a:	33 29                	xor    (%ecx),%ebp
    108c:	3b 30                	cmp    (%eax),%esi
    108e:	3b 32                	cmp    (%edx),%esi
    1090:	35 35 3b 00 75       	xor    $0x75003b35,%eax
    1095:	6e                   	outsb  %ds:(%esi),(%dx)
    1096:	73 69                	jae    1101 <bootmain-0x27eeff>
    1098:	67 6e                	outsb  %ds:(%si),(%dx)
    109a:	65 64 20 63 68       	gs and %ah,%fs:0x68(%ebx)
    109f:	61                   	popa   
    10a0:	72 3a                	jb     10dc <bootmain-0x27ef24>
    10a2:	74 28                	je     10cc <bootmain-0x27ef34>
    10a4:	30 2c 33             	xor    %ch,(%ebx,%esi,1)
    10a7:	29 00                	sub    %eax,(%eax)
    10a9:	69 6e 69 74 5f 6b 65 	imul   $0x656b5f74,0x69(%esi),%ebp
    10b0:	79 62                	jns    1114 <bootmain-0x27eeec>
    10b2:	6f                   	outsl  %ds:(%esi),(%dx)
    10b3:	61                   	popa   
    10b4:	72 64                	jb     111a <bootmain-0x27eee6>
    10b6:	3a 46 28             	cmp    0x28(%esi),%al
    10b9:	30 2c 31             	xor    %ch,(%ecx,%esi,1)
    10bc:	29 00                	sub    %eax,(%eax)
    10be:	65 6e                	outsb  %gs:(%esi),(%dx)
    10c0:	61                   	popa   
    10c1:	62 6c 65 5f          	bound  %ebp,0x5f(%ebp,%eiz,2)
    10c5:	6d                   	insl   (%dx),%es:(%edi)
    10c6:	6f                   	outsl  %ds:(%esi),(%dx)
    10c7:	75 73                	jne    113c <bootmain-0x27eec4>
    10c9:	65 3a 46 28          	cmp    %gs:0x28(%esi),%al
    10cd:	30 2c 31             	xor    %ch,(%ecx,%esi,1)
    10d0:	29 00                	sub    %eax,(%eax)
    10d2:	6d                   	insl   (%dx),%es:(%edi)
    10d3:	64 65 63 3a          	fs arpl %di,%gs:(%edx)
    10d7:	70 28                	jo     1101 <bootmain-0x27eeff>
    10d9:	30 2c 34             	xor    %ch,(%esp,%esi,1)
    10dc:	29 3d 2a 28 30 2c    	sub    %edi,0x2c30282a
    10e2:	35 29 3d 78 73       	xor    $0x73783d29,%eax
    10e7:	4d                   	dec    %ebp
    10e8:	4f                   	dec    %edi
    10e9:	55                   	push   %ebp
    10ea:	53                   	push   %ebx
    10eb:	45                   	inc    %ebp
    10ec:	5f                   	pop    %edi
    10ed:	44                   	inc    %esp
    10ee:	45                   	inc    %ebp
    10ef:	43                   	inc    %ebx
    10f0:	3a 00                	cmp    (%eax),%al
    10f2:	4d                   	dec    %ebp
    10f3:	4f                   	dec    %edi
    10f4:	55                   	push   %ebp
    10f5:	53                   	push   %ebx
    10f6:	45                   	inc    %ebp
    10f7:	5f                   	pop    %edi
    10f8:	44                   	inc    %esp
    10f9:	45                   	inc    %ebp
    10fa:	43                   	inc    %ebx
    10fb:	3a 54 28 30          	cmp    0x30(%eax,%ebp,1),%dl
    10ff:	2c 35                	sub    $0x35,%al
    1101:	29 3d 73 31 36 62    	sub    %edi,0x62363173
    1107:	75 66                	jne    116f <bootmain-0x27ee91>
    1109:	3a 28                	cmp    (%eax),%ch
    110b:	30 2c 36             	xor    %ch,(%esi,%esi,1)
    110e:	29 3d 61 72 28 30    	sub    %edi,0x30287261
    1114:	2c 37                	sub    $0x37,%al
    1116:	29 3d 72 28 30 2c    	sub    %edi,0x2c302872
    111c:	37                   	aaa    
    111d:	29 3b                	sub    %edi,(%ebx)
    111f:	30 3b                	xor    %bh,(%ebx)
    1121:	34 32                	xor    $0x32,%al
    1123:	39 34 39             	cmp    %esi,(%ecx,%edi,1)
    1126:	36 37                	ss aaa 
    1128:	32 39                	xor    (%ecx),%bh
    112a:	35 3b 3b 30 3b       	xor    $0x3b303b3b,%eax
    112f:	32 3b                	xor    (%ebx),%bh
    1131:	28 30                	sub    %dh,(%eax)
    1133:	2c 33                	sub    $0x33,%al
    1135:	29 2c 30             	sub    %ebp,(%eax,%esi,1)
    1138:	2c 32                	sub    $0x32,%al
    113a:	34 3b                	xor    $0x3b,%al
    113c:	70 68                	jo     11a6 <bootmain-0x27ee5a>
    113e:	61                   	popa   
    113f:	73 65                	jae    11a6 <bootmain-0x27ee5a>
    1141:	3a 28                	cmp    (%eax),%ch
    1143:	30 2c 33             	xor    %ch,(%ebx,%esi,1)
    1146:	29 2c 32             	sub    %ebp,(%edx,%esi,1)
    1149:	34 2c                	xor    $0x2c,%al
    114b:	38 3b                	cmp    %bh,(%ebx)
    114d:	78 3a                	js     1189 <bootmain-0x27ee77>
    114f:	28 30                	sub    %dh,(%eax)
    1151:	2c 38                	sub    $0x38,%al
    1153:	29 3d 72 28 30 2c    	sub    %edi,0x2c302872
    1159:	38 29                	cmp    %ch,(%ecx)
    115b:	3b 2d 32 31 34 37    	cmp    0x37343132,%ebp
    1161:	34 38                	xor    $0x38,%al
    1163:	33 36                	xor    (%esi),%esi
    1165:	34 38                	xor    $0x38,%al
    1167:	3b 32                	cmp    (%edx),%esi
    1169:	31 34 37             	xor    %esi,(%edi,%esi,1)
    116c:	34 38                	xor    $0x38,%al
    116e:	33 36                	xor    (%esi),%esi
    1170:	34 37                	xor    $0x37,%al
    1172:	3b 2c 33             	cmp    (%ebx,%esi,1),%ebp
    1175:	32 2c 33             	xor    (%ebx,%esi,1),%ch
    1178:	32 3b                	xor    (%ebx),%bh
    117a:	79 3a                	jns    11b6 <bootmain-0x27ee4a>
    117c:	28 30                	sub    %dh,(%eax)
    117e:	2c 38                	sub    $0x38,%al
    1180:	29 2c 36             	sub    %ebp,(%esi,%esi,1)
    1183:	34 2c                	xor    $0x2c,%al
    1185:	33 32                	xor    (%edx),%esi
    1187:	3b 62 74             	cmp    0x74(%edx),%esp
    118a:	6e                   	outsb  %ds:(%esi),(%dx)
    118b:	3a 28                	cmp    (%eax),%ch
    118d:	30 2c 38             	xor    %ch,(%eax,%edi,1)
    1190:	29 2c 39             	sub    %ebp,(%ecx,%edi,1)
    1193:	36 2c 33             	ss sub $0x33,%al
    1196:	32 3b                	xor    (%ebx),%bh
    1198:	3b 00                	cmp    (%eax),%eax
    119a:	69 6e 74 3a 74 28 30 	imul   $0x3028743a,0x74(%esi),%ebp
    11a1:	2c 38                	sub    $0x38,%al
    11a3:	29 00                	sub    %eax,(%eax)
    11a5:	6d                   	insl   (%dx),%es:(%edi)
    11a6:	64 65 63 3a          	fs arpl %di,%gs:(%edx)
    11aa:	72 28                	jb     11d4 <bootmain-0x27ee2c>
    11ac:	30 2c 34             	xor    %ch,(%esp,%esi,1)
    11af:	29 00                	sub    %eax,(%eax)
    11b1:	6d                   	insl   (%dx),%es:(%edi)
    11b2:	6f                   	outsl  %ds:(%esi),(%dx)
    11b3:	75 73                	jne    1228 <bootmain-0x27edd8>
    11b5:	65 5f                	gs pop %edi
    11b7:	64 65 63 6f 64       	fs arpl %bp,%gs:0x64(%edi)
    11bc:	65 3a 46 28          	cmp    %gs:0x28(%esi),%al
    11c0:	30 2c 38             	xor    %ch,(%eax,%edi,1)
    11c3:	29 00                	sub    %eax,(%eax)
    11c5:	6d                   	insl   (%dx),%es:(%edi)
    11c6:	64 65 63 3a          	fs arpl %di,%gs:(%edx)
    11ca:	70 28                	jo     11f4 <bootmain-0x27ee0c>
    11cc:	30 2c 34             	xor    %ch,(%esp,%esi,1)
    11cf:	29 00                	sub    %eax,(%eax)
    11d1:	64 61                	fs popa 
    11d3:	74 3a                	je     120f <bootmain-0x27edf1>
    11d5:	70 28                	jo     11ff <bootmain-0x27ee01>
    11d7:	30 2c 38             	xor    %ch,(%eax,%edi,1)
    11da:	29 00                	sub    %eax,(%eax)
    11dc:	6d                   	insl   (%dx),%es:(%edi)
    11dd:	65 6d                	gs insl (%dx),%es:(%edi)
    11df:	6f                   	outsl  %ds:(%esi),(%dx)
    11e0:	72 79                	jb     125b <bootmain-0x27eda5>
    11e2:	2e 63 00             	arpl   %ax,%cs:(%eax)
    11e5:	6d                   	insl   (%dx),%es:(%edi)
    11e6:	65 6d                	gs insl (%dx),%es:(%edi)
    11e8:	74 65                	je     124f <bootmain-0x27edb1>
    11ea:	73 74                	jae    1260 <bootmain-0x27eda0>
    11ec:	5f                   	pop    %edi
    11ed:	73 75                	jae    1264 <bootmain-0x27ed9c>
    11ef:	62 3a                	bound  %edi,(%edx)
    11f1:	46                   	inc    %esi
    11f2:	28 30                	sub    %dh,(%eax)
    11f4:	2c 31                	sub    $0x31,%al
    11f6:	29 3d 72 28 30 2c    	sub    %edi,0x2c302872
    11fc:	31 29                	xor    %ebp,(%ecx)
    11fe:	3b 30                	cmp    (%eax),%esi
    1200:	3b 34 32             	cmp    (%edx,%esi,1),%esi
    1203:	39 34 39             	cmp    %esi,(%ecx,%edi,1)
    1206:	36 37                	ss aaa 
    1208:	32 39                	xor    (%ecx),%bh
    120a:	35 3b 00 75 6e       	xor    $0x6e75003b,%eax
    120f:	73 69                	jae    127a <bootmain-0x27ed86>
    1211:	67 6e                	outsb  %ds:(%si),(%dx)
    1213:	65 64 20 69 6e       	gs and %ch,%fs:0x6e(%ecx)
    1218:	74 3a                	je     1254 <bootmain-0x27edac>
    121a:	74 28                	je     1244 <bootmain-0x27edbc>
    121c:	30 2c 31             	xor    %ch,(%ecx,%esi,1)
    121f:	29 00                	sub    %eax,(%eax)
    1221:	73 74                	jae    1297 <bootmain-0x27ed69>
    1223:	61                   	popa   
    1224:	72 74                	jb     129a <bootmain-0x27ed66>
    1226:	3a 70 28             	cmp    0x28(%eax),%dh
    1229:	30 2c 31             	xor    %ch,(%ecx,%esi,1)
    122c:	29 00                	sub    %eax,(%eax)
    122e:	65 6e                	outsb  %gs:(%esi),(%dx)
    1230:	64 3a 70 28          	cmp    %fs:0x28(%eax),%dh
    1234:	30 2c 31             	xor    %ch,(%ecx,%esi,1)
    1237:	29 00                	sub    %eax,(%eax)
    1239:	69 3a 72 28 30 2c    	imul   $0x2c302872,(%edx),%edi
    123f:	31 29                	xor    %ebp,(%ecx)
    1241:	00 6f 6c             	add    %ch,0x6c(%edi)
    1244:	64 3a 72 28          	cmp    %fs:0x28(%edx),%dh
    1248:	30 2c 31             	xor    %ch,(%ecx,%esi,1)
    124b:	29 00                	sub    %eax,(%eax)
    124d:	6d                   	insl   (%dx),%es:(%edi)
    124e:	65 6d                	gs insl (%dx),%es:(%edi)
    1250:	74 65                	je     12b7 <bootmain-0x27ed49>
    1252:	73 74                	jae    12c8 <bootmain-0x27ed38>
    1254:	3a 46 28             	cmp    0x28(%esi),%al
    1257:	30 2c 31             	xor    %ch,(%ecx,%esi,1)
    125a:	29 00                	sub    %eax,(%eax)
    125c:	75 69                	jne    12c7 <bootmain-0x27ed39>
    125e:	6e                   	outsb  %ds:(%esi),(%dx)
    125f:	74 33                	je     1294 <bootmain-0x27ed6c>
    1261:	32 5f 74             	xor    0x74(%edi),%bl
    1264:	3a 74 28 30          	cmp    0x30(%eax,%ebp,1),%dh
    1268:	2c 32                	sub    $0x32,%al
    126a:	29 3d 28 30 2c 31    	sub    %edi,0x312c3028
    1270:	29 00                	sub    %eax,(%eax)
    1272:	6d                   	insl   (%dx),%es:(%edi)
    1273:	65 6d                	gs insl (%dx),%es:(%edi)
    1275:	6d                   	insl   (%dx),%es:(%edi)
    1276:	61                   	popa   
    1277:	6e                   	outsb  %ds:(%esi),(%dx)
    1278:	5f                   	pop    %edi
    1279:	69 6e 69 74 3a 46 28 	imul   $0x28463a74,0x69(%esi),%ebp
    1280:	30 2c 33             	xor    %ch,(%ebx,%esi,1)
    1283:	29 3d 28 30 2c 33    	sub    %edi,0x332c3028
    1289:	29 00                	sub    %eax,(%eax)
    128b:	76 6f                	jbe    12fc <bootmain-0x27ed04>
    128d:	69 64 3a 74 28 30 2c 	imul   $0x332c3028,0x74(%edx,%edi,1),%esp
    1294:	33 
    1295:	29 00                	sub    %eax,(%eax)
    1297:	6d                   	insl   (%dx),%es:(%edi)
    1298:	61                   	popa   
    1299:	6e                   	outsb  %ds:(%esi),(%dx)
    129a:	3a 70 28             	cmp    0x28(%eax),%dh
    129d:	30 2c 34             	xor    %ch,(%esp,%esi,1)
    12a0:	29 3d 2a 28 30 2c    	sub    %edi,0x2c30282a
    12a6:	35 29 3d 78 73       	xor    $0x73783d29,%eax
    12ab:	4d                   	dec    %ebp
    12ac:	45                   	inc    %ebp
    12ad:	4d                   	dec    %ebp
    12ae:	4d                   	dec    %ebp
    12af:	41                   	inc    %ecx
    12b0:	4e                   	dec    %esi
    12b1:	3a 00                	cmp    (%eax),%al
    12b3:	4d                   	dec    %ebp
    12b4:	45                   	inc    %ebp
    12b5:	4d                   	dec    %ebp
    12b6:	4d                   	dec    %ebp
    12b7:	41                   	inc    %ecx
    12b8:	4e                   	dec    %esi
    12b9:	3a 54 28 30          	cmp    0x30(%eax,%ebp,1),%dl
    12bd:	2c 35                	sub    $0x35,%al
    12bf:	29 3d 73 33 32 37    	sub    %edi,0x37323373
    12c5:	33 36                	xor    (%esi),%esi
    12c7:	66 72 65             	data16 jb 132f <bootmain-0x27ecd1>
    12ca:	65 73 3a             	gs jae 1307 <bootmain-0x27ecf9>
    12cd:	28 30                	sub    %dh,(%eax)
    12cf:	2c 36                	sub    $0x36,%al
    12d1:	29 3d 72 28 30 2c    	sub    %edi,0x2c302872
    12d7:	36 29 3b             	sub    %edi,%ss:(%ebx)
    12da:	2d 32 31 34 37       	sub    $0x37343132,%eax
    12df:	34 38                	xor    $0x38,%al
    12e1:	33 36                	xor    (%esi),%esi
    12e3:	34 38                	xor    $0x38,%al
    12e5:	3b 32                	cmp    (%edx),%esi
    12e7:	31 34 37             	xor    %esi,(%edi,%esi,1)
    12ea:	34 38                	xor    $0x38,%al
    12ec:	33 36                	xor    (%esi),%esi
    12ee:	34 37                	xor    $0x37,%al
    12f0:	3b 2c 30             	cmp    (%eax,%esi,1),%ebp
    12f3:	2c 33                	sub    $0x33,%al
    12f5:	32 3b                	xor    (%ebx),%bh
    12f7:	6d                   	insl   (%dx),%es:(%edi)
    12f8:	61                   	popa   
    12f9:	78 66                	js     1361 <bootmain-0x27ec9f>
    12fb:	72 65                	jb     1362 <bootmain-0x27ec9e>
    12fd:	65 73 3a             	gs jae 133a <bootmain-0x27ecc6>
    1300:	28 30                	sub    %dh,(%eax)
    1302:	2c 36                	sub    $0x36,%al
    1304:	29 2c 33             	sub    %ebp,(%ebx,%esi,1)
    1307:	32 2c 33             	xor    (%ebx,%esi,1),%ch
    130a:	32 3b                	xor    (%ebx),%bh
    130c:	6c                   	insb   (%dx),%es:(%edi)
    130d:	6f                   	outsl  %ds:(%esi),(%dx)
    130e:	73 74                	jae    1384 <bootmain-0x27ec7c>
    1310:	73 69                	jae    137b <bootmain-0x27ec85>
    1312:	7a 65                	jp     1379 <bootmain-0x27ec87>
    1314:	3a 28                	cmp    (%eax),%ch
    1316:	30 2c 36             	xor    %ch,(%esi,%esi,1)
    1319:	29 2c 36             	sub    %ebp,(%esi,%esi,1)
    131c:	34 2c                	xor    $0x2c,%al
    131e:	33 32                	xor    (%edx),%esi
    1320:	3b 6c 6f 73          	cmp    0x73(%edi,%ebp,2),%ebp
    1324:	74 73                	je     1399 <bootmain-0x27ec67>
    1326:	3a 28                	cmp    (%eax),%ch
    1328:	30 2c 36             	xor    %ch,(%esi,%esi,1)
    132b:	29 2c 39             	sub    %ebp,(%ecx,%edi,1)
    132e:	36 2c 33             	ss sub $0x33,%al
    1331:	32 3b                	xor    (%ebx),%bh
    1333:	66 72 65             	data16 jb 139b <bootmain-0x27ec65>
    1336:	65 3a 28             	cmp    %gs:(%eax),%ch
    1339:	30 2c 37             	xor    %ch,(%edi,%esi,1)
    133c:	29 3d 61 72 28 30    	sub    %edi,0x30287261
    1342:	2c 38                	sub    $0x38,%al
    1344:	29 3d 72 28 30 2c    	sub    %edi,0x2c302872
    134a:	38 29                	cmp    %ch,(%ecx)
    134c:	3b 30                	cmp    (%eax),%esi
    134e:	3b 34 32             	cmp    (%edx,%esi,1),%esi
    1351:	39 34 39             	cmp    %esi,(%ecx,%edi,1)
    1354:	36 37                	ss aaa 
    1356:	32 39                	xor    (%ecx),%bh
    1358:	35 3b 3b 30 3b       	xor    $0x3b303b3b,%eax
    135d:	34 30                	xor    $0x30,%al
    135f:	38 39                	cmp    %bh,(%ecx)
    1361:	3b 28                	cmp    (%eax),%ebp
    1363:	30 2c 39             	xor    %ch,(%ecx,%edi,1)
    1366:	29 3d 78 73 46 52    	sub    %edi,0x52467378
    136c:	45                   	inc    %ebp
    136d:	45                   	inc    %ebp
    136e:	49                   	dec    %ecx
    136f:	4e                   	dec    %esi
    1370:	46                   	inc    %esi
    1371:	4f                   	dec    %edi
    1372:	3a 2c 31             	cmp    (%ecx,%esi,1),%ch
    1375:	32 38                	xor    (%eax),%bh
    1377:	2c 32                	sub    $0x32,%al
    1379:	36 31 37             	xor    %esi,%ss:(%edi)
    137c:	36 30 3b             	xor    %bh,%ss:(%ebx)
    137f:	3b 00                	cmp    (%eax),%eax
    1381:	69 6e 74 3a 74 28 30 	imul   $0x3028743a,0x74(%esi),%ebp
    1388:	2c 36                	sub    $0x36,%al
    138a:	29 00                	sub    %eax,(%eax)
    138c:	46                   	inc    %esi
    138d:	52                   	push   %edx
    138e:	45                   	inc    %ebp
    138f:	45                   	inc    %ebp
    1390:	49                   	dec    %ecx
    1391:	4e                   	dec    %esi
    1392:	46                   	inc    %esi
    1393:	4f                   	dec    %edi
    1394:	3a 54 28 30          	cmp    0x30(%eax,%ebp,1),%dl
    1398:	2c 39                	sub    $0x39,%al
    139a:	29 3d 73 38 61 64    	sub    %edi,0x64613873
    13a0:	64 72 3a             	fs jb  13dd <bootmain-0x27ec23>
    13a3:	28 30                	sub    %dh,(%eax)
    13a5:	2c 31                	sub    $0x31,%al
    13a7:	29 2c 30             	sub    %ebp,(%eax,%esi,1)
    13aa:	2c 33                	sub    $0x33,%al
    13ac:	32 3b                	xor    (%ebx),%bh
    13ae:	73 69                	jae    1419 <bootmain-0x27ebe7>
    13b0:	7a 65                	jp     1417 <bootmain-0x27ebe9>
    13b2:	3a 28                	cmp    (%eax),%ch
    13b4:	30 2c 31             	xor    %ch,(%ecx,%esi,1)
    13b7:	29 2c 33             	sub    %ebp,(%ebx,%esi,1)
    13ba:	32 2c 33             	xor    (%ebx,%esi,1),%ch
    13bd:	32 3b                	xor    (%ebx),%bh
    13bf:	3b 00                	cmp    (%eax),%eax
    13c1:	6d                   	insl   (%dx),%es:(%edi)
    13c2:	61                   	popa   
    13c3:	6e                   	outsb  %ds:(%esi),(%dx)
    13c4:	3a 72 28             	cmp    0x28(%edx),%dh
    13c7:	30 2c 34             	xor    %ch,(%esp,%esi,1)
    13ca:	29 00                	sub    %eax,(%eax)
    13cc:	6d                   	insl   (%dx),%es:(%edi)
    13cd:	65 6d                	gs insl (%dx),%es:(%edi)
    13cf:	6d                   	insl   (%dx),%es:(%edi)
    13d0:	61                   	popa   
    13d1:	6e                   	outsb  %ds:(%esi),(%dx)
    13d2:	5f                   	pop    %edi
    13d3:	74 6f                	je     1444 <bootmain-0x27ebbc>
    13d5:	74 61                	je     1438 <bootmain-0x27ebc8>
    13d7:	6c                   	insb   (%dx),%es:(%edi)
    13d8:	3a 46 28             	cmp    0x28(%esi),%al
    13db:	30 2c 31             	xor    %ch,(%ecx,%esi,1)
    13de:	29 00                	sub    %eax,(%eax)
    13e0:	6d                   	insl   (%dx),%es:(%edi)
    13e1:	61                   	popa   
    13e2:	6e                   	outsb  %ds:(%esi),(%dx)
    13e3:	3a 70 28             	cmp    0x28(%eax),%dh
    13e6:	30 2c 34             	xor    %ch,(%esp,%esi,1)
    13e9:	29 00                	sub    %eax,(%eax)
    13eb:	74 3a                	je     1427 <bootmain-0x27ebd9>
    13ed:	72 28                	jb     1417 <bootmain-0x27ebe9>
    13ef:	30 2c 31             	xor    %ch,(%ecx,%esi,1)
    13f2:	29 00                	sub    %eax,(%eax)
    13f4:	6d                   	insl   (%dx),%es:(%edi)
    13f5:	65 6d                	gs insl (%dx),%es:(%edi)
    13f7:	6d                   	insl   (%dx),%es:(%edi)
    13f8:	61                   	popa   
    13f9:	6e                   	outsb  %ds:(%esi),(%dx)
    13fa:	5f                   	pop    %edi
    13fb:	61                   	popa   
    13fc:	6c                   	insb   (%dx),%es:(%edi)
    13fd:	6c                   	insb   (%dx),%es:(%edi)
    13fe:	6f                   	outsl  %ds:(%esi),(%dx)
    13ff:	63 3a                	arpl   %di,(%edx)
    1401:	46                   	inc    %esi
    1402:	28 30                	sub    %dh,(%eax)
    1404:	2c 31                	sub    $0x31,%al
    1406:	29 00                	sub    %eax,(%eax)
    1408:	73 69                	jae    1473 <bootmain-0x27eb8d>
    140a:	7a 65                	jp     1471 <bootmain-0x27eb8f>
    140c:	3a 70 28             	cmp    0x28(%eax),%dh
    140f:	30 2c 31             	xor    %ch,(%ecx,%esi,1)
    1412:	29 00                	sub    %eax,(%eax)
    1414:	61                   	popa   
    1415:	3a 72 28             	cmp    0x28(%edx),%dh
    1418:	30 2c 31             	xor    %ch,(%ecx,%esi,1)
    141b:	29 00                	sub    %eax,(%eax)
    141d:	6d                   	insl   (%dx),%es:(%edi)
    141e:	65 6d                	gs insl (%dx),%es:(%edi)
    1420:	6d                   	insl   (%dx),%es:(%edi)
    1421:	61                   	popa   
    1422:	6e                   	outsb  %ds:(%esi),(%dx)
    1423:	5f                   	pop    %edi
    1424:	66 72 65             	data16 jb 148c <bootmain-0x27eb74>
    1427:	65 3a 46 28          	cmp    %gs:0x28(%esi),%al
    142b:	30 2c 36             	xor    %ch,(%esi,%esi,1)
    142e:	29 00                	sub    %eax,(%eax)
    1430:	61                   	popa   
    1431:	64 64 72 3a          	fs fs jb 146f <bootmain-0x27eb91>
    1435:	70 28                	jo     145f <bootmain-0x27eba1>
    1437:	30 2c 31             	xor    %ch,(%ecx,%esi,1)
    143a:	29 00                	sub    %eax,(%eax)
    143c:	69 3a 72 28 30 2c    	imul   $0x2c302872,(%edx),%edi
    1442:	36 29 00             	sub    %eax,%ss:(%eax)
    1445:	6a 3a                	push   $0x3a
    1447:	72 28                	jb     1471 <bootmain-0x27eb8f>
    1449:	30 2c 36             	xor    %ch,(%esi,%esi,1)
    144c:	29 00                	sub    %eax,(%eax)
