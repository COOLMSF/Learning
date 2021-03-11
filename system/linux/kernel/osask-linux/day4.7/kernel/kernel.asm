
kernel.out:     file format elf32-i386


Disassembly of section .text:

0000c400 <start>:

  


  # Set up the important data segment registers (DS, ES, SS).
  xorw    %ax,%ax             # Segment number zero
    c400:	31 c0                	xor    %eax,%eax
  movw    %ax,%ds             # -> Data Segment
    c402:	8e d8                	mov    %eax,%ds
  movw    %ax,%es             # -> Extra Segment
    c404:	8e c0                	mov    %eax,%es
  movw    %ax,%ss             # -> Stack Segment
    c406:	8e d0                	mov    %eax,%ss
  
  movb $0x13,%al  # ;vga 320x200x8 位,color mode 
    c408:	b0 13                	mov    $0x13,%al
  movb $0x00,%ah
    c40a:	b4 00                	mov    $0x0,%ah
  int $0x10
    c40c:	cd 10                	int    $0x10
  
#save color mode in ram 0x0ff0
 movb $8,(VMODE)
    c40e:	c6 06 f2             	movb   $0xf2,(%esi)
    c411:	0f 08                	invd   
 movw $320,(SCRNX)
    c413:	c7 06 f4 0f 40 01    	movl   $0x1400ff4,(%esi)
 movw $200,(SCRNY)
    c419:	c7 06 f6 0f c8 00    	movl   $0xc80ff6,(%esi)
 movl $0x000a0000,(VRAM)
    c41f:	66 c7 06 f8 0f       	movw   $0xff8,(%esi)
    c424:	00 00                	add    %al,(%eax)
    c426:	0a 00                	or     (%eax),%al

 #get keyboard led status
 movb	$0x02,%ah 
    c428:	b4 02                	mov    $0x2,%ah
 int     $0x16			#keyboard interrupts
    c42a:	cd 16                	int    $0x16
 movb   %al,(LEDS)
    c42c:	a2 f1 0f be 65       	mov    %al,0x65be0ff1
		
		
		
#diplay something
  movw $msg,%si
    c431:	c4                   	(bad)  
  call puts
    c432:	e8 5d 00 be 81       	call   81bec494 <__bss_start+0x81bdfce4>
  
  movw $try,%si
    c437:	c4                   	(bad)  
  call puts
    c438:	e8 57 00 fa fc       	call   fcfac494 <__bss_start+0xfcf9fce4>

0000c43d <seta20.1>:
  # Enable A20:
  #   For backwards compatibility with the earliest PCs, physical
  #   address line 20 is tied low, so that addresses higher than
  #   1MB wrap around to zero by default.  This code undoes this. 
seta20.1:
  inb     $0x64,%al               # Wait for not busy
    c43d:	e4 64                	in     $0x64,%al
  testb   $0x2,%al
    c43f:	a8 02                	test   $0x2,%al
  jnz     seta20.1
    c441:	75 fa                	jne    c43d <seta20.1>

  movb    $0xd1,%al               # 0xd1 -> port 0x64
    c443:	b0 d1                	mov    $0xd1,%al
  outb    %al,$0x64
    c445:	e6 64                	out    %al,$0x64

0000c447 <seta20.2>:

seta20.2:
  inb     $0x64,%al               # Wait for not busy
    c447:	e4 64                	in     $0x64,%al
  testb   $02,%al
    c449:	a8 02                	test   $0x2,%al
  jnz     seta20.2
    c44b:	75 fa                	jne    c447 <seta20.2>

  movb    $0xdf,%al               # 0xdf -> port 0x60
    c44d:	b0 df                	mov    $0xdf,%al
  outb    %al,$0x60
    c44f:	e6 60                	out    %al,$0x60

  # Switch from real to protected mode, using a bootstrap GDT       this is vip ,but i don`t know it clearly now
  # and segment translation that makes virtual addresses 
  # identical to their physical addresses, so that the 
  # effective memory map does not change during the switch.
  lgdt    gdtdesc
    c451:	0f 01 16             	lgdtl  (%esi)
    c454:	d8 c4                	fadd   %st(4),%st
  movl    %cr0, %eax
    c456:	0f 20 c0             	mov    %cr0,%eax
  orl     $CR0_PE_ON, %eax
    c459:	66 83 c8 01          	or     $0x1,%ax
  movl    %eax, %cr0
    c45d:	0f 22 c0             	mov    %eax,%cr0
  
  # Jump to next instruction, but in 32-bit code segment.
  # Switches processor into 32-bit mode.
  ljmp    $PROT_MODE_CSEG, $protcseg
    c460:	ea                   	.byte 0xea
    c461:	a5                   	movsl  %ds:(%esi),%es:(%edi)
    c462:	c4 08                	les    (%eax),%ecx
	...

