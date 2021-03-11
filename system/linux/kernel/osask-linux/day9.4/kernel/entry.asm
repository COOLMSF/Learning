
entry.out:     file format elf32-i386


Disassembly of section .note.gnu.property:

080480b4 <.note.gnu.property>:
  addl  $4    ,%esi
  movl  %eax ,(%edi)
  addl   $4    ,%edi
  subl   $1    ,%ecx
  jnz    memcpy
  ret
 80480b4:	04 00                	add    $0x0,%al
 80480b6:	00 00                	add    %al,(%eax)
 80480b8:	18 00                	sbb    %al,(%eax)
 80480ba:	00 00                	add    %al,(%eax)
 80480bc:	05 00 00 00 47       	add    $0x47000000,%eax
 80480c1:	4e                   	dec    %esi
 80480c2:	55                   	push   %ebp
 80480c3:	00 01                	add    %al,(%ecx)
 80480c5:	00 01                	add    %al,(%ecx)
 80480c7:	c0 04 00 00          	rolb   $0x0,(%eax,%eax,1)
 80480cb:	00 01                	add    %al,(%ecx)
 80480cd:	00 00                	add    %al,(%eax)
 80480cf:	00 02                	add    %al,(%edx)
 80480d1:	00 01                	add    %al,(%ecx)
 80480d3:	c0 04 00 00          	rolb   $0x0,(%eax,%eax,1)
 80480d7:	00 00                	add    %al,(%eax)
 80480d9:	00 00                	add    %al,(%eax)
	...

Disassembly of section .text:

0000c400 <entry>:
  jmp start
    c400:	eb 40                	jmp    c442 <start>

0000c402 <msg>:
    c402:	0d 0a 0a 0d 6d       	or     $0x6d0d0a0a,%eax
    c407:	79 20                	jns    c429 <try+0xb>
    c409:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
    c40d:	65 6c                	gs insb (%dx),%es:(%edi)
    c40f:	20 69 73             	and    %ch,0x73(%ecx)
    c412:	20 72 75             	and    %dh,0x75(%edx)
    c415:	6e                   	outsb  %ds:(%esi),(%dx)
    c416:	69 6e 67 20 6a 6f 73 	imul   $0x736f6a20,0x67(%esi),%ebp
	...

0000c41e <try>:
    c41e:	0d 0a 0a 0d 74       	or     $0x740d0a0a,%eax
    c423:	72 79                	jb     c49e <seta20.2+0x10>
    c425:	20 69 74             	and    %ch,0x74(%ecx)
    c428:	20 61 67             	and    %ah,0x67(%ecx)
    c42b:	61                   	popa   
    c42c:	69 6e 00     	imul   $0xc683048a,0x0(%esi),%ebp

0000c42f <puts>:
	movb (%si),%al
    c42f:	8a 04 83             	mov    (%ebx,%eax,4),%al
	add $1,%si
    c432:	c6 01 3c             	movb   $0x3c,(%ecx)
	cmp $0,%al
    c435:	00 74 09 b4          	add    %dh,-0x4c(%ecx,%ecx,1)
	movb $0x0e,%ah
    c439:	0e                   	push   %cs
	movw $15,%bx
    c43a:	bb 0f 00 cd 10       	mov    $0x10cd000f,%ebx
	jmp puts
    c43f:	eb ee                	jmp    c42f <puts>

0000c441 <over>:
	ret
    c441:	c3                   	ret    

0000c442 <start>:
  xorw    %ax,%ax             # Segment number zero
    c442:	31 c0                	xor    %eax,%eax
  movw    %ax,%ds             # -> Data Segment
    c444:	8e d8                	mov    %eax,%ds
  movw    %ax,%es             # -> Extra Segment
    c446:	8e c0                	mov    %eax,%es
  movw    %ax,%ss             # -> Stack Segment
    c448:	8e d0                	mov    %eax,%ss
  movb $0x13,%al  # ;vga 320x200x8 位,color mode 
    c44a:	b0 13                	mov    $0x13,%al
  movb $0x00,%ah  
    c44c:	b4 00                	mov    $0x0,%ah
   int $0x10   
    c44e:	cd 10                	int    $0x10
 movb  $10,(CYLS)
    c450:	c6 06 f0             	movb   $0xf0,(%esi)
    c453:	0f 0a                	(bad)  
 movb $8,(VMODE)
    c455:	c6 06 f2             	movb   $0xf2,(%esi)
    c458:	0f 08                	invd   
 movw $320,(SCRNX)
    c45a:	c7 06 f4 0f 40 01    	movl   $0x1400ff4,(%esi)
 movw $200,(SCRNY)
    c460:	c7 06 f6 0f c8 00    	movl   $0xc80ff6,(%esi)
 movl $0x000a0000,(VRAM)
    c466:	66 c7 06 f8 0f       	movw   $0xff8,(%esi)
    c46b:	00 00                	add    %al,(%eax)
    c46d:	0a 00                	or     (%eax),%al
 movb	$0x02,%ah 
    c46f:	b4 02                	mov    $0x2,%ah
 int     $0x16			#keyboard interrupts
    c471:	cd 16                	int    $0x16
 movb   %al,(LEDS)		
    c473:	a2 f1 0f be 02       	mov    %al,0x2be0ff1
  movw $msg,%si
    c478:	c4                   	(bad)  
  call puts
    c479:	e8 b3 ff b0 ff       	call   ffb1c431 <__bss_start+0xffb0fed9>
  outb %al, $0x21 #format  outb data port
    c47e:	e6 21                	out    %al,$0x21
  nop
    c480:	90                   	nop
  out %al, $0xa1
    c481:	e6 a1                	out    %al,$0xa1
   cli                         # Disable interrupts
    c483:	fa                   	cli    

