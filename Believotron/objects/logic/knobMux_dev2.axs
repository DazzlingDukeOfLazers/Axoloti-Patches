<patch-1.0 appVersion="1.0.12">
   <obj type="patch/inlet i" uuid="f11927f00c59219df0c50f73056aa19f125540b7" name="ActiveChannel" x="98" y="28">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/or 2" uuid="3805d3c84d30032a44fbdbe42d9a2988a1790a3e" name="or_1" x="462" y="28">
      <params/>
      <attribs/>
   </obj>
   <obj type="table/alloc 16b sdram" uuid="6d8eb0fd68f404cb5d14e7d4c8c146c8ccf09da1" name="tableFoo" x="616" y="28">
      <params/>
      <attribs>
         <combo attributeName="size" selection="8"/>
         <text attributeName="init">
            <sText><![CDATA[]]></sText>
         </text>
      </attribs>
   </obj>
   <obj type="logic/change" uuid="96e39ae624c3f3c952cec4a95e1986ee0104f718" name="change_1" x="322" y="42">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet i" uuid="f11927f00c59219df0c50f73056aa19f125540b7" name="offset" x="112" y="98">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/+" uuid="b94a9b8e9adcb7d18868c0ee808a9b211b65578d" name="+_1" x="224" y="126">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet i" uuid="f11927f00c59219df0c50f73056aa19f125540b7" name="page" x="84" y="182">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="AttackOut" x="1498" y="182">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/==" uuid="deaf0d36642c57876c4101e86f8a0b6a06021ab2" name="==_1" x="266" y="196">
      <params/>
      <attribs/>
   </obj>
   <obj type="table/table8CH_SD" uuid="b63e44c0-705f-4b46-bc43-7deac444bd05" name="table8CH_SD_1" x="840" y="210">
      <params/>
      <attribs>
         <objref attributeName="table" obj="tableFoo"/>
      </attribs>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="DecayOut" x="1498" y="224">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="SustainOut" x="1498" y="266">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="saveToSD" x="98" y="280">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="ReleaseOut" x="1498" y="308">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="loadFromSD" x="98" y="322">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="VolumeOut" x="1498" y="350">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="PitchOut" x="1498" y="392">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/i" uuid="a3786816db6ea5bc6ac4193a5cccdb2c83b83496" name="ChannelID" x="112" y="406">
      <params>
         <int32 name="value" onParent="true" value="0"/>
      </params>
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
   <nets>
      <net>
         <source obj="VolumeIn" outlet="inlet"/>
         <dest obj="table8CH_SD_1" inlet="v4"/>
      </net>
      <net>
         <source obj="loadFromSD" outlet="inlet"/>
         <dest obj="or_1" inlet="i2"/>
      </net>
      <net>
         <source obj="DecayIn" outlet="inlet"/>
         <dest obj="table8CH_SD_1" inlet="v1"/>
      </net>
      <net>
         <source obj="SustainIn" outlet="inlet"/>
         <dest obj="table8CH_SD_1" inlet="v2"/>
      </net>
      <net>
         <source obj="ReleaseIn" outlet="inlet"/>
         <dest obj="table8CH_SD_1" inlet="v3"/>
      </net>
      <net>
         <source obj="offset" outlet="inlet"/>
         <dest obj="change_1" inlet="in"/>
         <dest obj="+_1" inlet="in1"/>
         <dest obj="table8CH_SD_1" inlet="offset"/>
      </net>
      <net>
         <source obj="PitchIn" outlet="inlet"/>
         <dest obj="table8CH_SD_1" inlet="v5"/>
      </net>
      <net>
         <source obj="change_1" outlet="trig"/>
         <dest obj="or_1" inlet="i1"/>
      </net>
      <net>
         <source obj="ActiveChannel" outlet="inlet"/>
         <dest obj="==_1" inlet="in1"/>
         <dest obj="table8CH_SD_1" inlet="activeChannel"/>
      </net>
      <net>
         <source obj="ChannelID" outlet="out"/>
         <dest obj="+_1" inlet="in2"/>
         <dest obj="==_1" inlet="in2"/>
         <dest obj="table8CH_SD_1" inlet="channelID"/>
      </net>
      <net>
         <source obj="==_1" outlet="out"/>
         <dest obj="table8CH_SD_1" inlet="write"/>
      </net>
      <net>
         <source obj="AttackIn" outlet="inlet"/>
         <dest obj="table8CH_SD_1" inlet="v0"/>
      </net>
      <net>
         <source obj="table8CH_SD_1" outlet="v0"/>
         <dest obj="AttackOut" inlet="outlet"/>
      </net>
      <net>
         <source obj="table8CH_SD_1" outlet="v1"/>
         <dest obj="DecayOut" inlet="outlet"/>
      </net>
      <net>
         <source obj="table8CH_SD_1" outlet="v2"/>
         <dest obj="SustainOut" inlet="outlet"/>
      </net>
      <net>
         <source obj="table8CH_SD_1" outlet="v3"/>
         <dest obj="ReleaseOut" inlet="outlet"/>
      </net>
      <net>
         <source obj="table8CH_SD_1" outlet="v4"/>
         <dest obj="VolumeOut" inlet="outlet"/>
      </net>
      <net>
         <source obj="table8CH_SD_1" outlet="v5"/>
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