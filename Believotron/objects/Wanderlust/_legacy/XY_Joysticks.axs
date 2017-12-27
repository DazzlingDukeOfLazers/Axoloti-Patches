<patch-1.0 appVersion="1.0.10">
   <obj type="gpio/in/analog" uuid="1c0c845ed2d7e06ae5f377ba13d9d09f4747ac87" name="analog_2" x="98" y="98">
      <params/>
      <attribs>
         <combo attributeName="channel" selection="PC1 (ADC1_IN11)"/>
      </attribs>
   </obj>
   <obj type="disp/dial b" uuid="9ffed04e6a3052d9001eda83bae7024cb6d17037" name="dial_2" x="378" y="112">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="joyLX" x="476" y="112">
      <params/>
      <attribs/>
   </obj>
   <obj type="gpio/in/analog" uuid="1c0c845ed2d7e06ae5f377ba13d9d09f4747ac87" name="analog_1" x="98" y="196">
      <params/>
      <attribs>
         <combo attributeName="channel" selection="PC4 (ADC1_IN14)"/>
      </attribs>
   </obj>
   <obj type="disp/dial b" uuid="9ffed04e6a3052d9001eda83bae7024cb6d17037" name="dial_1" x="378" y="196">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="joyLY" x="476" y="196">
      <params/>
      <attribs/>
   </obj>
   <obj type="gpio/in/analog" uuid="1c0c845ed2d7e06ae5f377ba13d9d09f4747ac87" name="analog_4" x="98" y="280">
      <params/>
      <attribs>
         <combo attributeName="channel" selection="PC2 (ADC1_IN12)"/>
      </attribs>
   </obj>
   <obj type="disp/dial b" uuid="9ffed04e6a3052d9001eda83bae7024cb6d17037" name="dial_4" x="378" y="294">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="joyRX" x="476" y="294">
      <params/>
      <attribs/>
   </obj>
   <obj type="gpio/in/analog" uuid="1c0c845ed2d7e06ae5f377ba13d9d09f4747ac87" name="analog_3" x="98" y="350">
      <params/>
      <attribs>
         <combo attributeName="channel" selection="PC3 (ADC1_IN13)"/>
      </attribs>
   </obj>
   <obj type="disp/dial b" uuid="9ffed04e6a3052d9001eda83bae7024cb6d17037" name="dial_3" x="378" y="364">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="joyRY" x="476" y="364">
      <params/>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="analog_1" outlet="out"/>
         <dest obj="dial_1" inlet="in"/>
         <dest obj="joyLY" inlet="outlet"/>
      </net>
      <net>
         <source obj="analog_2" outlet="out"/>
         <dest obj="dial_2" inlet="in"/>
         <dest obj="joyLX" inlet="outlet"/>
      </net>
      <net>
         <source obj="analog_3" outlet="out"/>
         <dest obj="dial_3" inlet="in"/>
         <dest obj="joyRY" inlet="outlet"/>
      </net>
      <net>
         <source obj="analog_4" outlet="out"/>
         <dest obj="dial_4" inlet="in"/>
         <dest obj="joyRX" inlet="outlet"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>no</subpatchmode>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>-1735</x>
      <y>233</y>
      <width>1258</width>
      <height>934</height>
   </windowPos>
</patch-1.0>