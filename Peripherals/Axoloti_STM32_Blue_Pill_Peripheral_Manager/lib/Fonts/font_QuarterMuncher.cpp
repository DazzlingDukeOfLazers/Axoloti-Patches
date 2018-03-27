/*
font_QuarterMuncher.h
Modified from font "Press Start" and converted into lightweight bytecode
for use in microcontrollers with pixel displays; originally for the
Believotron / Axoloti Synthesizer system by Dazzling Duke of Lazers.

Font file modifications are under the original SIL Open Font License (Below)

Herstory:
    2017-06-02 DDL
        Changed font name from press_play to QuarterMuncher to comply with
        license "No Modified Version of the Font Software may use the Reserved Font
        Name(s) unless explicit written permission is granted by the corresponding
        Copyright Holder. This restriction only applies to the primary font name as
        presented to the users." Press_Play is similar enough to be confusable.

*/


/* Copyright (c) 2011; Cody "CodeMan38" Boisclair (cody@zone38.net);
with Reserved Font Name "Press Start".

This Font Software is licensed under the SIL Open Font License; Version 1.1.
This license is copied below; and is also available with a FAQ at:
http://scripts.sil.org/OFL


-----------------------------------------------------------
SIL OPEN FONT LICENSE Version 1.1 - 26 February 2007
-----------------------------------------------------------

PREAMBLE
The goals of the Open Font License (OFL) are to stimulate worldwide
development of collaborative font projects; to support the font creation
efforts of academic and linguistic communities; and to provide a free and
open framework in which fonts may be shared and improved in partnership
with others.

The OFL allows the licensed fonts to be used; studied; modified and
redistributed freely as long as they are not sold by themselves. The
fonts; including any derivative works; can be bundled; embedded;
redistributed and/or sold with any software provided that any reserved
names are not used by derivative works. The fonts and derivatives;
however; cannot be released under any other type of license. The
requirement for fonts to remain under this license does not apply
to any document created using the fonts or their derivatives.

DEFINITIONS
"Font Software" refers to the set of files released by the Copyright
Holder(s) under this license and clearly marked as such. This may
include source files; build scripts and documentation.

"Reserved Font Name" refers to any names specified as such after the
copyright statement(s).

"Original Version" refers to the collection of Font Software components as
distributed by the Copyright Holder(s).

"Modified Version" refers to any derivative made by adding to; deleting;
or substituting -- in part or in whole -- any of the components of the
Original Version; by changing formats or by porting the Font Software to a
new environment.

"Author" refers to any designer; engineer; programmer; technical
writer or other person who contributed to the Font Software.

PERMISSION & CONDITIONS
Permission is hereby granted; free of charge; to any person obtaining
a copy of the Font Software; to use; study; copy; merge; embed; modify;
redistribute; and sell modified and unmodified copies of the Font
Software; subject to the following conditions:

1) Neither the Font Software nor any of its individual components;
in Original or Modified Versions; may be sold by itself.

2) Original or Modified Versions of the Font Software may be bundled;
redistributed and/or sold with any software; provided that each copy
contains the above copyright notice and this license. These can be
included either as stand-alone text files; human-readable headers or
in the appropriate machine-readable metadata fields within text or
binary files as long as those fields can be easily viewed by the user.

3) No Modified Version of the Font Software may use the Reserved Font
Name(s) unless explicit written permission is granted by the corresponding
Copyright Holder. This restriction only applies to the primary font name as
presented to the users.

4) The name(s) of the Copyright Holder(s) or the Author(s) of the Font
Software shall not be used to promote; endorse or advertise any
Modified Version; except to acknowledge the contribution(s) of the
Copyright Holder(s) and the Author(s) or with their explicit written
permission.

5) The Font Software; modified or unmodified; in part or in whole;
must be distributed entirely under this license; and must not be
distributed under any other license. The requirement for fonts to
remain under this license does not apply to any document created
using the Font Software.

TERMINATION
This license becomes null and void if any of the above conditions are
not met.

DISCLAIMER
THE FONT SOFTWARE IS PROVIDED "AS IS"; WITHOUT WARRANTY OF ANY KIND;
EXPRESS OR IMPLIED; INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OF
MERCHANTABILITY; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT
OF COPYRIGHT; PATENT; TRADEMARK; OR OTHER RIGHT. IN NO EVENT SHALL THE
COPYRIGHT HOLDER BE LIABLE FOR ANY CLAIM; DAMAGES OR OTHER LIABILITY;
INCLUDING ANY GENERAL; SPECIAL; INDIRECT; INCIDENTAL; OR CONSEQUENTIAL
DAMAGES; WHETHER IN AN ACTION OF CONTRACT; TORT OR OTHERWISE; ARISING
FROM; OUT OF THE USE OR INABILITY TO USE THE FONT SOFTWARE OR FROM
OTHER DEALINGS IN THE FONT SOFTWARE.
*/

