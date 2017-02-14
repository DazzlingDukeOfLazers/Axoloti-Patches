<patch-1.0 appVersion="1.0.12">
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="enable" x="140" y="84">
      <params/>
      <attribs/>
   </obj>
   <obj type="table/alloc 16b" uuid="597fcaac36aa638ba120b0fbdcadcde4ad405a7e" name="tbl" x="140" y="154">
      <params/>
      <attribs>
         <combo attributeName="size" selection="2"/>
         <text attributeName="init">
            <sText><![CDATA[]]></sText>
         </text>
      </attribs>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="in" x="238" y="154">
      <params/>
      <attribs/>
   </obj>
   <obj type="table/write" uuid="ae85c48e960e33bd95ba61cce3832cf2a3a3de26" name="writeTbl" x="476" y="154">
      <params/>
      <attribs>
         <objref attributeName="table" obj="tbl"/>
      </attribs>
   </obj>
   <obj type="table/read interp" uuid="e650ab07d8398b3a0fc7b498a9580d4144727675" name="readTbl" x="616" y="154">
      <params/>
      <attribs>
         <objref attributeName="table" obj="tbl"/>
      </attribs>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="tableOut" x="756" y="154">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/changeIgnoreStale" uuid="8de16ccd-6686-4a4b-b83e-baa2ff747d6b" name="change" x="336" y="196">
      <params/>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="readTbl" outlet="o"/>
         <dest obj="tableOut" inlet="outlet"/>
      </net>
      <net>
         <source obj="change" outlet="Changed"/>
         <dest obj="writeTbl" inlet="trig"/>
      </net>
      <net>
         <source obj="in" outlet="inlet"/>
         <dest obj="change" inlet="val"/>
         <dest obj="writeTbl" inlet="v"/>
      </net>
      <net>
         <source obj="enable" outlet="inlet"/>
         <dest obj="change" inlet="enable"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>no</subpatchmode>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>-1928</x>
      <y>-91</y>
      <width>1723</width>
      <height>976</height>
   </windowPos>
</patch-1.0>