
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
    c432:	e8 5d 00 be 81       	call   81bec494 <__bss_start+0x81bdfdc4>
  
  movw $try,%si
    c437:	c4                   	(bad)  
  call puts
    c438:	e8 57 00 fa fc       	call   fcfac494 <__bss_start+0xfcf9fdc4>

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
    c4e2:	e8 24 00 00 00       	call   c50b <__x86.get_pc_thunk.bx>
    c4e7:	81 c3 a9 01 00 00    	add    $0x1a9,%ebx
    c4ed:	50                   	push   %eax
	//注意这里的函数名字为bootmain，因为在entry.S中设定的入口名字也是bootmain，两者要保持一致
	int i;
	char *p;
	init_palette();
    c4ee:	e8 98 00 00 00       	call   c58b <init_palette>
	for(i=0xa0000; i<=0xaffff; i++){
    c4f3:	b8 00 00 0a 00       	mov    $0xa0000,%eax
		//write_mem8(i, i&0x0f);
		p=(char *)i;
		*p=i&0x0f;
    c4f8:	89 c2                	mov    %eax,%edx
	for(i=0xa0000; i<=0xaffff; i++){
    c4fa:	40                   	inc    %eax
		*p=i&0x0f;
    c4fb:	83 e2 0f             	and    $0xf,%edx
    c4fe:	88 50 ff             	mov    %dl,-0x1(%eax)
	for(i=0xa0000; i<=0xaffff; i++){
    c501:	3d 00 00 0b 00       	cmp    $0xb0000,%eax
    c506:	75 f0                	jne    c4f8 <bootmain+0x1a>
	}

	for(;;){
		io_halt();
    c508:	f4                   	hlt    
    c509:	eb fd                	jmp    c508 <bootmain+0x2a>

0000c50b <__x86.get_pc_thunk.bx>:
    c50b:	8b 1c 24             	mov    (%esp),%ebx
    c50e:	c3                   	ret    

0000c50f <clear_screen>:
#include<header.h>

void clear_screen(char color) //15:pure white
{
    c50f:	55                   	push   %ebp
    c510:	89 e5                	mov    %esp,%ebp
    c512:	0f b6 55 08          	movzbl 0x8(%ebp),%edx
	int i;
	for(i=0xa0000;i<0xaffff;i++)
    c516:	b8 00 00 0a 00       	mov    $0xa0000,%eax
	{
		write_mem8(i,color);  //if we write 15 ,all pixels color will be white,15 mens pure white ,so the screen changes into white
    c51b:	88 10                	mov    %dl,(%eax)
	for(i=0xa0000;i<0xaffff;i++)
    c51d:	83 c0 01             	add    $0x1,%eax
    c520:	3d ff ff 0a 00       	cmp    $0xaffff,%eax
    c525:	75 f4                	jne    c51b <clear_screen+0xc>

	}
}
    c527:	5d                   	pop    %ebp
    c528:	c3                   	ret    

0000c529 <color_screen>:

void color_screen(char color) //15:pure white
{
	int i;
	color=color;
	for(i=0xa0000;i<0xaffff;i++)
    c529:	b8 00 00 0a 00       	mov    $0xa0000,%eax
	{
		write_mem8(i,i&0x0f);  //if we write 15 ,all pixels color will be white,15 mens pure white ,so the screen changes into white
    c52e:	89 c2                	mov    %eax,%edx
    c530:	83 e2 0f             	and    $0xf,%edx
    c533:	88 10                	mov    %dl,(%eax)
	for(i=0xa0000;i<0xaffff;i++)
    c535:	83 c0 01             	add    $0x1,%eax
    c538:	3d ff ff 0a 00       	cmp    $0xaffff,%eax
    c53d:	75 ef                	jne    c52e <color_screen+0x5>

	}
}
    c53f:	c3                   	ret    

0000c540 <set_palette>:

void set_palette(int start, int end, unsigned char* rgb){
    c540:	55                   	push   %ebp
    c541:	89 e5                	mov    %esp,%ebp
    c543:	57                   	push   %edi
    c544:	56                   	push   %esi
    c545:	53                   	push   %ebx
    c546:	8b 5d 08             	mov    0x8(%ebp),%ebx
    c549:	8b 75 0c             	mov    0xc(%ebp),%esi
    c54c:	8b 4d 10             	mov    0x10(%ebp),%ecx
//read eflags and write_eflags
static __inline uint32_t
read_eflags(void)
{
        uint32_t eflags;
        __asm __volatile("pushfl; popl %0" : "=r" (eflags));
    c54f:	9c                   	pushf  
    c550:	5f                   	pop    %edi
	int i, eflags;
	eflags = read_eflags();	//替代作者的io_load_eflags()
	io_cli();
    c551:	fa                   	cli    
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
    c552:	ba c8 03 00 00       	mov    $0x3c8,%edx
    c557:	89 d8                	mov    %ebx,%eax
    c559:	ee                   	out    %al,(%dx)
	outb(0x03c8, start);	//替代作者的io_out8()
	for(i=start; i<=end; i++){
    c55a:	39 f3                	cmp    %esi,%ebx
    c55c:	7f 26                	jg     c584 <set_palette+0x44>
    c55e:	ba c9 03 00 00       	mov    $0x3c9,%edx
		outb(0x03c9,rgb[0]/4);
    c563:	0f b6 01             	movzbl (%ecx),%eax
    c566:	c0 e8 02             	shr    $0x2,%al
    c569:	ee                   	out    %al,(%dx)
		outb(0x03c9,rgb[1]/4);
    c56a:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    c56e:	c0 e8 02             	shr    $0x2,%al
    c571:	ee                   	out    %al,(%dx)
		outb(0x03c9,rgb[2]/4);
    c572:	0f b6 41 02          	movzbl 0x2(%ecx),%eax
    c576:	c0 e8 02             	shr    $0x2,%al
    c579:	ee                   	out    %al,(%dx)
		rgb+=3;
    c57a:	83 c1 03             	add    $0x3,%ecx
	for(i=start; i<=end; i++){
    c57d:	83 c3 01             	add    $0x1,%ebx
    c580:	39 de                	cmp    %ebx,%esi
    c582:	7d df                	jge    c563 <set_palette+0x23>
}

static __inline void
write_eflags(uint32_t eflags)
{
        __asm __volatile("pushl %0; popfl" : : "r" (eflags));
    c584:	57                   	push   %edi
    c585:	9d                   	popf   
	}
	write_eflags(eflags);	//替代作者的io_store_eflags(eflags)
	return;
}
    c586:	5b                   	pop    %ebx
    c587:	5e                   	pop    %esi
    c588:	5f                   	pop    %edi
    c589:	5d                   	pop    %ebp
    c58a:	c3                   	ret    

0000c58b <init_palette>:


void init_palette(void){
    c58b:	55                   	push   %ebp
    c58c:	89 e5                	mov    %esp,%ebp
    c58e:	83 ec 0c             	sub    $0xc,%esp
    c591:	e8 1a 00 00 00       	call   c5b0 <__x86.get_pc_thunk.ax>
    c596:	05 fa 00 00 00       	add    $0xfa,%eax
		0x00,0x00,0x84,   /*12:dark 青*/
		0x84,0x00,0x84,   /*13:dark purper*/
		0x00,0x84,0x84,   /*14:light blue*/
		0x84,0x84,0x84,   /*15:dark gray*/
	};  
	set_palette(0,15,table_rgb);
    c59b:	8d 80 10 00 00 00    	lea    0x10(%eax),%eax
    c5a1:	50                   	push   %eax
    c5a2:	6a 0f                	push   $0xf
    c5a4:	6a 00                	push   $0x0
    c5a6:	e8 95 ff ff ff       	call   c540 <set_palette>
	return;
    c5ab:	83 c4 10             	add    $0x10,%esp
}
    c5ae:	c9                   	leave  
    c5af:	c3                   	ret    

0000c5b0 <__x86.get_pc_thunk.ax>:
    c5b0:	8b 04 24             	mov    (%esp),%eax
    c5b3:	c3                   	ret    
