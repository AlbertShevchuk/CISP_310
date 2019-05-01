b 3
r
restore test.0 binary &string
set var *((char*)&kchar) = 'i'
b 30
c
print $ecx

