<patch-1.0 appVersion="1.0.12">
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="pitch" x="14" y="14">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="freq" x="14" y="70">
      <params/>
      <attribs/>
   </obj>
   <obj type="lfo/sine" uuid="75f7330c26a13953215dccc3b7b9008545c9daa9" name="excite" x="98" y="70">
      <params>
         <frac32.s.map name="pitch" onParent="true" value="14.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="mix/mix1_m" uuid="cd851533-66fa-46a0-a8df-22b3e6ae19a3" name="mix1_m_1" x="210" y="70">
      <params>
         <frac32.u.map name="gain1" onParent="true" value="0.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="osc/saw" uuid="739ecc36017ef3249479b8f01716b8bbfba9abc1" name="saw_2" x="322" y="70">
      <params>
         <frac32.s.map name="pitch" value="-8.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="math/*c" uuid="7a66f52a9594e7e9eb31328ea725cb3641a80b55" name="*c_1" x="434" y="70">
      <params>
         <frac32.u.map name="amp" value="41.5"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet a" uuid="abd8c5fd3b0524a6630f65cad6dc27f6c58e2a3e" name="outlet_1" x="546" y="70">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="rubber" x="14" y="168">
      <params/>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="saw_2" outlet="wave"/>
         <dest obj="*c_1" inlet="in"/>
      </net>
      <net>
         <source obj="excite" outlet="wave"/>
         <dest obj="mix1_m_1" inlet="in1"/>
      </net>
      <net>
         <source obj="pitch" outlet="inlet"/>
         <dest obj="mix1_m_1" inlet="bus_in"/>
      </net>
      <net>
         <source obj="*c_1" outlet="out"/>
         <dest obj="outlet_1" inlet="outlet"/>
      </net>
      <net>
         <source obj="mix1_m_1" outlet="out"/>
         <dest obj="saw_2" inlet="pitch"/>
      </net>
      <net>
         <source obj="freq" outlet="inlet"/>
         <dest obj="excite" inlet="pitch"/>
      </net>
      <net>
         <source obj="rubber" outlet="inlet"/>
         <dest obj="mix1_m_1" inlet="gainAmt"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>no</subpatchmode>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>246</x>
      <y>331</y>
      <width>695</width>
      <height>368</height>
   </windowPos>
</patch-1.0>