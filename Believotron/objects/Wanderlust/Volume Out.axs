<patch-1.0 appVersion="1.0.10">
   <obj type="ctrl/dial p" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="dial_6" x="168" y="0">
      <params>
         <frac32.u.map name="value" value="64.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="mux/mux 2" uuid="3bcb8a666381ed18b8962eda50b1aa679136f618" name="mux_1" x="364" y="14">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/*" uuid="3ac307b9f782049739ed62504081b96d580ea336" name="*_1" x="490" y="42">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/*c" uuid="7a66f52a9594e7e9eb31328ea725cb3641a80b55" name="*c_1" x="546" y="42">
      <params>
         <frac32.u.map name="amp" value="64.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/inlet a" uuid="b577fe41e0a6bc7b5502ce33cb8a3129e2e28ee5" name="left" x="42" y="56">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/toggle" uuid="42b8134fa729d54bfc8d62d6ef3fa99498c1de99" name="Enable Vol Knob" x="238" y="56">
      <params>
         <bool32.tgl name="b" onParent="true" value="1"/>
      </params>
      <attribs/>
   </obj>
   <comment type="patch/comment" x="42" y="126" text="Uses volume knob on Believotron Wanderlust controller to control the volume to a stereo out"/>
   <obj type="disp/dial p" uuid="44fd18b562e434b3230441681132dbeabb15cdc5" name="dial_4" x="182" y="140">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="dial_5" x="252" y="140">
      <params>
         <frac32.u.map name="value" value="64.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="audio/out stereo" sha="b933bb91801a126126313c11f773158b5ca2face" name="dac_1" x="672" y="196">
      <params/>
      <attribs/>
   </obj>
   <obj type="gpio/in/analog" uuid="1c0c845ed2d7e06ae5f377ba13d9d09f4747ac87" name="analog_1" x="14" y="210">
      <params/>
      <attribs>
         <combo attributeName="channel" selection="PC0 (ADC1_IN10)"/>
      </attribs>
   </obj>
   <obj type="math/-" uuid="3280bb759e9fc189e134300e48dda7e903c9a110" name="-_1" x="322" y="224">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/dial p" uuid="44fd18b562e434b3230441681132dbeabb15cdc5" name="dial_1" x="392" y="224">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet a" uuid="b577fe41e0a6bc7b5502ce33cb8a3129e2e28ee5" name="right" x="42" y="308">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/*" uuid="3ac307b9f782049739ed62504081b96d580ea336" name="*_2" x="490" y="364">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/*c" uuid="7a66f52a9594e7e9eb31328ea725cb3641a80b55" name="*c_2" x="546" y="364">
      <params>
         <frac32.u.map name="amp" value="64.0"/>
      </params>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="*c_1" outlet="out"/>
         <dest obj="dac_1" inlet="left"/>
      </net>
      <net>
         <source obj="analog_1" outlet="out"/>
         <dest obj="dial_4" inlet="in"/>
         <dest obj="-_1" inlet="in2"/>
      </net>
      <net>
         <source obj="*_1" outlet="result"/>
         <dest obj="*c_1" inlet="in"/>
      </net>
      <net>
         <source obj="dial_5" outlet="out"/>
         <dest obj="-_1" inlet="in1"/>
      </net>
      <net>
         <source obj="-_1" outlet="out"/>
         <dest obj="dial_1" inlet="in"/>
         <dest obj="mux_1" inlet="i2"/>
      </net>
      <net>
         <source obj="left" outlet="inlet"/>
         <dest obj="*_1" inlet="b"/>
      </net>
      <net>
         <source obj="*_2" outlet="result"/>
         <dest obj="*c_2" inlet="in"/>
      </net>
      <net>
         <source obj="right" outlet="inlet"/>
         <dest obj="*_2" inlet="b"/>
      </net>
      <net>
         <source obj="*c_2" outlet="out"/>
         <dest obj="dac_1" inlet="right"/>
      </net>
      <net>
         <source obj="Enable Vol Knob" outlet="o"/>
         <dest obj="mux_1" inlet="s"/>
      </net>
      <net>
         <source obj="dial_6" outlet="out"/>
         <dest obj="mux_1" inlet="i1"/>
      </net>
      <net>
         <source obj="mux_1" outlet="o"/>
         <dest obj="*_1" inlet="a"/>
         <dest obj="*_2" inlet="a"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>no</subpatchmode>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>-1781</x>
      <y>24</y>
      <width>1006</width>
      <height>684</height>
   </windowPos>
</patch-1.0>