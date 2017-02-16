<patch-1.0 appVersion="1.0.12">
   <obj type="ctrl/dial p" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="dial_7" x="0" y="0">
      <params>
         <frac32.u.map name="value" value="64.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="disp/dial p" uuid="44fd18b562e434b3230441681132dbeabb15cdc5" name="dial_1" x="1540" y="0">
      <params/>
      <attribs/>
   </obj>
   <obj type="phi/logic/or 4" uuid="5dc5a7c1fb7809522171638f755fead71cbe14ea" name="or_2" x="1120" y="28">
      <params/>
      <attribs/>
   </obj>
   <obj type="ADSR OSC" uuid="a6e252ad-28a8-4c03-9a8d-c862febdf7dd" name="ADSR_1" x="1344" y="28">
      <params>
         <frac32.s.map name="noteMod" value="0.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="Wanderlust/Volume Out" uuid="4c32af6c-47e2-4e74-8b97-37dfb4d76913" name="obj_4" x="1624" y="56">
      <params>
         <bool32.tgl name="Enable Vol Knob" value="0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="Wanderlust/Wanderlust_beta1" uuid="4b4a7c45-923f-4809-b307-bdfb6f04094f" name="obj_1" x="140" y="112">
      <params>
         <bool32.tgl name="Reverse Knobs" value="1"/>
         <bool32.tgl name="Rev Padrow Top" value="0"/>
         <bool32.tgl name="Rev Padrow Bottom" value="0"/>
         <int32 name="LED Mode" value="1"/>
      </params>
      <attribs/>
   </obj>
   <obj type="ctrl/i" uuid="a3786816db6ea5bc6ac4193a5cccdb2c83b83496" name="i_4" x="14" y="154">
      <params>
         <int32 name="value" value="0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="timer/pulselength" uuid="ca68725237d8ba8407773340801660a9fd9b0dba" name="pulselength_1" x="644" y="154">
      <params>
         <frac32.s.map name="delay" value="14.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="disp/dial p" uuid="44fd18b562e434b3230441681132dbeabb15cdc5" name="dial_3" x="1344" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/dial p" uuid="44fd18b562e434b3230441681132dbeabb15cdc5" name="dial_2" x="1442" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="sequencing/16_Step_SynthModel" uuid="bc193b87-fbca-4f1b-bfe0-036935fc3798" name="Step Value Array" x="1022" y="224">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/dial p" uuid="44fd18b562e434b3230441681132dbeabb15cdc5" name="dial_4" x="1344" y="294">
      <params/>
      <attribs/>
   </obj>
   <obj type="KnobRowColumnSel16x4" uuid="8eb6ce77-ffad-4171-973b-878c34acaeb7" name="KnobRowColumnSel16x4_1" x="392" y="322">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/dial p" uuid="44fd18b562e434b3230441681132dbeabb15cdc5" name="dial_5" x="1344" y="378">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/dial p" uuid="44fd18b562e434b3230441681132dbeabb15cdc5" name="dial_6" x="1344" y="462">
      <params/>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="obj_1" outlet="knob_top_0"/>
         <dest obj="Step Value Array" inlet="AttackIn"/>
      </net>
      <net>
         <source obj="obj_1" outlet="knob_top_1"/>
         <dest obj="Step Value Array" inlet="DecayIn"/>
      </net>
      <net>
         <source obj="obj_1" outlet="knob_top_2"/>
         <dest obj="Step Value Array" inlet="SustainIn"/>
      </net>
      <net>
         <source obj="obj_1" outlet="knob_top_3"/>
         <dest obj="Step Value Array" inlet="ReleaseIn"/>
      </net>
      <net>
         <source obj="obj_1" outlet="knob_top_4"/>
         <dest obj="Step Value Array" inlet="VolumeIn"/>
      </net>
      <net>
         <source obj="obj_1" outlet="knob_top_5"/>
         <dest obj="Step Value Array" inlet="PitchIn"/>
      </net>
      <net>
         <source obj="Step Value Array" outlet="VolumeOut"/>
         <dest obj="dial_1" inlet="in"/>
      </net>
      <net>
         <source obj="Step Value Array" outlet="PitchOut"/>
         <dest obj="dial_2" inlet="in"/>
         <dest obj="ADSR_1" inlet="Base Note"/>
      </net>
      <net>
         <source obj="Step Value Array" outlet="AttackOut"/>
         <dest obj="dial_3" inlet="in"/>
         <dest obj="ADSR_1" inlet="attack"/>
      </net>
      <net>
         <source obj="Step Value Array" outlet="DecayOut"/>
         <dest obj="dial_4" inlet="in"/>
         <dest obj="ADSR_1" inlet="decay"/>
      </net>
      <net>
         <source obj="Step Value Array" outlet="SustainOut"/>
         <dest obj="dial_5" inlet="in"/>
         <dest obj="ADSR_1" inlet="sustain"/>
      </net>
      <net>
         <source obj="Step Value Array" outlet="ReleaseOut"/>
         <dest obj="dial_6" inlet="in"/>
         <dest obj="ADSR_1" inlet="release"/>
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
         <source obj="obj_1" outlet="knob_bot_6"/>
         <dest obj="KnobRowColumnSel16x4_1" inlet="Row"/>
      </net>
      <net>
         <source obj="obj_1" outlet="knob_bot_7"/>
         <dest obj="KnobRowColumnSel16x4_1" inlet="Col"/>
      </net>
      <net>
         <source obj="KnobRowColumnSel16x4_1" outlet="stepnum"/>
         <dest obj="obj_1" inlet="step"/>
         <dest obj="Step Value Array" inlet="stepOut_"/>
         <dest obj="Step Value Array" inlet="stepIn_"/>
      </net>
      <net>
         <source obj="ADSR_1" outlet="out"/>
         <dest obj="obj_4" inlet="left"/>
         <dest obj="obj_4" inlet="right"/>
      </net>
      <net>
         <source obj="KnobRowColumnSel16x4_1" outlet="chchchchanges"/>
         <dest obj="pulselength_1" inlet="trig"/>
      </net>
      <net>
         <source obj="obj_1" outlet="parasailing"/>
         <dest obj="or_2" inlet="i2"/>
      </net>
      <net>
         <source obj="or_2" outlet="o"/>
         <dest obj="ADSR_1" inlet="trigger"/>
      </net>
      <net>
         <source obj="pulselength_1" outlet="pulse"/>
         <dest obj="or_2" inlet="i1"/>
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