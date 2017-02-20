<patch-1.0 appVersion="1.0.12">
   <obj type="patch/inlet i" uuid="f11927f00c59219df0c50f73056aa19f125540b7" name="stepIn" x="56" y="28">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet i" uuid="f11927f00c59219df0c50f73056aa19f125540b7" name="stepOut" x="56" y="98">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="enableWR" x="56" y="154">
      <params/>
      <attribs/>
   </obj>
   <obj type="table/write" uuid="50b8c8807ba1fc700ed79381c9360a982e0c3fb9" name="write_1" x="588" y="168">
      <params/>
      <attribs>
         <objref attributeName="table" obj="tbl"/>
      </attribs>
   </obj>
   <obj type="table/read" uuid="65eb8d0f6a3344638de94c9882999b9af15510d0" name="read_1" x="756" y="182">
      <params/>
      <attribs>
         <objref attributeName="table" obj="tbl"/>
      </attribs>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="tableOut" x="896" y="182">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/and 2" uuid="c67031682f552aa0a80b23377495c51ea28a8c9c" name="and_1" x="490" y="196">
      <params/>
      <attribs/>
   </obj>
   <obj type="table/alloc 16b sdram" uuid="6d8eb0fd68f404cb5d14e7d4c8c146c8ccf09da1" name="tbl" x="14" y="266">
      <params/>
      <attribs>
         <combo attributeName="size" selection="16"/>
         <text attributeName="init">
            <sText><![CDATA[]]></sText>
         </text>
      </attribs>
   </obj>
   <obj type="logic/change" uuid="96e39ae624c3f3c952cec4a95e1986ee0104f718" name="change_1" x="154" y="266">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/inv" uuid="2bd44b865d3b63ff9b80862242bf5be779e3ad5" name="inv_1" x="252" y="266">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="in" x="196" y="322">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/changeAfterSel" uuid="080d83c3-b79f-4eaf-9609-14c34f3ffbb9" name="changeAfterSel_1" x="336" y="392">
      <params/>
      <attribs/>
   </obj>
   <obj type="table/saveLoad" uuid="9d733dd3-c9aa-4b7e-b413-bf84a63d8c41" name="saveLoad_1" x="742" y="392">
      <params/>
      <attribs>
         <objref attributeName="table" obj="tbl"/>
      </attribs>
   </obj>
   <obj type="patch/inlet string" uuid="6c562c1a7890cccf18fa7327d8baa476d0926cd8" name="filename" x="42" y="434">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="trigSave" x="42" y="490">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="trigLoad" x="42" y="546">
      <params/>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="in" outlet="inlet"/>
         <dest obj="changeAfterSel_1" inlet="in"/>
         <dest obj="write_1" inlet="v"/>
      </net>
      <net>
         <source obj="stepIn" outlet="inlet"/>
         <dest obj="write_1" inlet="a"/>
         <dest obj="change_1" inlet="in"/>
      </net>
      <net>
         <source obj="read_1" outlet="o"/>
         <dest obj="tableOut" inlet="outlet"/>
      </net>
      <net>
         <source obj="change_1" outlet="trig"/>
         <dest obj="inv_1" inlet="i"/>
      </net>
      <net>
         <source obj="inv_1" outlet="o"/>
         <dest obj="changeAfterSel_1" inlet="sel"/>
      </net>
      <net>
         <source obj="stepOut" outlet="inlet"/>
         <dest obj="read_1" inlet="a"/>
      </net>
      <net>
         <source obj="trigSave" outlet="inlet"/>
         <dest obj="saveLoad_1" inlet="trigSave"/>
      </net>
      <net>
         <source obj="trigLoad" outlet="inlet"/>
         <dest obj="saveLoad_1" inlet="trigLoad"/>
      </net>
      <net>
         <source obj="filename" outlet="inlet"/>
         <dest obj="saveLoad_1" inlet="filename"/>
      </net>
      <net>
         <source obj="enableWR" outlet="inlet"/>
         <dest obj="and_1" inlet="i1"/>
      </net>
      <net>
         <source obj="and_1" outlet="o"/>
         <dest obj="write_1" inlet="trig"/>
      </net>
      <net>
         <source obj="changeAfterSel_1" outlet="trig"/>
         <dest obj="and_1" inlet="i2"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>no</subpatchmode>
      <MidiChannel>1</MidiChannel>
      <NPresets>0</NPresets>
      <NPresetEntries>0</NPresetEntries>
      <NModulationSources>0</NModulationSources>
      <NModulationTargetsPerSource>0</NModulationTargetsPerSource>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>-1928</x>
      <y>-91</y>
      <width>1723</width>
      <height>976</height>
   </windowPos>
</patch-1.0>