0000c484 <seta20.1>:
  inb     $0x64,%al               # Wait for not busy
    c484:	e4 64                	in     $0x64,%al
  testb   $0x2,%al   #if 1 :busy ,if 0:idle
    c486:	a8 02                	test   $0x2,%al
  jnz     seta20.1
    c488:	75 fa                	jne    c484 <seta20.1>
  movb    $0xd1,%al               # 0xd1 -> port 0x64
    c48a:	b0 d1                	mov    $0xd1,%al
  outb    %al,$0x64
    c48c:	e6 64                	out    %al,$0x64

0000c48e <seta20.2>:
  inb     $0x64,%al               # Wait for not busy
    c48e:	e4 64                	in     $0x64,%al
  testb   $02,%al
    c490:	a8 02                	test   $0x2,%al
  jnz     seta20.2
    c492:	75 fa                	jne    c48e <seta20.2>
  movb    $0xdf,%al               # 0xdf -> port 0x60
    c494:	b0 df                	mov    $0xdf,%al
  outb    %al,$0x60 
    c496:	e6 60                	out    %al,$0x60
  movw $msg,%si
    c498:	be 02 c4 e8 91       	mov    $0x91e8c402,%esi
  call puts
    c49d:	ff 0f                	decl   (%edi)
  lgdt     gdtdesc
    c49f:	01 16                	add    %edx,(%esi)
    c4a1:	52                   	push   %edx
    c4a2:	c5 0f                	lds    (%edi),%ecx
  movl     %cr0, %eax
    c4a4:	20 c0                	and    %al,%al
  andl     $0x7fffffff,%eax
    c4a6:	66 25 ff ff          	and    $0xffff,%ax
    c4aa:	ff                   	(bad)  
    c4ab:	7f 66                	jg     c513 <all+0x20>
  orl      $CR0_PE_ON, %eax  #CR0_PE_ON=0x1 
    c4ad:	83 c8 01             	or     $0x1,%eax
  movl     %eax, %cr0  
    c4b0:	0f 22 c0             	mov    %eax,%cr0
  ljmp    $(2*8), $protcseg #PROT_MODE_CSEG=0x8 #32位的跳转指令。 ljmp selector ,offset 小日本这里没有这个跳转，但是用gnu的汇编编写时必须要一个，否则无法正常跳转
    c4b3:	ea b8 c4 10 00   	ljmp   $0xb866,$0x10c4b8

0000c4b8 <protcseg>:
  movw    $(1*8) , %ax
    c4b8:	66 b8 08 00          	mov    $0x8,%ax
  movw    %ax, %ds                # -> DS: Data Segment  //vip
    c4bc:	8e d8                	mov    %eax,%ds
  movw    %ax, %es                # -> ES: Extra Segment
    c4be:	8e c0                	mov    %eax,%es
  movw    %ax, %fs                # -> FS
    c4c0:	8e e0                	mov    %eax,%fs
  movw    %ax, %gs                # -> GS
    c4c2:	8e e8                	mov    %eax,%gs
  movw    %ax, %ss                # -> SS: Stack Segment
    c4c4:	8e d0                	mov    %eax,%ss
  movl    $0x3fffff, %esp
    c4c6:	bc ff ff 3f 00       	mov    $0x3fffff,%esp

0000c4cb <ccode>:
  movl $main, %esi
    c4cb:	be 58 c5 00 00       	mov    $0xc558,%esi
  movl $BOTPAK  , %edi
    c4d0:	bf 00 00 28 00       	mov    $0x280000,%edi
  movl $(512*1024/4),%ecx
    c4d5:	b9 00 00 02 00       	mov    $0x20000,%ecx
  call memcpy
    c4da:	e8 41 00 00 00       	call   c520 <memcpy>

