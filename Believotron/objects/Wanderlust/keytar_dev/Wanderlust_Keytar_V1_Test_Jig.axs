<patch-1.0 appVersion="1.0.12">
   <obj type="disp/dial b" uuid="9ffed04e6a3052d9001eda83bae7024cb6d17037" name="dial_4" x="448" y="28">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/dial p" uuid="44fd18b562e434b3230441681132dbeabb15cdc5" name="dial_1" x="448" y="140">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/dial p" uuid="44fd18b562e434b3230441681132dbeabb15cdc5" name="dial_10" x="518" y="140">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/dial p" uuid="44fd18b562e434b3230441681132dbeabb15cdc5" name="dial_11" x="588" y="140">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/dial p" uuid="44fd18b562e434b3230441681132dbeabb15cdc5" name="dial_12" x="658" y="140">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/dial p" uuid="44fd18b562e434b3230441681132dbeabb15cdc5" name="dial_13" x="728" y="140">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/dial p" uuid="44fd18b562e434b3230441681132dbeabb15cdc5" name="dial_14" x="798" y="140">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/dial p" uuid="44fd18b562e434b3230441681132dbeabb15cdc5" name="dial_15" x="868" y="140">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/dial p" uuid="44fd18b562e434b3230441681132dbeabb15cdc5" name="dial_16" x="938" y="140">
      <params/>
      <attribs/>
   </obj>
   <obj type="Wanderlust/Wanderlust_Keytar_V1" uuid="768ad288-4b99-4e0a-890e-43a47281ca22" name="obj_1" x="112" y="196">
      <params>
         <bool32.tgl name="Reverse Knobs" value="0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="disp/dial p" uuid="44fd18b562e434b3230441681132dbeabb15cdc5" name="dial_17" x="532" y="308">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/dial p" uuid="44fd18b562e434b3230441681132dbeabb15cdc5" name="dial_2" x="462" y="364">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_13" x="532" y="392">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_21" x="644" y="980">
      <params/>
      <attribs/>
   </obj>
   <obj type="gpio/in/analog" uuid="1c0c845ed2d7e06ae5f377ba13d9d09f4747ac87" name="analog_2" x="630" y="1386">
      <params/>
      <attribs>
         <combo attributeName="channel" selection="PC1 (ADC1_IN11)"/>
      </attribs>
   </obj>
   <obj type="disp/dial b" uuid="9ffed04e6a3052d9001eda83bae7024cb6d17037" name="dial_6" x="910" y="1400">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="joyLX" x="1008" y="1400">
      <params/>
      <attribs/>
   </obj>
   <obj type="gpio/in/analog" uuid="1c0c845ed2d7e06ae5f377ba13d9d09f4747ac87" name="analog_1" x="630" y="1484">
      <params/>
      <attribs>
         <combo attributeName="channel" selection="PC4 (ADC1_IN14)"/>
      </attribs>
   </obj>
   <obj type="disp/dial b" uuid="9ffed04e6a3052d9001eda83bae7024cb6d17037" name="dial_7" x="910" y="1484">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="joyLY" x="1008" y="1484">
      <params/>
      <attribs/>
   </obj>
   <obj type="gpio/in/analog" uuid="1c0c845ed2d7e06ae5f377ba13d9d09f4747ac87" name="analog_4" x="630" y="1568">
      <params/>
      <attribs>
         <combo attributeName="channel" selection="PC2 (ADC1_IN12)"/>
      </attribs>
   </obj>
   <obj type="disp/dial b" uuid="9ffed04e6a3052d9001eda83bae7024cb6d17037" name="dial_8" x="910" y="1582">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="joyRX" x="1008" y="1582">
      <params/>
      <attribs/>
   </obj>
   <obj type="gpio/in/analog" uuid="1c0c845ed2d7e06ae5f377ba13d9d09f4747ac87" name="analog_3" x="630" y="1638">
      <params/>
      <attribs>
         <combo attributeName="channel" selection="PC3 (ADC1_IN13)"/>
      </attribs>
   </obj>
   <obj type="disp/dial b" uuid="9ffed04e6a3052d9001eda83bae7024cb6d17037" name="dial_9" x="910" y="1652">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="joyRY" x="1008" y="1652">
      <params/>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="analog_1" outlet="out"/>
         <dest obj="dial_7" inlet="in"/>
         <dest obj="joyLY" inlet="outlet"/>
      </net>
      <net>
         <source obj="analog_2" outlet="out"/>
         <dest obj="dial_6" inlet="in"/>
         <dest obj="joyLX" inlet="outlet"/>
      </net>
      <net>
         <source obj="analog_3" outlet="out"/>
         <dest obj="dial_9" inlet="in"/>
         <dest obj="joyRY" inlet="outlet"/>
      </net>
      <net>
         <source obj="analog_4" outlet="out"/>
         <dest obj="dial_8" inlet="in"/>
         <dest obj="joyRX" inlet="outlet"/>
      </net>
      <net>
         <source obj="obj_1" outlet="Volume"/>
         <dest obj="dial_4" inlet="in"/>
      </net>
      <net>
         <source obj="obj_1" outlet="knob_top_0"/>
         <dest obj="dial_1" inlet="in"/>
      </net>
      <net>
         <source obj="obj_1" outlet="knob_top_1"/>
         <dest obj="dial_10" inlet="in"/>
      </net>
      <net>
         <source obj="obj_1" outlet="knob_top_2"/>
         <dest obj="dial_11" inlet="in"/>
      </net>
      <net>
         <source obj="obj_1" outlet="knob_top_3"/>
         <dest obj="dial_12" inlet="in"/>
      </net>
      <net>
         <source obj="obj_1" outlet="knob_top_4"/>
         <dest obj="dial_13" inlet="in"/>
      </net>
      <net>
         <source obj="obj_1" outlet="knob_top_5"/>
         <dest obj="dial_14" inlet="in"/>
      </net>
      <net>
         <source obj="obj_1" outlet="knob_top_6"/>
         <dest obj="dial_15" inlet="in"/>
      </net>
      <net>
         <source obj="obj_1" outlet="knob_top_7"/>
         <dest obj="dial_16" inlet="in"/>
      </net>
      <net>
         <source obj="obj_1" outlet="JOYX"/>
         <dest obj="dial_2" inlet="in"/>
      </net>
      <net>
         <source obj="obj_1" outlet="JOYY"/>
         <dest obj="dial_17" inlet="in"/>
      </net>
      <net>
         <source obj="obj_1" outlet="JOY0_BTN"/>
         <dest obj="bool_13" inlet="in"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>no</subpatchmode>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>383</x>
      <y>26</y>
      <width>1506</width>
      <height>1003</height>
   </windowPos>
</patch-1.0>