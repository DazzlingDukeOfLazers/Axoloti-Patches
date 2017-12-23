<patch-1.0 appVersion="1.0.12">
   <obj type="patch/inlet i" uuid="f11927f00c59219df0c50f73056aa19f125540b7" name="ActiveChannel" x="98" y="28">
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
         <combo attributeName="size" selection="2"/>
         <text attributeName="init">
            <sText><![CDATA[]]></sText>
         </text>
      </attribs>
   </obj>
   <obj type="logic/change" uuid="96e39ae624c3f3c952cec4a95e1986ee0104f718" name="change_1" x="322" y="42">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet i" uuid="f11927f00c59219df0c50f73056aa19f125540b7" name="offset" x="84" y="98">
      <params/>
      <attribs/>
   </obj>
   <obj type="table/alloc 16b sdram" uuid="6d8eb0fd68f404cb5d14e7d4c8c146c8ccf09da1" name="tbl1" x="714" y="98">
      <params/>
      <attribs>
         <combo attributeName="size" selection="2"/>
         <text attributeName="init">
            <sText><![CDATA[]]></sText>
         </text>
      </attribs>
   </obj>
   <obj type="math/+" uuid="b94a9b8e9adcb7d18868c0ee808a9b211b65578d" name="+_1" x="224" y="126">
      <params/>
      <attribs/>
   </obj>
   <obj type="table/read" uuid="65eb8d0f6a3344638de94c9882999b9af15510d0" name="read_1" x="490" y="140">
      <params/>
      <attribs>
         <objref attributeName="table" obj=""/>
      </attribs>
   </obj>
   <obj type="table/alloc 16b sdram" uuid="6d8eb0fd68f404cb5d14e7d4c8c146c8ccf09da1" name="foobear" x="714" y="168">
      <params/>
      <attribs>
         <combo attributeName="size" selection="2"/>
         <text attributeName="init">
            <sText><![CDATA[]]></sText>
         </text>
      </attribs>
   </obj>
   <obj type="patch/inlet i" uuid="f11927f00c59219df0c50f73056aa19f125540b7" name="page" x="84" y="182">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/==" uuid="deaf0d36642c57876c4101e86f8a0b6a06021ab2" name="==_1" x="266" y="196">
      <params/>
      <attribs/>
   </obj>
   <obj type="table/tableReadWriteIndexPage" uuid="b2f36c9f-a7de-4572-a943-dc8c7e645eef" name="carl" x="980" y="224">
      <params/>
      <attribs>
         <objref attributeName="table" obj="foobear"/>
         <table attributeName="prefix" table="atk"/>
         <table attributeName="suffix" table=".step"/>
      </attribs>
   </obj>
   <obj type="table/alloc 16b sdram" uuid="6d8eb0fd68f404cb5d14e7d4c8c146c8ccf09da1" name="tbl3" x="714" y="238">
      <params/>
      <attribs>
         <combo attributeName="size" selection="2"/>
         <text attributeName="init">
            <sText><![CDATA[]]></sText>
         </text>
      </attribs>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="AttackOut" x="1218" y="252">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="saveToSD" x="98" y="280">
      <params/>
      <attribs/>
   </obj>
   <obj type="table/alloc 16b sdram" uuid="6d8eb0fd68f404cb5d14e7d4c8c146c8ccf09da1" name="tbl4" x="714" y="308">
      <params/>
      <attribs>
         <combo attributeName="size" selection="2"/>
         <text attributeName="init">
            <sText><![CDATA[]]></sText>
         </text>
      </attribs>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="loadFromSD" x="98" y="322">
      <params/>
      <attribs/>
   </obj>
   <obj type="const/i" uuid="e202f44b2df17ae0b3e663b98ea6b14c8ff00408" name="i_1" x="854" y="336">
      <params/>
      <attribs>
         <spinner attributeName="value" value="0"/>
      </attribs>
   </obj>
   <obj type="table/alloc 16b sdram" uuid="6d8eb0fd68f404cb5d14e7d4c8c146c8ccf09da1" name="tbl5" x="714" y="378">
      <params/>
      <attribs>
         <combo attributeName="size" selection="2"/>
         <text attributeName="init">
            <sText><![CDATA[]]></sText>
         </text>
      </attribs>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="outlet_1" x="1288" y="392">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/i" uuid="a3786816db6ea5bc6ac4193a5cccdb2c83b83496" name="ChannelID" x="112" y="406">
      <params>
         <int32 name="value" onParent="true" value="0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="table/tableReadWriteIndexPage" uuid="b2f36c9f-a7de-4572-a943-dc8c7e645eef" name="tableReadWriteIndexPage_5" x="980" y="476">
      <params/>
      <attribs>
         <objref attributeName="table" obj="tbl3"/>
         <table attributeName="prefix" table="dec"/>
         <table attributeName="suffix" table=".step"/>
      </attribs>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="DecayOut" x="1232" y="490">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="AttackIn" x="98" y="532">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="DecayIn" x="98" y="602">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="SustainIn" x="98" y="672">
      <params/>
      <attribs/>
   </obj>
   <obj type="table/tableReadWriteIndexPage" uuid="b2f36c9f-a7de-4572-a943-dc8c7e645eef" name="tableReadWriteIndexPage_4" x="980" y="714">
      <params/>
      <attribs>
         <objref attributeName="table" obj="tbl4"/>
         <table attributeName="prefix" table="sus"/>
         <table attributeName="suffix" table=".step"/>
      </attribs>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="SustainOut" x="1176" y="714">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="ReleaseIn" x="98" y="728">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="VolumeIn" x="98" y="784">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="PitchIn" x="98" y="840">
      <params/>
      <attribs/>
   </obj>
   <obj type="table/tableReadWriteIndexPage" uuid="b2f36c9f-a7de-4572-a943-dc8c7e645eef" name="tableReadWriteIndexPage_3" x="980" y="952">
      <params/>
      <attribs>
         <objref attributeName="table" obj="tbl5"/>
         <table attributeName="prefix" table="rel"/>
         <table attributeName="suffix" table=".step"/>
      </attribs>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="ReleaseOut" x="1302" y="952">
      <params/>
      <attribs/>
   </obj>
   <obj type="table/tableReadWriteIndexPage" uuid="b2f36c9f-a7de-4572-a943-dc8c7e645eef" name="tableReadWriteIndexPage_2" x="980" y="1190">
      <params/>
      <attribs>
         <objref attributeName="table" obj="tbl0"/>
         <table attributeName="prefix" table="vol"/>
         <table attributeName="suffix" table=".step"/>
      </attribs>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="VolumeOut" x="1302" y="1190">
      <params/>
      <attribs/>
   </obj>
   <obj type="table/tableReadWriteIndexPage" uuid="b2f36c9f-a7de-4572-a943-dc8c7e645eef" name="tableReadWriteIndexPage_1" x="980" y="1442">
      <params/>
      <attribs>
         <objref attributeName="table" obj="tbl1"/>
         <table attributeName="prefix" table="pit"/>
         <table attributeName="suffix" table=".step"/>
      </attribs>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="PitchOut" x="1302" y="1470">
      <params/>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="VolumeIn" outlet="inlet"/>
         <dest obj="tableReadWriteIndexPage_2" inlet="v"/>
      </net>
      <net>
         <source obj="saveToSD" outlet="inlet"/>
         <dest obj="tableReadWriteIndexPage_1" inlet="trigSave"/>
         <dest obj="tableReadWriteIndexPage_2" inlet="trigSave"/>
         <dest obj="tableReadWriteIndexPage_3" inlet="trigSave"/>
         <dest obj="tableReadWriteIndexPage_4" inlet="trigSave"/>
         <dest obj="tableReadWriteIndexPage_5" inlet="trigSave"/>
         <dest obj="carl" inlet="trigSave"/>
      </net>
      <net>
         <source obj="loadFromSD" outlet="inlet"/>
         <dest obj="or_1" inlet="i2"/>
      </net>
      <net>
         <source obj="DecayIn" outlet="inlet"/>
         <dest obj="tableReadWriteIndexPage_5" inlet="v"/>
      </net>
      <net>
         <source obj="SustainIn" outlet="inlet"/>
         <dest obj="tableReadWriteIndexPage_4" inlet="v"/>
      </net>
      <net>
         <source obj="ReleaseIn" outlet="inlet"/>
         <dest obj="tableReadWriteIndexPage_3" inlet="v"/>
      </net>
      <net>
         <source obj="offset" outlet="inlet"/>
         <dest obj="change_1" inlet="in"/>
         <dest obj="+_1" inlet="in1"/>
      </net>
      <net>
         <source obj="page" outlet="inlet"/>
         <dest obj="tableReadWriteIndexPage_1" inlet="page"/>
         <dest obj="tableReadWriteIndexPage_2" inlet="page"/>
         <dest obj="tableReadWriteIndexPage_3" inlet="page"/>
         <dest obj="tableReadWriteIndexPage_4" inlet="page"/>
         <dest obj="tableReadWriteIndexPage_5" inlet="page"/>
         <dest obj="carl" inlet="page"/>
      </net>
      <net>
         <source obj="PitchIn" outlet="inlet"/>
         <dest obj="tableReadWriteIndexPage_1" inlet="v"/>
      </net>
      <net>
         <source obj="change_1" outlet="trig"/>
         <dest obj="or_1" inlet="i1"/>
      </net>
      <net>
         <source obj="or_1" outlet="o"/>
         <dest obj="tableReadWriteIndexPage_1" inlet="trigLoad"/>
         <dest obj="tableReadWriteIndexPage_2" inlet="trigLoad"/>
         <dest obj="tableReadWriteIndexPage_3" inlet="trigLoad"/>
         <dest obj="tableReadWriteIndexPage_4" inlet="trigLoad"/>
         <dest obj="tableReadWriteIndexPage_5" inlet="trigLoad"/>
         <dest obj="carl" inlet="trigLoad"/>
      </net>
      <net>
         <source obj="ActiveChannel" outlet="inlet"/>
         <dest obj="tableReadWriteIndexPage_1" inlet="activeChannel"/>
         <dest obj="tableReadWriteIndexPage_2" inlet="activeChannel"/>
         <dest obj="==_1" inlet="in1"/>
         <dest obj="tableReadWriteIndexPage_3" inlet="activeChannel"/>
         <dest obj="tableReadWriteIndexPage_4" inlet="activeChannel"/>
         <dest obj="tableReadWriteIndexPage_5" inlet="activeChannel"/>
         <dest obj="carl" inlet="activeChannel"/>
      </net>
      <net>
         <source obj="tableReadWriteIndexPage_2" outlet="o"/>
         <dest obj="VolumeOut" inlet="outlet"/>
      </net>
      <net>
         <source obj="tableReadWriteIndexPage_3" outlet="o"/>
         <dest obj="ReleaseOut" inlet="outlet"/>
      </net>
      <net>
         <source obj="tableReadWriteIndexPage_4" outlet="o"/>
         <dest obj="SustainOut" inlet="outlet"/>
      </net>
      <net>
         <source obj="tableReadWriteIndexPage_5" outlet="o"/>
         <dest obj="DecayOut" inlet="outlet"/>
      </net>
      <net>
         <source obj="carl" outlet="o"/>
         <dest obj="AttackOut" inlet="outlet"/>
      </net>
      <net>
         <source obj="ChannelID" outlet="out"/>
         <dest obj="tableReadWriteIndexPage_1" inlet="channelID"/>
         <dest obj="tableReadWriteIndexPage_2" inlet="channelID"/>
         <dest obj="+_1" inlet="in2"/>
         <dest obj="==_1" inlet="in2"/>
         <dest obj="tableReadWriteIndexPage_3" inlet="channelID"/>
         <dest obj="tableReadWriteIndexPage_4" inlet="channelID"/>
         <dest obj="tableReadWriteIndexPage_5" inlet="channelID"/>
         <dest obj="carl" inlet="channelID"/>
      </net>
      <net>
         <source obj="==_1" outlet="out"/>
         <dest obj="tableReadWriteIndexPage_1" inlet="enWr"/>
         <dest obj="tableReadWriteIndexPage_2" inlet="enWr"/>
         <dest obj="tableReadWriteIndexPage_3" inlet="enWr"/>
         <dest obj="tableReadWriteIndexPage_4" inlet="enWr"/>
         <dest obj="tableReadWriteIndexPage_5" inlet="enWr"/>
         <dest obj="carl" inlet="enWr"/>
      </net>
      <net>
         <source obj="i_1" outlet="out"/>
         <dest obj="tableReadWriteIndexPage_1" inlet="a"/>
         <dest obj="tableReadWriteIndexPage_2" inlet="a"/>
         <dest obj="tableReadWriteIndexPage_3" inlet="a"/>
         <dest obj="tableReadWriteIndexPage_4" inlet="a"/>
         <dest obj="tableReadWriteIndexPage_5" inlet="a"/>
         <dest obj="carl" inlet="a"/>
      </net>
      <net>
         <source obj="AttackIn" outlet="inlet"/>
         <dest obj="carl" inlet="v"/>
      </net>
      <net>
         <source obj="carl" outlet="hot"/>
         <dest obj="outlet_1" inlet="outlet"/>
      </net>
      <net>
         <source obj="+_1" outlet="out"/>
         <dest obj="tableReadWriteIndexPage_1" inlet="index"/>
         <dest obj="tableReadWriteIndexPage_2" inlet="index"/>
         <dest obj="tableReadWriteIndexPage_3" inlet="index"/>
         <dest obj="tableReadWriteIndexPage_4" inlet="index"/>
         <dest obj="tableReadWriteIndexPage_5" inlet="index"/>
         <dest obj="carl" inlet="index"/>
      </net>
      <net>
         <source obj="tableReadWriteIndexPage_1" outlet="o"/>
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