0000c4df <bootsector>:
  movl $0x7c00, %esi
    c4df:	be 00 7c 00 00       	mov    $0x7c00,%esi
  movl $DSKCAC , %edi  # DSKCAC=0x00100000 把bootsector的内容复制到0x100000地址处
    c4e4:	bf 00 00 10 00       	mov    $0x100000,%edi
  movl $(512/4),%ecx
    c4e9:	b9 80 00 00 00       	mov    $0x80,%ecx
  call memcpy
    c4ee:	e8 2d 00 00 00       	call   c520 <memcpy>

0000c4f3 <all>:
  movl $(DSKCAC0+512), %esi
    c4f3:	be 00 82 00 00       	mov    $0x8200,%esi
  movl $(DSKCAC+512) , %edi  
    c4f8:	bf 00 02 10 00       	mov    $0x100200,%edi
  movl $0,%ecx
    c4fd:	b9 00 00 00 00       	mov    $0x0,%ecx
  movb (CYLS),%cl
    c502:	8a 0d f0 0f 00 00    	mov    0xff0,%cl
  imul $(512*18*2/4) , %ecx
    c508:	69 c9 00 12 00 00    	imul   $0x1200,%ecx,%ecx
  subl  $(512/4),       %ecx
    c50e:	81 e9 80 00 00 00    	sub    $0x80,%ecx
  call memcpy
    c514:	e8 07 00 00 00       	call   c520 <memcpy>
 ljmp  $(3*8), $0x0000
    c519:	ea 00 00 00 00 18 00 	ljmp   $0x18,$0x0

0000c520 <memcpy>:
  movl  (%esi),%eax
    c520:	8b 06                	mov    (%esi),%eax
  addl  $4    ,%esi
    c522:	83 c6 04             	add    $0x4,%esi
  movl  %eax ,(%edi)
    c525:	89 07                	mov    %eax,(%edi)
  addl   $4    ,%edi
    c527:	83 c7 04             	add    $0x4,%edi
  subl   $1    ,%ecx
    c52a:	83 e9 01             	sub    $0x1,%ecx
  jnz    memcpy
    c52d:	75 f1                	jne    c520 <memcpy>
  ret
    c52f:	c3                   	ret    

0000c530 <gdt>:
	...
    c538:	ff                   	(bad)  
    c539:	ff 00                	incl   (%eax)
    c53b:	00 00                	add    %al,(%eax)
    c53d:	92                   	xchg   %eax,%edx
    c53e:	cf                   	iret   
    c53f:	00 ff                	add    %bh,%bh
    c541:	ff 00                	incl   (%eax)
    c543:	00 00                	add    %al,(%eax)
    c545:	9a 47 00 ff ff 00 00 	lcall  $0x0,$0xffff0047
    c54c:	28 9a 47 00 00 00    	sub    %bl,0x47(%edx)

0000c552 <gdtdesc>:
    c552:	1f                   	pop    %ds
    c553:	00 30                	add    %dh,(%eax)
    c555:	c5 00                	lds    (%eax),%eax
	...

Disassembly of section .stab:

