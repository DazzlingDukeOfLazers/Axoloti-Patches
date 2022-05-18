/*
font_QuarterMuncher.h
Modified from font "Press Start" and converted into lightweight bytecode
for use in microcontrollers with pixel displays, originally for the
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


/* Copyright (c) 2011, Cody "CodeMan38" Boisclair (cody@zone38.net),
with Reserved Font Name "Press Start".

This Font Software is licensed under the SIL Open Font License, Version 1.1.
This license is copied below, and is also available with a FAQ at:
http://scripts.sil.org/OFL


-----------------------------------------------------------
SIL OPEN FONT LICENSE Version 1.1 - 26 February 2007
-----------------------------------------------------------

PREAMBLE
The goals of the Open Font License (OFL) are to stimulate worldwide
development of collaborative font projects, to support the font creation
efforts of academic and linguistic communities, and to provide a free and
open framework in which fonts may be shared and improved in partnership
with others.

The OFL allows the licensed fonts to be used, studied, modified and
redistributed freely as long as they are not sold by themselves. The
fonts, including any derivative works, can be bundled, embedded,
redistributed and/or sold with any software provided that any reserved
names are not used by derivative works. The fonts and derivatives,
however, cannot be released under any other type of license. The
requirement for fonts to remain under this license does not apply
to any document created using the fonts or their derivatives.

DEFINITIONS
"Font Software" refers to the set of files released by the Copyright
Holder(s) under this license and clearly marked as such. This may
include source files, build scripts and documentation.

"Reserved Font Name" refers to any names specified as such after the
copyright statement(s).

"Original Version" refers to the collection of Font Software components as
distributed by the Copyright Holder(s).

"Modified Version" refers to any derivative made by adding to, deleting,
or substituting -- in part or in whole -- any of the components of the
Original Version, by changing formats or by porting the Font Software to a
new environment.

"Author" refers to any designer, engineer, programmer, technical
writer or other person who contributed to the Font Software.

PERMISSION & CONDITIONS
Permission is hereby granted, free of charge, to any person obtaining
a copy of the Font Software, to use, study, copy, merge, embed, modify,
redistribute, and sell modified and unmodified copies of the Font
Software, subject to the following conditions:

1) Neither the Font Software nor any of its individual components,
in Original or Modified Versions, may be sold by itself.

2) Original or Modified Versions of the Font Software may be bundled,
redistributed and/or sold with any software, provided that each copy
contains the above copyright notice and this license. These can be
included either as stand-alone text files, human-readable headers or
in the appropriate machine-readable metadata fields within text or
binary files as long as those fields can be easily viewed by the user.

3) No Modified Version of the Font Software may use the Reserved Font
Name(s) unless explicit written permission is granted by the corresponding
Copyright Holder. This restriction only applies to the primary font name as
presented to the users.

4) The name(s) of the Copyright Holder(s) or the Author(s) of the Font
Software shall not be used to promote, endorse or advertise any
Modified Version, except to acknowledge the contribution(s) of the
Copyright Holder(s) and the Author(s) or with their explicit written
permission.

5) The Font Software, modified or unmodified, in part or in whole,
must be distributed entirely under this license, and must not be
distributed under any other license. The requirement for fonts to
remain under this license does not apply to any document created
using the Font Software.

TERMINATION
This license becomes null and void if any of the above conditions are
not met.

DISCLAIMER
THE FONT SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT
OF COPYRIGHT, PATENT, TRADEMARK, OR OTHER RIGHT. IN NO EVENT SHALL THE
COPYRIGHT HOLDER BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
INCLUDING ANY GENERAL, SPECIAL, INDIRECT, INCIDENTAL, OR CONSEQUENTIAL
DAMAGES, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF THE USE OR INABILITY TO USE THE FONT SOFTWARE OR FROM
OTHER DEALINGS IN THE FONT SOFTWARE.
*/

