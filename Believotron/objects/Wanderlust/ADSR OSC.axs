<patch-1.0 appVersion="1.0.10">
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="trigger" x="308" y="112">
      <params/>
      <attribs/>
   </obj>
   <obj type="env/adsr" sha="2c4b16047d03b574d8a72b651f130895749eb670" name="adsr1_" x="560" y="112">
      <params>
         <frac32.s.map name="a" value="-11.0"/>
         <frac32.s.map name="d" value="9.5"/>
         <frac32.u.map name="s" value="27.5"/>
         <frac32.s.map name="r" value="24.5"/>
      </params>
      <attribs/>
   </obj>
   <obj type="gain/vca" sha="6bbeaeb94e74091879965461ad0cb043f2e7f6cf" name="vca_2" x="714" y="308">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="Base Note" x="308" y="322">
      <params/>
      <attribs/>
   </obj>
   <comment type="patch/comment" x="560" y="322" text="carrier oscillator"/>
   <obj type="patch/outlet a" uuid="abd8c5fd3b0524a6630f65cad6dc27f6c58e2a3e" name="out" x="798" y="322">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/+" uuid="44553fdc8628c67ab535845ed1be304ad6c9553b" name="+_2" x="448" y="336">
      <params/>
      <attribs/>
   </obj>
   <obj type="osc/sine" sha="edec4a9d5f533ea748cd564ce8c69673dd78742f" name="osc_3" x="560" y="336">
      <params>
         <frac32.s.map name="pitch" value="0.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="ctrl/dial b" uuid="862e7d7f29093cb1ce4aed72244d118ad4d46692" name="noteMod" x="308" y="378">
      <params>
         <frac32.s.map name="value" onParent="true" value="0.0"/>
      </params>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="osc_3" outlet="wave"/>
         <dest obj="vca_2" inlet="a"/>
      </net>
      <net>
         <source obj="adsr1_" outlet="env"/>
         <dest obj="vca_2" inlet="v"/>
      </net>
      <net>
         <source obj="+_2" outlet="out"/>
         <dest obj="osc_3" inlet="pitch"/>
      </net>
      <net>
         <source obj="vca_2" outlet="o"/>
         <dest obj="out" inlet="outlet"/>
      </net>
      <net>
         <source obj="Base Note" outlet="inlet"/>
         <dest obj="+_2" inlet="in1"/>
      </net>
      <net>
         <source obj="trigger" outlet="inlet"/>
         <dest obj="adsr1_" inlet="gate"/>
      </net>
      <net>
         <source obj="noteMod" outlet="out"/>
         <dest obj="+_2" inlet="in2"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>no</subpatchmode>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>-2103</x>
      <y>-9</y>
      <width>1932</width>
      <height>1328</height>
   </windowPos>
</patch-1.0>