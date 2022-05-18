<patch-1.0 appVersion="1.0.10">
   <obj type="patch/outlet a" uuid="abd8c5fd3b0524a6630f65cad6dc27f6c58e2a3e" name="Top" x="1246" y="294">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet a" uuid="abd8c5fd3b0524a6630f65cad6dc27f6c58e2a3e" name="Bottom" x="1246" y="364">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet i" uuid="f11927f00c59219df0c50f73056aa19f125540b7" name="stepPos" x="154" y="392">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/change" uuid="96e39ae624c3f3c952cec4a95e1986ee0104f718" name="change_1" x="574" y="434">
      <params/>
      <attribs/>
   </obj>
   <obj type="env/adsr" sha="2c4b16047d03b574d8a72b651f130895749eb670" uuid="d1dbcc5fa6f87b98a6a91c87fd44acee5e690bac" name="topEnv" x="728" y="434">
      <params>
         <frac32.s.map name="a" onParent="true" value="-29.0"/>
         <frac32.s.map name="d" onParent="true" value="-16.0"/>
         <frac32.u.map name="s" onParent="true" value="41.5"/>
         <frac32.s.map name="r" onParent="true" value="38.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="math/*c" uuid="7d5ef61c3bcd571ee6bbd8437ef3612125dfb225" name="*c_1" x="854" y="434">
      <params>
         <frac32.u.map name="amp" value="61.5"/>
      </params>
      <attribs/>
   </obj>
   <obj type="gain/vca" sha="9f05a910184d5ba1a2b974c295057d10160c4a10" uuid="a9f2dcd18043e2f47364e45cb8814f63c2a37c0d" name="vca_1" x="966" y="434">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet i" uuid="f11927f00c59219df0c50f73056aa19f125540b7" name="topCh" x="154" y="574">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet a" uuid="b577fe41e0a6bc7b5502ce33cb8a3129e2e28ee5" name="i00" x="154" y="616">
      <params/>
      <attribs/>
   </obj>
   <obj type="mux/mux 8" uuid="a09f1f8ed9a5ae2334f6eaee0bf5500cdaa683ea" name="mux_2" x="728" y="644">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet a" uuid="b577fe41e0a6bc7b5502ce33cb8a3129e2e28ee5" name="i01" x="154" y="658">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet a" uuid="b577fe41e0a6bc7b5502ce33cb8a3129e2e28ee5" name="i02" x="154" y="700">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet a" uuid="b577fe41e0a6bc7b5502ce33cb8a3129e2e28ee5" name="i03" x="154" y="742">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet a" uuid="b577fe41e0a6bc7b5502ce33cb8a3129e2e28ee5" name="i04" x="154" y="784">
      <params/>
      <attribs/>
   </obj>
   <obj type="mix/mix 2" uuid="30c04239c88e09d3fa5c333b784ecf54f1b0e268" name="mix_1" x="1148" y="784">
      <params>
         <frac32.u.map name="gain1" value="32.0"/>
         <frac32.u.map name="gain2" value="32.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet a" uuid="abd8c5fd3b0524a6630f65cad6dc27f6c58e2a3e" name="mix" x="1316" y="784">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet a" uuid="b577fe41e0a6bc7b5502ce33cb8a3129e2e28ee5" name="i05" x="154" y="826">
      <params/>
      <attribs/>
   </obj>
   <obj type="env/adsr" sha="2c4b16047d03b574d8a72b651f130895749eb670" uuid="d1dbcc5fa6f87b98a6a91c87fd44acee5e690bac" name="botEnv" x="728" y="826">
      <params>
         <frac32.s.map name="a" onParent="true" value="-54.0"/>
         <frac32.s.map name="d" onParent="true" value="-28.0"/>
         <frac32.u.map name="s" onParent="true" value="60.0"/>
         <frac32.s.map name="r" onParent="true" value="36.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="math/*c" uuid="7d5ef61c3bcd571ee6bbd8437ef3612125dfb225" name="*c_2" x="854" y="826">
      <params>
         <frac32.u.map name="amp" value="19.5"/>
      </params>
      <attribs/>
   </obj>
   <obj type="gain/vca" sha="9f05a910184d5ba1a2b974c295057d10160c4a10" uuid="a9f2dcd18043e2f47364e45cb8814f63c2a37c0d" name="vca_2" x="966" y="826">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet a" uuid="b577fe41e0a6bc7b5502ce33cb8a3129e2e28ee5" name="i06" x="154" y="868">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet a" uuid="b577fe41e0a6bc7b5502ce33cb8a3129e2e28ee5" name="i07" x="154" y="910">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet i" uuid="f11927f00c59219df0c50f73056aa19f125540b7" name="botCh" x="154" y="966">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet a" uuid="b577fe41e0a6bc7b5502ce33cb8a3129e2e28ee5" name="i08" x="154" y="1008">
      <params/>
      <attribs/>
   </obj>
   <obj type="mux/mux 8" uuid="a09f1f8ed9a5ae2334f6eaee0bf5500cdaa683ea" name="mux_5" x="728" y="1036">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet a" uuid="b577fe41e0a6bc7b5502ce33cb8a3129e2e28ee5" name="i09" x="154" y="1050">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet a" uuid="b577fe41e0a6bc7b5502ce33cb8a3129e2e28ee5" name="i10" x="154" y="1092">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet a" uuid="b577fe41e0a6bc7b5502ce33cb8a3129e2e28ee5" name="i11" x="154" y="1134">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet a" uuid="b577fe41e0a6bc7b5502ce33cb8a3129e2e28ee5" name="i12" x="154" y="1176">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet a" uuid="b577fe41e0a6bc7b5502ce33cb8a3129e2e28ee5" name="i13" x="154" y="1218">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet a" uuid="b577fe41e0a6bc7b5502ce33cb8a3129e2e28ee5" name="i14" x="154" y="1260">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet a" uuid="b577fe41e0a6bc7b5502ce33cb8a3129e2e28ee5" name="i15" x="154" y="1302">
      <params/>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="topEnv" outlet="env"/>
         <dest obj="*c_1" inlet="in"/>
      </net>
      <net>
         <source obj="*c_1" outlet="out"/>
         <dest obj="vca_1" inlet="v"/>
      </net>
      <net>
         <source obj="change_1" outlet="trig"/>
         <dest obj="topEnv" inlet="gate"/>
         <dest obj="botEnv" inlet="gate"/>
      </net>
      <net>
         <source obj="mux_2" outlet="o"/>
         <dest obj="vca_1" inlet="a"/>
      </net>
      <net>
         <source obj="botEnv" outlet="env"/>
         <dest obj="*c_2" inlet="in"/>
      </net>
      <net>
         <source obj="*c_2" outlet="out"/>
         <dest obj="vca_2" inlet="v"/>
      </net>
      <net>
         <source obj="mux_5" outlet="o"/>
         <dest obj="vca_2" inlet="a"/>
      </net>
      <net>
         <source obj="topCh" outlet="inlet"/>
         <dest obj="mux_2" inlet="s"/>
      </net>
      <net>
         <source obj="vca_1" outlet="o"/>
         <dest obj="mix_1" inlet="in1"/>
         <dest obj="Top" inlet="outlet"/>
      </net>
      <net>
         <source obj="vca_2" outlet="o"/>
         <dest obj="mix_1" inlet="in2"/>
         <dest obj="Bottom" inlet="outlet"/>
      </net>
      <net>
         <source obj="mix_1" outlet="out"/>
         <dest obj="mix" inlet="outlet"/>
      </net>
      <net>
         <source obj="i00" outlet="inlet"/>
         <dest obj="mux_2" inlet="i0"/>
      </net>
      <net>
         <source obj="botCh" outlet="inlet"/>
         <dest obj="mux_5" inlet="s"/>
      </net>
      <net>
         <source obj="i01" outlet="inlet"/>
         <dest obj="mux_2" inlet="i1"/>
      </net>
      <net>
         <source obj="i02" outlet="inlet"/>
         <dest obj="mux_2" inlet="i2"/>
      </net>
      <net>
         <source obj="i03" outlet="inlet"/>
         <dest obj="mux_2" inlet="i3"/>
      </net>
      <net>
         <source obj="i04" outlet="inlet"/>
         <dest obj="mux_2" inlet="i4"/>
      </net>
      <net>
         <source obj="i05" outlet="inlet"/>
         <dest obj="mux_2" inlet="i5"/>
      </net>
      <net>
         <source obj="i06" outlet="inlet"/>
         <dest obj="mux_2" inlet="i6"/>
      </net>
      <net>
         <source obj="i07" outlet="inlet"/>
         <dest obj="mux_2" inlet="i7"/>
      </net>
      <net>
         <source obj="i08" outlet="inlet"/>
         <dest obj="mux_5" inlet="i0"/>
      </net>
      <net>
         <source obj="i09" outlet="inlet"/>
         <dest obj="mux_5" inlet="i1"/>
      </net>
      <net>
         <source obj="i10" outlet="inlet"/>
         <dest obj="mux_5" inlet="i2"/>
      </net>
      <net>
         <source obj="i11" outlet="inlet"/>
         <dest obj="mux_5" inlet="i3"/>
      </net>
      <net>
         <source obj="i12" outlet="inlet"/>
         <dest obj="mux_5" inlet="i4"/>
      </net>
      <net>
         <source obj="i13" outlet="inlet"/>
         <dest obj="mux_5" inlet="i5"/>
      </net>
      <net>
         <source obj="i14" outlet="inlet"/>
         <dest obj="mux_5" inlet="i6"/>
      </net>
      <net>
         <source obj="i15" outlet="inlet"/>
         <dest obj="mux_5" inlet="i7"/>
      </net>
      <net>
         <source obj="stepPos" outlet="inlet"/>
         <dest obj="change_1" inlet="in"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>no</subpatchmode>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>-1770</x>
      <y>60</y>
      <width>1626</width>
      <height>1060</height>
   </windowPos>
</patch-1.0>