<patch-1.0 appVersion="1.0.12">
   <obj type="ctrl/dial p" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="dial_7" x="0" y="0">
      <params>
         <frac32.u.map name="value" value="64.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="sequencing/16_Step_SynthModel" uuid="bc193b87-fbca-4f1b-bfe0-036935fc3798" name="Step Value Array" x="1064" y="14">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/dial p" uuid="44fd18b562e434b3230441681132dbeabb15cdc5" name="dial_1" x="1302" y="14">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/i" uuid="a3786816db6ea5bc6ac4193a5cccdb2c83b83496" name="i_2" x="0" y="84">
      <params>
         <int32 name="value" value="1"/>
      </params>
      <attribs/>
   </obj>
   <obj type="disp/dial p" uuid="44fd18b562e434b3230441681132dbeabb15cdc5" name="dial_2" x="1302" y="98">
      <params/>
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
   <obj type="disp/dial p" uuid="44fd18b562e434b3230441681132dbeabb15cdc5" name="dial_3" x="1302" y="182">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/dial p" uuid="44fd18b562e434b3230441681132dbeabb15cdc5" name="dial_4" x="1302" y="266">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/KnobRowColumnSel16x4" uuid="8eb6ce77-ffad-4171-973b-878c34acaeb7" name="obj_2" x="350" y="308">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/dial p" uuid="44fd18b562e434b3230441681132dbeabb15cdc5" name="dial_5" x="1302" y="350">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/selectChan16" uuid="4817e28e-6ae3-44e2-a76c-ea37b87d2a0d" name="selectChan16_1" x="434" y="406">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/i" uuid="5e35fd0c62d81e70017289250cf28edd26e19e4a" name="i_3" x="798" y="434">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/dial p" uuid="44fd18b562e434b3230441681132dbeabb15cdc5" name="dial_6" x="1302" y="434">
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
         <source obj="i_2" outlet="out"/>
         <dest obj="Step Value Array" inlet="stepOut_"/>
      </net>
      <net>
         <source obj="obj_1" outlet="parasailing"/>
         <dest obj="selectChan16_1" inlet="b00"/>
      </net>
      <net>
         <source obj="obj_1" outlet="diving"/>
         <dest obj="selectChan16_1" inlet="b01"/>
      </net>
      <net>
         <source obj="obj_1" outlet="canoing"/>
         <dest obj="selectChan16_1" inlet="b02"/>
      </net>
      <net>
         <source obj="obj_1" outlet="swimming"/>
         <dest obj="selectChan16_1" inlet="b03"/>
      </net>
      <net>
         <source obj="obj_1" outlet="sailing"/>
         <dest obj="selectChan16_1" inlet="b04"/>
      </net>
      <net>
         <source obj="obj_1" outlet="fishing"/>
         <dest obj="selectChan16_1" inlet="b05"/>
      </net>
      <net>
         <source obj="obj_1" outlet="anchor"/>
         <dest obj="selectChan16_1" inlet="b06"/>
      </net>
      <net>
         <source obj="obj_1" outlet="showers"/>
         <dest obj="selectChan16_1" inlet="b07"/>
      </net>
      <net>
         <source obj="obj_1" outlet="ski_down"/>
         <dest obj="selectChan16_1" inlet="b08"/>
      </net>
      <net>
         <source obj="obj_1" outlet="ski_cross"/>
         <dest obj="selectChan16_1" inlet="b09"/>
      </net>
      <net>
         <source obj="obj_1" outlet="skating"/>
         <dest obj="selectChan16_1" inlet="b10"/>
      </net>
      <net>
         <source obj="obj_1" outlet="tram"/>
         <dest obj="selectChan16_1" inlet="b11"/>
      </net>
      <net>
         <source obj="obj_1" outlet="sledding"/>
         <dest obj="selectChan16_1" inlet="b12"/>
      </net>
      <net>
         <source obj="obj_1" outlet="snowmowbiling"/>
         <dest obj="selectChan16_1" inlet="b13"/>
      </net>
      <net>
         <source obj="obj_1" outlet="hiking"/>
         <dest obj="selectChan16_1" inlet="b14"/>
      </net>
      <net>
         <source obj="obj_1" outlet="horsebackriding"/>
         <dest obj="selectChan16_1" inlet="b15"/>
      </net>
      <net>
         <source obj="selectChan16_1" outlet="out"/>
         <dest obj="i_3" inlet="in"/>
         <dest obj="Step Value Array" inlet="stepIn_"/>
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
      </net>
      <net>
         <source obj="Step Value Array" outlet="AttackOut"/>
         <dest obj="dial_3" inlet="in"/>
      </net>
      <net>
         <source obj="Step Value Array" outlet="DecayOut"/>
         <dest obj="dial_4" inlet="in"/>
      </net>
      <net>
         <source obj="Step Value Array" outlet="SustainOut"/>
         <dest obj="dial_5" inlet="in"/>
      </net>
      <net>
         <source obj="Step Value Array" outlet="ReleaseOut"/>
         <dest obj="dial_6" inlet="in"/>
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
         <dest obj="obj_2" inlet="Row"/>
      </net>
      <net>
         <source obj="obj_1" outlet="knob_bot_7"/>
         <dest obj="obj_2" inlet="Col"/>
      </net>
      <net>
         <source obj="obj_2" outlet="stepnum"/>
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