<patch-1.0 appVersion="1.0.12">
   <obj type="patch/inlet i" uuid="f11927f00c59219df0c50f73056aa19f125540b7" name="stepIn_" x="56" y="0">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet i" uuid="f11927f00c59219df0c50f73056aa19f125540b7" name="stepOut_" x="56" y="42">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/changedMemoryFile" uuid="f30cfe81-0307-49c5-af04-2eb92776346c" name="obj_7" x="602" y="70">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="VolumeOut" x="770" y="70">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet i" uuid="f11927f00c59219df0c50f73056aa19f125540b7" name="frame" x="56" y="98">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/indexed" uuid="a28740deef67c39ffc65bd0f341a47c9b196f46" name="indexed_1" x="406" y="98">
      <params/>
      <attribs>
         <table attributeName="prefix" table="stepVolume"/>
         <table attributeName="suffix" table=".step"/>
      </attribs>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="saveToSD" x="56" y="154">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="loadFromSD" x="56" y="196">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/changedMemoryFile" uuid="f30cfe81-0307-49c5-af04-2eb92776346c" name="obj_8" x="602" y="196">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="PitchOut" x="770" y="196">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/indexed" uuid="a28740deef67c39ffc65bd0f341a47c9b196f46" name="indexed_2" x="406" y="224">
      <params/>
      <attribs>
         <table attributeName="prefix" table="stepPitch"/>
         <table attributeName="suffix" table=".step"/>
      </attribs>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="VolumeIn" x="56" y="252">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/changedMemoryFile" uuid="f30cfe81-0307-49c5-af04-2eb92776346c" name="obj_9" x="602" y="322">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="AttackOut" x="770" y="322">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="PitchIn" x="56" y="336">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/indexed" uuid="a28740deef67c39ffc65bd0f341a47c9b196f46" name="indexed_3" x="406" y="350">
      <params/>
      <attribs>
         <table attributeName="prefix" table="stepAttack"/>
         <table attributeName="suffix" table=".step"/>
      </attribs>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="AttackIn" x="56" y="406">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/changedMemoryFile" uuid="f30cfe81-0307-49c5-af04-2eb92776346c" name="obj_10" x="602" y="448">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="DecayOut" x="770" y="448">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="DecayIn" x="56" y="476">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/indexed" uuid="a28740deef67c39ffc65bd0f341a47c9b196f46" name="indexed_4" x="406" y="476">
      <params/>
      <attribs>
         <table attributeName="prefix" table="stepDecay"/>
         <table attributeName="suffix" table=".step"/>
      </attribs>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="SustainIn" x="56" y="546">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/changedMemoryFile" uuid="f30cfe81-0307-49c5-af04-2eb92776346c" name="obj_11" x="602" y="574">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="SustainOut" x="770" y="574">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="ReleaseIn" x="56" y="602">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/indexed" uuid="a28740deef67c39ffc65bd0f341a47c9b196f46" name="indexed_5" x="406" y="602">
      <params/>
      <attribs>
         <table attributeName="prefix" table="stepSustain"/>
         <table attributeName="suffix" table=".step"/>
      </attribs>
   </obj>
   <obj type="logic/changedMemoryFile" uuid="f30cfe81-0307-49c5-af04-2eb92776346c" name="obj_12" x="602" y="700">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="ReleaseOut" x="770" y="700">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/indexed" uuid="a28740deef67c39ffc65bd0f341a47c9b196f46" name="indexed_6" x="406" y="728">
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
         <source obj="indexed_1" outlet="out"/>
         <dest obj="obj_7" inlet="filename"/>
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
         <dest obj="obj_7" inlet="trigLoad"/>
         <dest obj="obj_8" inlet="trigLoad"/>
         <dest obj="obj_9" inlet="trigLoad"/>
         <dest obj="obj_10" inlet="trigLoad"/>
         <dest obj="obj_11" inlet="trigLoad"/>
         <dest obj="obj_12" inlet="trigLoad"/>
      </net>
      <net>
         <source obj="indexed_2" outlet="out"/>
         <dest obj="obj_8" inlet="filename"/>
      </net>
      <net>
         <source obj="PitchIn" outlet="inlet"/>
         <dest obj="obj_8" inlet="in"/>
      </net>
      <net>
         <source obj="obj_8" outlet="tableOut"/>
         <dest obj="PitchOut" inlet="outlet"/>
      </net>
      <net>
         <source obj="indexed_3" outlet="out"/>
         <dest obj="obj_9" inlet="filename"/>
      </net>
      <net>
         <source obj="indexed_4" outlet="out"/>
         <dest obj="obj_10" inlet="filename"/>
      </net>
      <net>
         <source obj="indexed_5" outlet="out"/>
         <dest obj="obj_11" inlet="filename"/>
      </net>
      <net>
         <source obj="indexed_6" outlet="out"/>
         <dest obj="obj_12" inlet="filename"/>
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
         <dest obj="indexed_1" inlet="index"/>
         <dest obj="indexed_2" inlet="index"/>
         <dest obj="indexed_3" inlet="index"/>
         <dest obj="indexed_4" inlet="index"/>
         <dest obj="indexed_5" inlet="index"/>
         <dest obj="indexed_6" inlet="index"/>
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