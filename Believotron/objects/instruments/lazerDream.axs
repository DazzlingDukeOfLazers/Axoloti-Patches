<patch-1.0 appVersion="1.0.10">
   <obj type="patch/outlet a" uuid="abd8c5fd3b0524a6630f65cad6dc27f6c58e2a3e" name="outlet_1" x="308" y="14">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="inlet_1" x="42" y="42">
      <params/>
      <attribs/>
   </obj>
   <obj type="osc/pwm" uuid="a6b40ff63f161d8bac8ea2eba5b0dbffcf49b472" name="pwm_1" x="182" y="56">
      <params>
         <frac32.s.map name="pitch" value="0.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="lfo/saw" uuid="ef2a162678b533c5e46c4e3c0decba17b1862d85" name="REM" x="42" y="154">
      <params>
         <frac32.s.map name="pitch" onParent="true" value="-32.0"/>
      </params>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="REM" outlet="wave"/>
         <dest obj="pwm_1" inlet="pw"/>
      </net>
      <net>
         <source obj="inlet_1" outlet="inlet"/>
         <dest obj="pwm_1" inlet="pitch"/>
      </net>
      <net>
         <source obj="pwm_1" outlet="wave"/>
         <dest obj="outlet_1" inlet="outlet"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>no</subpatchmode>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>-1427</x>
      <y>142</y>
      <width>400</width>
      <height>400</height>
   </windowPos>
</patch-1.0>