0000c465 <msg>:
    c465:	0d 0a 0a 0d 6d       	or     $0x6d0d0a0a,%eax
    c46a:	79 20                	jns    c48c <try+0xb>
    c46c:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
    c470:	65 6c                	gs insb (%dx),%es:(%edi)
    c472:	20 69 73             	and    %ch,0x73(%ecx)
    c475:	20 72 75             	and    %dh,0x75(%edx)
    c478:	6e                   	outsb  %ds:(%esi),(%dx)
    c479:	69 6e 67 20 6a 6f 73 	imul   $0x736f6a20,0x67(%esi),%ebp
	...

0000c481 <try>:
    c481:	0d 0a 0a 0d 74       	or     $0x740d0a0a,%eax
    c486:	72 79                	jb     c501 <bootmain+0x23>
    c488:	20 69 74             	and    %ch,0x74(%ecx)
    c48b:	20 61 67             	and    %ah,0x67(%ecx)
    c48e:	61                   	popa   
    c48f:	69                   	.byte 0x69
    c490:	6e                   	outsb  %ds:(%esi),(%dx)
	...

0000c492 <puts>:
 try:
  .asciz "\r\n\n\rtry it again"

puts:

	movb (%si),%al
    c492:	8a 04 83             	mov    (%ebx,%eax,4),%al
	add $1,%si
    c495:	c6 01 3c             	movb   $0x3c,(%ecx)
	cmp $0,%al
    c498:	00 74 09 b4          	add    %dh,-0x4c(%ecx,%ecx,1)
	je over
	movb $0x0e,%ah
    c49c:	0e                   	push   %cs
	movw $15,%bx
    c49d:	bb 0f 00 cd 10       	mov    $0x10cd000f,%ebx
	int $0x10
	jmp puts
    c4a2:	eb ee                	jmp    c492 <puts>

0000c4a4 <over>:
over:
	ret	
    c4a4:	c3                   	ret    

0000c4a5 <protcseg>:
	
	
  .code32                     # Assemble for 32-bit mode
protcseg:
  # Set up the protected-mode data segment registers
  movw    $PROT_MODE_DSEG, %ax    # Our data segment selector
    c4a5:	66 b8 10 00          	mov    $0x10,%ax
  movw    %ax, %ds                # -> DS: Data Segment
    c4a9:	8e d8                	mov    %eax,%ds
  movw    %ax, %es                # -> ES: Extra Segment
    c4ab:	8e c0                	mov    %eax,%es
  movw    %ax, %fs                # -> FS
    c4ad:	8e e0                	mov    %eax,%fs
  movw    %ax, %gs                # -> GS
    c4af:	8e e8                	mov    %eax,%gs
  movw    %ax, %ss                # -> SS: Stack Segment
    c4b1:	8e d0                	mov    %eax,%ss
  
  # Set up the stack pointer and call into C.
  movl    $start, %esp
    c4b3:	bc 00 c4 00 00       	mov    $0xc400,%esp
  call bootmain
    c4b8:	e8 21 00 00 00       	call   c4de <bootmain>

0000c4bd <spin>:

  # If bootmain returns (it shouldn't), loop.
spin:
  jmp spin
    c4bd:	eb fe                	jmp    c4bd <spin>
    c4bf:	90                   	nop

0000c4c0 <gdt>:
	...
    c4c8:	ff                   	(bad)  
    c4c9:	ff 00                	incl   (%eax)
    c4cb:	00 00                	add    %al,(%eax)
    c4cd:	9a cf 00 ff ff 00 00 	lcall  $0x0,$0xffff00cf
    c4d4:	00                   	.byte 0x0
    c4d5:	92                   	xchg   %eax,%edx
    c4d6:	cf                   	iret   
	...

