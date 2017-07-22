<patch-1.0 appVersion="1.0.12">
   <obj type="patch/inlet i" uuid="f11927f00c59219df0c50f73056aa19f125540b7" name="waveNum" x="84" y="14">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="foo" x="84" y="98">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet a" uuid="abd8c5fd3b0524a6630f65cad6dc27f6c58e2a3e" name="magic" x="560" y="98">
      <params/>
      <attribs/>
   </obj>
   <obj type="osc/sine" uuid="6e094045cca76a9dbf7ebfa72e44e4700d2b3ba" name="sine_1" x="238" y="112">
      <params>
         <frac32.s.map name="pitch" value="0.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="mux/mux 8" uuid="a09f1f8ed9a5ae2334f6eaee0bf5500cdaa683ea" name="mux_2" x="448" y="112">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet a" uuid="b577fe41e0a6bc7b5502ce33cb8a3129e2e28ee5" name="freq" x="84" y="168">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="mod1" x="84" y="252">
      <params/>
      <attribs/>
   </obj>
   <obj type="osc/square" uuid="aa9592566d3673fe64dcaede132e9ebd45d2202f" name="square_1" x="238" y="252">
      <params>
         <frac32.s.map name="pitch" value="0.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="mod2" x="84" y="308">
      <params/>
      <attribs/>
   </obj>
   <obj type="osc/pwm" uuid="a6b40ff63f161d8bac8ea2eba5b0dbffcf49b472" name="pwm_1" x="238" y="364">
      <params>
         <frac32.s.map name="pitch" value="-3.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="osc/saw" uuid="739ecc36017ef3249479b8f01716b8bbfba9abc1" name="saw_1" x="238" y="476">
      <params>
         <frac32.s.map name="pitch" value="0.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="gate" x="84" y="574">
      <params/>
      <attribs/>
   </obj>
   <obj type="osc/tri" uuid="905879afa8256b0ca207557d656949e476ca6f16" name="tri_1" x="238" y="588">
      <params>
         <frac32.s.map name="pitch" value="0.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="osc/brds/twinpeaksnoise" uuid="53c6fee2-ff8c-4097-924f-24552007c840" name="twinpeaksnoise_1" x="224" y="686">
      <params>
         <frac32.s.map name="pitch" value="0.0"/>
         <frac32.u.map name="timbre" value="0.0"/>
         <frac32.u.map name="color" value="0.0"/>
      </params>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="freq" outlet="inlet"/>
         <dest obj="sine_1" inlet="freq"/>
      </net>
      <net>
         <source obj="sine_1" outlet="wave"/>
         <dest obj="mux_2" inlet="i0"/>
      </net>
      <net>
         <source obj="mux_2" outlet="o"/>
         <dest obj="magic" inlet="outlet"/>
      </net>
      <net>
         <source obj="foo" outlet="inlet"/>
         <dest obj="sine_1" inlet="pitch"/>
         <dest obj="square_1" inlet="pitch"/>
         <dest obj="saw_1" inlet="pitch"/>
         <dest obj="tri_1" inlet="pitch"/>
         <dest obj="twinpeaksnoise_1" inlet="pitch"/>
         <dest obj="pwm_1" inlet="pitch"/>
      </net>
      <net>
         <source obj="mod1" outlet="inlet"/>
         <dest obj="twinpeaksnoise_1" inlet="timbre"/>
         <dest obj="pwm_1" inlet="pw"/>
      </net>
      <net>
         <source obj="mod2" outlet="inlet"/>
         <dest obj="twinpeaksnoise_1" inlet="color"/>
      </net>
      <net>
         <source obj="square_1" outlet="wave"/>
         <dest obj="mux_2" inlet="i1"/>
      </net>
      <net>
         <source obj="pwm_1" outlet="wave"/>
         <dest obj="mux_2" inlet="i2"/>
      </net>
      <net>
         <source obj="saw_1" outlet="wave"/>
         <dest obj="mux_2" inlet="i3"/>
      </net>
      <net>
         <source obj="tri_1" outlet="wave"/>
         <dest obj="mux_2" inlet="i4"/>
      </net>
      <net>
         <source obj="twinpeaksnoise_1" outlet="wave"/>
         <dest obj="mux_2" inlet="i5"/>
      </net>
      <net>
         <source obj="waveNum" outlet="inlet"/>
         <dest obj="mux_2" inlet="s"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>no</subpatchmode>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>-1139</x>
      <y>80</y>
      <width>931</width>
      <height>802</height>
   </windowPos>
</patch-1.0>