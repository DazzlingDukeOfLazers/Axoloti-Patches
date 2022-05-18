<patch-1.0 appVersion="1.0.12">
   <obj type="math/*" uuid="6a31299e3a491edd8c4df0e809a519a35cc08a3b" name="*_1" x="294" y="28">
      <params/>
      <attribs/>
   </obj>
   <obj type="const/i" uuid="e202f44b2df17ae0b3e663b98ea6b14c8ff00408" name="i_1" x="196" y="42">
      <params/>
      <attribs>
         <spinner attributeName="value" value="16"/>
      </attribs>
   </obj>
   <obj type="math/min" uuid="e8e70895f32cf1d38f8c4ed78774c30ff352375d" name="min_1" x="420" y="42">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet i" uuid="aae2176b26209e34e4fdeba5edb1ace82d178655" name="row" x="602" y="42">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/+" uuid="b94a9b8e9adcb7d18868c0ee808a9b211b65578d" name="+_1" x="518" y="98">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet i" uuid="aae2176b26209e34e4fdeba5edb1ace82d178655" name="stepNum" x="602" y="98">
      <params/>
      <attribs/>
   </obj>
   <obj type="conv/to i" uuid="305966430ee86b5c3b8e18cde0c721657c558a87" name="to_1" x="266" y="112">
      <params/>
      <attribs/>
   </obj>
   <obj type="const/i" uuid="e202f44b2df17ae0b3e663b98ea6b14c8ff00408" name="i_5" x="336" y="112">
      <params/>
      <attribs>
         <spinner attributeName="value" value="48"/>
      </attribs>
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
   <obj type="logic/change" uuid="96e39ae624c3f3c952cec4a95e1986ee0104f718" name="change_1" x="602" y="154">
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
   <obj type="conv/to i" uuid="305966430ee86b5c3b8e18cde0c721657c558a87" name="to_2" x="266" y="182">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet i" uuid="aae2176b26209e34e4fdeba5edb1ace82d178655" name="col" x="602" y="210">
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
         <dest obj="to_2" inlet="i"/>
      </net>
      <net>
         <source obj="div_2" outlet="out"/>
         <dest obj="round_2" inlet="in"/>
      </net>
      <net>
         <source obj="round_2" outlet="out"/>
         <dest obj="to_1" inlet="i"/>
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
         <dest obj="change_1" inlet="in"/>
         <dest obj="stepNum" inlet="outlet"/>
      </net>
      <net>
         <source obj="change_1" outlet="trig"/>
         <dest obj="chchchchanges" inlet="outlet"/>
      </net>
      <net>
         <source obj="to_1" outlet="o"/>
         <dest obj="*_1" inlet="a"/>
         <dest obj="row" inlet="outlet"/>
      </net>
      <net>
         <source obj="to_2" outlet="o"/>
         <dest obj="min_2" inlet="in1"/>
         <dest obj="col" inlet="outlet"/>
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