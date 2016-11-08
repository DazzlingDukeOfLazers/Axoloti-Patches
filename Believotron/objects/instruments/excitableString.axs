<patch-1.0 appVersion="1.0.10">
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="inlet_1" x="196" y="168">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet a" uuid="abd8c5fd3b0524a6630f65cad6dc27f6c58e2a3e" name="outlet_1" x="938" y="196">
      <params/>
      <attribs/>
   </obj>
   <obj type="lfo/sine" sha="a2851b3d62ed0faceefc98038d9571422f0ce260" name="excite" x="168" y="238">
      <params>
         <frac32.s.map name="pitch" onParent="true" value="14.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="mix/mix 1" uuid="26fb1fe4ed25d8bc2ac4a3f91ab6b80ed6d9d4fa" name="rubber" x="392" y="238">
      <params>
         <frac32.u.map name="gain1" onParent="true" value="0.5"/>
      </params>
      <attribs/>
   </obj>
   <obj type="osc/saw" sha="fe2c3c02396657dfbc225c73f9340ad0c4c3eea6" name="saw_2" x="532" y="238">
      <params>
         <frac32.s.map name="pitch" value="-8.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="math/*c" uuid="7a66f52a9594e7e9eb31328ea725cb3641a80b55" name="*c_4" x="770" y="238">
      <params>
         <frac32.u.map name="amp" value="41.5"/>
      </params>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="rubber" outlet="out"/>
         <dest obj="saw_2" inlet="pitch"/>
      </net>
      <net>
         <source obj="saw_2" outlet="wave"/>
         <dest obj="*c_4" inlet="in"/>
      </net>
      <net>
         <source obj="excite" outlet="wave"/>
         <dest obj="rubber" inlet="in1"/>
      </net>
      <net>
         <source obj="inlet_1" outlet="inlet"/>
         <dest obj="rubber" inlet="bus_in"/>
      </net>
      <net>
         <source obj="*c_4" outlet="out"/>
         <dest obj="outlet_1" inlet="outlet"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>no</subpatchmode>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>-1891</x>
      <y>65</y>
      <width>1067</width>
      <height>703</height>
   </windowPos>
</patch-1.0>