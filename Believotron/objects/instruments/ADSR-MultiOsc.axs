<patch-1.0 appVersion="1.0.12">
   <obj type="logic/and 2" uuid="c67031682f552aa0a80b23377495c51ea28a8c9c" name="and_1" x="196" y="14">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="trigger" x="28" y="28">
      <params/>
      <attribs/>
   </obj>
   <obj type="env/adsr m" uuid="98bd39fb828c392b28126d259cb5175e6f6ea34b" name="adsr_1" x="294" y="42">
      <params>
         <frac32.s.map name="a" value="-64.0"/>
         <frac32.s.map name="d" value="-64.0"/>
         <frac32.u.map name="s" value="0.0"/>
         <frac32.s.map name="r" value="-63.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="attack" x="28" y="84">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/+" uuid="44553fdc8628c67ab535845ed1be304ad6c9553b" name="+_1" x="434" y="98">
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
   <obj type="gain/vca" uuid="a9f2dcd18043e2f47364e45cb8814f63c2a37c0d" name="vca_1" x="574" y="294">
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
   <obj type="osc/sine" uuid="6e094045cca76a9dbf7ebfa72e44e4700d2b3ba" name="osc_3" x="266" y="350">
      <params>
         <frac32.s.map name="pitch" value="-48.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="env/ADSR1" uuid="22b63723-acad-4e78-b44b-34d41c939c10" name="ADSR1_1" x="476" y="350">
      <params>
         <bool32.tgl name="on" value="1"/>
         <frac32.s.map name="a" value="-63.0"/>
         <frac32.s.map name="d" value="-64.0"/>
         <frac32.u.map name="s" value="0.5"/>
         <frac32.s.map name="r" value="-63.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="beat/osc/multiWave" uuid="50bff098-b6e0-43ff-bf4d-7f946501a55b" name="multiWave_1" x="70" y="462">
      <params>
         <int32.vradio name="waveform" value="0"/>
         <frac32.s.map name="pitch" value="0.0"/>
         <frac32.u.map name="shape" value="0.0"/>
         <frac32.u.map name="amount" value="0.0"/>
      </params>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="volume" outlet="inlet"/>
         <dest obj="&gt;c_1" inlet="in"/>
         <dest obj="+_1" inlet="in2"/>
         <dest obj="vca_1" inlet="v"/>
      </net>
      <net>
         <source obj="Base Note" outlet="inlet"/>
         <dest obj="osc_3" inlet="pitch"/>
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
         <source obj="adsr_1" outlet="env"/>
         <dest obj="+_1" inlet="in1"/>
      </net>
      <net>
         <source obj="osc_3" outlet="wave"/>
         <dest obj="ADSR1_1" inlet="i"/>
      </net>
      <net>
         <source obj="attack" outlet="inlet"/>
         <dest obj="ADSR1_1" inlet="a"/>
      </net>
      <net>
         <source obj="decay" outlet="inlet"/>
         <dest obj="ADSR1_1" inlet="d"/>
      </net>
      <net>
         <source obj="sustain" outlet="inlet"/>
         <dest obj="ADSR1_1" inlet="s"/>
      </net>
      <net>
         <source obj="release" outlet="inlet"/>
         <dest obj="ADSR1_1" inlet="r"/>
      </net>
      <net>
         <source obj="and_1" outlet="o"/>
         <dest obj="ADSR1_1" inlet="g"/>
      </net>
      <net>
         <source obj="ADSR1_1" outlet="o"/>
         <dest obj="vca_1" inlet="a"/>
      </net>
      <net>
         <source obj="vca_1" outlet="o"/>
         <dest obj="out" inlet="outlet"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>no</subpatchmode>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>-1675</x>
      <y>9</y>
      <width>1192</width>
      <height>772</height>
   </windowPos>
</patch-1.0>