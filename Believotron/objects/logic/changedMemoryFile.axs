<patch-1.0 appVersion="1.0.12">
   <obj type="patch/inlet i" uuid="f11927f00c59219df0c50f73056aa19f125540b7" name="stepIn" x="56" y="28">
      <params/>
      <attribs/>
   </obj>
   <obj type="sss/table/primes" uuid="f77764d2-dc31-498c-b3aa-7177cc7cefa4" name="primes_1" x="518" y="56">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet i" uuid="f11927f00c59219df0c50f73056aa19f125540b7" name="stepOut" x="56" y="98">
      <params/>
      <attribs/>
   </obj>
   <obj type="table/write" uuid="50b8c8807ba1fc700ed79381c9360a982e0c3fb9" name="write_1" x="476" y="182">
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
   <obj type="string/c" uuid="4aa90a90c435a742ddfa152d232883fc5b2f1b3" name="c_1" x="588" y="336">
      <params/>
      <attribs>
         <table attributeName="str" table="afile"/>
      </attribs>
   </obj>
   <obj type="table/save" uuid="3e4108b607d56d9e1cd10abb898b58eea11e53b2" name="save_1" x="854" y="336">
      <params/>
      <attribs>
         <objref attributeName="table" obj="tbl"/>
      </attribs>
   </obj>
   <obj type="logic/changeIgnoreStale" uuid="8de16ccd-6686-4a4b-b83e-baa2ff747d6b" name="change" x="294" y="364">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="trigSave" x="42" y="434">
      <params/>
      <attribs/>
   </obj>
   <obj type="table/load" uuid="600cc22c6734d23a82620da1a14e78782a7e168e" name="load_1" x="854" y="504">
      <params/>
      <attribs>
         <objref attributeName="table" obj="tbl"/>
      </attribs>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="trigLoad" x="42" y="532">
      <params/>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="in" outlet="inlet"/>
         <dest obj="change" inlet="val"/>
         <dest obj="write_1" inlet="v"/>
      </net>
      <net>
         <source obj="change" outlet="Changed"/>
         <dest obj="write_1" inlet="trig"/>
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
         <dest obj="change" inlet="enable"/>
      </net>
      <net>
         <source obj="stepOut" outlet="inlet"/>
         <dest obj="read_1" inlet="a"/>
      </net>
      <net>
         <source obj="c_1" outlet="out"/>
         <dest obj="save_1" inlet="filename"/>
         <dest obj="load_1" inlet="filename"/>
      </net>
      <net>
         <source obj="trigSave" outlet="inlet"/>
         <dest obj="save_1" inlet="trig"/>
      </net>
      <net>
         <source obj="trigLoad" outlet="inlet"/>
         <dest obj="load_1" inlet="trig"/>
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