// TBD; refactor
// TBD; refactor
// #ifndef uint8_t
// #define uint8_t char
// #endif
#include <stdint.h>
#include <font_QuarterMuncher.h>
uint8_t font_QuarterMuncher[256][8];


// TBD; I think this is 9 bc I had an extra line in there somewhere.
// Remove and test
void InitFontQuarterMuncher(){
    uint8_t iCharacter=0;
    uint8_t iRow = 0;
// A 0065
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01101100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b11000110;
    iCharacter++; iRow = 0;

 // B 0066
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b11111100;
    iCharacter++; iRow = 0;

 // C 0067
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01100110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01100110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00111100;
    iCharacter++; iRow = 0;

 // 0068 D
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11001100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11001100;
    font_QuarterMuncher[iCharacter][iRow]   = 0b11111000;
    iCharacter++; iRow = 0;

 // 0069 E
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b11111110;
    iCharacter++; iRow = 0;

 // 0070 F
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b11000000;
    iCharacter++; iRow = 0;

 // 0071 G
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01100000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11001110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01100110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00111110;
    iCharacter++; iRow = 0;

 // 0072 H
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b11000110;
    iCharacter++; iRow = 0;

 // 0073 I
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b11111111;
    iCharacter++; iRow = 0;

 // 0074 J
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b01111100;
    iCharacter++; iRow = 0;

 // 0075 K
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11001100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11011000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11011100;
    font_QuarterMuncher[iCharacter][iRow]   = 0b11001110;
    iCharacter++; iRow = 0;

 // 0076 L
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b11111110;
    iCharacter++; iRow = 0;

 // 0077 M
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11101110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11010110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b11000110;
    iCharacter++; iRow = 0;

 // 0078 N
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11100110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11110110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11011110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11001110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b11000110;
    iCharacter++; iRow = 0;

 // 0079 O
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b01111100;
    iCharacter++; iRow = 0;

 // 0080 P
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b11000000;
    iCharacter++; iRow = 0;

 // 0081 Q
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11011110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11001100;
    font_QuarterMuncher[iCharacter][iRow]   = 0b01111010;
    iCharacter++; iRow = 0;

 // 0082 R
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11001110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11011100;
    font_QuarterMuncher[iCharacter][iRow]   = 0b11001110;
    iCharacter++; iRow = 0;

 // 0083 S
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11001100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b01111100;
    iCharacter++; iRow = 0;

 // 0084 T
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00111000;
    iCharacter++; iRow = 0;

 // 0085 U
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b01111100;
    iCharacter++; iRow = 0;

 // 0086 V
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11101110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00010000;
    iCharacter++; iRow = 0;

 // 0087 W
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11010110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11101110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b11000110;
    iCharacter++; iRow = 0;

 // 0088 X
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11101110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11101110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b11000110;
    iCharacter++; iRow = 0;

 // 0089 Y
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11001100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11001100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11001100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00110000;
    iCharacter++; iRow = 0;

 // 0090 Z
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00001110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11100000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b11111110;
    iCharacter++; iRow = 0;

 // 0097 a
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111100;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00000000;
    iCharacter++; iRow = 0;

 // 0098 b
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111100;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00000000;
    iCharacter++; iRow = 0;

 // 0099 c
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00000000;
    iCharacter++; iRow = 0;

 // 0100 d
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00000000;
    iCharacter++; iRow = 0;

 // 0101 e
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00000000;
    iCharacter++; iRow = 0;

 // 102 f
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00000000;
    iCharacter++; iRow = 0;

 // 0103 g
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b01111100;
    iCharacter++; iRow = 0;

 // 0104 h
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00000000;
    iCharacter++; iRow = 0;

 // 0105 i
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111100;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00000000;
    iCharacter++; iRow = 0;

 // 0106 j
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b11110000;
    iCharacter++; iRow = 0;

 // 0107 k
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11001110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11011100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11001110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00000000;
    iCharacter++; iRow = 0;

 // 0108 l
    font_QuarterMuncher[iCharacter][iRow++] = 0b01110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111100;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00000000;
    iCharacter++; iRow = 0;

 // 0109 m
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b10110110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b10110110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b10110110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b10110110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00000000;
    iCharacter++; iRow = 0;

 // 0110 n
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00000000;
    iCharacter++; iRow = 0;

 // 0111 o
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111100;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00000000;
    iCharacter++; iRow = 0;

 // 0112 p
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b11000000;
    iCharacter++; iRow = 0;

 // 0113 q
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00000110;
    iCharacter++; iRow = 0;

 // 0114 r
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11011100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11100000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00000000;
    iCharacter++; iRow = 0;

 // 0115 s
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111100;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00000000;
    iCharacter++; iRow = 0;

 // 0116 t
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00000000;
    iCharacter++; iRow = 0;

 // 0117 u
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00000000;
    iCharacter++; iRow = 0;

 // 0118 v
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11001100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11001100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11001100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00000000;
    iCharacter++; iRow = 0;

 // 0119 w
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b10110110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b10110110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b10110110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b10110110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00000000;
    iCharacter++; iRow = 0;

 // 0120 x
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00000000;
    iCharacter++; iRow = 0;

 // 0121 y
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b01111100;
    iCharacter++; iRow = 0;

 // 0122 z
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111111;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00000000;
    iCharacter++; iRow = 0;

 // 0048 0
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01001100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11001110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11011110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11110110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01100100;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00111000;
    iCharacter++; iRow = 0;

 // 0049 1
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b11111100;
    iCharacter++; iRow = 0;

 // 0050 2
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00001110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11100000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b11111110;
    iCharacter++; iRow = 0;

 // 0051 3
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00001100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b01111100;
    iCharacter++; iRow = 0;

 // 0052 4
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01101100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11001100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00001100;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00001100;
    iCharacter++; iRow = 0;

 // 0053 5
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b01111100;
    iCharacter++; iRow = 0;

 // 0054 6
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01100000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b01111100;
    iCharacter++; iRow = 0;

 // 0055 7
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00001100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00110000;
    iCharacter++; iRow = 0;

 // 0058 8
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11100100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b10011110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b10000110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b01111100;
    iCharacter++; iRow = 0;

 // 0057 9
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00001100;
    font_QuarterMuncher[iCharacter][iRow]   = 0b01111000;
    iCharacter++; iRow = 0;

 // 0043 +
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00000000;
    iCharacter++; iRow = 0;

 // 0045 -
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00000000;
    iCharacter++; iRow = 0;

 // 0042 *
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01100110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01100110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00000000;
    iCharacter++; iRow = 0;

 // 0047 /
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000010;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00001000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00010000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00100000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01000000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b10000000;
    iCharacter++; iRow = 0;

 // 0247 ÷
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00000000;
    iCharacter++; iRow = 0;

 // 0061 =
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00000000;
    iCharacter++; iRow = 0;

 // 0037 %
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01100010;
    font_QuarterMuncher[iCharacter][iRow++] = 0b10100100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11001000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00001000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00100110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01001010;
    font_QuarterMuncher[iCharacter][iRow]   = 0b10001100;
    iCharacter++; iRow = 0;

 // 0034 "
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11001110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11101110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01100110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01000100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00000000;
    iCharacter++; iRow = 0;

 // 0039 '
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00010000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00000000;
    iCharacter++; iRow = 0;

 // 0035 #
    font_QuarterMuncher[iCharacter][iRow++] = 0b01100110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01100110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01100110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b01100110;
    iCharacter++; iRow = 0;

 // 0036 @
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b10000010;
    font_QuarterMuncher[iCharacter][iRow++] = 0b10111010;
    font_QuarterMuncher[iCharacter][iRow++] = 0b10101010;
    font_QuarterMuncher[iCharacter][iRow++] = 0b10111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b10000000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b01111100;
    iCharacter++; iRow = 0;

 // 0037 &
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11011000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11011000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11011010;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11001100;
    font_QuarterMuncher[iCharacter][iRow]   = 0b01111110;
    iCharacter++; iRow = 0;

 // 0095 _
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b11111110;
    iCharacter++; iRow = 0;

 // 0040 (
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00001100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00001100;
    iCharacter++; iRow = 0;

 // 0041 )
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00001100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00001100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00001100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00110000;
    iCharacter++; iRow = 0;

 // 0044 ;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011100;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00110000;
    iCharacter++; iRow = 0;

 // 0046 .
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011100;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00000000;
    iCharacter++; iRow = 0;

 // 0059 ;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011100;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00110000;
    iCharacter++; iRow = 0;

 // 0058 :
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011100;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00000000;
    iCharacter++; iRow = 0;

 // 0191 ¿
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01100000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b01111100;
    iCharacter++; iRow = 0;

 // 0063 ?
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00001100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00111000;
    iCharacter++; iRow = 0;

 // 0161 ¡
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00111000;
    iCharacter++; iRow = 0;

 // 0033 !
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00110000;
    iCharacter++; iRow = 0;

 // 0092 Down slash
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00100000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00010000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00001000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000100;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00000010;
    iCharacter++; iRow = 0;

 // 0124 |
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00011000;
    iCharacter++; iRow = 0;

 // 0123
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00001100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00001100;
    iCharacter++; iRow = 0;

 // 0125 }
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00001100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00110000;
    iCharacter++; iRow = 0;

 // 0060 <
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00001100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01100000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00001100;
    iCharacter++; iRow = 0;

 // 0062 >
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01100000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00001100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b01100000;
    iCharacter++; iRow = 0;

 // 0091 [
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00111110;
    iCharacter++; iRow = 0;

 // 0093 ]
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00001100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00001100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00001100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00001100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00001100;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00111100;
    iCharacter++; iRow = 0;

 // 0181 μ
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11001100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11001100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11001100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11110110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b11000000;
    iCharacter++; iRow = 0;

 // 0094 ^
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01100110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00000000;
    iCharacter++; iRow = 0;

 // 0192 À
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00100000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00010000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01101100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b11000110;
    iCharacter++; iRow = 0;

 // 0193 Á
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00001000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00010000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01101100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b11000110;
    iCharacter++; iRow = 0;

 // 0194 Â
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01101100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b11000110;
    iCharacter++; iRow = 0;

 // 0195 Ã
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01110110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11011100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01101100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b11000110;
    iCharacter++; iRow = 0;

 // 0196 Ä
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01101100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01101100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b11000110;
    iCharacter++; iRow = 0;

 // 0197 Å
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01101100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01101100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b11000110;
    iCharacter++; iRow = 0;

 // 0198 Æ
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11011000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11011110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11011000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b11011110;
    iCharacter++; iRow = 0;

 // 0199 ç
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01101100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01100110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00001000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00110000;
    iCharacter++; iRow = 0;

 // 0200 È
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00100000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00010000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b11111110;
    iCharacter++; iRow = 0;

 // 0201 É
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00001000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00010000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b11111110;
    iCharacter++; iRow = 0;

 // 0202 Ê
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00011000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00100100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b11111110;
    iCharacter++; iRow = 0;

 // 0203 Ë
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01100110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b11111110;
    iCharacter++; iRow = 0;

 // 0204 Ì
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00100000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00010000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b11111100;
    iCharacter++; iRow = 0;

 // 205 Í
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00010000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00100000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b11111100;
    iCharacter++; iRow = 0;

 // 206 Î
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01001000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b11111100;
    iCharacter++; iRow = 0;

 // 0207 Ï
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01101100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b11111100;
    iCharacter++; iRow = 0;

 // 0209 Ñ
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01011000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11100110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11110110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11011110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b11001110;
    iCharacter++; iRow = 0;

 // 0210 Ò
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00100000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00010000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b01111100;
    iCharacter++; iRow = 0;

 // 0211 Ó
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00100000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00010000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b01111100;
    iCharacter++; iRow = 0;

 // 0212 Ô
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00010000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00101000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b01111100;
    iCharacter++; iRow = 0;

 // 0213 Õ
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00110100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01011000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b01111100;
    iCharacter++; iRow = 0;

 // 0214 Ö
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00100100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b01111100;
    iCharacter++; iRow = 0;

 // 0216 Ø
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000010;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00111100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01001100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01010100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01100100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b10000000;
    iCharacter++; iRow = 0;

 // 0140 Œ
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11011000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11011000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11011110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11011000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11011000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b01111110;
    iCharacter++; iRow = 0;

 // 0217 Ù
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00010000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00001000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b01111100;
    iCharacter++; iRow = 0;

 // 0218 Ú
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00001000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00010000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b01111100;
    iCharacter++; iRow = 0;

 // 0219 Û
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00010000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00101000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b01111100;
    iCharacter++; iRow = 0;

 // 0220 Ü
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00101000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11000110;
    font_QuarterMuncher[iCharacter][iRow]   = 0b01111100;
    iCharacter++; iRow = 0;

 // 0223 ß
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b01111000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11001100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11001100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11011000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11001100;
    font_QuarterMuncher[iCharacter][iRow++] = 0b11101100;
    font_QuarterMuncher[iCharacter][iRow]   = 0b11011000;
    iCharacter++; iRow = 0;

 // space
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow++] = 0b00000000;
    font_QuarterMuncher[iCharacter][iRow]   = 0b00000000;
    iCharacter++; iRow = 0;

}
