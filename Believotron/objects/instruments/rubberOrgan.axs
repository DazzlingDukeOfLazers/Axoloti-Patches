<patch-1.0 appVersion="1.0.10">
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="inlet_1" x="70" y="196">
      <params/>
      <attribs/>
   </obj>
   <obj type="lfo/sine" uuid="75f7330c26a13953215dccc3b7b9008545c9daa9" name="sine_1" x="154" y="196">
      <params>
         <frac32.s.map name="pitch" value="-32.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="math/*c" uuid="7d5ef61c3bcd571ee6bbd8437ef3612125dfb225" name="*c_3" x="266" y="196">
      <params>
         <frac32.u.map name="amp" value="1.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="math/+" uuid="44553fdc8628c67ab535845ed1be304ad6c9553b" name="+_3" x="378" y="196">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/change" uuid="42071f8cb4cfe1f35956c0bd5a313a57e049bec4" name="change_2" x="602" y="322">
      <params/>
      <attribs/>
   </obj>
   <obj type="osc/sine" sha="edec4a9d5f533ea748cd564ce8c69673dd78742f" name="osc_1" x="728" y="322">
      <params>
         <frac32.s.map name="pitch" value="0.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="env/d" sha="d9f7cfe1295d7bcc550714a18126d4f73c7c8411" name="envd1_" x="840" y="322">
      <params>
         <frac32.s.map name="d" value="64.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="gain/vca" sha="6bbeaeb94e74091879965461ad0cb043f2e7f6cf" name="vca_4" x="966" y="322">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/+" uuid="44553fdc8628c67ab535845ed1be304ad6c9553b" name="+_1" x="602" y="420">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/i" uuid="a3786816db6ea5bc6ac4193a5cccdb2c83b83496" name="i_5" x="462" y="462">
      <params>
         <int32 name="value" value="3"/>
      </params>
      <attribs/>
   </obj>
   <obj type="osc/sine" sha="edec4a9d5f533ea748cd564ce8c69673dd78742f" name="osc_2" x="728" y="462">
      <params>
         <frac32.s.map name="pitch" value="-7.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="env/d" sha="d9f7cfe1295d7bcc550714a18126d4f73c7c8411" name="envd2" x="840" y="462">
      <params>
         <frac32.s.map name="d" value="64.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="gain/vca" sha="6bbeaeb94e74091879965461ad0cb043f2e7f6cf" name="vca_5" x="966" y="462">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/+" uuid="44553fdc8628c67ab535845ed1be304ad6c9553b" name="+_2" x="602" y="518">
      <params/>
      <attribs/>
   </obj>
   <obj type="mix/mix 3" uuid="8be16f2156012a4a8974804178cece51555f272b" name="mix_3" x="1162" y="546">
      <params>
         <frac32.u.map name="gain1" value="16.5"/>
         <frac32.u.map name="gain2" value="15.5"/>
         <frac32.u.map name="gain3" value="18.5"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet a" uuid="abd8c5fd3b0524a6630f65cad6dc27f6c58e2a3e" name="outlet_1" x="1260" y="546">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/i" uuid="a3786816db6ea5bc6ac4193a5cccdb2c83b83496" name="i_6" x="462" y="560">
      <params>
         <int32 name="value" value="8"/>
      </params>
      <attribs/>
   </obj>
   <obj type="osc/sine" sha="edec4a9d5f533ea748cd564ce8c69673dd78742f" name="osc_3" x="728" y="602">
      <params>
         <frac32.s.map name="pitch" value="0.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="env/d" sha="d9f7cfe1295d7bcc550714a18126d4f73c7c8411" name="envd3" x="840" y="602">
      <params>
         <frac32.s.map name="d" value="41.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="gain/vca" sha="6bbeaeb94e74091879965461ad0cb043f2e7f6cf" name="vca_6" x="966" y="602">
      <params/>
      <attribs/>
   </obj>
   <comment type="patch/comment" x="728" y="728" text="three oscillators tuned to different transpositions"/>
   <comment type="patch/comment" x="840" y="742" text="three decay envelopes with diferent decay times"/>
   <comment type="patch/comment" x="1162" y="742" text="mix the three sources"/>
   <comment type="patch/comment" x="966" y="756" text="multiply envelope with oscillation"/>
   <comment type="patch/comment" x="1050" y="770" text="watch the envelopes here"/>
   <nets>
      <net>
         <source obj="change_2" outlet="trig"/>
         <dest obj="envd1_" inlet="trig"/>
         <dest obj="envd2" inlet="trig"/>
         <dest obj="envd3" inlet="trig"/>
      </net>
      <net>
         <source obj="envd1_" outlet="env"/>
         <dest obj="vca_4" inlet="v"/>
      </net>
      <net>
         <source obj="osc_1" outlet="wave"/>
         <dest obj="vca_4" inlet="a"/>
      </net>
      <net>
         <source obj="vca_4" outlet="o"/>
         <dest obj="mix_3" inlet="in1"/>
      </net>
      <net>
         <source obj="envd2" outlet="env"/>
         <dest obj="vca_5" inlet="v"/>
      </net>
      <net>
         <source obj="osc_2" outlet="wave"/>
         <dest obj="vca_5" inlet="a"/>
      </net>
      <net>
         <source obj="osc_3" outlet="wave"/>
         <dest obj="vca_6" inlet="a"/>
      </net>
      <net>
         <source obj="envd3" outlet="env"/>
         <dest obj="vca_6" inlet="v"/>
      </net>
      <net>
         <source obj="vca_5" outlet="o"/>
         <dest obj="mix_3" inlet="in2"/>
      </net>
      <net>
         <source obj="vca_6" outlet="o"/>
         <dest obj="mix_3" inlet="in3"/>
      </net>
      <net>
         <source obj="i_5" outlet="out"/>
         <dest obj="+_1" inlet="in2"/>
      </net>
      <net>
         <source obj="+_1" outlet="out"/>
         <dest obj="osc_2" inlet="pitch"/>
      </net>
      <net>
         <source obj="i_6" outlet="out"/>
         <dest obj="+_2" inlet="in2"/>
      </net>
      <net>
         <source obj="+_2" outlet="out"/>
         <dest obj="osc_3" inlet="pitch"/>
      </net>
      <net>
         <source obj="sine_1" outlet="wave"/>
         <dest obj="*c_3" inlet="in"/>
      </net>
      <net>
         <source obj="+_3" outlet="out"/>
         <dest obj="osc_1" inlet="pitch"/>
         <dest obj="+_1" inlet="in1"/>
         <dest obj="+_2" inlet="in1"/>
      </net>
      <net>
         <source obj="*c_3" outlet="out"/>
         <dest obj="+_3" inlet="in1"/>
      </net>
      <net>
         <source obj="inlet_1" outlet="inlet"/>
         <dest obj="+_3" inlet="in2"/>
         <dest obj="sine_1" inlet="pitch"/>
         <dest obj="change_2" inlet="in"/>
      </net>
      <net>
         <source obj="mix_3" outlet="out"/>
         <dest obj="outlet_1" inlet="outlet"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>no</subpatchmode>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>-1830</x>
      <y>-18</y>
      <width>1252</width>
      <height>893</height>
   </windowPos>
</patch-1.0>