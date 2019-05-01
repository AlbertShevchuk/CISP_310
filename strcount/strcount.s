.data
string:
.=. + 256 # this area is not initialized, do not count on the null terminator to be initialized here
kchar: .byte 0
.text
.global _start
_start:

movl $string,%eax
movb kchar,%ebx
movl $0,%ecx
L1:
movb (%eax),%dl
cmp %bl,%dl
jz L3
L2:
addb $1,%eax
cmp  $0 ,%dl
jnz L1
jmp L4
L3:
addb $1, %ecx
jmp L2
L4:

checkHere:
  # ecx should have the number of characters in the null terminated string matching the character in bl
  # note that reversed should start at the label reversed
  movl $1,%eax
  movl $0,%ebx
  int $0x80