0000c4d8 <gdtdesc>:
    c4d8:	17                   	pop    %ss
    c4d9:	00 c0                	add    %al,%al
    c4db:	c4 00                	les    (%eax),%eax
	...

0000c4de <bootmain>:
 *        Company:  ZJUT
 *
 * ==================================================
 */
#include<header.h>
void bootmain(void){
    c4de:	55                   	push   %ebp
    c4df:	89 e5                	mov    %esp,%ebp
    c4e1:	53                   	push   %ebx
    c4e2:	e8 7c 00 00 00       	call   c563 <__x86.get_pc_thunk.bx>
    c4e7:	81 c3 8d 02 00 00    	add    $0x28d,%ebx
    c4ed:	50                   	push   %eax
	//注意这里的函数名字为bootmain，因为在entry.S中设定的入口名字也是bootmain，两者要保持一致
	int i;
	char *p;
	init_palette();
    c4ee:	e8 f0 00 00 00       	call   c5e3 <init_palette>

	clear_screen(15);	//由于一进来这里显示的是"my kernel is running"等字符串，这里刷屏为灰色，去除字符串
    c4f3:	83 ec 0c             	sub    $0xc,%esp
    c4f6:	6a 0f                	push   $0xf
    c4f8:	e8 6a 00 00 00       	call   c567 <clear_screen>

	p=(char*)0xa0000;
	boxfill8(p, 320, 1, 20, 20, 120, 120);
    c4fd:	83 c4 0c             	add    $0xc,%esp
    c500:	6a 78                	push   $0x78
    c502:	6a 78                	push   $0x78
    c504:	6a 14                	push   $0x14
    c506:	6a 14                	push   $0x14
    c508:	6a 01                	push   $0x1
    c50a:	68 40 01 00 00       	push   $0x140
    c50f:	68 00 00 0a 00       	push   $0xa0000
    c514:	e8 ef 00 00 00       	call   c608 <boxfill8>
	boxfill8(p, 320, 2, 70, 50, 170, 150);
    c519:	83 c4 1c             	add    $0x1c,%esp
    c51c:	68 96 00 00 00       	push   $0x96
    c521:	68 aa 00 00 00       	push   $0xaa
    c526:	6a 32                	push   $0x32
    c528:	6a 46                	push   $0x46
    c52a:	6a 02                	push   $0x2
    c52c:	68 40 01 00 00       	push   $0x140
    c531:	68 00 00 0a 00       	push   $0xa0000
    c536:	e8 cd 00 00 00       	call   c608 <boxfill8>
	boxfill8(p, 320, 4, 120, 80, 220, 180);
    c53b:	83 c4 1c             	add    $0x1c,%esp
    c53e:	68 b4 00 00 00       	push   $0xb4
    c543:	68 dc 00 00 00       	push   $0xdc
    c548:	6a 50                	push   $0x50
    c54a:	6a 78                	push   $0x78
    c54c:	6a 04                	push   $0x4
    c54e:	68 40 01 00 00       	push   $0x140
    c553:	68 00 00 0a 00       	push   $0xa0000
    c558:	e8 ab 00 00 00       	call   c608 <boxfill8>
    c55d:	83 c4 20             	add    $0x20,%esp

	for(;;){
		io_halt();
    c560:	f4                   	hlt    
    c561:	eb fd                	jmp    c560 <bootmain+0x82>

0000c563 <__x86.get_pc_thunk.bx>:
    c563:	8b 1c 24             	mov    (%esp),%ebx
    c566:	c3                   	ret    

0000c567 <clear_screen>:
#include<header.h>

void clear_screen(char color) //15:pure white
{
    c567:	55                   	push   %ebp
    c568:	89 e5                	mov    %esp,%ebp
    c56a:	0f b6 55 08          	movzbl 0x8(%ebp),%edx
	int i;
	for(i=0xa0000;i<0xaffff;i++)
    c56e:	b8 00 00 0a 00       	mov    $0xa0000,%eax
	{
		write_mem8(i,color);  //if we write 15 ,all pixels color will be white,15 mens pure white ,so the screen changes into white
    c573:	88 10                	mov    %dl,(%eax)
	for(i=0xa0000;i<0xaffff;i++)
    c575:	83 c0 01             	add    $0x1,%eax
    c578:	3d ff ff 0a 00       	cmp    $0xaffff,%eax
    c57d:	75 f4                	jne    c573 <clear_screen+0xc>

	}
}
    c57f:	5d                   	pop    %ebp
    c580:	c3                   	ret    

0000c581 <color_screen>:

void color_screen(char color) //15:pure white
{
	int i;
	color=color;
	for(i=0xa0000;i<0xaffff;i++)
    c581:	b8 00 00 0a 00       	mov    $0xa0000,%eax
	{
		write_mem8(i,i&0x0f);  //if we write 15 ,all pixels color will be white,15 mens pure white ,so the screen changes into white
    c586:	89 c2                	mov    %eax,%edx
    c588:	83 e2 0f             	and    $0xf,%edx
    c58b:	88 10                	mov    %dl,(%eax)
	for(i=0xa0000;i<0xaffff;i++)
    c58d:	83 c0 01             	add    $0x1,%eax
    c590:	3d ff ff 0a 00       	cmp    $0xaffff,%eax
    c595:	75 ef                	jne    c586 <color_screen+0x5>

	}
}
    c597:	c3                   	ret    

0000c598 <set_palette>:

void set_palette(int start, int end, unsigned char* rgb){
    c598:	55                   	push   %ebp
    c599:	89 e5                	mov    %esp,%ebp
    c59b:	57                   	push   %edi
    c59c:	56                   	push   %esi
    c59d:	53                   	push   %ebx
    c59e:	8b 5d 08             	mov    0x8(%ebp),%ebx
    c5a1:	8b 75 0c             	mov    0xc(%ebp),%esi
    c5a4:	8b 4d 10             	mov    0x10(%ebp),%ecx
//read eflags and write_eflags
static __inline uint32_t
read_eflags(void)
{
        uint32_t eflags;
        __asm __volatile("pushfl; popl %0" : "=r" (eflags));
    c5a7:	9c                   	pushf  
    c5a8:	5f                   	pop    %edi
	int i, eflags;
	eflags = read_eflags();	//替代作者的io_load_eflags()
	io_cli();
    c5a9:	fa                   	cli    
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
    c5aa:	ba c8 03 00 00       	mov    $0x3c8,%edx
    c5af:	89 d8                	mov    %ebx,%eax
    c5b1:	ee                   	out    %al,(%dx)
	outb(0x03c8, start);	//替代作者的io_out8()
	for(i=start; i<=end; i++){
    c5b2:	39 f3                	cmp    %esi,%ebx
    c5b4:	7f 26                	jg     c5dc <set_palette+0x44>
    c5b6:	ba c9 03 00 00       	mov    $0x3c9,%edx
		outb(0x03c9,rgb[0]/4);
    c5bb:	0f b6 01             	movzbl (%ecx),%eax
    c5be:	c0 e8 02             	shr    $0x2,%al
    c5c1:	ee                   	out    %al,(%dx)
		outb(0x03c9,rgb[1]/4);
    c5c2:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    c5c6:	c0 e8 02             	shr    $0x2,%al
    c5c9:	ee                   	out    %al,(%dx)
		outb(0x03c9,rgb[2]/4);
    c5ca:	0f b6 41 02          	movzbl 0x2(%ecx),%eax
    c5ce:	c0 e8 02             	shr    $0x2,%al
    c5d1:	ee                   	out    %al,(%dx)
		rgb+=3;
    c5d2:	83 c1 03             	add    $0x3,%ecx
	for(i=start; i<=end; i++){
    c5d5:	83 c3 01             	add    $0x1,%ebx
    c5d8:	39 de                	cmp    %ebx,%esi
    c5da:	7d df                	jge    c5bb <set_palette+0x23>
}

static __inline void
write_eflags(uint32_t eflags)
{
        __asm __volatile("pushl %0; popfl" : : "r" (eflags));
    c5dc:	57                   	push   %edi
    c5dd:	9d                   	popf   
	}
	write_eflags(eflags);	//替代作者的io_store_eflags(eflags)
	return;
}
    c5de:	5b                   	pop    %ebx
    c5df:	5e                   	pop    %esi
    c5e0:	5f                   	pop    %edi
    c5e1:	5d                   	pop    %ebp
    c5e2:	c3                   	ret    

0000c5e3 <init_palette>:


void init_palette(void){
    c5e3:	55                   	push   %ebp
    c5e4:	89 e5                	mov    %esp,%ebp
    c5e6:	83 ec 0c             	sub    $0xc,%esp
    c5e9:	e8 7a 00 00 00       	call   c668 <__x86.get_pc_thunk.ax>
    c5ee:	05 86 01 00 00       	add    $0x186,%eax
		0x00,0x00,0x84,   /*12:dark 青*/
		0x84,0x00,0x84,   /*13:dark purper*/
		0x00,0x84,0x84,   /*14:light blue*/
		0x84,0x84,0x84,   /*15:dark gray*/
	};  
	set_palette(0,15,table_rgb);
    c5f3:	8d 80 0c 00 00 00    	lea    0xc(%eax),%eax
    c5f9:	50                   	push   %eax
    c5fa:	6a 0f                	push   $0xf
    c5fc:	6a 00                	push   $0x0
    c5fe:	e8 95 ff ff ff       	call   c598 <set_palette>
	return;
    c603:	83 c4 10             	add    $0x10,%esp
}
    c606:	c9                   	leave  
    c607:	c3                   	ret    

0000c608 <boxfill8>:

void boxfill8(char* vram, int xsize, unsigned char c, int x0, int y0, int x1, int y1){
    c608:	55                   	push   %ebp
    c609:	89 e5                	mov    %esp,%ebp
    c60b:	57                   	push   %edi
    c60c:	56                   	push   %esi
    c60d:	53                   	push   %ebx
    c60e:	83 ec 04             	sub    $0x4,%esp
    c611:	8b 5d 18             	mov    0x18(%ebp),%ebx
    c614:	8b 7d 1c             	mov    0x1c(%ebp),%edi
    c617:	8b 75 20             	mov    0x20(%ebp),%esi
    c61a:	0f b6 4d 10          	movzbl 0x10(%ebp),%ecx
	int x, y;
	for(y=y0; y<=y1; y++){
    c61e:	39 f3                	cmp    %esi,%ebx
    c620:	7f 3e                	jg     c660 <boxfill8+0x58>
    c622:	8b 45 08             	mov    0x8(%ebp),%eax
    c625:	8d 54 38 01          	lea    0x1(%eax,%edi,1),%edx
    c629:	89 d8                	mov    %ebx,%eax
    c62b:	0f af 45 0c          	imul   0xc(%ebp),%eax
    c62f:	01 c2                	add    %eax,%edx
    c631:	83 c6 01             	add    $0x1,%esi
    c634:	8b 45 14             	mov    0x14(%ebp),%eax
    c637:	29 f8                	sub    %edi,%eax
    c639:	83 e8 01             	sub    $0x1,%eax
    c63c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    c63f:	eb 13                	jmp    c654 <boxfill8+0x4c>
		for(x=x0; x<=x1; x++){
			vram[y*xsize+x]=c;
    c641:	88 08                	mov    %cl,(%eax)
		for(x=x0; x<=x1; x++){
    c643:	83 c0 01             	add    $0x1,%eax
    c646:	39 d0                	cmp    %edx,%eax
    c648:	75 f7                	jne    c641 <boxfill8+0x39>
	for(y=y0; y<=y1; y++){
    c64a:	83 c3 01             	add    $0x1,%ebx
    c64d:	03 55 0c             	add    0xc(%ebp),%edx
    c650:	39 f3                	cmp    %esi,%ebx
    c652:	74 0c                	je     c660 <boxfill8+0x58>
    c654:	8b 45 f0             	mov    -0x10(%ebp),%eax
    c657:	01 d0                	add    %edx,%eax
		for(x=x0; x<=x1; x++){
    c659:	39 7d 14             	cmp    %edi,0x14(%ebp)
    c65c:	7e e3                	jle    c641 <boxfill8+0x39>
    c65e:	eb ea                	jmp    c64a <boxfill8+0x42>
		}
	}
	return;
}
    c660:	83 c4 04             	add    $0x4,%esp
    c663:	5b                   	pop    %ebx
    c664:	5e                   	pop    %esi
    c665:	5f                   	pop    %edi
    c666:	5d                   	pop    %ebp
    c667:	c3                   	ret    

0000c668 <__x86.get_pc_thunk.ax>:
    c668:	8b 04 24             	mov    (%esp),%eax
    c66b:	c3                   	ret    
