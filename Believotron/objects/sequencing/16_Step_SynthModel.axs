<patch-1.0 appVersion="1.0.12">
   <obj type="patch/inlet i" uuid="f11927f00c59219df0c50f73056aa19f125540b7" name="inlet_1" x="56" y="0">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet i" uuid="f11927f00c59219df0c50f73056aa19f125540b7" name="stepOut_" x="56" y="42">
      <params/>
      <attribs/>
   </obj>
   <obj type="changedMemory" uuid="54c1707e-8643-4296-8eb4-60370c4dbaa0" name="changedMemory_1" x="406" y="70">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="VolumeOut" x="532" y="70">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="VolumeIn" x="56" y="84">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="PitchIn" x="56" y="154">
      <params/>
      <attribs/>
   </obj>
   <obj type="changedMemory" uuid="54c1707e-8643-4296-8eb4-60370c4dbaa0" name="changedMemory_2" x="406" y="168">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="PitchOut" x="532" y="168">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="AttackIn" x="56" y="224">
      <params/>
      <attribs/>
   </obj>
   <obj type="changedMemory" uuid="54c1707e-8643-4296-8eb4-60370c4dbaa0" name="changedMemory_3" x="406" y="280">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="AttackOut" x="532" y="280">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="DecayIn" x="56" y="294">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="SustainIn" x="56" y="364">
      <params/>
      <attribs/>
   </obj>
   <obj type="changedMemory" uuid="54c1707e-8643-4296-8eb4-60370c4dbaa0" name="changedMemory_4" x="406" y="364">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="DecayOut" x="532" y="364">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="ReleaseIn" x="56" y="420">
      <params/>
      <attribs/>
   </obj>
   <obj type="changedMemory" uuid="54c1707e-8643-4296-8eb4-60370c4dbaa0" name="changedMemory_5" x="406" y="462">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="SustainOut" x="532" y="462">
      <params/>
      <attribs/>
   </obj>
   <obj type="changedMemory" uuid="54c1707e-8643-4296-8eb4-60370c4dbaa0" name="changedMemory_6" x="406" y="560">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="ReleaseOut" x="532" y="560">
      <params/>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="changedMemory_1" outlet="tableOut"/>
         <dest obj="VolumeOut" inlet="outlet"/>
      </net>
      <net>
         <source obj="changedMemory_2" outlet="tableOut"/>
         <dest obj="PitchOut" inlet="outlet"/>
      </net>
      <net>
         <source obj="changedMemory_3" outlet="tableOut"/>
         <dest obj="AttackOut" inlet="outlet"/>
      </net>
      <net>
         <source obj="changedMemory_4" outlet="tableOut"/>
         <dest obj="DecayOut" inlet="outlet"/>
      </net>
      <net>
         <source obj="changedMemory_5" outlet="tableOut"/>
         <dest obj="SustainOut" inlet="outlet"/>
      </net>
      <net>
         <source obj="changedMemory_6" outlet="tableOut"/>
         <dest obj="ReleaseOut" inlet="outlet"/>
      </net>
      <net>
         <source obj="VolumeIn" outlet="inlet"/>
         <dest obj="changedMemory_1" inlet="in"/>
      </net>
      <net>
         <source obj="PitchIn" outlet="inlet"/>
         <dest obj="changedMemory_2" inlet="in"/>
      </net>
      <net>
         <source obj="AttackIn" outlet="inlet"/>
         <dest obj="changedMemory_3" inlet="in"/>
      </net>
      <net>
         <source obj="DecayIn" outlet="inlet"/>
         <dest obj="changedMemory_4" inlet="in"/>
      </net>
      <net>
         <source obj="SustainIn" outlet="inlet"/>
         <dest obj="changedMemory_5" inlet="in"/>
      </net>
      <net>
         <source obj="ReleaseIn" outlet="inlet"/>
         <dest obj="changedMemory_6" inlet="in"/>
      </net>
      <net>
         <source obj="inlet_1" outlet="inlet"/>
         <dest obj="changedMemory_1" inlet="stepIn"/>
         <dest obj="changedMemory_2" inlet="stepIn"/>
         <dest obj="changedMemory_3" inlet="stepIn"/>
         <dest obj="changedMemory_4" inlet="stepIn"/>
         <dest obj="changedMemory_5" inlet="stepIn"/>
         <dest obj="changedMemory_6" inlet="stepIn"/>
      </net>
      <net>
         <source obj="stepOut_" outlet="inlet"/>
         <dest obj="changedMemory_1" inlet="stepOut"/>
         <dest obj="changedMemory_2" inlet="stepOut"/>
         <dest obj="changedMemory_3" inlet="stepOut"/>
         <dest obj="changedMemory_4" inlet="stepOut"/>
         <dest obj="changedMemory_5" inlet="stepOut"/>
         <dest obj="changedMemory_6" inlet="stepOut"/>
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