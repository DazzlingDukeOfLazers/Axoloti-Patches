<patch-1.0 appVersion="1.0.12">
   <obj type="patch/inlet i" uuid="f11927f00c59219df0c50f73056aa19f125540b7" name="ActiveChannel" x="98" y="28">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet i" uuid="f11927f00c59219df0c50f73056aa19f125540b7" name="offset" x="98" y="98">
      <params/>
      <attribs/>
   </obj>
   <obj type="table/alloc 16b sdram" uuid="6d8eb0fd68f404cb5d14e7d4c8c146c8ccf09da1" name="tableFoo" x="854" y="168">
      <params/>
      <attribs>
         <combo attributeName="size" selection="8"/>
         <text attributeName="init">
            <sText><![CDATA[]]></sText>
         </text>
      </attribs>
   </obj>
   <obj type="patch/inlet i" uuid="f11927f00c59219df0c50f73056aa19f125540b7" name="page" x="84" y="182">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="AttackOut" x="1498" y="182">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="DecayOut" x="1498" y="224">
      <params/>
      <attribs/>
   </obj>
   <obj type="table/table8CH_SD" uuid="b63e44c0-705f-4b46-bc43-7deac444bd05" name="table8CH_SD_1" x="854" y="252">
      <params/>
      <attribs>
         <objref attributeName="table" obj="tableFoo"/>
      </attribs>
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
         <dest obj="table8CH_SD_1" inlet="offset"/>
      </net>
      <net>
         <source obj="PitchIn" outlet="inlet"/>
         <dest obj="table8CH_SD_1" inlet="v5"/>
      </net>
      <net>
         <source obj="ActiveChannel" outlet="inlet"/>
         <dest obj="table8CH_SD_1" inlet="activeChannel"/>
      </net>
      <net>
         <source obj="ChannelID" outlet="out"/>
         <dest obj="table8CH_SD_1" inlet="channelID"/>
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
      <net>
         <source obj="page" outlet="inlet"/>
         <dest obj="table8CH_SD_1" inlet="page"/>
      </net>
      <net>
         <source obj="saveToSD" outlet="inlet"/>
         <dest obj="table8CH_SD_1" inlet="trigSaveSD"/>
      </net>
      <net>
         <source obj="loadFromSD" outlet="inlet"/>
         <dest obj="table8CH_SD_1" inlet="trigLoadSD"/>
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