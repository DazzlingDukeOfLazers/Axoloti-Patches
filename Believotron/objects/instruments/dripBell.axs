<patch-1.0 appVersion="1.0.12">
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="pitch" x="0" y="84">
      <params/>
      <attribs/>
   </obj>
   <obj type="osc/sine" uuid="6e094045cca76a9dbf7ebfa72e44e4700d2b3ba" name="sine_10" x="210" y="98">
      <params>
         <frac32.s.map name="pitch" value="-1.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet a" uuid="abd8c5fd3b0524a6630f65cad6dc27f6c58e2a3e" name="outlet_1" x="336" y="98">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="freq" x="0" y="140">
      <params/>
      <attribs/>
   </obj>
   <obj type="osc/square medium" uuid="d8675e626c34278d4df80ca15ee965d647908d2f" name="bell daze" x="84" y="140">
      <params>
         <frac32.s.map name="pitch" onParent="true" value="-64.0"/>
      </params>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="bell daze" outlet="wave"/>
         <dest obj="sine_10" inlet="freq"/>
      </net>
      <net>
         <source obj="sine_10" outlet="wave"/>
         <dest obj="outlet_1" inlet="outlet"/>
      </net>
      <net>
         <source obj="freq" outlet="inlet"/>
         <dest obj="bell daze" inlet="pitch"/>
      </net>
      <net>
         <source obj="pitch" outlet="inlet"/>
         <dest obj="sine_10" inlet="pitch"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>no</subpatchmode>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>-892</x>
      <y>414</y>
      <width>638</width>
      <height>400</height>
   </windowPos>
</patch-1.0>