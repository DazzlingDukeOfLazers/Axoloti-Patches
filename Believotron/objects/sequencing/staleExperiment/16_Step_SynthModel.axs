<patch-1.0 appVersion="1.0.12">
   <obj type="patch/inlet i" uuid="f11927f00c59219df0c50f73056aa19f125540b7" name="step" x="98" y="28">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/or 2" uuid="3805d3c84d30032a44fbdbe42d9a2988a1790a3e" name="or_1" x="462" y="28">
      <params/>
      <attribs/>
   </obj>
   <obj type="table/alloc 16b sdram" uuid="6d8eb0fd68f404cb5d14e7d4c8c146c8ccf09da1" name="tbl0" x="714" y="28">
      <params/>
      <attribs>
         <combo attributeName="size" selection="16"/>
         <text attributeName="init">
            <sText><![CDATA[]]></sText>
         </text>
      </attribs>
   </obj>
   <obj type="logic/change" uuid="96e39ae624c3f3c952cec4a95e1986ee0104f718" name="change_1" x="322" y="42">
      <params/>
      <attribs/>
   </obj>
   <obj type="table/tableReadWrite" uuid="80bf0332-3574-4c01-beb7-098c3454b662" name="tableReadWrite_1" x="994" y="70">
      <params/>
      <attribs>
         <objref attributeName="table" obj="tbl0"/>
      </attribs>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="VolumeOut" x="1190" y="84">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet i" uuid="f11927f00c59219df0c50f73056aa19f125540b7" name="frame" x="98" y="98">
      <params/>
      <attribs/>
   </obj>
   <obj type="table/alloc 16b sdram" uuid="6d8eb0fd68f404cb5d14e7d4c8c146c8ccf09da1" name="tbl1" x="714" y="98">
      <params/>
      <attribs>
         <combo attributeName="size" selection="16"/>
         <text attributeName="init">
            <sText><![CDATA[]]></sText>
         </text>
      </attribs>
   </obj>
   <obj type="string/doubleIndex" uuid="3b44eb68-01ef-4ba5-b6ee-cd6c736940da" name="doubleIndex_1" x="448" y="112">
      <params/>
      <attribs>
         <table attributeName="prefix" table="vol"/>
         <table attributeName="suffix" table=".step"/>
      </attribs>
   </obj>
   <obj type="patch/inlet i" uuid="f11927f00c59219df0c50f73056aa19f125540b7" name="page" x="98" y="154">
      <params/>
      <attribs/>
   </obj>
   <obj type="table/alloc 16b sdram" uuid="6d8eb0fd68f404cb5d14e7d4c8c146c8ccf09da1" name="tbl2" x="714" y="168">
      <params/>
      <attribs>
         <combo attributeName="size" selection="16"/>
         <text attributeName="init">
            <sText><![CDATA[]]></sText>
         </text>
      </attribs>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="PitchOut" x="1190" y="196">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="enableWr" x="98" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="table/tableReadWrite" uuid="80bf0332-3574-4c01-beb7-098c3454b662" name="tableReadWrite_2" x="994" y="210">
      <params/>
      <attribs>
         <objref attributeName="table" obj="tbl1"/>
      </attribs>
   </obj>
   <obj type="string/doubleIndex" uuid="3b44eb68-01ef-4ba5-b6ee-cd6c736940da" name="doubleIndex_2" x="448" y="224">
      <params/>
      <attribs>
         <table attributeName="prefix" table="pit"/>
         <table attributeName="suffix" table=".step"/>
      </attribs>
   </obj>
   <obj type="table/alloc 16b sdram" uuid="6d8eb0fd68f404cb5d14e7d4c8c146c8ccf09da1" name="tbl3" x="714" y="238">
      <params/>
      <attribs>
         <combo attributeName="size" selection="16"/>
         <text attributeName="init">
            <sText><![CDATA[]]></sText>
         </text>
      </attribs>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="saveToSD" x="98" y="280">
      <params/>
      <attribs/>
   </obj>
   <obj type="table/alloc 16b sdram" uuid="6d8eb0fd68f404cb5d14e7d4c8c146c8ccf09da1" name="tbl4" x="714" y="308">
      <params/>
      <attribs>
         <combo attributeName="size" selection="16"/>
         <text attributeName="init">
            <sText><![CDATA[]]></sText>
         </text>
      </attribs>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="loadFromSD" x="98" y="322">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/doubleIndex" uuid="3b44eb68-01ef-4ba5-b6ee-cd6c736940da" name="doubleIndex_3" x="448" y="350">
      <params/>
      <attribs>
         <table attributeName="prefix" table="atk"/>
         <table attributeName="suffix" table=".step"/>
      </attribs>
   </obj>
   <obj type="table/tableReadWrite" uuid="80bf0332-3574-4c01-beb7-098c3454b662" name="tableReadWrite_3" x="994" y="350">
      <params/>
      <attribs>
         <objref attributeName="table" obj="tbl2"/>
      </attribs>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="AttackOut" x="1190" y="364">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="VolumeIn" x="98" y="378">
      <params/>
      <attribs/>
   </obj>
   <obj type="table/alloc 16b sdram" uuid="6d8eb0fd68f404cb5d14e7d4c8c146c8ccf09da1" name="tbl5" x="714" y="378">
      <params/>
      <attribs>
         <combo attributeName="size" selection="16"/>
         <text attributeName="init">
            <sText><![CDATA[]]></sText>
         </text>
      </attribs>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="PitchIn" x="98" y="462">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/doubleIndex" uuid="3b44eb68-01ef-4ba5-b6ee-cd6c736940da" name="doubleIndex_4" x="448" y="462">
      <params/>
      <attribs>
         <table attributeName="prefix" table="dec"/>
         <table attributeName="suffix" table=".step"/>
      </attribs>
   </obj>
   <obj type="table/tableReadWrite" uuid="80bf0332-3574-4c01-beb7-098c3454b662" name="tableReadWrite_4" x="994" y="490">
      <params/>
      <attribs>
         <objref attributeName="table" obj="tbl3"/>
      </attribs>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="DecayOut" x="1190" y="490">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="AttackIn" x="98" y="532">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/doubleIndex" uuid="3b44eb68-01ef-4ba5-b6ee-cd6c736940da" name="doubleIndex_5" x="448" y="588">
      <params/>
      <attribs>
         <table attributeName="prefix" table="sus"/>
         <table attributeName="suffix" table=".step"/>
      </attribs>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="DecayIn" x="98" y="602">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="SustainOut" x="1190" y="616">
      <params/>
      <attribs/>
   </obj>
   <obj type="table/tableReadWrite" uuid="80bf0332-3574-4c01-beb7-098c3454b662" name="tableReadWrite_5" x="994" y="630">
      <params/>
      <attribs>
         <objref attributeName="table" obj="tbl4"/>
      </attribs>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="SustainIn" x="98" y="672">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/doubleIndex" uuid="3b44eb68-01ef-4ba5-b6ee-cd6c736940da" name="doubleIndex_6" x="448" y="714">
      <params/>
      <attribs>
         <table attributeName="prefix" table="rel"/>
         <table attributeName="suffix" table=".step"/>
      </attribs>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="ReleaseIn" x="98" y="728">
      <params/>
      <attribs/>
   </obj>
   <obj type="table/tableReadWrite" uuid="80bf0332-3574-4c01-beb7-098c3454b662" name="tableReadWrite_6" x="994" y="770">
      <params/>
      <attribs>
         <objref attributeName="table" obj="tbl5"/>
      </attribs>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="ReleaseOut" x="1232" y="910">
      <params/>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="VolumeIn" outlet="inlet"/>
         <dest obj="tableReadWrite_1" inlet="v"/>
      </net>
      <net>
         <source obj="saveToSD" outlet="inlet"/>
         <dest obj="tableReadWrite_1" inlet="trigSave"/>
         <dest obj="tableReadWrite_2" inlet="trigSave"/>
         <dest obj="tableReadWrite_3" inlet="trigSave"/>
         <dest obj="tableReadWrite_4" inlet="trigSave"/>
         <dest obj="tableReadWrite_5" inlet="trigSave"/>
         <dest obj="tableReadWrite_6" inlet="trigSave"/>
      </net>
      <net>
         <source obj="loadFromSD" outlet="inlet"/>
         <dest obj="or_1" inlet="i2"/>
      </net>
      <net>
         <source obj="DecayIn" outlet="inlet"/>
         <dest obj="tableReadWrite_4" inlet="v"/>
      </net>
      <net>
         <source obj="SustainIn" outlet="inlet"/>
         <dest obj="tableReadWrite_5" inlet="v"/>
      </net>
      <net>
         <source obj="ReleaseIn" outlet="inlet"/>
         <dest obj="tableReadWrite_6" inlet="v"/>
      </net>
      <net>
         <source obj="frame" outlet="inlet"/>
         <dest obj="doubleIndex_1" inlet="index"/>
         <dest obj="doubleIndex_2" inlet="index"/>
         <dest obj="doubleIndex_3" inlet="index"/>
         <dest obj="doubleIndex_4" inlet="index"/>
         <dest obj="doubleIndex_5" inlet="index"/>
         <dest obj="doubleIndex_6" inlet="index"/>
         <dest obj="change_1" inlet="in"/>
      </net>
      <net>
         <source obj="page" outlet="inlet"/>
         <dest obj="doubleIndex_1" inlet="page"/>
         <dest obj="doubleIndex_2" inlet="page"/>
         <dest obj="doubleIndex_3" inlet="page"/>
         <dest obj="doubleIndex_4" inlet="page"/>
         <dest obj="doubleIndex_5" inlet="page"/>
         <dest obj="doubleIndex_6" inlet="page"/>
      </net>
      <net>
         <source obj="doubleIndex_1" outlet="out"/>
         <dest obj="tableReadWrite_1" inlet="filename"/>
      </net>
      <net>
         <source obj="doubleIndex_2" outlet="out"/>
         <dest obj="tableReadWrite_2" inlet="filename"/>
      </net>
      <net>
         <source obj="doubleIndex_3" outlet="out"/>
         <dest obj="tableReadWrite_3" inlet="filename"/>
      </net>
      <net>
         <source obj="doubleIndex_6" outlet="out"/>
         <dest obj="tableReadWrite_6" inlet="filename"/>
      </net>
      <net>
         <source obj="PitchIn" outlet="inlet"/>
         <dest obj="tableReadWrite_2" inlet="v"/>
         <dest obj="tableReadWrite_3" inlet="v"/>
      </net>
      <net>
         <source obj="change_1" outlet="trig"/>
         <dest obj="or_1" inlet="i1"/>
      </net>
      <net>
         <source obj="or_1" outlet="o"/>
         <dest obj="tableReadWrite_1" inlet="trigLoad"/>
         <dest obj="tableReadWrite_2" inlet="trigLoad"/>
         <dest obj="tableReadWrite_3" inlet="trigLoad"/>
         <dest obj="tableReadWrite_4" inlet="trigLoad"/>
         <dest obj="tableReadWrite_5" inlet="trigLoad"/>
         <dest obj="tableReadWrite_6" inlet="trigLoad"/>
      </net>
      <net>
         <source obj="enableWr" outlet="inlet"/>
         <dest obj="tableReadWrite_1" inlet="enWr"/>
         <dest obj="tableReadWrite_2" inlet="enWr"/>
         <dest obj="tableReadWrite_3" inlet="enWr"/>
         <dest obj="tableReadWrite_4" inlet="enWr"/>
         <dest obj="tableReadWrite_5" inlet="enWr"/>
         <dest obj="tableReadWrite_6" inlet="enWr"/>
      </net>
      <net>
         <source obj="doubleIndex_5" outlet="out"/>
         <dest obj="tableReadWrite_5" inlet="filename"/>
      </net>
      <net>
         <source obj="doubleIndex_4" outlet="out"/>
         <dest obj="tableReadWrite_4" inlet="filename"/>
      </net>
      <net>
         <source obj="step" outlet="inlet"/>
         <dest obj="tableReadWrite_1" inlet="a"/>
         <dest obj="tableReadWrite_2" inlet="a"/>
         <dest obj="tableReadWrite_3" inlet="a"/>
         <dest obj="tableReadWrite_4" inlet="a"/>
         <dest obj="tableReadWrite_5" inlet="a"/>
         <dest obj="tableReadWrite_6" inlet="a"/>
      </net>
      <net>
         <source obj="tableReadWrite_1" outlet="o"/>
         <dest obj="VolumeOut" inlet="outlet"/>
      </net>
      <net>
         <source obj="tableReadWrite_6" outlet="o"/>
         <dest obj="ReleaseOut" inlet="outlet"/>
      </net>
      <net>
         <source obj="tableReadWrite_5" outlet="o"/>
         <dest obj="SustainOut" inlet="outlet"/>
      </net>
      <net>
         <source obj="tableReadWrite_4" outlet="o"/>
         <dest obj="DecayOut" inlet="outlet"/>
      </net>
      <net>
         <source obj="tableReadWrite_3" outlet="o"/>
         <dest obj="AttackOut" inlet="outlet"/>
      </net>
      <net>
         <source obj="tableReadWrite_2" outlet="o"/>
         <dest obj="PitchOut" inlet="outlet"/>
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