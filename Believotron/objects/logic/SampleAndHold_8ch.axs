<patch-1.0 appVersion="1.0.12">
   <obj type="patch/inlet i" uuid="f11927f00c59219df0c50f73056aa19f125540b7" name="chan" x="42" y="0">
      <params/>
      <attribs/>
   </obj>
   <obj type="pmj/math/!=" uuid="51548753-c417-4977-9a32-5b2089b9497c" name="!=_1" x="154" y="28">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/i" uuid="a3786816db6ea5bc6ac4193a5cccdb2c83b83496" name="Channel" x="42" y="42">
      <params>
         <int32 name="value" onParent="true" value="0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="in0" x="140" y="140">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/samplehold" uuid="55479a62c4ed7e3536b6e6f339ce05a802a81b9d" name="samplehold_1" x="280" y="140">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="out0" x="434" y="140">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="in1" x="140" y="196">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/samplehold" uuid="55479a62c4ed7e3536b6e6f339ce05a802a81b9d" name="samplehold_2" x="280" y="196">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="out1" x="434" y="196">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="in2" x="140" y="252">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/samplehold" uuid="55479a62c4ed7e3536b6e6f339ce05a802a81b9d" name="samplehold_3" x="280" y="252">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="out2" x="434" y="252">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="in3" x="140" y="308">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/samplehold" uuid="55479a62c4ed7e3536b6e6f339ce05a802a81b9d" name="samplehold_4" x="280" y="308">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="out3" x="434" y="308">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="in4" x="140" y="364">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/samplehold" uuid="55479a62c4ed7e3536b6e6f339ce05a802a81b9d" name="samplehold_5" x="280" y="364">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="out4" x="434" y="364">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="in5" x="140" y="420">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/samplehold" uuid="55479a62c4ed7e3536b6e6f339ce05a802a81b9d" name="samplehold_6" x="280" y="420">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="out5" x="434" y="420">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="in6" x="140" y="476">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/samplehold" uuid="55479a62c4ed7e3536b6e6f339ce05a802a81b9d" name="samplehold_7" x="280" y="476">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="out6" x="434" y="476">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="in7" x="140" y="532">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/samplehold" uuid="55479a62c4ed7e3536b6e6f339ce05a802a81b9d" name="samplehold_8" x="280" y="532">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="out7" x="434" y="532">
      <params/>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="Channel" outlet="out"/>
         <dest obj="!=_1" inlet="in2"/>
      </net>
      <net>
         <source obj="samplehold_1" outlet="out"/>
         <dest obj="out0" inlet="outlet"/>
      </net>
      <net>
         <source obj="in0" outlet="inlet"/>
         <dest obj="samplehold_1" inlet="in"/>
      </net>
      <net>
         <source obj="chan" outlet="inlet"/>
         <dest obj="!=_1" inlet="in1"/>
      </net>
      <net>
         <source obj="samplehold_2" outlet="out"/>
         <dest obj="out1" inlet="outlet"/>
      </net>
      <net>
         <source obj="in1" outlet="inlet"/>
         <dest obj="samplehold_2" inlet="in"/>
      </net>
      <net>
         <source obj="samplehold_3" outlet="out"/>
         <dest obj="out2" inlet="outlet"/>
      </net>
      <net>
         <source obj="in2" outlet="inlet"/>
         <dest obj="samplehold_3" inlet="in"/>
      </net>
      <net>
         <source obj="samplehold_4" outlet="out"/>
         <dest obj="out3" inlet="outlet"/>
      </net>
      <net>
         <source obj="in3" outlet="inlet"/>
         <dest obj="samplehold_4" inlet="in"/>
      </net>
      <net>
         <source obj="samplehold_5" outlet="out"/>
         <dest obj="out4" inlet="outlet"/>
      </net>
      <net>
         <source obj="in4" outlet="inlet"/>
         <dest obj="samplehold_5" inlet="in"/>
      </net>
      <net>
         <source obj="samplehold_6" outlet="out"/>
         <dest obj="out5" inlet="outlet"/>
      </net>
      <net>
         <source obj="in5" outlet="inlet"/>
         <dest obj="samplehold_6" inlet="in"/>
      </net>
      <net>
         <source obj="samplehold_7" outlet="out"/>
         <dest obj="out6" inlet="outlet"/>
      </net>
      <net>
         <source obj="in6" outlet="inlet"/>
         <dest obj="samplehold_7" inlet="in"/>
      </net>
      <net>
         <source obj="samplehold_8" outlet="out"/>
         <dest obj="out7" inlet="outlet"/>
      </net>
      <net>
         <source obj="in7" outlet="inlet"/>
         <dest obj="samplehold_8" inlet="in"/>
      </net>
      <net>
         <source obj="!=_1" outlet="out"/>
         <dest obj="samplehold_1" inlet="s_h"/>
         <dest obj="samplehold_2" inlet="s_h"/>
         <dest obj="samplehold_3" inlet="s_h"/>
         <dest obj="samplehold_4" inlet="s_h"/>
         <dest obj="samplehold_5" inlet="s_h"/>
         <dest obj="samplehold_6" inlet="s_h"/>
         <dest obj="samplehold_7" inlet="s_h"/>
         <dest obj="samplehold_8" inlet="s_h"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>no</subpatchmode>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>-1852</x>
      <y>224</y>
      <width>927</width>
      <height>763</height>
   </windowPos>
</patch-1.0>