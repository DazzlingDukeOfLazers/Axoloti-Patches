<patch-1.0 appVersion="1.0.12">
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="pitch" x="42" y="28">
      <params/>
      <attribs/>
   </obj>
   <obj type="sss/osc/trisaw" uuid="8b2c4e31-8b02-4685-9284-513d7d252bb6" name="trisaw_1" x="462" y="70">
      <params>
         <bool32.tgl name="sine" value="0"/>
         <frac32.s.map name="pitch" onParent="true" value="-28.0"/>
         <frac32.s.map name="FM" value="9.0"/>
         <frac32.u.map name="slope" onParent="true" value="16.0"/>
         <frac32.s.map name="Swidth" onParent="true" value="-18.0"/>
         <frac32.s.map name="Slope" value="-27.0"/>
         <bool32.tgl name="AM" value="0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet a" uuid="abd8c5fd3b0524a6630f65cad6dc27f6c58e2a3e" name="outlet_1" x="602" y="84">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="Slope Base" x="42" y="140">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/+" uuid="44553fdc8628c67ab535845ed1be304ad6c9553b" name="+_1" x="266" y="140">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="Slope LFO Rate" x="42" y="196">
      <params/>
      <attribs/>
   </obj>
   <obj type="lfo/saw" uuid="ef2a162678b533c5e46c4e3c0decba17b1862d85" name="twerk" x="140" y="196">
      <params>
         <frac32.s.map name="pitch" onParent="true" value="-23.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="ctrl/toggle" uuid="42b8134fa729d54bfc8d62d6ef3fa99498c1de99" name="toggle_1" x="238" y="364">
      <params>
         <bool32.tgl name="b" value="1"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="FMW" x="42" y="378">
      <params/>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="twerk" outlet="wave"/>
         <dest obj="+_1" inlet="in2"/>
      </net>
      <net>
         <source obj="toggle_1" outlet="o"/>
         <dest obj="trisaw_1" inlet="active"/>
      </net>
      <net>
         <source obj="pitch" outlet="inlet"/>
         <dest obj="trisaw_1" inlet="pitch"/>
      </net>
      <net>
         <source obj="trisaw_1" outlet="out"/>
         <dest obj="outlet_1" inlet="outlet"/>
      </net>
      <net>
         <source obj="Slope LFO Rate" outlet="inlet"/>
         <dest obj="twerk" inlet="pitch"/>
      </net>
      <net>
         <source obj="FMW" outlet="inlet"/>
         <dest obj="trisaw_1" inlet="FMW"/>
      </net>
      <net>
         <source obj="+_1" outlet="out"/>
         <dest obj="trisaw_1" inlet="slope"/>
      </net>
      <net>
         <source obj="Slope Base" outlet="inlet"/>
         <dest obj="+_1" inlet="in1"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>polyphonic</subpatchmode>
      <MidiChannel>1</MidiChannel>
      <NPresets>8</NPresets>
      <NPresetEntries>32</NPresetEntries>
      <NModulationSources>8</NModulationSources>
      <NModulationTargetsPerSource>8</NModulationTargetsPerSource>
      <Saturate>false</Saturate>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>238</x>
      <y>55</y>
      <width>977</width>
      <height>725</height>
   </windowPos>
</patch-1.0>