<patch-1.0 appVersion="1.0.12">
   <obj type="ctrl/i" uuid="a3786816db6ea5bc6ac4193a5cccdb2c83b83496" name="i_2" x="0" y="28">
      <params>
         <int32 name="value" value="0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="16_Step_SynthModel" uuid="56e1528a-09ba-44a4-854a-ee710c87e2f7" name="16_Step_SynthModel_1" x="658" y="70">
      <params/>
      <attribs/>
   </obj>
   <obj type="Wanderlust_beta1" uuid="2909b311-008d-40f4-962d-6a3a5f2d2a8e" name="Wanderlust_beta1_1" x="140" y="112">
      <params>
         <bool32.tgl name="Reverse Knobs" value="0"/>
         <bool32.tgl name="Rev Padrow Top" value="0"/>
         <bool32.tgl name="Rev Padrow Bottom" value="1"/>
      </params>
      <attribs/>
   </obj>
   <obj type="logic/selectChan16" uuid="4817e28e-6ae3-44e2-a76c-ea37b87d2a0d" name="selectChan16_1" x="350" y="336">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/i" uuid="5e35fd0c62d81e70017289250cf28edd26e19e4a" name="i_3" x="504" y="336">
      <params/>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="Wanderlust_beta1_1" outlet="knob_top_0"/>
         <dest obj="16_Step_SynthModel_1" inlet="AttackIn"/>
      </net>
      <net>
         <source obj="Wanderlust_beta1_1" outlet="knob_top_1"/>
         <dest obj="16_Step_SynthModel_1" inlet="DecayIn"/>
      </net>
      <net>
         <source obj="Wanderlust_beta1_1" outlet="knob_top_2"/>
         <dest obj="16_Step_SynthModel_1" inlet="SustainIn"/>
      </net>
      <net>
         <source obj="Wanderlust_beta1_1" outlet="knob_top_3"/>
         <dest obj="16_Step_SynthModel_1" inlet="ReleaseIn"/>
      </net>
      <net>
         <source obj="i_2" outlet="out"/>
         <dest obj="16_Step_SynthModel_1" inlet="stepOut_"/>
         <dest obj="Wanderlust_beta1_1" inlet="step"/>
      </net>
      <net>
         <source obj="Wanderlust_beta1_1" outlet="parasailing"/>
         <dest obj="selectChan16_1" inlet="b00"/>
      </net>
      <net>
         <source obj="Wanderlust_beta1_1" outlet="diving"/>
         <dest obj="selectChan16_1" inlet="b01"/>
      </net>
      <net>
         <source obj="Wanderlust_beta1_1" outlet="canoing"/>
         <dest obj="selectChan16_1" inlet="b02"/>
      </net>
      <net>
         <source obj="Wanderlust_beta1_1" outlet="swimming"/>
         <dest obj="selectChan16_1" inlet="b03"/>
      </net>
      <net>
         <source obj="Wanderlust_beta1_1" outlet="sailing"/>
         <dest obj="selectChan16_1" inlet="b04"/>
      </net>
      <net>
         <source obj="Wanderlust_beta1_1" outlet="fishing"/>
         <dest obj="selectChan16_1" inlet="b05"/>
      </net>
      <net>
         <source obj="Wanderlust_beta1_1" outlet="anchor"/>
         <dest obj="selectChan16_1" inlet="b06"/>
      </net>
      <net>
         <source obj="Wanderlust_beta1_1" outlet="showers"/>
         <dest obj="selectChan16_1" inlet="b07"/>
      </net>
      <net>
         <source obj="Wanderlust_beta1_1" outlet="ski_down"/>
         <dest obj="selectChan16_1" inlet="b08"/>
      </net>
      <net>
         <source obj="Wanderlust_beta1_1" outlet="ski_cross"/>
         <dest obj="selectChan16_1" inlet="b09"/>
      </net>
      <net>
         <source obj="Wanderlust_beta1_1" outlet="skating"/>
         <dest obj="selectChan16_1" inlet="b10"/>
      </net>
      <net>
         <source obj="Wanderlust_beta1_1" outlet="tram"/>
         <dest obj="selectChan16_1" inlet="b11"/>
      </net>
      <net>
         <source obj="Wanderlust_beta1_1" outlet="sledding"/>
         <dest obj="selectChan16_1" inlet="b12"/>
      </net>
      <net>
         <source obj="Wanderlust_beta1_1" outlet="snowmowbiling"/>
         <dest obj="selectChan16_1" inlet="b13"/>
      </net>
      <net>
         <source obj="Wanderlust_beta1_1" outlet="hiking"/>
         <dest obj="selectChan16_1" inlet="b14"/>
      </net>
      <net>
         <source obj="Wanderlust_beta1_1" outlet="horsebackriding"/>
         <dest obj="selectChan16_1" inlet="b15"/>
      </net>
      <net>
         <source obj="selectChan16_1" outlet="out"/>
         <dest obj="i_3" inlet="in"/>
         <dest obj="16_Step_SynthModel_1" inlet="inlet_1"/>
      </net>
      <net>
         <source obj="Wanderlust_beta1_1" outlet="knob_top_4"/>
         <dest obj="16_Step_SynthModel_1" inlet="VolumeIn"/>
      </net>
      <net>
         <source obj="Wanderlust_beta1_1" outlet="knob_top_5"/>
         <dest obj="16_Step_SynthModel_1" inlet="PitchIn"/>
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