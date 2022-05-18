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
         <frac32.u.map name="gain1" value="31.0"/>
         <frac32.u.map name="gain2" value="32.5"/>
         <frac32.u.map name="gain3" value="33.0"/>
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
   <obj type="sequencing/16_Step_SynthModel" uuid="c17d9e60-6df2-4d5f-ab9f-43c9703aceb4" name="obj_7" x="966" y="112">
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
   <obj type="instruments/ADSR OSC_Saw" uuid="0e1b38ec-97fe-4434-92bd-42f3cb75447e" name="obj_3" x="1344" y="336">
      <params/>
      <attribs/>
   </obj>
   <obj type="sequencing/16_Step_SynthModel" uuid="c17d9e60-6df2-4d5f-ab9f-43c9703aceb4" name="obj_8" x="966" y="350">
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
   <obj type="sequencing/16_Step_SynthModel" uuid="c17d9e60-6df2-4d5f-ab9f-43c9703aceb4" name="obj_9" x="966" y="588">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/or 2" uuid="3805d3c84d30032a44fbdbe42d9a2988a1790a3e" name="or_3" x="1218" y="588">
      <params/>
      <attribs/>
   </obj>
   <obj type="instruments/ADSR OSC_Saw" uuid="0e1b38ec-97fe-4434-92bd-42f3cb75447e" name="obj_6" x="1344" y="588">
      <params/>
      <attribs/>
   </obj>
   <obj type="drj/math/== const i" uuid="36ae23539d64bc2fb798a1b4a65cf9dda17a1952" name="==_4" x="714" y="658">
      <params/>
      <attribs>
         <spinner attributeName="value" value="2"/>
      </attribs>
   </obj>
   <obj type="const/i" uuid="e202f44b2df17ae0b3e663b98ea6b14c8ff00408" name="i_9" x="644" y="812">
      <params/>
      <attribs>
         <spinner attributeName="value" value="3"/>
      </attribs>
   </obj>
   <obj type="sequencing/16_Step_SynthModel" uuid="c17d9e60-6df2-4d5f-ab9f-43c9703aceb4" name="obj_10" x="966" y="812">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/or 2" uuid="3805d3c84d30032a44fbdbe42d9a2988a1790a3e" name="or_6" x="1176" y="812">
      <params/>
      <attribs/>
   </obj>
   <obj type="instruments/ADSR OSC_Noise" uuid="47e13859-ac60-4cb0-b3a1-c26c8ce41846" name="obj_11" x="1316" y="826">
      <params>
         <frac32.s.map name="noteMod" value="0.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="drj/math/== const i" uuid="36ae23539d64bc2fb798a1b4a65cf9dda17a1952" name="==_5" x="672" y="882">
      <params/>
      <attribs>
         <spinner attributeName="value" value="3"/>
      </attribs>
   </obj>
   <obj type="const/i" uuid="e202f44b2df17ae0b3e663b98ea6b14c8ff00408" name="i_8" x="644" y="1120">
      <params/>
      <attribs>
         <spinner attributeName="value" value="3"/>
      </attribs>
   </obj>
   <nets>
      <net>
         <source obj="obj_1" outlet="knob_top_0"/>
         <dest obj="obj_7" inlet="AttackIn"/>
         <dest obj="obj_8" inlet="AttackIn"/>
         <dest obj="obj_9" inlet="AttackIn"/>
         <dest obj="obj_10" inlet="AttackIn"/>
      </net>
      <net>
         <source obj="obj_1" outlet="knob_top_1"/>
         <dest obj="obj_7" inlet="DecayIn"/>
         <dest obj="obj_8" inlet="DecayIn"/>
         <dest obj="obj_9" inlet="DecayIn"/>
         <dest obj="obj_10" inlet="DecayIn"/>
      </net>
      <net>
         <source obj="obj_1" outlet="knob_top_2"/>
         <dest obj="obj_7" inlet="SustainIn"/>
         <dest obj="obj_8" inlet="SustainIn"/>
         <dest obj="obj_9" inlet="SustainIn"/>
         <dest obj="obj_10" inlet="SustainIn"/>
      </net>
      <net>
         <source obj="obj_1" outlet="knob_top_3"/>
         <dest obj="obj_7" inlet="ReleaseIn"/>
         <dest obj="obj_8" inlet="ReleaseIn"/>
         <dest obj="obj_9" inlet="ReleaseIn"/>
         <dest obj="obj_10" inlet="ReleaseIn"/>
      </net>
      <net>
         <source obj="obj_1" outlet="knob_top_4"/>
         <dest obj="obj_7" inlet="VolumeIn"/>
         <dest obj="obj_8" inlet="VolumeIn"/>
         <dest obj="obj_9" inlet="VolumeIn"/>
         <dest obj="obj_10" inlet="VolumeIn"/>
      </net>
      <net>
         <source obj="obj_1" outlet="knob_top_5"/>
         <dest obj="obj_7" inlet="PitchIn"/>
         <dest obj="obj_8" inlet="PitchIn"/>
         <dest obj="obj_9" inlet="PitchIn"/>
         <dest obj="obj_10" inlet="PitchIn"/>
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
         <dest obj="obj_7" inlet="saveToSD"/>
         <dest obj="obj_8" inlet="saveToSD"/>
         <dest obj="obj_9" inlet="saveToSD"/>
         <dest obj="obj_10" inlet="saveToSD"/>
      </net>
      <net>
         <source obj="load" outlet="o"/>
         <dest obj="obj_7" inlet="loadFromSD"/>
         <dest obj="obj_8" inlet="loadFromSD"/>
         <dest obj="obj_9" inlet="loadFromSD"/>
         <dest obj="obj_10" inlet="loadFromSD"/>
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
         <dest obj="or_6" inlet="i1"/>
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
         <dest obj="obj_7" inlet="frame"/>
         <dest obj="obj_8" inlet="frame"/>
         <dest obj="obj_9" inlet="frame"/>
         <dest obj="obj_10" inlet="frame"/>
      </net>
      <net>
         <source obj="obj_1" outlet="diving"/>
         <dest obj="or_4" inlet="i2"/>
      </net>
      <net>
         <source obj="obj_5" outlet="row"/>
         <dest obj="==_2" inlet="in"/>
         <dest obj="==_3" inlet="in"/>
         <dest obj="==_4" inlet="in"/>
         <dest obj="==_5" inlet="in"/>
      </net>
      <net>
         <source obj="==_2" outlet="out"/>
         <dest obj="obj_7" inlet="enableWr"/>
      </net>
      <net>
         <source obj="==_3" outlet="out"/>
         <dest obj="obj_8" inlet="enableWr"/>
      </net>
      <net>
         <source obj="obj_5" outlet="stepNum"/>
         <dest obj="obj_1" inlet="step"/>
      </net>
      <net>
         <source obj="obj_7" outlet="VolumeOut"/>
         <dest obj="obj_2" inlet="volume"/>
      </net>
      <net>
         <source obj="obj_7" outlet="PitchOut"/>
         <dest obj="obj_2" inlet="Base Note"/>
      </net>
      <net>
         <source obj="obj_7" outlet="AttackOut"/>
         <dest obj="obj_2" inlet="attack"/>
      </net>
      <net>
         <source obj="obj_7" outlet="DecayOut"/>
         <dest obj="obj_2" inlet="decay"/>
      </net>
      <net>
         <source obj="obj_7" outlet="SustainOut"/>
         <dest obj="obj_2" inlet="sustain"/>
      </net>
      <net>
         <source obj="obj_7" outlet="ReleaseOut"/>
         <dest obj="obj_2" inlet="release"/>
      </net>
      <net>
         <source obj="obj_8" outlet="VolumeOut"/>
         <dest obj="obj_3" inlet="volume"/>
      </net>
      <net>
         <source obj="obj_8" outlet="PitchOut"/>
         <dest obj="obj_3" inlet="Base Note"/>
      </net>
      <net>
         <source obj="obj_8" outlet="AttackOut"/>
         <dest obj="obj_3" inlet="attack"/>
      </net>
      <net>
         <source obj="obj_8" outlet="DecayOut"/>
         <dest obj="obj_3" inlet="decay"/>
      </net>
      <net>
         <source obj="obj_8" outlet="SustainOut"/>
         <dest obj="obj_3" inlet="sustain"/>
      </net>
      <net>
         <source obj="obj_8" outlet="ReleaseOut"/>
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
         <source obj="obj_9" outlet="VolumeOut"/>
         <dest obj="obj_6" inlet="volume"/>
      </net>
      <net>
         <source obj="obj_9" outlet="PitchOut"/>
         <dest obj="obj_6" inlet="Base Note"/>
      </net>
      <net>
         <source obj="obj_9" outlet="AttackOut"/>
         <dest obj="obj_6" inlet="attack"/>
      </net>
      <net>
         <source obj="obj_9" outlet="DecayOut"/>
         <dest obj="obj_6" inlet="decay"/>
      </net>
      <net>
         <source obj="obj_9" outlet="SustainOut"/>
         <dest obj="obj_6" inlet="sustain"/>
      </net>
      <net>
         <source obj="obj_9" outlet="ReleaseOut"/>
         <dest obj="obj_6" inlet="release"/>
      </net>
      <net>
         <source obj="i_5" outlet="out"/>
         <dest obj="obj_9" inlet="page"/>
      </net>
      <net>
         <source obj="==_4" outlet="out"/>
         <dest obj="obj_9" inlet="enableWr"/>
      </net>
      <net>
         <source obj="i_6" outlet="out"/>
         <dest obj="obj_8" inlet="page"/>
      </net>
      <net>
         <source obj="i_7" outlet="out"/>
         <dest obj="obj_7" inlet="page"/>
      </net>
      <net>
         <source obj="obj_5" outlet="col"/>
         <dest obj="obj_7" inlet="step"/>
         <dest obj="obj_8" inlet="step"/>
         <dest obj="obj_9" inlet="step"/>
         <dest obj="obj_10" inlet="step"/>
      </net>
      <net>
         <source obj="obj_10" outlet="VolumeOut"/>
         <dest obj="obj_11" inlet="volume"/>
      </net>
      <net>
         <source obj="obj_10" outlet="PitchOut"/>
         <dest obj="obj_11" inlet="Base Note"/>
      </net>
      <net>
         <source obj="obj_10" outlet="AttackOut"/>
         <dest obj="obj_11" inlet="attack"/>
      </net>
      <net>
         <source obj="obj_10" outlet="DecayOut"/>
         <dest obj="obj_11" inlet="decay"/>
      </net>
      <net>
         <source obj="obj_10" outlet="SustainOut"/>
         <dest obj="obj_11" inlet="sustain"/>
      </net>
      <net>
         <source obj="obj_10" outlet="ReleaseOut"/>
         <dest obj="obj_11" inlet="release"/>
      </net>
      <net>
         <source obj="or_6" outlet="o"/>
         <dest obj="obj_11" inlet="trigger"/>
      </net>
      <net>
         <source obj="obj_1" outlet="swimming"/>
         <dest obj="or_6" inlet="i2"/>
      </net>
      <net>
         <source obj="obj_11" outlet="out"/>
         <dest obj="mix_1" inlet="in4"/>
      </net>
      <net>
         <source obj="i_9" outlet="out"/>
         <dest obj="obj_10" inlet="page"/>
      </net>
      <net>
         <source obj="==_5" outlet="out"/>
         <dest obj="obj_10" inlet="enableWr"/>
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