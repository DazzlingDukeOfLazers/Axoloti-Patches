<patch-1.0 appVersion="1.0.12">
   <obj type="ctrl/dial p" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="dial_7" x="0" y="0">
      <params>
         <frac32.u.map name="value" value="64.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="timer/pulselength" uuid="ca68725237d8ba8407773340801660a9fd9b0dba" name="pulselength_1" x="588" y="0">
      <params>
         <frac32.s.map name="delay" value="14.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="logic/or 2" uuid="3805d3c84d30032a44fbdbe42d9a2988a1790a3e" name="or_5" x="1176" y="28">
      <params/>
      <attribs/>
   </obj>
   <obj type="Wanderlust/Volume Out" uuid="4c32af6c-47e2-4e74-8b97-37dfb4d76913" name="obj_4" x="1890" y="56">
      <params>
         <bool32.tgl name="Enable Vol Knob" value="0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="mix/mix 4" uuid="e6f9a0cc7aadc1b89516143cf1ccb79b3538d05a" name="mix_1" x="1764" y="70">
      <params>
         <frac32.u.map name="gain1" value="32.0"/>
         <frac32.u.map name="gain2" value="32.0"/>
         <frac32.u.map name="gain3" value="32.0"/>
         <frac32.u.map name="gain4" value="32.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="instruments/ADSR OSC" uuid="8967b687-af04-43ec-aa19-e4441e692ab0" name="obj_2" x="1302" y="84">
      <params/>
      <attribs/>
   </obj>
   <obj type="const/i" uuid="e202f44b2df17ae0b3e663b98ea6b14c8ff00408" name="i_7" x="756" y="98">
      <params/>
      <attribs>
         <spinner attributeName="value" value="0"/>
      </attribs>
   </obj>
   <obj type="Wanderlust/Wanderlust_beta1" uuid="c334aa4f-471d-4f06-8408-f87234bd20ed" name="obj_1" x="140" y="112">
      <params>
         <bool32.tgl name="Reverse Knobs" value="1"/>
         <bool32.tgl name="Rev Padrow Top" value="0"/>
         <bool32.tgl name="Rev Padrow Bottom" value="0"/>
         <int32 name="LED Mode" value="2"/>
      </params>
      <attribs/>
   </obj>
   <obj type="ctrl/button" uuid="ef3d13774349df85aa9bfecf30dbc91ab8488b3f" name="save" x="490" y="112">
      <params>
         <bool32.mom name="b" value="0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="16_Step_SynthModel" uuid="4552610c-2903-4a7f-8845-1f0aa123128c" name="16_Step_SynthModel_1" x="966" y="112">
      <params/>
      <attribs/>
   </obj>
   <obj type="drj/math/== const i" uuid="36ae23539d64bc2fb798a1b4a65cf9dda17a1952" name="==_2" x="686" y="168">
      <params/>
      <attribs>
         <spinner attributeName="value" value="0"/>
      </attribs>
   </obj>
   <obj type="ctrl/button" uuid="ef3d13774349df85aa9bfecf30dbc91ab8488b3f" name="load" x="490" y="182">
      <params>
         <bool32.mom name="b" value="0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="ctrl/i" uuid="a3786816db6ea5bc6ac4193a5cccdb2c83b83496" name="i_3" x="28" y="196">
      <params>
         <int32 name="value" value="3"/>
      </params>
      <attribs/>
   </obj>
   <obj type="logic/KnobRowColumnSel16x4" uuid="092e2fbc-d0db-44f9-8c3e-437598599373" name="obj_5" x="364" y="308">
      <params/>
      <attribs/>
   </obj>
   <obj type="drj/math/== const i" uuid="36ae23539d64bc2fb798a1b4a65cf9dda17a1952" name="==_3" x="700" y="336">
      <params/>
      <attribs>
         <spinner attributeName="value" value="1"/>
      </attribs>
   </obj>
   <obj type="logic/or 2" uuid="3805d3c84d30032a44fbdbe42d9a2988a1790a3e" name="or_4" x="1204" y="336">
      <params/>
      <attribs/>
   </obj>
   <obj type="instruments/ADSR OSC_Saw" uuid="a9cd5f30-c411-45d2-a3ed-89fdb366b6be" name="obj_3" x="1344" y="336">
      <params/>
      <attribs/>
   </obj>
   <obj type="16_Step_SynthModel" uuid="4552610c-2903-4a7f-8845-1f0aa123128c" name="16_Step_SynthModel_2" x="966" y="350">
      <params/>
      <attribs/>
   </obj>
   <obj type="const/i" uuid="e202f44b2df17ae0b3e663b98ea6b14c8ff00408" name="i_6" x="728" y="448">
      <params/>
      <attribs>
         <spinner attributeName="value" value="1"/>
      </attribs>
   </obj>
   <obj type="disp/i" uuid="5e35fd0c62d81e70017289250cf28edd26e19e4a" name="i_1" x="560" y="476">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/counter2" uuid="d9536f238ab92e53ac93d5927c3b43ceef998dc1" name="counter2_1" x="378" y="518">
      <params>
         <int32 name="maximum" value="1024"/>
      </params>
      <attribs/>
   </obj>
   <obj type="const/i" uuid="e202f44b2df17ae0b3e663b98ea6b14c8ff00408" name="i_5" x="756" y="588">
      <params/>
      <attribs>
         <spinner attributeName="value" value="2"/>
      </attribs>
   </obj>
   <obj type="16_Step_SynthModel" uuid="ff8656a2-d08d-42bc-936c-c899a1c4d681" name="16_Step_SynthModel_4" x="966" y="588">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/or 2" uuid="3805d3c84d30032a44fbdbe42d9a2988a1790a3e" name="or_3" x="1218" y="588">
      <params/>
      <attribs/>
   </obj>
   <obj type="instruments/ADSR OSC_Saw" uuid="a9cd5f30-c411-45d2-a3ed-89fdb366b6be" name="obj_6" x="1344" y="588">
      <params/>
      <attribs/>
   </obj>
   <obj type="drj/math/== const i" uuid="36ae23539d64bc2fb798a1b4a65cf9dda17a1952" name="==_4" x="714" y="658">
      <params/>
      <attribs>
         <spinner attributeName="value" value="2"/>
      </attribs>
   </obj>
   <obj type="const/i" uuid="e202f44b2df17ae0b3e663b98ea6b14c8ff00408" name="i_8" x="854" y="994">
      <params/>
      <attribs>
         <spinner attributeName="value" value="2"/>
      </attribs>
   </obj>
   <nets>
      <net>
         <source obj="obj_1" outlet="knob_top_0"/>
         <dest obj="16_Step_SynthModel_1" inlet="AttackIn"/>
         <dest obj="16_Step_SynthModel_2" inlet="AttackIn"/>
         <dest obj="16_Step_SynthModel_4" inlet="AttackIn"/>
      </net>
      <net>
         <source obj="obj_1" outlet="knob_top_1"/>
         <dest obj="16_Step_SynthModel_1" inlet="DecayIn"/>
         <dest obj="16_Step_SynthModel_2" inlet="DecayIn"/>
         <dest obj="16_Step_SynthModel_4" inlet="DecayIn"/>
      </net>
      <net>
         <source obj="obj_1" outlet="knob_top_2"/>
         <dest obj="16_Step_SynthModel_1" inlet="SustainIn"/>
         <dest obj="16_Step_SynthModel_2" inlet="SustainIn"/>
         <dest obj="16_Step_SynthModel_4" inlet="SustainIn"/>
      </net>
      <net>
         <source obj="obj_1" outlet="knob_top_3"/>
         <dest obj="16_Step_SynthModel_1" inlet="ReleaseIn"/>
         <dest obj="16_Step_SynthModel_2" inlet="ReleaseIn"/>
         <dest obj="16_Step_SynthModel_4" inlet="ReleaseIn"/>
      </net>
      <net>
         <source obj="obj_1" outlet="knob_top_4"/>
         <dest obj="16_Step_SynthModel_1" inlet="VolumeIn"/>
         <dest obj="16_Step_SynthModel_2" inlet="VolumeIn"/>
         <dest obj="16_Step_SynthModel_4" inlet="VolumeIn"/>
      </net>
      <net>
         <source obj="obj_1" outlet="knob_top_5"/>
         <dest obj="16_Step_SynthModel_1" inlet="PitchIn"/>
         <dest obj="16_Step_SynthModel_2" inlet="PitchIn"/>
         <dest obj="16_Step_SynthModel_4" inlet="PitchIn"/>
      </net>
      <net>
         <source obj="i_3" outlet="out"/>
         <dest obj="obj_1" inlet="Color In"/>
      </net>
      <net>
         <source obj="dial_7" outlet="out"/>
         <dest obj="obj_1" inlet="Intensity"/>
      </net>
      <net>
         <source obj="mix_1" outlet="out"/>
         <dest obj="obj_4" inlet="left"/>
         <dest obj="obj_4" inlet="right"/>
      </net>
      <net>
         <source obj="obj_1" outlet="knob_bot_6"/>
         <dest obj="obj_5" inlet="Row"/>
      </net>
      <net>
         <source obj="obj_1" outlet="knob_bot_7"/>
         <dest obj="obj_5" inlet="Col"/>
      </net>
      <net>
         <source obj="obj_5" outlet="chchchchanges"/>
         <dest obj="pulselength_1" inlet="trig"/>
      </net>
      <net>
         <source obj="save" outlet="o"/>
         <dest obj="16_Step_SynthModel_1" inlet="saveToSD"/>
         <dest obj="16_Step_SynthModel_2" inlet="saveToSD"/>
         <dest obj="16_Step_SynthModel_4" inlet="saveToSD"/>
      </net>
      <net>
         <source obj="load" outlet="o"/>
         <dest obj="16_Step_SynthModel_1" inlet="loadFromSD"/>
         <dest obj="16_Step_SynthModel_2" inlet="loadFromSD"/>
         <dest obj="16_Step_SynthModel_4" inlet="loadFromSD"/>
      </net>
      <net>
         <source obj="obj_1" outlet="parasailing"/>
         <dest obj="or_5" inlet="i2"/>
      </net>
      <net>
         <source obj="pulselength_1" outlet="pulse"/>
         <dest obj="or_3" inlet="i1"/>
         <dest obj="or_4" inlet="i1"/>
         <dest obj="or_5" inlet="i1"/>
      </net>
      <net>
         <source obj="obj_1" outlet="hiking"/>
         <dest obj="counter2_1" inlet="dec"/>
      </net>
      <net>
         <source obj="obj_1" outlet="horsebackriding"/>
         <dest obj="counter2_1" inlet="inc"/>
      </net>
      <net>
         <source obj="counter2_1" outlet="o"/>
         <dest obj="i_1" inlet="in"/>
         <dest obj="obj_1" inlet="page"/>
         <dest obj="16_Step_SynthModel_1" inlet="frame"/>
         <dest obj="16_Step_SynthModel_2" inlet="frame"/>
         <dest obj="16_Step_SynthModel_4" inlet="frame"/>
      </net>
      <net>
         <source obj="obj_1" outlet="diving"/>
         <dest obj="or_4" inlet="i2"/>
      </net>
      <net>
         <source obj="obj_5" outlet="col"/>
         <dest obj="16_Step_SynthModel_1" inlet="stepIn_"/>
         <dest obj="16_Step_SynthModel_1" inlet="stepOut_"/>
         <dest obj="16_Step_SynthModel_2" inlet="stepIn_"/>
         <dest obj="16_Step_SynthModel_2" inlet="stepOut_"/>
         <dest obj="16_Step_SynthModel_4" inlet="stepIn_"/>
         <dest obj="16_Step_SynthModel_4" inlet="stepOut_"/>
      </net>
      <net>
         <source obj="obj_5" outlet="row"/>
         <dest obj="==_2" inlet="in"/>
         <dest obj="==_3" inlet="in"/>
         <dest obj="==_4" inlet="in"/>
      </net>
      <net>
         <source obj="==_2" outlet="out"/>
         <dest obj="16_Step_SynthModel_1" inlet="enableWr"/>
      </net>
      <net>
         <source obj="==_3" outlet="out"/>
         <dest obj="16_Step_SynthModel_2" inlet="enableWr"/>
      </net>
      <net>
         <source obj="obj_5" outlet="stepNum"/>
         <dest obj="obj_1" inlet="step"/>
      </net>
      <net>
         <source obj="16_Step_SynthModel_1" outlet="VolumeOut"/>
         <dest obj="obj_2" inlet="volume"/>
      </net>
      <net>
         <source obj="16_Step_SynthModel_1" outlet="PitchOut"/>
         <dest obj="obj_2" inlet="Base Note"/>
      </net>
      <net>
         <source obj="16_Step_SynthModel_1" outlet="AttackOut"/>
         <dest obj="obj_2" inlet="attack"/>
      </net>
      <net>
         <source obj="16_Step_SynthModel_1" outlet="DecayOut"/>
         <dest obj="obj_2" inlet="decay"/>
      </net>
      <net>
         <source obj="16_Step_SynthModel_1" outlet="SustainOut"/>
         <dest obj="obj_2" inlet="sustain"/>
      </net>
      <net>
         <source obj="16_Step_SynthModel_1" outlet="ReleaseOut"/>
         <dest obj="obj_2" inlet="release"/>
      </net>
      <net>
         <source obj="16_Step_SynthModel_2" outlet="VolumeOut"/>
         <dest obj="obj_3" inlet="volume"/>
      </net>
      <net>
         <source obj="16_Step_SynthModel_2" outlet="PitchOut"/>
         <dest obj="obj_3" inlet="Base Note"/>
      </net>
      <net>
         <source obj="16_Step_SynthModel_2" outlet="AttackOut"/>
         <dest obj="obj_3" inlet="attack"/>
      </net>
      <net>
         <source obj="16_Step_SynthModel_2" outlet="DecayOut"/>
         <dest obj="obj_3" inlet="decay"/>
      </net>
      <net>
         <source obj="16_Step_SynthModel_2" outlet="SustainOut"/>
         <dest obj="obj_3" inlet="sustain"/>
      </net>
      <net>
         <source obj="16_Step_SynthModel_2" outlet="ReleaseOut"/>
         <dest obj="obj_3" inlet="release"/>
      </net>
      <net>
         <source obj="obj_3" outlet="out"/>
         <dest obj="mix_1" inlet="in2"/>
      </net>
      <net>
         <source obj="obj_2" outlet="out"/>
         <dest obj="mix_1" inlet="in1"/>
      </net>
      <net>
         <source obj="obj_1" outlet="canoing"/>
         <dest obj="or_3" inlet="i2"/>
      </net>
      <net>
         <source obj="or_3" outlet="o"/>
         <dest obj="obj_6" inlet="trigger"/>
      </net>
      <net>
         <source obj="or_4" outlet="o"/>
         <dest obj="obj_3" inlet="trigger"/>
      </net>
      <net>
         <source obj="or_5" outlet="o"/>
         <dest obj="obj_2" inlet="trigger"/>
      </net>
      <net>
         <source obj="obj_6" outlet="out"/>
         <dest obj="mix_1" inlet="in3"/>
      </net>
      <net>
         <source obj="16_Step_SynthModel_4" outlet="VolumeOut"/>
         <dest obj="obj_6" inlet="volume"/>
      </net>
      <net>
         <source obj="16_Step_SynthModel_4" outlet="PitchOut"/>
         <dest obj="obj_6" inlet="Base Note"/>
      </net>
      <net>
         <source obj="16_Step_SynthModel_4" outlet="AttackOut"/>
         <dest obj="obj_6" inlet="attack"/>
      </net>
      <net>
         <source obj="16_Step_SynthModel_4" outlet="DecayOut"/>
         <dest obj="obj_6" inlet="decay"/>
      </net>
      <net>
         <source obj="16_Step_SynthModel_4" outlet="SustainOut"/>
         <dest obj="obj_6" inlet="sustain"/>
      </net>
      <net>
         <source obj="16_Step_SynthModel_4" outlet="ReleaseOut"/>
         <dest obj="obj_6" inlet="release"/>
      </net>
      <net>
         <source obj="i_5" outlet="out"/>
         <dest obj="16_Step_SynthModel_4" inlet="page"/>
      </net>
      <net>
         <source obj="==_4" outlet="out"/>
         <dest obj="16_Step_SynthModel_4" inlet="enableWr"/>
      </net>
      <net>
         <source obj="i_6" outlet="out"/>
         <dest obj="16_Step_SynthModel_2" inlet="page"/>
      </net>
      <net>
         <source obj="i_7" outlet="out"/>
         <dest obj="16_Step_SynthModel_1" inlet="page"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>no</subpatchmode>
      <MidiChannel>1</MidiChannel>
      <NPresets>0</NPresets>
      <NPresetEntries>0</NPresetEntries>
      <NModulationSources>0</NModulationSources>
      <NModulationTargetsPerSource>0</NModulationTargetsPerSource>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>-1928</x>
      <y>-91</y>
      <width>1723</width>
      <height>976</height>
   </windowPos>
</patch-1.0>