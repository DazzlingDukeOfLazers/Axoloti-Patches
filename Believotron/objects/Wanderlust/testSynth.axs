<patch-1.0 appVersion="1.0.12">
   <obj type="disp/i" uuid="5e35fd0c62d81e70017289250cf28edd26e19e4a" name="i_1" x="392" y="112">
      <params/>
      <attribs/>
   </obj>
   <obj type="midi/in/keyb" uuid="53b04874696932f38aceaa168bd5d9efb743716d" name="keyb_1" x="84" y="168">
      <params/>
      <attribs/>
   </obj>
   <obj type="osc/multiWave_dev" uuid="afcc705d-3fd6-4386-9ff1-822d779e4a74" name="obj_2" x="812" y="266">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet i" uuid="f11927f00c59219df0c50f73056aa19f125540b7" name="waveNum" x="98" y="336">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/+" uuid="44553fdc8628c67ab535845ed1be304ad6c9553b" name="+_1" x="490" y="336">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/+" uuid="44553fdc8628c67ab535845ed1be304ad6c9553b" name="+_2" x="588" y="336">
      <params/>
      <attribs/>
   </obj>
   <obj type="env/adsr_lean_gain" uuid="f0c526e4-6439-409c-85c8-603cc632eca3" name="adsr_lean_gain_1" x="1036" y="336">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet a" uuid="abd8c5fd3b0524a6630f65cad6dc27f6c58e2a3e" name="magic" x="1358" y="350">
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
   <obj type="gain/vca" uuid="a9f2dcd18043e2f47364e45cb8814f63c2a37c0d" name="vca_1" x="574" y="462">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="sustain" x="98" y="518">
      <params/>
      <attribs/>
   </obj>
   <obj type="osc/saw" uuid="739ecc36017ef3249479b8f01716b8bbfba9abc1" name="saw_1" x="434" y="518">
      <params>
         <frac32.s.map name="pitch" value="0.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="math/+" uuid="44553fdc8628c67ab535845ed1be304ad6c9553b" name="+_3" x="854" y="518">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="release" x="98" y="560">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="mod1" x="98" y="616">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial b" uuid="862e7d7f29093cb1ce4aed72244d118ad4d46692" name="dial_1" x="672" y="616">
      <params>
         <frac32.s.map name="value" value="64.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="mod2" x="98" y="672">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="freqModAmount" x="98" y="756">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="freqModPitch" x="98" y="812">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="PitchMod" x="98" y="868">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="volume" x="98" y="924">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/*" uuid="922423f2db9f222aa3e5ba095778288c446da47a" name="*_1" x="462" y="924">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="PitchLFOAmount" x="98" y="980">
      <params/>
      <attribs/>
   </obj>
   <obj type="sss/lfo/multiform" uuid="c1281771-92c6-4ec2-b3ca-9238129d7db6" name="multiform_1" x="336" y="980">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/and 2" uuid="c67031682f552aa0a80b23377495c51ea28a8c9c" name="and_1" x="238" y="994">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet i" uuid="f11927f00c59219df0c50f73056aa19f125540b7" name="PitchLFOWaveform" x="98" y="1022">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="PitchLFOFreq" x="98" y="1036">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/toggle" uuid="42b8134fa729d54bfc8d62d6ef3fa99498c1de99" name="PitchLFOSync" x="98" y="1092">
      <params>
         <bool32.tgl name="b" onParent="true" value="0"/>
      </params>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="keyb_1" outlet="note"/>
         <dest obj="i_1" inlet="in"/>
         <dest obj="+_1" inlet="in1"/>
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
         <source obj="volume" outlet="inlet"/>
         <dest obj="+_3" inlet="in1"/>
      </net>
      <net>
         <source obj="PitchMod" outlet="inlet"/>
         <dest obj="+_1" inlet="in2"/>
      </net>
      <net>
         <source obj="+_1" outlet="out"/>
         <dest obj="+_2" inlet="in1"/>
      </net>
      <net>
         <source obj="multiform_1" outlet="wave"/>
         <dest obj="*_1" inlet="b"/>
      </net>
      <net>
         <source obj="PitchLFOFreq" outlet="inlet"/>
         <dest obj="multiform_1" inlet="Hz"/>
      </net>
      <net>
         <source obj="*_1" outlet="result"/>
         <dest obj="+_2" inlet="in2"/>
      </net>
      <net>
         <source obj="PitchLFOAmount" outlet="inlet"/>
         <dest obj="*_1" inlet="a"/>
      </net>
      <net>
         <source obj="PitchLFOWaveform" outlet="inlet"/>
         <dest obj="multiform_1" inlet="waveform"/>
      </net>
      <net>
         <source obj="and_1" outlet="o"/>
         <dest obj="multiform_1" inlet="reset"/>
      </net>
      <net>
         <source obj="keyb_1" outlet="gate"/>
         <dest obj="and_1" inlet="i1"/>
         <dest obj="adsr_lean_gain_1" inlet="gate"/>
         <dest obj="obj_2" inlet="gate"/>
      </net>
      <net>
         <source obj="PitchLFOSync" outlet="o"/>
         <dest obj="and_1" inlet="i2"/>
      </net>
      <net>
         <source obj="adsr_lean_gain_1" outlet="o"/>
         <dest obj="magic" inlet="outlet"/>
      </net>
      <net>
         <source obj="saw_1" outlet="wave"/>
         <dest obj="vca_1" inlet="a"/>
      </net>
      <net>
         <source obj="freqModPitch" outlet="inlet"/>
         <dest obj="saw_1" inlet="pitch"/>
      </net>
      <net>
         <source obj="vca_1" outlet="o"/>
         <dest obj="obj_2" inlet="freq"/>
      </net>
      <net>
         <source obj="freqModAmount" outlet="inlet"/>
         <dest obj="vca_1" inlet="v"/>
      </net>
      <net>
         <source obj="waveNum" outlet="inlet"/>
         <dest obj="obj_2" inlet="waveNum"/>
      </net>
      <net>
         <source obj="+_2" outlet="out"/>
         <dest obj="obj_2" inlet="foo"/>
      </net>
      <net>
         <source obj="mod1" outlet="inlet"/>
         <dest obj="obj_2" inlet="mod1"/>
      </net>
      <net>
         <source obj="mod2" outlet="inlet"/>
         <dest obj="obj_2" inlet="mod2"/>
      </net>
      <net>
         <source obj="dial_1" outlet="out"/>
         <dest obj="+_3" inlet="in2"/>
      </net>
      <net>
         <source obj="+_3" outlet="out"/>
         <dest obj="adsr_lean_gain_1" inlet="v"/>
      </net>
      <net>
         <source obj="obj_2" outlet="magic"/>
         <dest obj="adsr_lean_gain_1" inlet="a2"/>
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
      <x>-3069</x>
      <y>61</y>
      <width>1407</width>
      <height>976</height>
   </windowPos>
</patch-1.0>