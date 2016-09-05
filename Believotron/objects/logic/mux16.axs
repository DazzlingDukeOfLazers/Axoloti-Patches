<patch-1.0 appVersion="1.0.10">
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="i0" x="28" y="28">
      <params/>
      <attribs/>
   </obj>
   <obj type="mux/mux 8" uuid="de5167d9da39b04039376e8cc620ea2afc22e28a" name="mux_2" x="392" y="56">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="i1" x="28" y="70">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="i2" x="28" y="112">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="i3" x="28" y="154">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="i4" x="28" y="196">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/-" uuid="3280bb759e9fc189e134300e48dda7e903c9a110" name="-_1" x="686" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/*" uuid="13882852b58661ad012ffbe246470b5df4b6c5d1" name="*_1" x="770" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="CurrentChVal" x="840" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/recv i" uuid="c57c3fb0d08bcb566403f4fb43426338bd37ce1f" name="recv_4" x="336" y="224">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="stepPos"/>
      </attribs>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="i5" x="28" y="238">
      <params/>
      <attribs/>
   </obj>
   <obj type="mux/mux 2" uuid="3bcb8a666381ed18b8962eda50b1aa679136f618" name="mux_4" x="490" y="252">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="i6" x="28" y="280">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/i" uuid="a3786816db6ea5bc6ac4193a5cccdb2c83b83496" name="i_2" x="602" y="294">
      <params>
         <int32 name="value" value="32"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="i7" x="28" y="322">
      <params/>
      <attribs/>
   </obj>
   <obj type="mux/mux 8" uuid="de5167d9da39b04039376e8cc620ea2afc22e28a" name="mux_3" x="406" y="322">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/i" uuid="a3786816db6ea5bc6ac4193a5cccdb2c83b83496" name="i_1" x="700" y="364">
      <params>
         <int32 name="value" value="2"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="i8" x="28" y="392">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/recv i" uuid="c57c3fb0d08bcb566403f4fb43426338bd37ce1f" name="recv_2" x="168" y="420">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="stepPos"/>
      </attribs>
   </obj>
   <obj type="phi/math/-+ i" uuid="e5bf3953ead204874692af5d85cww43a027g74f1" name="-+_1" x="308" y="420">
      <params>
         <int32 name="c" value="-8"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="i9" x="28" y="434">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="i10" x="28" y="476">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/recv i" uuid="c57c3fb0d08bcb566403f4fb43426338bd37ce1f" name="recv_5" x="168" y="490">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="stepPos"/>
      </attribs>
   </obj>
   <obj type="drj/math/&lt; const i" uuid="b798cf9d5a1b4a65236aeb4da17a59539d64bc2f" name="&lt;_2" x="308" y="490">
      <params/>
      <attribs>
         <spinner attributeName="value" value="8"/>
      </attribs>
   </obj>
   <obj type="logic/inv" uuid="2bd44b865d3b63ff9b80862242bf5be779e3ad5" name="inv_1" x="420" y="490">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_1" x="574" y="490">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="i11" x="28" y="518">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="i12" x="28" y="560">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="i13" x="28" y="602">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="i14" x="28" y="644">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="i15" x="28" y="686">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/send i" uuid="452e1d7a88de691f954015e6fec2f6994e1b35fc" name="stepPos" x="182" y="728">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet i" uuid="f11927f00c59219df0c50f73056aa19f125540b7" name="inlet_1" x="42" y="742">
      <params/>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="mux_2" outlet="o"/>
         <dest obj="mux_4" inlet="i1"/>
      </net>
      <net>
         <source obj="-+_1" outlet="out"/>
         <dest obj="mux_3" inlet="s"/>
      </net>
      <net>
         <source obj="recv_2" outlet="v"/>
         <dest obj="-+_1" inlet="in"/>
      </net>
      <net>
         <source obj="recv_4" outlet="v"/>
         <dest obj="mux_2" inlet="s"/>
      </net>
      <net>
         <source obj="recv_5" outlet="v"/>
         <dest obj="&lt;_2" inlet="in"/>
      </net>
      <net>
         <source obj="&lt;_2" outlet="out"/>
         <dest obj="inv_1" inlet="i"/>
      </net>
      <net>
         <source obj="mux_4" outlet="o"/>
         <dest obj="-_1" inlet="in1"/>
      </net>
      <net>
         <source obj="inlet_1" outlet="inlet"/>
         <dest obj="stepPos" inlet="v"/>
      </net>
      <net>
         <source obj="inv_1" outlet="o"/>
         <dest obj="bool_1" inlet="in"/>
         <dest obj="mux_4" inlet="s"/>
      </net>
      <net>
         <source obj="mux_3" outlet="o"/>
         <dest obj="mux_4" inlet="i2"/>
      </net>
      <net>
         <source obj="i0" outlet="inlet"/>
         <dest obj="mux_2" inlet="i0"/>
      </net>
      <net>
         <source obj="i1" outlet="inlet"/>
         <dest obj="mux_2" inlet="i1"/>
      </net>
      <net>
         <source obj="i2" outlet="inlet"/>
         <dest obj="mux_2" inlet="i2"/>
      </net>
      <net>
         <source obj="i3" outlet="inlet"/>
         <dest obj="mux_2" inlet="i3"/>
      </net>
      <net>
         <source obj="i4" outlet="inlet"/>
         <dest obj="mux_2" inlet="i4"/>
      </net>
      <net>
         <source obj="i5" outlet="inlet"/>
         <dest obj="mux_2" inlet="i5"/>
      </net>
      <net>
         <source obj="i6" outlet="inlet"/>
         <dest obj="mux_2" inlet="i6"/>
      </net>
      <net>
         <source obj="i7" outlet="inlet"/>
         <dest obj="mux_2" inlet="i7"/>
      </net>
      <net>
         <source obj="i8" outlet="inlet"/>
         <dest obj="mux_3" inlet="i0"/>
      </net>
      <net>
         <source obj="i9" outlet="inlet"/>
         <dest obj="mux_3" inlet="i1"/>
      </net>
      <net>
         <source obj="i10" outlet="inlet"/>
         <dest obj="mux_3" inlet="i2"/>
      </net>
      <net>
         <source obj="i11" outlet="inlet"/>
         <dest obj="mux_3" inlet="i3"/>
      </net>
      <net>
         <source obj="i12" outlet="inlet"/>
         <dest obj="mux_3" inlet="i4"/>
      </net>
      <net>
         <source obj="i13" outlet="inlet"/>
         <dest obj="mux_3" inlet="i5"/>
      </net>
      <net>
         <source obj="i14" outlet="inlet"/>
         <dest obj="mux_3" inlet="i6"/>
      </net>
      <net>
         <source obj="i15" outlet="inlet"/>
         <dest obj="mux_3" inlet="i7"/>
      </net>
      <net>
         <source obj="i_1" outlet="out"/>
         <dest obj="*_1" inlet="b"/>
      </net>
      <net>
         <source obj="*_1" outlet="result"/>
         <dest obj="CurrentChVal" inlet="outlet"/>
      </net>
      <net>
         <source obj="i_2" outlet="out"/>
         <dest obj="-_1" inlet="in2"/>
      </net>
      <net>
         <source obj="-_1" outlet="out"/>
         <dest obj="*_1" inlet="a"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>no</subpatchmode>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>-1628</x>
      <y>316</y>
      <width>1057</width>
      <height>814</height>
   </windowPos>
</patch-1.0>