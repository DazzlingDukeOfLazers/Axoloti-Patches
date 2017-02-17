<patch-1.0 appVersion="1.0.12">
   <obj type="ctrl/dial p" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="dial_7" x="0" y="0">
      <params>
         <frac32.u.map name="value" value="64.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="phi/logic/or 4" uuid="5dc5a7c1fb7809522171638f755fead71cbe14ea" name="or_1" x="1008" y="14">
      <params/>
      <attribs/>
   </obj>
   <obj type="instruments/ADSR OSC" uuid="4ed53c76-2d29-4944-b35e-8652a1ae16ce" name="obj_3" x="1344" y="28">
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
   <obj type="math/*" uuid="3ac307b9f782049739ed62504081b96d580ea336" name="*_1" x="1582" y="70">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/*c" uuid="7a66f52a9594e7e9eb31328ea725cb3641a80b55" name="*c_1" x="1638" y="70">
      <params>
         <frac32.u.map name="amp" value="64.0"/>
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
   <obj type="sequencing/16_Step_SynthModel" uuid="eb8134a3-4a0c-4538-a91a-90e0a21feed6" name="obj_2" x="966" y="112">
      <params/>
      <attribs/>
   </obj>
   <obj type="timer/pulselength" uuid="ca68725237d8ba8407773340801660a9fd9b0dba" name="pulselength_1" x="644" y="154">
      <params>
         <frac32.s.map name="delay" value="14.0"/>
      </params>
      <attribs/>
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
   <obj type="logic/KnobRowColumnSel16x4" uuid="c2bf8d4c-e2a2-460d-bcba-eeff967c6409" name="obj_6" x="364" y="308">
      <params/>
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
         <dest obj="obj_2" inlet="AttackIn"/>
      </net>
      <net>
         <source obj="obj_1" outlet="knob_top_1"/>
         <dest obj="obj_2" inlet="DecayIn"/>
      </net>
      <net>
         <source obj="obj_1" outlet="knob_top_2"/>
         <dest obj="obj_2" inlet="SustainIn"/>
      </net>
      <net>
         <source obj="obj_1" outlet="knob_top_3"/>
         <dest obj="obj_2" inlet="ReleaseIn"/>
      </net>
      <net>
         <source obj="obj_1" outlet="knob_top_4"/>
         <dest obj="obj_2" inlet="VolumeIn"/>
      </net>
      <net>
         <source obj="obj_1" outlet="knob_top_5"/>
         <dest obj="obj_2" inlet="PitchIn"/>
      </net>
      <net>
         <source obj="obj_2" outlet="VolumeOut"/>
         <dest obj="*_1" inlet="a"/>
         <dest obj="obj_3" inlet="volume"/>
      </net>
      <net>
         <source obj="obj_2" outlet="PitchOut"/>
         <dest obj="obj_3" inlet="Base Note"/>
      </net>
      <net>
         <source obj="obj_2" outlet="AttackOut"/>
         <dest obj="obj_3" inlet="attack"/>
      </net>
      <net>
         <source obj="obj_2" outlet="DecayOut"/>
         <dest obj="obj_3" inlet="decay"/>
      </net>
      <net>
         <source obj="obj_2" outlet="SustainOut"/>
         <dest obj="obj_3" inlet="sustain"/>
      </net>
      <net>
         <source obj="obj_2" outlet="ReleaseOut"/>
         <dest obj="obj_3" inlet="release"/>
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
         <source obj="obj_6" outlet="stepnum"/>
         <dest obj="obj_1" inlet="step"/>
         <dest obj="obj_2" inlet="stepIn_"/>
         <dest obj="obj_2" inlet="stepOut_"/>
      </net>
      <net>
         <source obj="mix_1" outlet="out"/>
         <dest obj="obj_4" inlet="left"/>
         <dest obj="obj_4" inlet="right"/>
      </net>
      <net>
         <source obj="obj_1" outlet="knob_bot_6"/>
         <dest obj="obj_6" inlet="Row"/>
      </net>
      <net>
         <source obj="obj_1" outlet="knob_bot_7"/>
         <dest obj="obj_6" inlet="Col"/>
      </net>
      <net>
         <source obj="obj_6" outlet="chchchchanges"/>
         <dest obj="pulselength_1" inlet="trig"/>
      </net>
      <net>
         <source obj="save" outlet="o"/>
         <dest obj="obj_2" inlet="saveToSD"/>
      </net>
      <net>
         <source obj="load" outlet="o"/>
         <dest obj="obj_2" inlet="loadFromSD"/>
      </net>
      <net>
         <source obj="or_1" outlet="o"/>
         <dest obj="obj_3" inlet="trigger"/>
      </net>
      <net>
         <source obj="obj_1" outlet="parasailing"/>
         <dest obj="or_1" inlet="i4"/>
      </net>
      <net>
         <source obj="pulselength_1" outlet="pulse"/>
         <dest obj="or_1" inlet="i3"/>
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
         <dest obj="obj_2" inlet="frame"/>
      </net>
      <net>
         <source obj="*_1" outlet="result"/>
         <dest obj="*c_1" inlet="in"/>
      </net>
      <net>
         <source obj="*c_1" outlet="out"/>
         <dest obj="mix_1" inlet="in1"/>
      </net>
      <net>
         <source obj="obj_3" outlet="out"/>
         <dest obj="*_1" inlet="b"/>
      </net>
      <net>
         <source obj="i_5" outlet="out"/>
         <dest obj="obj_2" inlet="page"/>
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