<patch-1.0 appVersion="1.0.12">
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="cyberDive" x="0" y="70">
      <params/>
      <attribs/>
   </obj>
   <obj type="osc/sine" uuid="6e094045cca76a9dbf7ebfa72e44e4700d2b3ba" name="cyberDrive" x="98" y="70">
      <params>
         <frac32.s.map name="pitch" onParent="true" value="-9.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="osc/sine" uuid="6e094045cca76a9dbf7ebfa72e44e4700d2b3ba" name="sine_4" x="224" y="70">
      <params>
         <frac32.s.map name="pitch" value="0.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet a" uuid="abd8c5fd3b0524a6630f65cad6dc27f6c58e2a3e" name="bell" x="364" y="70">
      <params/>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="cyberDrive" outlet="wave"/>
         <dest obj="sine_4" inlet="freq"/>
      </net>
      <net>
         <source obj="sine_4" outlet="wave"/>
         <dest obj="bell" inlet="outlet"/>
      </net>
      <net>
         <source obj="cyberDive" outlet="inlet"/>
         <dest obj="cyberDrive" inlet="pitch"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>polyphonic</subpatchmode>
      <MidiChannel>1</MidiChannel>
      <NPresets>8</NPresets>
      <NPresetEntries>32</NPresetEntries>
      <NModulationSources>8</NModulationSources>
      <NModulationTargetsPerSource>8</NModulationTargetsPerSource>
      <Author></Author>
      <Saturate>false</Saturate>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>990</x>
      <y>174</y>
      <width>400</width>
      <height>400</height>
   </windowPos>
</patch-1.0>