// TBD, I think this is 9 bc I had an extra line in there somewhere.
// Remove and test
uint8_t font_QuarterMuncher[256][9] =
{
    { // A 0065
        0b00000000,
        0b00111000,
        0b01101100,
        0b11000110,
        0b11000110,
        0b11111110,
        0b11000110,
        0b11000110
    },
    { // B 0066
        0b00000000,
        0b11111100,
        0b11000110,
        0b11000110,
        0b11111100,
        0b11000110,
        0b11000110,
        0b11111100
    },
    { // C 0067
        0b00000000,
        0b00111100,
        0b01100110,
        0b11000000,
        0b11000000,
        0b11000000,
        0b01100110,
        0b00111100
    },
    { // 0068 D
        0b00000000,
        0b11111000,
        0b11001100,
        0b11000110,
        0b11000110,
        0b11000110,
        0b11001100,
        0b11111000
    },
    { // 0069 E
        0b00000000,
        0b11111110,
        0b11000000,
        0b11000000,
        0b11111100,
        0b11000000,
        0b11000000,
        0b11111110
    },
    { // 0070 F
        0b00000000,
        0b11111110,
        0b11000000,
        0b11000000,
        0b11111100,
        0b11000000,
        0b11000000,
        0b11000000
    },
    { // 0071 G
        0b00000000,
        0b00111110,
        0b01100000,
        0b11000000,
        0b11001110,
        0b11000110,
        0b01100110,
        0b00111110
    },
    { // 0072 H
        0b00000000,
        0b11000110,
        0b11000110,
        0b11000110,
        0b11111110,
        0b11000110,
        0b11000110,
        0b11000110
    },
    { // 0073 I
        0b00000000,
        0b11111110,
        0b00111000,
        0b00111000,
        0b00111000,
        0b00111000,
        0b00111000,
        0b11111111
    },
    { // 0074 J
        0b00000000,
        0b00000110,
        0b00000110,
        0b00000110,
        0b00000110,
        0b00000110,
        0b11000110,
        0b01111100
    },
    { // 0075 K
        0b00000000,
        0b11000110,
        0b11001100,
        0b11011000,
        0b11110000,
        0b11111000,
        0b11011100,
        0b11001110
    },
    { // 0076 L
        0b00000000,
        0b11000000,
        0b11000000,
        0b11000000,
        0b11000000,
        0b11000000,
        0b11000000,
        0b11111110
    },
    { // 0077 M
        0b00000000,
        0b11000110,
        0b11101110,
        0b11111110,
        0b11111110,
        0b11010110,
        0b11000110,
        0b11000110
    },
    { // 0078 N
        0b00000000,
        0b11000110,
        0b11100110,
        0b11110110,
        0b11111110,
        0b11011110,
        0b11001110,
        0b11000110
    },
    { // 0079 O
        0b00000000,
        0b01111100,
        0b11000110,
        0b11000110,
        0b11000110,
        0b11000110,
        0b11000110,
        0b01111100
    },
    { // 0080 P
        0b00000000,
        0b11111100,
        0b11000110,
        0b11000110,
        0b11000110,
        0b11111100,
        0b11000000,
        0b11000000
    },
    { // 0081 Q
        0b00000000,
        0b01111100,
        0b11000110,
        0b11000110,
        0b11000110,
        0b11011110,
        0b11001100,
        0b01111010
    },
    { // 0082 R
        0b00000000,
        0b11111100,
        0b11000110,
        0b11000110,
        0b11001110,
        0b11111000,
        0b11011100,
        0b11001110
    },
    { // 0083 S
        0b00000000,
        0b01111000,
        0b11001100,
        0b11000000,
        0b01111100,
        0b00000110,
        0b11000110,
        0b01111100
    },
    { // 0084 T
        0b00000000,
        0b11111110,
        0b00111000,
        0b00111000,
        0b00111000,
        0b00111000,
        0b00111000,
        0b00111000
    },
    { // 0085 U
        0b00000000,
        0b11000110,
        0b11000110,
        0b11000110,
        0b11000110,
        0b11000110,
        0b11000110,
        0b01111100
    },
    { // 0086 V
        0b00000000,
        0b11000110,
        0b11000110,
        0b11000110,
        0b11101110,
        0b01111100,
        0b00111000,
        0b00010000
    },
    { // 0087 W
        0b00000000,
        0b11000110,
        0b11000110,
        0b11010110,
        0b11111110,
        0b11111110,
        0b11101110,
        0b11000110
    },
    { // 0088 X
        0b00000000,
        0b11000110,
        0b11101110,
        0b01111100,
        0b00111000,
        0b01111100,
        0b11101110,
        0b11000110
    },
    { // 0089 Y
        0b00000000,
        0b11001100,
        0b11001100,
        0b11001100,
        0b01111000,
        0b00110000,
        0b00110000,
        0b00110000
    },
    { // 0090 Z
        0b00000000,
        0b11111110,
        0b00001110,
        0b00011100,
        0b00111000,
        0b01110000,
        0b11100000,
        0b11111110
    },
    { // 0097 a
        0b00000000,
        0b00000000,
        0b01111100,
        0b00000110,
        0b01111110,
        0b11000110,
        0b01111100,
        0b00000000,
    },
    { // 0098 b
        0b00000000,
        0b11000000,
        0b11111100,
        0b11000110,
        0b11000110,
        0b11000110,
        0b01111100,
        0b00000000
    },
    { // 0099 c
        0b00000000,
        0b00000000,
        0b01111110,
        0b11000000,
        0b11000000,
        0b11000000,
        0b01111110,
        0b00000000
    },
    { // 0100 d
        0b00000110,
        0b00000110,
        0b01111110,
        0b11000110,
        0b11000110,
        0b11000110,
        0b01111110,
        0b00000000
    },
    { // 0101 e
        0b00000000,
        0b00000000,
        0b01111100,
        0b11000110,
        0b11111100,
        0b11000000,
        0b01111110,
        0b00000000
    },
    { // 102 f
        0b00011100,
        0b00110000,
        0b11111100,
        0b00110000,
        0b00110000,
        0b00110000,
        0b00110000,
        0b00000000
    },
    { // 0103 g
        0b00000000,
        0b00000000,
        0b01111110,
        0b11000110,
        0b11000110,
        0b01111110,
        0b00000110,
        0b01111100
    },
    { // 0104 h
        0b11000000,
        0b11000000,
        0b11111100,
        0b11000110,
        0b11000110,
        0b11000110,
        0b11000110,
        0b00000000
    },
    { // 0105 i
        0b00110000,
        0b00000000,
        0b01110000,
        0b00110000,
        0b00110000,
        0b00110000,
        0b11111100,
        0b00000000
    },
    { // 0106 j
        0b00011000,
        0b00000000,
        0b00111000,
        0b00011000,
        0b00011000,
        0b00011000,
        0b00011000,
        0b11110000
    },
    { // 0107 k
        0b11000000,
        0b11000000,
        0b11001110,
        0b11111100,
        0b11111000,
        0b11011100,
        0b11001110,
        0b00000000
    },
    { // 0108 l
        0b01110000,
        0b00110000,
        0b00110000,
        0b00110000,
        0b00110000,
        0b00110000,
        0b11111100,
        0b00000000
    },
    { // 0109 m
        0b00000000,
        0b00000000,
        0b11111100,
        0b10110110,
        0b10110110,
        0b10110110,
        0b10110110,
        0b00000000
    },
    { // 0110 n
        0b00000000,
        0b00000000,
        0b11111000,
        0b11000110,
        0b11000110,
        0b11000110,
        0b11000110,
        0b00000000
    },
    { // 0111 o
        0b00000000,
        0b00000000,
        0b01111100,
        0b11000110,
        0b11000110,
        0b11000110,
        0b01111100,
        0b00000000
    },
    { // 0112 p
        0b00000000,
        0b00000000,
        0b11111100,
        0b11000110,
        0b11000110,
        0b11111100,
        0b11000000,
        0b11000000
    },
    { // 0113 q
        0b00000000,
        0b00000000,
        0b01111110,
        0b11000110,
        0b11000110,
        0b01111110,
        0b00000110,
        0b00000110
    },
    { // 0114 r
        0b00000000,
        0b00000000,
        0b11011100,
        0b11100000,
        0b11000000,
        0b11000000,
        0b11000000,
        0b00000000
    },
    { // 0115 s
        0b00000000,
        0b00000000,
        0b01111100,
        0b11000000,
        0b01111100,
        0b00000110,
        0b11111100,
        0b00000000
    },
    { // 0116 t
        0b00110000,
        0b00110000,
        0b11111100,
        0b00110000,
        0b00110000,
        0b00110000,
        0b00110000,
        0b00000000
    },
    { // 0117 u
        0b00000000,
        0b00000000,
        0b11000110,
        0b11000110,
        0b11000110,
        0b11000110,
        0b01111110,
        0b00000000
    },
    { // 0118 v
        0b00000000,
        0b00000000,
        0b11001100,
        0b11001100,
        0b11001100,
        0b01111000,
        0b00110000,
        0b00000000
    },
    { // 0119 w
        0b00000000,
        0b00000000,
        0b10110110,
        0b10110110,
        0b10110110,
        0b10110110,
        0b01111110,
        0b00000000
    },
    { // 0120 x
        0b00000000,
        0b00000000,
        0b11000110,
        0b11111110,
        0b00111000,
        0b11111110,
        0b11000110,
        0b00000000
    },
    { // 0121 y
        0b00000000,
        0b00000000,
        0b11000110,
        0b11000110,
        0b11000110,
        0b01111110,
        0b00000110,
        0b01111100
    },
    { // 0122 z
        0b00000000,
        0b00000000,
        0b11111111,
        0b00011100,
        0b00111000,
        0b01110000,
        0b11111110,
        0b00000000
    },
    { // 0048 0
        0b00000000,
        0b00111000,
        0b01001100,
        0b11001110,
        0b11011110,
        0b11110110,
        0b01100100,
        0b00111000
    },
    { // 0049 1
        0b00000000,
        0b00110000,
        0b01110000,
        0b00110000,
        0b00110000,
        0b00110000,
        0b00110000,
        0b11111100
    },
    { // 0050 2
        0b00000000,
        0b01111100,
        0b11000110,
        0b00001110,
        0b00111100,
        0b01111000,
        0b11100000,
        0b11111110
    },
    { // 0051 3
        0b00000000,
        0b01111110,
        0b00001100,
        0b00011000,
        0b00111100,
        0b00000110,
        0b11000110,
        0b01111100
    },
    { // 0052 4
        0b00000000,
        0b00011100,
        0b00111100,
        0b01101100,
        0b11001100,
        0b11111110,
        0b00001100,
        0b00001100
    },
    { // 0053 5
        0b00000000,
        0b11111100,
        0b11000000,
        0b11111100,
        0b00000110,
        0b00000110,
        0b11000110,
        0b01111100
    },
    { // 0054 6
        0b00000000,
        0b00111100,
        0b01100000,
        0b11000000,
        0b11111100,
        0b11000110,
        0b11000110,
        0b01111100
    },
    { // 0055 7
        0b00000000,
        0b11111110,
        0b11000110,
        0b00001100,
        0b00011000,
        0b00110000,
        0b00110000,
        0b00110000
    },
    { // 0058 8
        0b00000000,
        0b01111000,
        0b11000100,
        0b11100100,
        0b01111000,
        0b10011110,
        0b10000110,
        0b01111100
    },
    { // 0057 9
        0b00000000,
        0b01111100,
        0b11000110,
        0b11000110,
        0b01111110,
        0b00000110,
        0b00001100,
        0b01111000
    },
    { // 0043 +
        0b00000000,
        0b00011000,
        0b00011000,
        0b01111110,
        0b01111110,
        0b00011000,
        0b00011000,
        0b00000000
    },
    { // 0045 -
        0b00000000,
        0b00000000,
        0b00000000,
        0b01111110,
        0b01111110,
        0b00000000,
        0b00000000,
        0b00000000
    },
    { // 0042 *
        0b00000000,
        0b01100110,
        0b00111100,
        0b01111110,
        0b01111110,
        0b00111100,
        0b01100110,
        0b00000000
    },
    { // 0047 /
        0b00000000,
        0b00000010,
        0b00000100,
        0b00001000,
        0b00010000,
        0b00100000,
        0b01000000,
        0b10000000
    },
    { // 0247 ÷
        0b00000000,
        0b00111000,
        0b00000000,
        0b01111110,
        0b01111110,
        0b00000000,
        0b00111000,
        0b00000000
    },
    { // 0061 =
        0b00000000,
        0b00000000,
        0b01111110,
        0b00000000,
        0b00000000,
        0b01111110,
        0b00000000,
        0b00000000
    },
    { // 0037 %
        0b00000000,
        0b01100010,
        0b10100100,
        0b11001000,
        0b00001000,
        0b00100110,
        0b01001010,
        0b10001100
    },
    { // 0034 "
        0b00000000,
        0b11001110,
        0b11101110,
        0b01100110,
        0b01000100,
        0b00000000,
        0b00000000,
        0b00000000
    },
    { // 0039 '
        0b00000000,
        0b00111000,
        0b00111000,
        0b00010000,
        0b00000000,
        0b00000000,
        0b00000000,
        0b00000000
    },
    { // 0035 #
        0b01100110,
        0b11111110,
        0b11111110,
        0b01100110,
        0b01100110,
        0b11111110,
        0b11111110,
        0b01100110
    },
    { // 0036 @
        0b00000000,
        0b01111100,
        0b10000010,
        0b10111010,
        0b10101010,
        0b10111110,
        0b10000000,
        0b01111100
    },
    { // 0037 &
        0b00000000,
        0b01110000,
        0b11011000,
        0b11011000,
        0b01110000,
        0b11011010,
        0b11001100,
        0b01111110
    },
    { // 0095 _
        0b00000000,
        0b00000000,
        0b00000000,
        0b00000000,
        0b00000000,
        0b00000000,
        0b11111110,
        0b11111110
    },
    { // 0040 (
        0b00000000,
        0b00001100,
        0b00011000,
        0b00110000,
        0b00110000,
        0b00110000,
        0b00011000,
        0b00001100
    },
    { // 0041 )
        0b00000000,
        0b00110000,
        0b00011000,
        0b00001100,
        0b00001100,
        0b00001100,
        0b00011000,
        0b00110000
    },
    { // 0044 ,
        0b00000000,
        0b00000000,
        0b00000000,
        0b00000000,
        0b00000000,
        0b00011100,
        0b00011100,
        0b00110000
    },
    { // 0046 .
        0b00000000,
        0b00000000,
        0b00000000,
        0b00000000,
        0b00000000,
        0b00011100,
        0b00011100,
        0b00000000
    },
    { // 0059 ;
        0b00000000,
        0b00000000,
        0b00011100,
        0b00011100,
        0b00000000,
        0b00011100,
        0b00011100,
        0b00110000
    },
    { // 0058 :
        0b00000000,
        0b00000000,
        0b00011100,
        0b00011100,
        0b00000000,
        0b00011100,
        0b00011100,
        0b00000000
    },
    { // 0191 ¿
        0b00000000,
        0b00111000,
        0b00000000,
        0b00111000,
        0b01100000,
        0b11000110,
        0b11111110,
        0b01111100
    },
    { // 0063 ?
        0b00000000,
        0b01111100,
        0b11111110,
        0b11000110,
        0b00001100,
        0b00111000,
        0b00000000,
        0b00111000
    },
    { // 0161 ¡
        0b00000000,
        0b00011000,
        0b00000000,
        0b00011000,
        0b00011000,
        0b00111000,
        0b00111000,
        0b00111000
    },
    { // 0033 !
        0b00000000,
        0b00111000,
        0b00111000,
        0b00111000,
        0b00110000,
        0b00110000,
        0b00000000,
        0b00110000
    },
    { // 0092 Down slash
        0b00000000,
        0b00000000,
        0b01000000,
        0b00100000,
        0b00010000,
        0b00001000,
        0b00000100,
        0b00000010
    },
    { // 0124 |
        0b00000000,
        0b00011000,
        0b00011000,
        0b00011000,
        0b00011000,
        0b00011000,
        0b00011000,
        0b00011000
    },
    { // 0123 {
        0b00000000,
        0b00001100,
        0b00011000,
        0b00011000,
        0b00110000,
        0b00011000,
        0b00011000,
        0b00001100
    },
    { // 0125 }
        0b00000000,
        0b00110000,
        0b00011000,
        0b00011000,
        0b00001100,
        0b00011000,
        0b00011000,
        0b00110000
    },
    { // 0060 <
        0b00000000,
        0b00001100,
        0b00011000,
        0b00110000,
        0b01100000,
        0b00110000,
        0b00011000,
        0b00001100
    },
    { // 0062 >
        0b00000000,
        0b01100000,
        0b00110000,
        0b00011000,
        0b00001100,
        0b00011000,
        0b00110000,
        0b01100000
    },
    { // 0091 [
        0b00000000,
        0b00111110,
        0b00110000,
        0b00110000,
        0b00110000,
        0b00110000,
        0b00110000,
        0b00111110
    },
    { // 0093 ]
        0b00000000,
        0b00111100,
        0b00001100,
        0b00001100,
        0b00001100,
        0b00001100,
        0b00001100,
        0b00111100
    },
    { // 0181 μ
        0b00000000,
        0b00000000,
        0b00000000,
        0b11001100,
        0b11001100,
        0b11001100,
        0b11110110,
        0b11000000
    },
    { // 0094 ^
        0b00000000,
        0b00000000,
        0b00011000,
        0b00111100,
        0b01100110,
        0b00000000,
        0b00000000,
        0b00000000
    },
    { // 0192 À
        0b00000000,
        0b00100000,
        0b00010000,
        0b00111000,
        0b01101100,
        0b11000110,
        0b11111110,
        0b11000110
    },
    { // 0193 Á
        0b00000000,
        0b00001000,
        0b00010000,
        0b00111000,
        0b01101100,
        0b11000110,
        0b11111110,
        0b11000110
    },
    { // 0194 Â
        0b00000000,
        0b00111000,
        0b11000110,
        0b00111000,
        0b01101100,
        0b11000110,
        0b11111110,
        0b11000110
    },
    { // 0195 Ã
        0b00000000,
        0b01110110,
        0b11011100,
        0b00111000,
        0b01101100,
        0b11000110,
        0b11111110,
        0b11000110
    },
    { // 0196 Ä
        0b00000000,
        0b01101100,
        0b00000000,
        0b00111000,
        0b01101100,
        0b11000110,
        0b11111110,
        0b11000110
    },
    { // 0197 Å
        0b00111000,
        0b01101100,
        0b00111000,
        0b00111000,
        0b01101100,
        0b11000110,
        0b11111110,
        0b11000110
    },
    { // 0198 Æ
        0b00000000,
        0b00111110,
        0b01111100,
        0b11011000,
        0b11011110,
        0b11111000,
        0b11011000,
        0b11011110
    },
    { // 0199 ç
        0b00111000,
        0b01101100,
        0b11000000,
        0b11000000,
        0b01100110,
        0b00111100,
        0b00001000,
        0b00110000
    },
    { // 0200 È
        0b00000000,
        0b00100000,
        0b00010000,
        0b11111110,
        0b11000000,
        0b11111100,
        0b11000000,
        0b11111110
    },
    { // 0201 É
        0b00000000,
        0b00001000,
        0b00010000,
        0b11111110,
        0b11000000,
        0b11111100,
        0b11000000,
        0b11111110
    },
    { // 0202 Ê
        0b00000000,
        0b00011000,
        0b00100100,
        0b11111110,
        0b11000000,
        0b11111100,
        0b11000000,
        0b11111110
    },
    { // 0203 Ë
        0b00000000,
        0b01100110,
        0b00000000,
        0b11111110,
        0b11000000,
        0b11111100,
        0b11000000,
        0b11111110
    },
    { // 0204 Ì
        0b00000000,
        0b00100000,
        0b00010000,
        0b11111110,
        0b00110000,
        0b00110000,
        0b00110000,
        0b11111100
    },
    { // 205 Í
        0b00000000,
        0b00010000,
        0b00100000,
        0b11111110,
        0b00110000,
        0b00110000,
        0b00110000,
        0b11111100
    },
    { // 206 Î
        0b00000000,
        0b00110000,
        0b01001000,
        0b11111110,
        0b00110000,
        0b00110000,
        0b00110000,
        0b11111100
    },
    { // 0207 Ï
        0b00000000,
        0b01101100,
        0b00000000,
        0b11111100,
        0b00110000,
        0b00110000,
        0b00110000,
        0b11111100
    },
    { // 0209 Ñ
        0b00000000,
        0b00110100,
        0b01011000,
        0b11100110,
        0b11110110,
        0b11111110,
        0b11011110,
        0b11001110
    },
    { // 0210 Ò
        0b00000000,
        0b00100000,
        0b00010000,
        0b01111100,
        0b11000110,
        0b11000110,
        0b11000110,
        0b01111100
    },
    { // 0211 Ó
        0b00000000,
        0b00100000,
        0b00010000,
        0b01111100,
        0b11000110,
        0b11000110,
        0b11000110,
        0b01111100
    },
    { // 0212 Ô
        0b00000000,
        0b00010000,
        0b00101000,
        0b01111100,
        0b11000110,
        0b11000110,
        0b11000110,
        0b01111100
    },
    { // 0213 Õ
        0b00000000,
        0b00110100,
        0b01011000,
        0b01111100,
        0b11000110,
        0b11000110,
        0b11000110,
        0b01111100
    },
    { // 0214 Ö
        0b00000000,
        0b00100100,
        0b00000000,
        0b01111100,
        0b11000110,
        0b11000110,
        0b11000110,
        0b01111100
    },
    { // 0216 Ø
        0b00000000,
        0b00000010,
        0b00111100,
        0b01001100,
        0b01010100,
        0b01100100,
        0b01111000,
        0b10000000
    },
    { // 0140 Œ
        0b00000000,
        0b01111110,
        0b11011000,
        0b11011000,
        0b11011110,
        0b11011000,
        0b11011000,
        0b01111110
    },
    { // 0217 Ù
        0b00000000,
        0b00010000,
        0b00001000,
        0b11000110,
        0b11000110,
        0b11000110,
        0b11000110,
        0b01111100
    },
    { // 0218 Ú
        0b00000000,
        0b00001000,
        0b00010000,
        0b11000110,
        0b11000110,
        0b11000110,
        0b11000110,
        0b01111100
    },
    { // 0219 Û
        0b00000000,
        0b00010000,
        0b00101000,
        0b11000110,
        0b11000110,
        0b11000110,
        0b11000110,
        0b01111100
    },
    { // 0220 Ü
        0b00000000,
        0b00101000,
        0b00000000,
        0b11000110,
        0b11000110,
        0b11000110,
        0b11000110,
        0b01111100
    },
    { // 0223 ß
        0b00000000,
        0b01111000,
        0b11001100,
        0b11001100,
        0b11011000,
        0b11001100,
        0b11101100,
        0b11011000
    },
    { // space
        0b00000000,
        0b00000000,
        0b00000000,
        0b00000000,
        0b00000000,
        0b00000000,
        0b00000000,
        0b00000000
    }
};
