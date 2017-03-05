<patch-1.0 appVersion="1.0.12">
   <obj type="logic/and 2" uuid="c67031682f552aa0a80b23377495c51ea28a8c9c" name="and_1" x="196" y="14">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="trigger" x="28" y="28">
      <params/>
      <attribs/>
   </obj>
   <obj type="env/adsr m" uuid="98bd39fb828c392b28126d259cb5175e6f6ea34b" name="adsr_1" x="364" y="42">
      <params>
         <frac32.s.map name="a" value="-64.0"/>
         <frac32.s.map name="d" value="-64.0"/>
         <frac32.u.map name="s" value="0.0"/>
         <frac32.s.map name="r" value="-64.0"/>
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
   <obj type="math/+" uuid="44553fdc8628c67ab535845ed1be304ad6c9553b" name="+_1" x="504" y="154">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="sustain" x="28" y="168">
      <params/>
      <attribs/>
   </obj>
   <obj type="gain/vca" uuid="a9f2dcd18043e2f47364e45cb8814f63c2a37c0d" name="vca_1" x="602" y="168">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="release" x="28" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/&gt;c" uuid="99f2934d97d62b715a829979ef6c8abef35dcdb2" name="&gt;c_1" x="126" y="252">
      <params>
         <frac32.u.map name="c" value="1.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="volume" x="28" y="266">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="Base Note" x="28" y="322">
      <params/>
      <attribs/>
   </obj>
   <comment type="patch/comment" x="266" y="322" text="carrier oscillator"/>
   <obj type="patch/outlet a" uuid="abd8c5fd3b0524a6630f65cad6dc27f6c58e2a3e" name="out" x="714" y="336">
      <params/>
      <attribs/>
   </obj>
   <obj type="osc/multiwave" uuid="f38f0682-77d4-48b7-97c2-0ba0436ea4d8" name="multiwave_1" x="350" y="350">
      <params>
         <int32.vradio name="waveform" value="0"/>
         <frac32.s.map name="pitch" value="-48.0"/>
         <frac32.u.map name="shape" value="0.0"/>
         <frac32.u.map name="amount" value="0.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/inlet a" uuid="b577fe41e0a6bc7b5502ce33cb8a3129e2e28ee5" name="modFreq" x="28" y="364">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="shape" x="28" y="406">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet i" uuid="f11927f00c59219df0c50f73056aa19f125540b7" name="waveSel" x="28" y="462">
      <params/>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="volume" outlet="inlet"/>
         <dest obj="&gt;c_1" inlet="in"/>
         <dest obj="+_1" inlet="in2"/>
      </net>
      <net>
         <source obj="Base Note" outlet="inlet"/>
         <dest obj="multiwave_1" inlet="pitch"/>
      </net>
      <net>
         <source obj="trigger" outlet="inlet"/>
         <dest obj="and_1" inlet="i1"/>
      </net>
      <net>
         <source obj="&gt;c_1" outlet="out"/>
         <dest obj="and_1" inlet="i2"/>
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
         <source obj="and_1" outlet="o"/>
         <dest obj="adsr_1" inlet="gate"/>
      </net>
      <net>
         <source obj="vca_1" outlet="o"/>
         <dest obj="out" inlet="outlet"/>
      </net>
      <net>
         <source obj="adsr_1" outlet="env"/>
         <dest obj="+_1" inlet="in1"/>
      </net>
      <net>
         <source obj="waveSel" outlet="inlet"/>
         <dest obj="multiwave_1" inlet="wave"/>
      </net>
      <net>
         <source obj="shape" outlet="inlet"/>
         <dest obj="multiwave_1" inlet="shape"/>
      </net>
      <net>
         <source obj="modFreq" outlet="inlet"/>
         <dest obj="multiwave_1" inlet="freq"/>
      </net>
      <net>
         <source obj="+_1" outlet="out"/>
         <dest obj="vca_1" inlet="v"/>
      </net>
      <net>
         <source obj="multiwave_1" outlet="out"/>
         <dest obj="vca_1" inlet="a"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>no</subpatchmode>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>-1112</x>
      <y>1</y>
      <width>893</width>
      <height>772</height>
   </windowPos>
</patch-1.0>