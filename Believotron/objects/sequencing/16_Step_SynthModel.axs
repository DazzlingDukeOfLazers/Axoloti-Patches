<patch-1.0 appVersion="1.0.12">
   <obj type="patch/inlet i" uuid="f11927f00c59219df0c50f73056aa19f125540b7" name="stepIn_" x="70" y="0">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/or 2" uuid="3805d3c84d30032a44fbdbe42d9a2988a1790a3e" name="or_1" x="434" y="28">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet i" uuid="f11927f00c59219df0c50f73056aa19f125540b7" name="stepOut_" x="70" y="42">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/change" uuid="96e39ae624c3f3c952cec4a95e1986ee0104f718" name="change_1" x="294" y="42">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/changedMemoryFile" uuid="61f6c474-ae4e-4fc7-80db-3bd21d8dd3d9" name="obj_7" x="616" y="70">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="VolumeOut" x="784" y="70">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet i" uuid="f11927f00c59219df0c50f73056aa19f125540b7" name="frame" x="70" y="98">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/doubleIndex" uuid="3b44eb68-01ef-4ba5-b6ee-cd6c736940da" name="doubleIndex_1" x="420" y="112">
      <params/>
      <attribs>
         <table attributeName="prefix" table="stepVolume"/>
         <table attributeName="suffix" table=".step"/>
      </attribs>
   </obj>
   <obj type="patch/inlet i" uuid="f11927f00c59219df0c50f73056aa19f125540b7" name="page" x="70" y="154">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/changedMemoryFile" uuid="61f6c474-ae4e-4fc7-80db-3bd21d8dd3d9" name="obj_8" x="616" y="196">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="PitchOut" x="784" y="196">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="saveToSD" x="70" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/doubleIndex" uuid="3b44eb68-01ef-4ba5-b6ee-cd6c736940da" name="doubleIndex_2" x="420" y="224">
      <params/>
      <attribs>
         <table attributeName="prefix" table="stepPitch"/>
         <table attributeName="suffix" table=".step"/>
      </attribs>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="loadFromSD" x="70" y="252">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="VolumeIn" x="70" y="308">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/changedMemoryFile" uuid="61f6c474-ae4e-4fc7-80db-3bd21d8dd3d9" name="obj_9" x="616" y="322">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="AttackOut" x="784" y="322">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/doubleIndex" uuid="3b44eb68-01ef-4ba5-b6ee-cd6c736940da" name="doubleIndex_3" x="420" y="350">
      <params/>
      <attribs>
         <table attributeName="prefix" table="stepAttack"/>
         <table attributeName="suffix" table=".step"/>
      </attribs>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="PitchIn" x="70" y="392">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/changedMemoryFile" uuid="61f6c474-ae4e-4fc7-80db-3bd21d8dd3d9" name="obj_10" x="616" y="448">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="DecayOut" x="784" y="448">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="AttackIn" x="70" y="462">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/doubleIndex" uuid="3b44eb68-01ef-4ba5-b6ee-cd6c736940da" name="doubleIndex_4" x="420" y="462">
      <params/>
      <attribs>
         <table attributeName="prefix" table="stepDecay"/>
         <table attributeName="suffix" table=".step"/>
      </attribs>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="DecayIn" x="70" y="532">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/changedMemoryFile" uuid="61f6c474-ae4e-4fc7-80db-3bd21d8dd3d9" name="obj_11" x="616" y="574">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="SustainOut" x="784" y="574">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/doubleIndex" uuid="3b44eb68-01ef-4ba5-b6ee-cd6c736940da" name="doubleIndex_5" x="420" y="588">
      <params/>
      <attribs>
         <table attributeName="prefix" table="stepSustain"/>
         <table attributeName="suffix" table=".step"/>
      </attribs>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="SustainIn" x="70" y="602">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="ReleaseIn" x="70" y="658">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/changedMemoryFile" uuid="61f6c474-ae4e-4fc7-80db-3bd21d8dd3d9" name="obj_12" x="616" y="700">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="ReleaseOut" x="784" y="700">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/doubleIndex" uuid="3b44eb68-01ef-4ba5-b6ee-cd6c736940da" name="doubleIndex_6" x="420" y="714">
      <params/>
      <attribs>
         <table attributeName="prefix" table="stepRelease"/>
         <table attributeName="suffix" table=".step"/>
      </attribs>
   </obj>
   <nets>
      <net>
         <source obj="VolumeIn" outlet="inlet"/>
         <dest obj="obj_7" inlet="in"/>
      </net>
      <net>
         <source obj="stepOut_" outlet="inlet"/>
         <dest obj="obj_7" inlet="stepOut"/>
         <dest obj="obj_8" inlet="stepOut"/>
         <dest obj="obj_9" inlet="stepOut"/>
         <dest obj="obj_10" inlet="stepOut"/>
         <dest obj="obj_11" inlet="stepOut"/>
         <dest obj="obj_12" inlet="stepOut"/>
      </net>
      <net>
         <source obj="obj_7" outlet="tableOut"/>
         <dest obj="VolumeOut" inlet="outlet"/>
      </net>
      <net>
         <source obj="stepIn_" outlet="inlet"/>
         <dest obj="obj_7" inlet="stepIn"/>
         <dest obj="obj_8" inlet="stepIn"/>
         <dest obj="obj_9" inlet="stepIn"/>
         <dest obj="obj_10" inlet="stepIn"/>
         <dest obj="obj_11" inlet="stepIn"/>
         <dest obj="obj_12" inlet="stepIn"/>
      </net>
      <net>
         <source obj="saveToSD" outlet="inlet"/>
         <dest obj="obj_7" inlet="trigSave"/>
         <dest obj="obj_8" inlet="trigSave"/>
         <dest obj="obj_9" inlet="trigSave"/>
         <dest obj="obj_10" inlet="trigSave"/>
         <dest obj="obj_11" inlet="trigSave"/>
         <dest obj="obj_12" inlet="trigSave"/>
      </net>
      <net>
         <source obj="loadFromSD" outlet="inlet"/>
         <dest obj="or_1" inlet="i2"/>
      </net>
      <net>
         <source obj="obj_8" outlet="tableOut"/>
         <dest obj="PitchOut" inlet="outlet"/>
      </net>
      <net>
         <source obj="AttackIn" outlet="inlet"/>
         <dest obj="obj_9" inlet="in"/>
      </net>
      <net>
         <source obj="DecayIn" outlet="inlet"/>
         <dest obj="obj_10" inlet="in"/>
      </net>
      <net>
         <source obj="SustainIn" outlet="inlet"/>
         <dest obj="obj_11" inlet="in"/>
      </net>
      <net>
         <source obj="ReleaseIn" outlet="inlet"/>
         <dest obj="obj_12" inlet="in"/>
      </net>
      <net>
         <source obj="obj_9" outlet="tableOut"/>
         <dest obj="AttackOut" inlet="outlet"/>
      </net>
      <net>
         <source obj="obj_10" outlet="tableOut"/>
         <dest obj="DecayOut" inlet="outlet"/>
      </net>
      <net>
         <source obj="obj_11" outlet="tableOut"/>
         <dest obj="SustainOut" inlet="outlet"/>
      </net>
      <net>
         <source obj="obj_12" outlet="tableOut"/>
         <dest obj="ReleaseOut" inlet="outlet"/>
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
         <dest obj="obj_7" inlet="filename"/>
      </net>
      <net>
         <source obj="doubleIndex_2" outlet="out"/>
         <dest obj="obj_8" inlet="filename"/>
      </net>
      <net>
         <source obj="doubleIndex_3" outlet="out"/>
         <dest obj="obj_9" inlet="filename"/>
      </net>
      <net>
         <source obj="doubleIndex_4" outlet="out"/>
         <dest obj="obj_10" inlet="filename"/>
      </net>
      <net>
         <source obj="doubleIndex_5" outlet="out"/>
         <dest obj="obj_11" inlet="filename"/>
      </net>
      <net>
         <source obj="doubleIndex_6" outlet="out"/>
         <dest obj="obj_12" inlet="filename"/>
      </net>
      <net>
         <source obj="PitchIn" outlet="inlet"/>
         <dest obj="obj_8" inlet="in"/>
      </net>
      <net>
         <source obj="change_1" outlet="trig"/>
         <dest obj="or_1" inlet="i1"/>
      </net>
      <net>
         <source obj="or_1" outlet="o"/>
         <dest obj="obj_7" inlet="trigLoad"/>
         <dest obj="obj_8" inlet="trigLoad"/>
         <dest obj="obj_9" inlet="trigLoad"/>
         <dest obj="obj_10" inlet="trigLoad"/>
         <dest obj="obj_11" inlet="trigLoad"/>
         <dest obj="obj_12" inlet="trigLoad"/>
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