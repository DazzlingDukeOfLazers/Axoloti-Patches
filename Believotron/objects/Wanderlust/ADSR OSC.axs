<patch-1.0 appVersion="1.0.10">
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="trigger" x="28" y="28">
      <params/>
      <attribs/>
   </obj>
   <obj type="env/adsr m" uuid="98bd39fb828c392b28126d259cb5175e6f6ea34b" name="adsr_1" x="266" y="42">
      <params>
         <frac32.s.map name="a" value="0.0"/>
         <frac32.s.map name="d" value="0.0"/>
         <frac32.u.map name="s" value="31.5"/>
         <frac32.s.map name="r" value="0.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="attack" x="28" y="84">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="decay" x="28" y="126">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="sustain" x="28" y="168">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="release" x="28" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial b" uuid="862e7d7f29093cb1ce4aed72244d118ad4d46692" name="dial_1" x="350" y="252">
      <params>
         <frac32.s.map name="value" value="33.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="Base Note" x="28" y="322">
      <params/>
      <attribs/>
   </obj>
   <comment type="patch/comment" x="266" y="322" text="carrier oscillator"/>
   <obj type="gain/vca" sha="6bbeaeb94e74091879965461ad0cb043f2e7f6cf" name="vca_2" x="518" y="336">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet a" uuid="abd8c5fd3b0524a6630f65cad6dc27f6c58e2a3e" name="out" x="574" y="336">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/+" uuid="44553fdc8628c67ab535845ed1be304ad6c9553b" name="+_1" x="168" y="350">
      <params/>
      <attribs/>
   </obj>
   <obj type="osc/sine" sha="edec4a9d5f533ea748cd564ce8c69673dd78742f" name="osc_3" x="266" y="350">
      <params>
         <frac32.s.map name="pitch" value="-4.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="gain/vca" uuid="a9f2dcd18043e2f47364e45cb8814f63c2a37c0d" name="vca_1" x="448" y="350">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial b" uuid="862e7d7f29093cb1ce4aed72244d118ad4d46692" name="noteMod" x="28" y="378">
      <params>
         <frac32.s.map name="value" onParent="true" value="0.0"/>
      </params>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="+_1" outlet="out"/>
         <dest obj="osc_3" inlet="pitch"/>
      </net>
      <net>
         <source obj="vca_2" outlet="o"/>
         <dest obj="out" inlet="outlet"/>
      </net>
      <net>
         <source obj="Base Note" outlet="inlet"/>
         <dest obj="+_1" inlet="in1"/>
      </net>
      <net>
         <source obj="trigger" outlet="inlet"/>
         <dest obj="adsr_1" inlet="gate"/>
      </net>
      <net>
         <source obj="noteMod" outlet="out"/>
         <dest obj="+_1" inlet="in2"/>
      </net>
      <net>
         <source obj="adsr_1" outlet="env"/>
         <dest obj="vca_2" inlet="v"/>
      </net>
      <net>
         <source obj="attack" outlet="inlet"/>
         <dest obj="adsr_1" inlet="a"/>
      </net>
      <net>
         <source obj="decay" outlet="inlet"/>
         <dest obj="adsr_1" inlet="d"/>
      </net>
      <net>
         <source obj="sustain" outlet="inlet"/>
         <dest obj="adsr_1" inlet="s"/>
      </net>
      <net>
         <source obj="release" outlet="inlet"/>
         <dest obj="adsr_1" inlet="r"/>
      </net>
      <net>
         <source obj="dial_1" outlet="out"/>
         <dest obj="vca_1" inlet="v"/>
      </net>
      <net>
         <source obj="vca_1" outlet="o"/>
         <dest obj="vca_2" inlet="a"/>
      </net>
      <net>
         <source obj="osc_3" outlet="wave"/>
         <dest obj="vca_1" inlet="a"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>no</subpatchmode>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>-867</x>
      <y>-63</y>
      <width>709</width>
      <height>957</height>
   </windowPos>
</patch-1.0>