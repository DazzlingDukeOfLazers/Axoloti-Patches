<patch-1.0 appVersion="1.0.12">
   <obj type="math/*" uuid="13882852b58661ad012ffbe246470b5df4b6c5d1" name="*_1" x="294" y="28">
      <params/>
      <attribs/>
   </obj>
   <obj type="const/i" uuid="e202f44b2df17ae0b3e663b98ea6b14c8ff00408" name="i_1" x="196" y="42">
      <params/>
      <attribs>
         <spinner attributeName="value" value="16"/>
      </attribs>
   </obj>
   <obj type="math/min" uuid="e3d20abc508a5b2245686febc1caf036edc7f501" name="min_1" x="420" y="42">
      <params/>
      <attribs/>
   </obj>
   <obj type="const/i" uuid="e202f44b2df17ae0b3e663b98ea6b14c8ff00408" name="i_5" x="294" y="98">
      <params/>
      <attribs>
         <spinner attributeName="value" value="48"/>
      </attribs>
   </obj>
   <obj type="math/+" uuid="44553fdc8628c67ab535845ed1be304ad6c9553b" name="+_1" x="518" y="98">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="stepnum" x="602" y="98">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="Row" x="0" y="126">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/div 16" uuid="19cf8d3358046cb69c1139e51a3e1555742492e0" name="div_2" x="84" y="126">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/round" uuid="d0382003e049112e1746390d691d052ae1294db" name="round_2" x="168" y="126">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/change" uuid="42071f8cb4cfe1f35956c0bd5a313a57e049bec4" name="change_2" x="602" y="154">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="chchchchanges" x="700" y="154">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="Col" x="0" y="168">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/div 4" uuid="507955275561b256e540f7205386d31545a2828f" name="div_1" x="84" y="168">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/round" uuid="d0382003e049112e1746390d691d052ae1294db" name="round_1" x="168" y="168">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/min" uuid="e8e70895f32cf1d38f8c4ed78774c30ff352375d" name="min_2" x="406" y="168">
      <params/>
      <attribs/>
   </obj>
   <obj type="const/i" uuid="e202f44b2df17ae0b3e663b98ea6b14c8ff00408" name="i_6" x="294" y="224">
      <params/>
      <attribs>
         <spinner attributeName="value" value="15"/>
      </attribs>
   </obj>
   <nets>
      <net>
         <source obj="div_1" outlet="out"/>
         <dest obj="round_1" inlet="in"/>
      </net>
      <net>
         <source obj="round_1" outlet="out"/>
         <dest obj="min_2" inlet="in1"/>
      </net>
      <net>
         <source obj="div_2" outlet="out"/>
         <dest obj="round_2" inlet="in"/>
      </net>
      <net>
         <source obj="round_2" outlet="out"/>
         <dest obj="*_1" inlet="a"/>
      </net>
      <net>
         <source obj="*_1" outlet="result"/>
         <dest obj="min_1" inlet="in1"/>
      </net>
      <net>
         <source obj="i_1" outlet="out"/>
         <dest obj="*_1" inlet="b"/>
      </net>
      <net>
         <source obj="i_5" outlet="out"/>
         <dest obj="min_1" inlet="in2"/>
      </net>
      <net>
         <source obj="min_1" outlet="out"/>
         <dest obj="+_1" inlet="in1"/>
      </net>
      <net>
         <source obj="i_6" outlet="out"/>
         <dest obj="min_2" inlet="in2"/>
      </net>
      <net>
         <source obj="min_2" outlet="out"/>
         <dest obj="+_1" inlet="in2"/>
      </net>
      <net>
         <source obj="Col" outlet="inlet"/>
         <dest obj="div_1" inlet="in"/>
      </net>
      <net>
         <source obj="Row" outlet="inlet"/>
         <dest obj="div_2" inlet="in"/>
      </net>
      <net>
         <source obj="+_1" outlet="out"/>
         <dest obj="stepnum" inlet="outlet"/>
         <dest obj="change_2" inlet="in"/>
      </net>
      <net>
         <source obj="change_2" outlet="trig"/>
         <dest obj="chchchchanges" inlet="outlet"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>no</subpatchmode>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>-1508</x>
      <y>32</y>
      <width>850</width>
      <height>676</height>
   </windowPos>
</patch-1.0>