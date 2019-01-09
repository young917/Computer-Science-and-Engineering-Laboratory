**TASK1**


Implement Str_copy, but only allow to copy the specific number of characters.

*hw6_1.inc*

`strSrc BYTE "Assembly homework6",0`

`strDest BYTE 41 dup(0)`

`copyNum BYTE 10`

*NOTE*

1. copyNum variable indicates the number of characters to copy.

---

**TASK2**


Search for the first matching occurrence of a source string inside a target string.

Return the first matching position.

*hw6_2.inc*

`target BYTE "123ABC342432",0`

`source BYTE "ABC",0`

`pos DWORD ?`
