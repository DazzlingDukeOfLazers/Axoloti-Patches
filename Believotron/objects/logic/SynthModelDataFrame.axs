<patch-1.0 appVersion="1.0.12">
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="inlet_1" x="28" y="14">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="volumeIn" x="28" y="84">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/changedMemory" uuid="a60ab68c-da63-4e5a-b447-ecc98b1e0d04" name="volumeMem" x="182" y="84">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="volumeOut" x="392" y="84">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="pitchIn" x="28" y="154">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/changedMemory" uuid="a60ab68c-da63-4e5a-b447-ecc98b1e0d04" name="pitchMem" x="182" y="154">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="pitchOut" x="392" y="154">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="attackIn" x="28" y="224">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/changedMemory" uuid="a60ab68c-da63-4e5a-b447-ecc98b1e0d04" name="attackMem" x="182" y="224">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="attackOut" x="392" y="224">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="decayIn" x="28" y="294">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/changedMemory" uuid="a60ab68c-da63-4e5a-b447-ecc98b1e0d04" name="decayMem" x="182" y="294">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="decayOut" x="392" y="294">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="sustainIn" x="28" y="364">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/changedMemory" uuid="a60ab68c-da63-4e5a-b447-ecc98b1e0d04" name="sustainMem" x="182" y="364">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="sustainOut" x="392" y="364">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="releaseIn" x="28" y="434">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/changedMemory" uuid="a60ab68c-da63-4e5a-b447-ecc98b1e0d04" name="releaseMem" x="182" y="434">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="releaseOut" x="392" y="434">
      <params/>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="inlet_1" outlet="inlet"/>
         <dest obj="attackMem" inlet="enable"/>
         <dest obj="decayMem" inlet="enable"/>
         <dest obj="sustainMem" inlet="enable"/>
         <dest obj="releaseMem" inlet="enable"/>
         <dest obj="pitchMem" inlet="enable"/>
         <dest obj="volumeMem" inlet="enable"/>
      </net>
      <net>
         <source obj="attackIn" outlet="inlet"/>
         <dest obj="attackMem" inlet="in"/>
      </net>
      <net>
         <source obj="decayIn" outlet="inlet"/>
         <dest obj="decayMem" inlet="in"/>
      </net>
      <net>
         <source obj="attackMem" outlet="tableOut"/>
         <dest obj="attackOut" inlet="outlet"/>
      </net>
      <net>
         <source obj="sustainIn" outlet="inlet"/>
         <dest obj="sustainMem" inlet="in"/>
      </net>
      <net>
         <source obj="sustainMem" outlet="tableOut"/>
         <dest obj="sustainOut" inlet="outlet"/>
      </net>
      <net>
         <source obj="releaseIn" outlet="inlet"/>
         <dest obj="releaseMem" inlet="in"/>
      </net>
      <net>
         <source obj="releaseMem" outlet="tableOut"/>
         <dest obj="releaseOut" inlet="outlet"/>
      </net>
      <net>
         <source obj="decayMem" outlet="tableOut"/>
         <dest obj="decayOut" inlet="outlet"/>
      </net>
      <net>
         <source obj="pitchIn" outlet="inlet"/>
         <dest obj="pitchMem" inlet="in"/>
      </net>
      <net>
         <source obj="pitchMem" outlet="tableOut"/>
         <dest obj="pitchOut" inlet="outlet"/>
      </net>
      <net>
         <source obj="volumeIn" outlet="inlet"/>
         <dest obj="volumeMem" inlet="in"/>
      </net>
      <net>
         <source obj="volumeMem" outlet="tableOut"/>
         <dest obj="volumeOut" inlet="outlet"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>no</subpatchmode>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>-1324</x>
      <y>76</y>
      <width>892</width>
      <height>632</height>
   </windowPos>
</patch-1.0>