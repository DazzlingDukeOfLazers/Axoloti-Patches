<patch-1.0 appVersion="1.0.12">
   <obj type="ctrl/dial p" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="dial_7" x="0" y="0">
      <params>
         <frac32.u.map name="value" value="64.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="timer/pulselength" uuid="ca68725237d8ba8407773340801660a9fd9b0dba" name="pulselength_1" x="574" y="0">
      <params>
         <frac32.s.map name="delay" value="14.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="phi/logic/or 4" uuid="5dc5a7c1fb7809522171638f755fead71cbe14ea" name="or_1" x="1008" y="14">
      <params/>
      <attribs/>
   </obj>
   <obj type="instruments/ADSR OSC" uuid="8496f27f-1507-467b-aec8-acf50954270a" name="obj_7" x="1344" y="28">
      <params>
         <frac32.s.map name="noteMod" value="0.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="ctrl/i" uuid="a3786816db6ea5bc6ac4193a5cccdb2c83b83496" name="i_5" x="756" y="56">
      <params>
         <int32 name="value" value="0"/>
      </params>
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
   <obj type="Wanderlust/Wanderlust_beta1" uuid="dae782d6-525e-4e55-b3d3-72a8a781d293" name="obj_1" x="140" y="112">
      <params>
         <bool32.tgl name="Reverse Knobs" value="1"/>
         <bool32.tgl name="Rev Padrow Top" value="0"/>
         <bool32.tgl name="Rev Padrow Bottom" value="1"/>
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
   <obj type="16_Step_SynthModel" uuid="7ec83c51-bc63-4949-b354-d598d2292324" name="16_Step_SynthModel_1" x="966" y="112">
      <params/>
      <attribs/>
   </obj>
   <obj type="drj/math/== const i" uuid="36ae23539d64bc2fb798a1b4a65cf9dda17a1952" name="==_2" x="700" y="168">
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
   <obj type="ctrl/i" uuid="a3786816db6ea5bc6ac4193a5cccdb2c83b83496" name="i_4" x="28" y="196">
      <params>
         <int32 name="value" value="3"/>
      </params>
      <attribs/>
   </obj>
   <obj type="disp/dial p" uuid="44fd18b562e434b3230441681132dbeabb15cdc5" name="dial_1" x="1358" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/dial p" uuid="44fd18b562e434b3230441681132dbeabb15cdc5" name="dial_2" x="1176" y="238">
      <params/>
      <attribs/>
   </obj>
   <obj type="KnobRowColumnSel16x4" uuid="0eb599c3-bda4-48c2-b872-1555a69eb97a" name="KnobRowColumnSel16x4_1" x="364" y="308">
      <params/>
      <attribs/>
   </obj>
   <obj type="drj/math/== const i" uuid="36ae23539d64bc2fb798a1b4a65cf9dda17a1952" name="==_3" x="700" y="336">
      <params/>
      <attribs>
         <spinner attributeName="value" value="1"/>
      </attribs>
   </obj>
   <obj type="phi/logic/or 4" uuid="5dc5a7c1fb7809522171638f755fead71cbe14ea" name="or_2" x="1218" y="336">
      <params/>
      <attribs/>
   </obj>
   <obj type="instruments/ADSR OSC_Saw" uuid="bceb049d-6f14-4254-aa04-b88c73e1d597" name="obj_3" x="1344" y="336">
      <params>
         <frac32.s.map name="noteMod" value="0.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="16_Step_SynthModel" uuid="7ec83c51-bc63-4949-b354-d598d2292324" name="16_Step_SynthModel_2" x="966" y="350">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/i" uuid="a3786816db6ea5bc6ac4193a5cccdb2c83b83496" name="i_6" x="756" y="420">
      <params>
         <int32 name="value" value="1"/>
      </params>
      <attribs/>
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
   <nets>
      <net>
         <source obj="obj_1" outlet="knob_top_0"/>
         <dest obj="16_Step_SynthModel_1" inlet="AttackIn"/>
         <dest obj="16_Step_SynthModel_2" inlet="AttackIn"/>
      </net>
      <net>
         <source obj="obj_1" outlet="knob_top_1"/>
         <dest obj="16_Step_SynthModel_1" inlet="DecayIn"/>
         <dest obj="16_Step_SynthModel_2" inlet="DecayIn"/>
      </net>
      <net>
         <source obj="obj_1" outlet="knob_top_2"/>
         <dest obj="16_Step_SynthModel_1" inlet="SustainIn"/>
         <dest obj="16_Step_SynthModel_2" inlet="SustainIn"/>
      </net>
      <net>
         <source obj="obj_1" outlet="knob_top_3"/>
         <dest obj="16_Step_SynthModel_1" inlet="ReleaseIn"/>
         <dest obj="16_Step_SynthModel_2" inlet="ReleaseIn"/>
      </net>
      <net>
         <source obj="obj_1" outlet="knob_top_4"/>
         <dest obj="16_Step_SynthModel_1" inlet="VolumeIn"/>
         <dest obj="16_Step_SynthModel_2" inlet="VolumeIn"/>
      </net>
      <net>
         <source obj="obj_1" outlet="knob_top_5"/>
         <dest obj="16_Step_SynthModel_1" inlet="PitchIn"/>
         <dest obj="16_Step_SynthModel_2" inlet="PitchIn"/>
      </net>
      <net>
         <source obj="16_Step_SynthModel_1" outlet="VolumeOut"/>
         <dest obj="obj_7" inlet="volume"/>
      </net>
      <net>
         <source obj="16_Step_SynthModel_1" outlet="PitchOut"/>
         <dest obj="obj_7" inlet="Base Note"/>
         <dest obj="dial_1" inlet="in"/>
      </net>
      <net>
         <source obj="16_Step_SynthModel_1" outlet="AttackOut"/>
         <dest obj="obj_7" inlet="attack"/>
      </net>
      <net>
         <source obj="16_Step_SynthModel_1" outlet="DecayOut"/>
         <dest obj="obj_7" inlet="decay"/>
      </net>
      <net>
         <source obj="16_Step_SynthModel_1" outlet="SustainOut"/>
         <dest obj="obj_7" inlet="sustain"/>
      </net>
      <net>
         <source obj="16_Step_SynthModel_1" outlet="ReleaseOut"/>
         <dest obj="obj_7" inlet="release"/>
      </net>
      <net>
         <source obj="i_4" outlet="out"/>
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
         <dest obj="KnobRowColumnSel16x4_1" inlet="Row"/>
      </net>
      <net>
         <source obj="obj_1" outlet="knob_bot_7"/>
         <dest obj="KnobRowColumnSel16x4_1" inlet="Col"/>
      </net>
      <net>
         <source obj="KnobRowColumnSel16x4_1" outlet="chchchchanges"/>
         <dest obj="pulselength_1" inlet="trig"/>
      </net>
      <net>
         <source obj="save" outlet="o"/>
         <dest obj="16_Step_SynthModel_1" inlet="saveToSD"/>
         <dest obj="16_Step_SynthModel_2" inlet="saveToSD"/>
      </net>
      <net>
         <source obj="load" outlet="o"/>
         <dest obj="16_Step_SynthModel_1" inlet="loadFromSD"/>
         <dest obj="16_Step_SynthModel_2" inlet="loadFromSD"/>
      </net>
      <net>
         <source obj="or_1" outlet="o"/>
         <dest obj="obj_7" inlet="trigger"/>
      </net>
      <net>
         <source obj="obj_1" outlet="parasailing"/>
         <dest obj="or_1" inlet="i4"/>
      </net>
      <net>
         <source obj="pulselength_1" outlet="pulse"/>
         <dest obj="or_1" inlet="i3"/>
         <dest obj="or_2" inlet="i1"/>
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
      </net>
      <net>
         <source obj="i_5" outlet="out"/>
         <dest obj="16_Step_SynthModel_1" inlet="page"/>
      </net>
      <net>
         <source obj="i_6" outlet="out"/>
         <dest obj="16_Step_SynthModel_2" inlet="page"/>
      </net>
      <net>
         <source obj="obj_1" outlet="diving"/>
         <dest obj="or_2" inlet="i2"/>
      </net>
      <net>
         <source obj="or_2" outlet="o"/>
         <dest obj="obj_3" inlet="trigger"/>
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
         <source obj="16_Step_SynthModel_2" outlet="PitchOut"/>
         <dest obj="obj_3" inlet="Base Note"/>
      </net>
      <net>
         <source obj="16_Step_SynthModel_2" outlet="VolumeOut"/>
         <dest obj="obj_3" inlet="volume"/>
      </net>
      <net>
         <source obj="obj_7" outlet="out"/>
         <dest obj="mix_1" inlet="in1"/>
      </net>
      <net>
         <source obj="obj_3" outlet="out"/>
         <dest obj="mix_1" inlet="in2"/>
      </net>
      <net>
         <source obj="KnobRowColumnSel16x4_1" outlet="col"/>
         <dest obj="16_Step_SynthModel_1" inlet="stepIn_"/>
         <dest obj="16_Step_SynthModel_1" inlet="stepOut_"/>
         <dest obj="16_Step_SynthModel_2" inlet="stepIn_"/>
         <dest obj="16_Step_SynthModel_2" inlet="stepOut_"/>
         <dest obj="dial_2" inlet="in"/>
      </net>
      <net>
         <source obj="KnobRowColumnSel16x4_1" outlet="row"/>
         <dest obj="==_2" inlet="in"/>
         <dest obj="==_3" inlet="in"/>
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
         <source obj="KnobRowColumnSel16x4_1" outlet="stepNum"/>
         <dest obj="obj_1" inlet="step"/>
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