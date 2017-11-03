<patch-1.0 appVersion="1.0.12">
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="i0" x="126" y="28">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/monophonicKBSel" uuid="eb493a19-36a5-41cc-a687-077dfdc6483a" name="monophonicKBSel_1" x="462" y="28">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="i1" x="126" y="70">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="i2" x="126" y="112">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="i3" x="126" y="154">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="i4" x="126" y="196">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="i5" x="126" y="238">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="i6" x="126" y="280">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial b" uuid="862e7d7f29093cb1ce4aed72244d118ad4d46692" name="base_freq" x="630" y="308">
      <params>
         <frac32.s.map name="value" onParent="true" value="-12.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="i7" x="126" y="322">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/+" uuid="44553fdc8628c67ab535845ed1be304ad6c9553b" name="+_9" x="728" y="392">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="baseFreqIn" x="126" y="462">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/+" uuid="44553fdc8628c67ab535845ed1be304ad6c9553b" name="+_8" x="490" y="476">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="stepSizeIn" x="126" y="532">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="stepsize" x="364" y="532">
      <params>
         <frac32.u.map name="value" onParent="true" value="1.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="math/+" uuid="44553fdc8628c67ab535845ed1be304ad6c9553b" name="+_7" x="1638" y="756">
      <params/>
      <attribs/>
   </obj>
   <obj type="mux/mux 8" uuid="de5167d9da39b04039376e8cc620ea2afc22e28a" name="mux_1" x="1820" y="756">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="Val0" x="1932" y="756">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/+" uuid="44553fdc8628c67ab535845ed1be304ad6c9553b" name="+_6" x="1554" y="826">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/+" uuid="44553fdc8628c67ab535845ed1be304ad6c9553b" name="+_4" x="1470" y="896">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/+" uuid="44553fdc8628c67ab535845ed1be304ad6c9553b" name="+_5" x="1386" y="966">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/+" uuid="44553fdc8628c67ab535845ed1be304ad6c9553b" name="+_3" x="1302" y="1036">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/+" uuid="44553fdc8628c67ab535845ed1be304ad6c9553b" name="+_2" x="1218" y="1106">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/+" uuid="44553fdc8628c67ab535845ed1be304ad6c9553b" name="+_1" x="1134" y="1176">
      <params/>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="i0" outlet="inlet"/>
         <dest obj="monophonicKBSel_1" inlet="b0"/>
      </net>
      <net>
         <source obj="i1" outlet="inlet"/>
         <dest obj="monophonicKBSel_1" inlet="b1"/>
      </net>
      <net>
         <source obj="i2" outlet="inlet"/>
         <dest obj="monophonicKBSel_1" inlet="b2"/>
      </net>
      <net>
         <source obj="monophonicKBSel_1" outlet="out"/>
         <dest obj="mux_1" inlet="s"/>
      </net>
      <net>
         <source obj="i3" outlet="inlet"/>
         <dest obj="monophonicKBSel_1" inlet="b3"/>
      </net>
      <net>
         <source obj="i4" outlet="inlet"/>
         <dest obj="monophonicKBSel_1" inlet="b4"/>
      </net>
      <net>
         <source obj="i5" outlet="inlet"/>
         <dest obj="monophonicKBSel_1" inlet="b5"/>
      </net>
      <net>
         <source obj="i6" outlet="inlet"/>
         <dest obj="monophonicKBSel_1" inlet="b6"/>
      </net>
      <net>
         <source obj="i7" outlet="inlet"/>
         <dest obj="monophonicKBSel_1" inlet="b7"/>
      </net>
      <net>
         <source obj="mux_1" outlet="o"/>
         <dest obj="Val0" inlet="outlet"/>
      </net>
      <net>
         <source obj="stepsize" outlet="out"/>
         <dest obj="+_8" inlet="in2"/>
      </net>
      <net>
         <source obj="+_2" outlet="out"/>
         <dest obj="+_3" inlet="in2"/>
         <dest obj="mux_1" inlet="i5"/>
      </net>
      <net>
         <source obj="+_4" outlet="out"/>
         <dest obj="+_6" inlet="in2"/>
         <dest obj="mux_1" inlet="i2"/>
      </net>
      <net>
         <source obj="+_6" outlet="out"/>
         <dest obj="+_7" inlet="in2"/>
         <dest obj="mux_1" inlet="i1"/>
      </net>
      <net>
         <source obj="stepSizeIn" outlet="inlet"/>
         <dest obj="+_8" inlet="in1"/>
      </net>
      <net>
         <source obj="+_8" outlet="out"/>
         <dest obj="+_1" inlet="in2"/>
         <dest obj="+_2" inlet="in1"/>
         <dest obj="+_3" inlet="in1"/>
         <dest obj="+_5" inlet="in1"/>
         <dest obj="+_4" inlet="in1"/>
         <dest obj="+_6" inlet="in1"/>
         <dest obj="+_7" inlet="in1"/>
      </net>
      <net>
         <source obj="+_1" outlet="out"/>
         <dest obj="+_2" inlet="in2"/>
         <dest obj="mux_1" inlet="i6"/>
      </net>
      <net>
         <source obj="+_3" outlet="out"/>
         <dest obj="+_5" inlet="in2"/>
         <dest obj="mux_1" inlet="i4"/>
      </net>
      <net>
         <source obj="+_5" outlet="out"/>
         <dest obj="+_4" inlet="in2"/>
         <dest obj="mux_1" inlet="i3"/>
      </net>
      <net>
         <source obj="base_freq" outlet="out"/>
         <dest obj="+_9" inlet="in1"/>
      </net>
      <net>
         <source obj="baseFreqIn" outlet="inlet"/>
         <dest obj="+_9" inlet="in2"/>
      </net>
      <net>
         <source obj="+_9" outlet="out"/>
         <dest obj="+_1" inlet="in1"/>
         <dest obj="mux_1" inlet="i7"/>
      </net>
      <net>
         <source obj="+_7" outlet="out"/>
         <dest obj="mux_1" inlet="i0"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>no</subpatchmode>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>-1647</x>
      <y>216</y>
      <width>1514</width>
      <height>1014</height>
   </windowPos>
</patch-1.0>