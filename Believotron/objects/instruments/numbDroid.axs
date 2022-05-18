<patch-1.0 appVersion="1.0.10">
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="dissassociation" x="0" y="140">
      <params/>
      <attribs/>
   </obj>
   <obj type="osc/sine" uuid="6e094045cca76a9dbf7ebfa72e44e4700d2b3ba" name="dissasociate" x="112" y="140">
      <params>
         <frac32.s.map name="pitch" onParent="true" value="-20.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="osc/sine" uuid="6e094045cca76a9dbf7ebfa72e44e4700d2b3ba" name="sine_6" x="238" y="140">
      <params>
         <frac32.s.map name="pitch" value="0.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet a" uuid="abd8c5fd3b0524a6630f65cad6dc27f6c58e2a3e" name="droidSass" x="350" y="140">
      <params/>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="dissasociate" outlet="wave"/>
         <dest obj="sine_6" inlet="phase"/>
      </net>
      <net>
         <source obj="dissassociation" outlet="inlet"/>
         <dest obj="dissasociate" inlet="pitch"/>
      </net>
      <net>
         <source obj="sine_6" outlet="wave"/>
         <dest obj="droidSass" inlet="outlet"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>no</subpatchmode>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>-1775</x>
      <y>-19</y>
      <width>400</width>
      <height>400</height>
   </windowPos>
</patch-1.0>