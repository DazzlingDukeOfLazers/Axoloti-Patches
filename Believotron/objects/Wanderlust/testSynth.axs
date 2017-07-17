<patch-1.0 appVersion="1.0.12">
   <obj type="disp/i" uuid="5e35fd0c62d81e70017289250cf28edd26e19e4a" name="i_1" x="392" y="112">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/dial b" uuid="9ffed04e6a3052d9001eda83bae7024cb6d17037" name="dial_3" x="280" y="126">
      <params/>
      <attribs/>
   </obj>
   <obj type="midi/in/keyb" uuid="53b04874696932f38aceaa168bd5d9efb743716d" name="keyb_1" x="84" y="168">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_1" x="462" y="182">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_2" x="462" y="252">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/dial p" uuid="44fd18b562e434b3230441681132dbeabb15cdc5" name="dial_5" x="280" y="266">
      <params/>
      <attribs/>
   </obj>
   <obj type="osc/sine" uuid="6e094045cca76a9dbf7ebfa72e44e4700d2b3ba" name="sine_1" x="812" y="350">
      <params>
         <frac32.s.map name="pitch" value="0.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="env/adsr_lean_gain" uuid="f0c526e4-6439-409c-85c8-603cc632eca3" name="adsr_lean_gain_1" x="1064" y="350">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet a" uuid="abd8c5fd3b0524a6630f65cad6dc27f6c58e2a3e" name="magic" x="1204" y="350">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/dial p" uuid="44fd18b562e434b3230441681132dbeabb15cdc5" name="dial_24" x="280" y="364">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="attack" x="98" y="392">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="decay" x="98" y="462">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="sustain" x="98" y="518">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="release" x="98" y="574">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="volume" x="98" y="630">
      <params/>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="keyb_1" outlet="note"/>
         <dest obj="dial_3" inlet="in"/>
         <dest obj="i_1" inlet="in"/>
         <dest obj="sine_1" inlet="pitch"/>
      </net>
      <net>
         <source obj="keyb_1" outlet="gate"/>
         <dest obj="bool_1" inlet="in"/>
         <dest obj="adsr_lean_gain_1" inlet="gate"/>
      </net>
      <net>
         <source obj="keyb_1" outlet="velocity"/>
         <dest obj="dial_5" inlet="in"/>
      </net>
      <net>
         <source obj="keyb_1" outlet="releaseVelocity"/>
         <dest obj="dial_24" inlet="in"/>
      </net>
      <net>
         <source obj="keyb_1" outlet="gate2"/>
         <dest obj="bool_2" inlet="in"/>
      </net>
      <net>
         <source obj="sine_1" outlet="wave"/>
         <dest obj="adsr_lean_gain_1" inlet="a2"/>
      </net>
      <net>
         <source obj="volume" outlet="inlet"/>
         <dest obj="adsr_lean_gain_1" inlet="v"/>
      </net>
      <net>
         <source obj="release" outlet="inlet"/>
         <dest obj="adsr_lean_gain_1" inlet="r"/>
      </net>
      <net>
         <source obj="sustain" outlet="inlet"/>
         <dest obj="adsr_lean_gain_1" inlet="s"/>
      </net>
      <net>
         <source obj="decay" outlet="inlet"/>
         <dest obj="adsr_lean_gain_1" inlet="d"/>
      </net>
      <net>
         <source obj="attack" outlet="inlet"/>
         <dest obj="adsr_lean_gain_1" inlet="a"/>
      </net>
      <net>
         <source obj="adsr_lean_gain_1" outlet="o"/>
         <dest obj="magic" inlet="outlet"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>polyphonic</subpatchmode>
      <MidiChannel>1</MidiChannel>
      <NPresets>8</NPresets>
      <NPresetEntries>32</NPresetEntries>
      <NModulationSources>8</NModulationSources>
      <NModulationTargetsPerSource>8</NModulationTargetsPerSource>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>-1928</x>
      <y>-79</y>
      <width>1723</width>
      <height>976</height>
   </windowPos>
</patch-1.0>