00000000 <.stab>:
   0:	01 00                	add    %eax,(%eax)
   2:	00 00                	add    %al,(%eax)
   4:	00 00                	add    %al,(%eax)
   6:	52                   	push   %edx
   7:	00 19                	add    %bl,(%ecx)
   9:	00 00                	add    %al,(%eax)
   b:	00 01                	add    %al,(%ecx)
   d:	00 00                	add    %al,(%eax)
   f:	00 64 00 00          	add    %ah,0x0(%eax,%eax,1)
  13:	00 00                	add    %al,(%eax)
  15:	c4 00                	les    (%eax),%eax
  17:	00 11                	add    %dl,(%ecx)
  19:	00 00                	add    %al,(%eax)
  1b:	00 84 00 00 00 00 c4 	add    %al,-0x3c000000(%eax,%eax,1)
  22:	00 00                	add    %al,(%eax)
  24:	00 00                	add    %al,(%eax)
  26:	00 00                	add    %al,(%eax)
  28:	44                   	inc    %esp
  29:	00 1a                	add    %bl,(%edx)
  2b:	00 00                	add    %al,(%eax)
  2d:	c4 00                	les    (%eax),%eax
  2f:	00 00                	add    %al,(%eax)
  31:	00 00                	add    %al,(%eax)
  33:	00 44 00 24          	add    %al,0x24(%eax,%eax,1)
  37:	00 2f                	add    %ch,(%edi)
  39:	c4 00                	les    (%eax),%eax
  3b:	00 00                	add    %al,(%eax)
  3d:	00 00                	add    %al,(%eax)
  3f:	00 44 00 25          	add    %al,0x25(%eax,%eax,1)
  43:	00 31                	add    %dh,(%ecx)
  45:	c4 00                	les    (%eax),%eax
  47:	00 00                	add    %al,(%eax)
  49:	00 00                	add    %al,(%eax)
  4b:	00 44 00 26          	add    %al,0x26(%eax,%eax,1)
  4f:	00 34 c4             	add    %dh,(%esp,%eax,8)
  52:	00 00                	add    %al,(%eax)
  54:	00 00                	add    %al,(%eax)
  56:	00 00                	add    %al,(%eax)
  58:	44                   	inc    %esp
  59:	00 27                	add    %ah,(%edi)
  5b:	00 36                	add    %dh,(%esi)
  5d:	c4 00                	les    (%eax),%eax
  5f:	00 00                	add    %al,(%eax)
  61:	00 00                	add    %al,(%eax)
  63:	00 44 00 28          	add    %al,0x28(%eax,%eax,1)
  67:	00 38                	add    %bh,(%eax)
  69:	c4 00                	les    (%eax),%eax
  6b:	00 00                	add    %al,(%eax)
  6d:	00 00                	add    %al,(%eax)
  6f:	00 44 00 29          	add    %al,0x29(%eax,%eax,1)
  73:	00 3a                	add    %bh,(%edx)
  75:	c4 00                	les    (%eax),%eax
  77:	00 00                	add    %al,(%eax)
  79:	00 00                	add    %al,(%eax)
  7b:	00 44 00 2a          	add    %al,0x2a(%eax,%eax,1)
  7f:	00 3d c4 00 00 00    	add    %bh,0xc4
  85:	00 00                	add    %al,(%eax)
  87:	00 44 00 2b          	add    %al,0x2b(%eax,%eax,1)
  8b:	00 3f                	add    %bh,(%edi)
  8d:	c4 00                	les    (%eax),%eax
  8f:	00 00                	add    %al,(%eax)
  91:	00 00                	add    %al,(%eax)
  93:	00 44 00 2d          	add    %al,0x2d(%eax,%eax,1)
  97:	00 41 c4             	add    %al,-0x3c(%ecx)
  9a:	00 00                	add    %al,(%eax)
  9c:	00 00                	add    %al,(%eax)
  9e:	00 00                	add    %al,(%eax)
  a0:	44                   	inc    %esp
  a1:	00 30                	add    %dh,(%eax)
  a3:	00 42 c4             	add    %al,-0x3c(%edx)
  a6:	00 00                	add    %al,(%eax)
  a8:	00 00                	add    %al,(%eax)
  aa:	00 00                	add    %al,(%eax)
  ac:	44                   	inc    %esp
  ad:	00 31                	add    %dh,(%ecx)
  af:	00 44 c4 00          	add    %al,0x0(%esp,%eax,8)
  b3:	00 00                	add    %al,(%eax)
  b5:	00 00                	add    %al,(%eax)
  b7:	00 44 00 32          	add    %al,0x32(%eax,%eax,1)
  bb:	00 46 c4             	add    %al,-0x3c(%esi)
  be:	00 00                	add    %al,(%eax)
  c0:	00 00                	add    %al,(%eax)
  c2:	00 00                	add    %al,(%eax)
  c4:	44                   	inc    %esp
  c5:	00 33                	add    %dh,(%ebx)
  c7:	00 48 c4             	add    %cl,-0x3c(%eax)
  ca:	00 00                	add    %al,(%eax)
  cc:	00 00                	add    %al,(%eax)
  ce:	00 00                	add    %al,(%eax)
  d0:	44                   	inc    %esp
  d1:	00 36                	add    %dh,(%esi)
  d3:	00 4a c4             	add    %cl,-0x3c(%edx)
  d6:	00 00                	add    %al,(%eax)
  d8:	00 00                	add    %al,(%eax)
  da:	00 00                	add    %al,(%eax)
  dc:	44                   	inc    %esp
  dd:	00 37                	add    %dh,(%edi)
  df:	00 4c c4 00          	add    %cl,0x0(%esp,%eax,8)
  e3:	00 00                	add    %al,(%eax)
  e5:	00 00                	add    %al,(%eax)
  e7:	00 44 00 38          	add    %al,0x38(%eax,%eax,1)
  eb:	00 4e c4             	add    %cl,-0x3c(%esi)
  ee:	00 00                	add    %al,(%eax)
  f0:	00 00                	add    %al,(%eax)
  f2:	00 00                	add    %al,(%eax)
  f4:	44                   	inc    %esp
  f5:	00 3a                	add    %bh,(%edx)
  f7:	00 50 c4             	add    %dl,-0x3c(%eax)
  fa:	00 00                	add    %al,(%eax)
  fc:	00 00                	add    %al,(%eax)
  fe:	00 00                	add    %al,(%eax)
 100:	44                   	inc    %esp
 101:	00 3b                	add    %bh,(%ebx)
 103:	00 55 c4             	add    %dl,-0x3c(%ebp)
 106:	00 00                	add    %al,(%eax)
 108:	00 00                	add    %al,(%eax)
 10a:	00 00                	add    %al,(%eax)
 10c:	44                   	inc    %esp
 10d:	00 3c 00             	add    %bh,(%eax,%eax,1)
 110:	5a                   	pop    %edx
 111:	c4 00                	les    (%eax),%eax
 113:	00 00                	add    %al,(%eax)
 115:	00 00                	add    %al,(%eax)
 117:	00 44 00 3d          	add    %al,0x3d(%eax,%eax,1)
 11b:	00 60 c4             	add    %ah,-0x3c(%eax)
 11e:	00 00                	add    %al,(%eax)
 120:	00 00                	add    %al,(%eax)
 122:	00 00                	add    %al,(%eax)
 124:	44                   	inc    %esp
 125:	00 3e                	add    %bh,(%esi)
 127:	00 66 c4             	add    %ah,-0x3c(%esi)
 12a:	00 00                	add    %al,(%eax)
 12c:	00 00                	add    %al,(%eax)
 12e:	00 00                	add    %al,(%eax)
 130:	44                   	inc    %esp
 131:	00 41 00             	add    %al,0x0(%ecx)
 134:	6f                   	outsl  %ds:(%esi),(%dx)
 135:	c4 00                	les    (%eax),%eax
 137:	00 00                	add    %al,(%eax)
 139:	00 00                	add    %al,(%eax)
 13b:	00 44 00 42          	add    %al,0x42(%eax,%eax,1)
 13f:	00 71 c4             	add    %dh,-0x3c(%ecx)
 142:	00 00                	add    %al,(%eax)
 144:	00 00                	add    %al,(%eax)
 146:	00 00                	add    %al,(%eax)
 148:	44                   	inc    %esp
 149:	00 43 00             	add    %al,0x0(%ebx)
 14c:	73 c4                	jae    112 <CR0_PE_ON+0x111>
 14e:	00 00                	add    %al,(%eax)
 150:	00 00                	add    %al,(%eax)
 152:	00 00                	add    %al,(%eax)
 154:	44                   	inc    %esp
 155:	00 45 00             	add    %al,0x0(%ebp)
 158:	76 c4                	jbe    11e <CR0_PE_ON+0x11d>
 15a:	00 00                	add    %al,(%eax)
 15c:	00 00                	add    %al,(%eax)
 15e:	00 00                	add    %al,(%eax)
 160:	44                   	inc    %esp
 161:	00 46 00             	add    %al,0x0(%esi)
 164:	79 c4                	jns    12a <CR0_PE_ON+0x129>
 166:	00 00                	add    %al,(%eax)
 168:	00 00                	add    %al,(%eax)
 16a:	00 00                	add    %al,(%eax)
 16c:	44                   	inc    %esp
 16d:	00 4a 00             	add    %cl,0x0(%edx)
 170:	7c c4                	jl     136 <CR0_PE_ON+0x135>
 172:	00 00                	add    %al,(%eax)
 174:	00 00                	add    %al,(%eax)
 176:	00 00                	add    %al,(%eax)
 178:	44                   	inc    %esp
 179:	00 4b 00             	add    %cl,0x0(%ebx)
 17c:	7e c4                	jle    142 <CR0_PE_ON+0x141>
 17e:	00 00                	add    %al,(%eax)
 180:	00 00                	add    %al,(%eax)
 182:	00 00                	add    %al,(%eax)
 184:	44                   	inc    %esp
 185:	00 4c 00 80          	add    %cl,-0x80(%eax,%eax,1)
 189:	c4 00                	les    (%eax),%eax
 18b:	00 00                	add    %al,(%eax)
 18d:	00 00                	add    %al,(%eax)
 18f:	00 44 00 4d          	add    %al,0x4d(%eax,%eax,1)
 193:	00 81 c4 00 00 00    	add    %al,0xc4(%ecx)
 199:	00 00                	add    %al,(%eax)
 19b:	00 44 00 4f          	add    %al,0x4f(%eax,%eax,1)
 19f:	00 83 c4 00 00 00    	add    %al,0xc4(%ebx)
 1a5:	00 00                	add    %al,(%eax)
 1a7:	00 44 00 57          	add    %al,0x57(%eax,%eax,1)
 1ab:	00 84 c4 00 00 00 00 	add    %al,0x0(%esp,%eax,8)
 1b2:	00 00                	add    %al,(%eax)
 1b4:	44                   	inc    %esp
 1b5:	00 58 00             	add    %bl,0x0(%eax)
 1b8:	86 c4                	xchg   %al,%ah
 1ba:	00 00                	add    %al,(%eax)
 1bc:	00 00                	add    %al,(%eax)
 1be:	00 00                	add    %al,(%eax)
 1c0:	44                   	inc    %esp
 1c1:	00 59 00             	add    %bl,0x0(%ecx)
 1c4:	88 c4                	mov    %al,%ah
 1c6:	00 00                	add    %al,(%eax)
 1c8:	00 00                	add    %al,(%eax)
 1ca:	00 00                	add    %al,(%eax)
 1cc:	44                   	inc    %esp
 1cd:	00 5b 00             	add    %bl,0x0(%ebx)
 1d0:	8a c4                	mov    %ah,%al
 1d2:	00 00                	add    %al,(%eax)
 1d4:	00 00                	add    %al,(%eax)
 1d6:	00 00                	add    %al,(%eax)
 1d8:	44                   	inc    %esp
 1d9:	00 5c 00 8c          	add    %bl,-0x74(%eax,%eax,1)
 1dd:	c4 00                	les    (%eax),%eax
 1df:	00 00                	add    %al,(%eax)
 1e1:	00 00                	add    %al,(%eax)
 1e3:	00 44 00 5e          	add    %al,0x5e(%eax,%eax,1)
 1e7:	00 8e c4 00 00 00    	add    %cl,0xc4(%esi)
 1ed:	00 00                	add    %al,(%eax)
 1ef:	00 44 00 5f          	add    %al,0x5f(%eax,%eax,1)
 1f3:	00 90 c4 00 00 00    	add    %dl,0xc4(%eax)
 1f9:	00 00                	add    %al,(%eax)
 1fb:	00 44 00 60          	add    %al,0x60(%eax,%eax,1)
 1ff:	00 92 c4 00 00 00    	add    %dl,0xc4(%edx)
 205:	00 00                	add    %al,(%eax)
 207:	00 44 00 62          	add    %al,0x62(%eax,%eax,1)
 20b:	00 94 c4 00 00 00 00 	add    %dl,0x0(%esp,%eax,8)
 212:	00 00                	add    %al,(%eax)
 214:	44                   	inc    %esp
 215:	00 63 00             	add    %ah,0x0(%ebx)
 218:	96                   	xchg   %eax,%esi
 219:	c4 00                	les    (%eax),%eax
 21b:	00 00                	add    %al,(%eax)
 21d:	00 00                	add    %al,(%eax)
 21f:	00 44 00 69          	add    %al,0x69(%eax,%eax,1)
 223:	00 98 c4 00 00 00    	add    %bl,0xc4(%eax)
 229:	00 00                	add    %al,(%eax)
 22b:	00 44 00 6a          	add    %al,0x6a(%eax,%eax,1)
 22f:	00 9b c4 00 00 00    	add    %bl,0xc4(%ebx)
 235:	00 00                	add    %al,(%eax)
 237:	00 44 00 6d          	add    %al,0x6d(%eax,%eax,1)
 23b:	00 9e c4 00 00 00    	add    %bl,0xc4(%esi)
 241:	00 00                	add    %al,(%eax)
 243:	00 44 00 6e          	add    %al,0x6e(%eax,%eax,1)
 247:	00 a3 c4 00 00 00    	add    %ah,0xc4(%ebx)
 24d:	00 00                	add    %al,(%eax)
 24f:	00 44 00 6f          	add    %al,0x6f(%eax,%eax,1)
 253:	00 a6 c4 00 00 00    	add    %ah,0xc4(%esi)
 259:	00 00                	add    %al,(%eax)
 25b:	00 44 00 70          	add    %al,0x70(%eax,%eax,1)
 25f:	00 ac c4 00 00 00 00 	add    %ch,0x0(%esp,%eax,8)
 266:	00 00                	add    %al,(%eax)
 268:	44                   	inc    %esp
 269:	00 71 00             	add    %dh,0x0(%ecx)
 26c:	b0 c4                	mov    $0xc4,%al
 26e:	00 00                	add    %al,(%eax)
 270:	00 00                	add    %al,(%eax)
 272:	00 00                	add    %al,(%eax)
 274:	44                   	inc    %esp
 275:	00 78 00             	add    %bh,0x0(%eax)
 278:	b3 c4                	mov    $0xc4,%bl
 27a:	00 00                	add    %al,(%eax)
 27c:	00 00                	add    %al,(%eax)
 27e:	00 00                	add    %al,(%eax)
 280:	44                   	inc    %esp
 281:	00 81 00 b8 c4 00    	add    %al,0xc4b800(%ecx)
 287:	00 00                	add    %al,(%eax)
 289:	00 00                	add    %al,(%eax)
 28b:	00 44 00 82          	add    %al,-0x7e(%eax,%eax,1)
 28f:	00 bc c4 00 00 00 00 	add    %bh,0x0(%esp,%eax,8)
 296:	00 00                	add    %al,(%eax)
 298:	44                   	inc    %esp
 299:	00 83 00 be c4 00    	add    %al,0xc4be00(%ebx)
 29f:	00 00                	add    %al,(%eax)
 2a1:	00 00                	add    %al,(%eax)
 2a3:	00 44 00 84          	add    %al,-0x7c(%eax,%eax,1)
 2a7:	00 c0                	add    %al,%al
 2a9:	c4 00                	les    (%eax),%eax
 2ab:	00 00                	add    %al,(%eax)
 2ad:	00 00                	add    %al,(%eax)
 2af:	00 44 00 85          	add    %al,-0x7b(%eax,%eax,1)
 2b3:	00 c2                	add    %al,%dl
 2b5:	c4 00                	les    (%eax),%eax
 2b7:	00 00                	add    %al,(%eax)
 2b9:	00 00                	add    %al,(%eax)
 2bb:	00 44 00 86          	add    %al,-0x7a(%eax,%eax,1)
 2bf:	00 c4                	add    %al,%ah
 2c1:	c4 00                	les    (%eax),%eax
 2c3:	00 00                	add    %al,(%eax)
 2c5:	00 00                	add    %al,(%eax)
 2c7:	00 44 00 8a          	add    %al,-0x76(%eax,%eax,1)
 2cb:	00 c6                	add    %al,%dh
 2cd:	c4 00                	les    (%eax),%eax
 2cf:	00 00                	add    %al,(%eax)
 2d1:	00 00                	add    %al,(%eax)
 2d3:	00 44 00 90          	add    %al,-0x70(%eax,%eax,1)
 2d7:	00 cb                	add    %cl,%bl
 2d9:	c4 00                	les    (%eax),%eax
 2db:	00 00                	add    %al,(%eax)
 2dd:	00 00                	add    %al,(%eax)
 2df:	00 44 00 91          	add    %al,-0x6f(%eax,%eax,1)
 2e3:	00 d0                	add    %dl,%al
 2e5:	c4 00                	les    (%eax),%eax
 2e7:	00 00                	add    %al,(%eax)
 2e9:	00 00                	add    %al,(%eax)
 2eb:	00 44 00 92          	add    %al,-0x6e(%eax,%eax,1)
 2ef:	00 d5                	add    %dl,%ch
 2f1:	c4 00                	les    (%eax),%eax
 2f3:	00 00                	add    %al,(%eax)
 2f5:	00 00                	add    %al,(%eax)
 2f7:	00 44 00 93          	add    %al,-0x6d(%eax,%eax,1)
 2fb:	00 da                	add    %bl,%dl
 2fd:	c4 00                	les    (%eax),%eax
 2ff:	00 00                	add    %al,(%eax)
 301:	00 00                	add    %al,(%eax)
 303:	00 44 00 97          	add    %al,-0x69(%eax,%eax,1)
 307:	00 df                	add    %bl,%bh
 309:	c4 00                	les    (%eax),%eax
 30b:	00 00                	add    %al,(%eax)
 30d:	00 00                	add    %al,(%eax)
 30f:	00 44 00 98          	add    %al,-0x68(%eax,%eax,1)
 313:	00 e4                	add    %ah,%ah
 315:	c4 00                	les    (%eax),%eax
 317:	00 00                	add    %al,(%eax)
 319:	00 00                	add    %al,(%eax)
 31b:	00 44 00 99          	add    %al,-0x67(%eax,%eax,1)
 31f:	00 e9                	add    %ch,%cl
 321:	c4 00                	les    (%eax),%eax
 323:	00 00                	add    %al,(%eax)
 325:	00 00                	add    %al,(%eax)
 327:	00 44 00 9a          	add    %al,-0x66(%eax,%eax,1)
 32b:	00 ee                	add    %ch,%dh
 32d:	c4 00                	les    (%eax),%eax
 32f:	00 00                	add    %al,(%eax)
 331:	00 00                	add    %al,(%eax)
 333:	00 44 00 9d          	add    %al,-0x63(%eax,%eax,1)
 337:	00 f3                	add    %dh,%bl
 339:	c4 00                	les    (%eax),%eax
 33b:	00 00                	add    %al,(%eax)
 33d:	00 00                	add    %al,(%eax)
 33f:	00 44 00 9e          	add    %al,-0x62(%eax,%eax,1)
 343:	00 f8                	add    %bh,%al
 345:	c4 00                	les    (%eax),%eax
 347:	00 00                	add    %al,(%eax)
 349:	00 00                	add    %al,(%eax)
 34b:	00 44 00 9f          	add    %al,-0x61(%eax,%eax,1)
 34f:	00 fd                	add    %bh,%ch
 351:	c4 00                	les    (%eax),%eax
 353:	00 00                	add    %al,(%eax)
 355:	00 00                	add    %al,(%eax)
 357:	00 44 00 a0          	add    %al,-0x60(%eax,%eax,1)
 35b:	00 02                	add    %al,(%edx)
 35d:	c5 00                	lds    (%eax),%eax
 35f:	00 00                	add    %al,(%eax)
 361:	00 00                	add    %al,(%eax)
 363:	00 44 00 a1          	add    %al,-0x5f(%eax,%eax,1)
 367:	00 08                	add    %cl,(%eax)
 369:	c5 00                	lds    (%eax),%eax
 36b:	00 00                	add    %al,(%eax)
 36d:	00 00                	add    %al,(%eax)
 36f:	00 44 00 a2          	add    %al,-0x5e(%eax,%eax,1)
 373:	00 0e                	add    %cl,(%esi)
 375:	c5 00                	lds    (%eax),%eax
 377:	00 00                	add    %al,(%eax)
 379:	00 00                	add    %al,(%eax)
 37b:	00 44 00 a3          	add    %al,-0x5d(%eax,%eax,1)
 37f:	00 14 c5 00 00 00 00 	add    %dl,0x0(,%eax,8)
 386:	00 00                	add    %al,(%eax)
 388:	44                   	inc    %esp
 389:	00 b3 00 19 c5 00    	add    %dh,0xc51900(%ebx)
 38f:	00 00                	add    %al,(%eax)
 391:	00 00                	add    %al,(%eax)
 393:	00 44 00 b8          	add    %al,-0x48(%eax,%eax,1)
 397:	00 20                	add    %ah,(%eax)
 399:	c5 00                	lds    (%eax),%eax
 39b:	00 00                	add    %al,(%eax)
 39d:	00 00                	add    %al,(%eax)
 39f:	00 44 00 b9          	add    %al,-0x47(%eax,%eax,1)
 3a3:	00 22                	add    %ah,(%edx)
 3a5:	c5 00                	lds    (%eax),%eax
 3a7:	00 00                	add    %al,(%eax)
 3a9:	00 00                	add    %al,(%eax)
 3ab:	00 44 00 ba          	add    %al,-0x46(%eax,%eax,1)
 3af:	00 25 c5 00 00 00    	add    %ah,0xc5
 3b5:	00 00                	add    %al,(%eax)
 3b7:	00 44 00 bb          	add    %al,-0x45(%eax,%eax,1)
 3bb:	00 27                	add    %ah,(%edi)
 3bd:	c5 00                	lds    (%eax),%eax
 3bf:	00 00                	add    %al,(%eax)
 3c1:	00 00                	add    %al,(%eax)
 3c3:	00 44 00 bc          	add    %al,-0x44(%eax,%eax,1)
 3c7:	00 2a                	add    %ch,(%edx)
 3c9:	c5 00                	lds    (%eax),%eax
 3cb:	00 00                	add    %al,(%eax)
 3cd:	00 00                	add    %al,(%eax)
 3cf:	00 44 00 bd          	add    %al,-0x43(%eax,%eax,1)
 3d3:	00 2d c5 00 00 00    	add    %ch,0xc5
 3d9:	00 00                	add    %al,(%eax)
 3db:	00 44 00 be          	add    %al,-0x42(%eax,%eax,1)
 3df:	00 2f                	add    %ch,(%edi)
 3e1:	c5 00                	lds    (%eax),%eax
	...

Disassembly of section .stabstr:

00000000 <.stabstr>:
   0:	00 2f                	add    %ch,(%edi)
   2:	74 6d                	je     71 <CR0_PE_ON+0x70>
   4:	70 2f                	jo     35 <CR0_PE_ON+0x34>
   6:	63 63 37             	arpl   %sp,0x37(%ebx)
   9:	4f                   	dec    %edi
   a:	42                   	inc    %edx
   b:	65 6f                	outsl  %gs:(%esi),(%dx)
   d:	6e                   	outsb  %ds:(%esi),(%dx)
   e:	2e 73 00             	jae,pn 11 <CR0_PE_ON+0x10>
  11:	65 6e                	outsb  %gs:(%esi),(%dx)
  13:	74 72                	je     87 <CR0_PE_ON+0x86>
  15:	79 2e                	jns    45 <CR0_PE_ON+0x44>
  17:	53                   	push   %ebx
	...
