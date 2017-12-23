<patch-1.0 appVersion="1.0.12">
   <obj type="patch/inlet i" uuid="f11927f00c59219df0c50f73056aa19f125540b7" name="step" x="56" y="28">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="enableWR" x="42" y="84">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="tableOut" x="1022" y="84">
      <params/>
      <attribs/>
   </obj>
   <obj type="table/tableReadWrite" uuid="80bf0332-3574-4c01-beb7-098c3454b662" name="tableReadWrite_1" x="574" y="98">
      <params/>
      <attribs>
         <objref attributeName="table" obj="tbl"/>
      </attribs>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="in" x="56" y="154">
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
         <dest obj="tableReadWrite_1" inlet="v"/>
      </net>
      <net>
         <source obj="step" outlet="inlet"/>
         <dest obj="tableReadWrite_1" inlet="a"/>
      </net>
      <net>
         <source obj="trigSave" outlet="inlet"/>
         <dest obj="tableReadWrite_1" inlet="trigSave"/>
      </net>
      <net>
         <source obj="trigLoad" outlet="inlet"/>
         <dest obj="tableReadWrite_1" inlet="trigLoad"/>
      </net>
      <net>
         <source obj="tableReadWrite_1" outlet="o"/>
         <dest obj="tableOut" inlet="outlet"/>
      </net>
      <net>
         <source obj="enableWR" outlet="inlet"/>
         <dest obj="tableReadWrite_1" inlet="enWr"/>
      </net>
      <net>
         <source obj="filename" outlet="inlet"/>
         <dest obj="tableReadWrite_1" inlet="filename"/>
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