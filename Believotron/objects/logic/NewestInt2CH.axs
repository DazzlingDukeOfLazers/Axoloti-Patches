<patch-1.0 appVersion="1.0.10">
   <comment type="patch/comment" x="14" y="14" text="IMPORTANT: needs samples on sdcard!"/>
   <obj type="mux/mux 2" uuid="3bcb8a666381ed18b8962eda50b1aa679136f618" name="mux_2" x="350" y="84">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet i" uuid="f11927f00c59219df0c50f73056aa19f125540b7" name="A" x="42" y="98">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/change" uuid="96e39ae624c3f3c952cec4a95e1986ee0104f718" name="aWig" x="126" y="98">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/toggle" uuid="f42f0d3aab552c17bc78b9e65f85dc24f977503d" name="toggle_1" x="336" y="98">
      <params/>
      <attribs/>
   </obj>
   <obj type="mux/mux 2" uuid="16f90f81694766b0bc8187bfcba5a021e5701d81" name="mux_1" x="406" y="154">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet i" uuid="aae2176b26209e34e4fdeba5edb1ace82d178655" name="outlet_1" x="504" y="154">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/flipflop" uuid="f9b15363f5ee203152e062c08a8846f0074b0ea5" name="flipflop_1" x="280" y="168">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet i" uuid="f11927f00c59219df0c50f73056aa19f125540b7" name="B" x="98" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/change" uuid="96e39ae624c3f3c952cec4a95e1986ee0104f718" name="bWig_" x="182" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/or 2" uuid="3805d3c84d30032a44fbdbe42d9a2988a1790a3e" name="or_1" x="336" y="266">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="outlet_2" x="504" y="266">
      <params/>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="A" outlet="inlet"/>
         <dest obj="aWig" inlet="in"/>
         <dest obj="mux_1" inlet="i1"/>
      </net>
      <net>
         <source obj="B" outlet="inlet"/>
         <dest obj="bWig_" inlet="in"/>
         <dest obj="mux_1" inlet="i2"/>
      </net>
      <net>
         <source obj="aWig" outlet="trig"/>
         <dest obj="flipflop_1" inlet="reset"/>
         <dest obj="or_1" inlet="i1"/>
      </net>
      <net>
         <source obj="flipflop_1" outlet="o"/>
         <dest obj="mux_1" inlet="s"/>
      </net>
      <net>
         <source obj="mux_1" outlet="o"/>
         <dest obj="outlet_1" inlet="outlet"/>
      </net>
      <net>
         <source obj="bWig_" outlet="trig"/>
         <dest obj="flipflop_1" inlet="set"/>
         <dest obj="or_1" inlet="i2"/>
      </net>
      <net>
         <source obj="or_1" outlet="o"/>
         <dest obj="outlet_2" inlet="outlet"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>no</subpatchmode>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>-2135</x>
      <y>-87</y>
      <width>671</width>
      <height>497</height>
   </windowPos>
</patch-1.0>