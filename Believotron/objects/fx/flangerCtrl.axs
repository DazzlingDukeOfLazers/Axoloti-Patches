<patch-1.0 appVersion="1.0.12">
   <obj type="patch/inlet a" uuid="b577fe41e0a6bc7b5502ce33cb8a3129e2e28ee5" name="in" x="588" y="0">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="fdbk" x="406" y="42">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="depth" x="196" y="84">
      <params/>
      <attribs/>
   </obj>
   <obj type="mix/xfade" uuid="375dc91d218e96cdc9cbc7e92adb48f705ef701a" name="xfade_1" x="686" y="126">
      <params/>
      <attribs/>
   </obj>
   <obj type="delay/write" uuid="bd73958e3830021807ee97a8cff4500a72a5710d" name="dela" x="770" y="126">
      <params/>
      <attribs>
         <combo attributeName="size" selection="512 (10.66ms)"/>
      </attribs>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="speed" x="0" y="140">
      <params/>
      <attribs/>
   </obj>
   <obj type="lfo/sine" uuid="75f7330c26a13953215dccc3b7b9008545c9daa9" name="speedLfo" x="84" y="140">
      <params>
         <frac32.s.map name="pitch" onParent="true" value="0.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="conv/bipolar2unipolar" uuid="f6f63d71053d572d3c795f83c7ec11dfbbce82dd" name="bipolar2unipolar1" x="196" y="140">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/*" uuid="922423f2db9f222aa3e5ba095778288c446da47a" name="vca_1" x="350" y="140">
      <params/>
      <attribs/>
   </obj>
   <obj type="conv/interp" uuid="d68c1a8709d8b55e3de8715d727ec0a2d8569d9a" name="interp_1" x="420" y="140">
      <params/>
      <attribs/>
   </obj>
   <obj type="delay/read interp" uuid="e3d8b8823ab551c588659520bf6cc25c630466c7" name="delread21" x="504" y="140">
      <params>
         <frac32.u.map name="time" value="0.0"/>
      </params>
      <attribs>
         <objref attributeName="delayname" obj="dela"/>
      </attribs>
   </obj>
   <obj type="patch/outlet a" uuid="abd8c5fd3b0524a6630f65cad6dc27f6c58e2a3e" name="out" x="798" y="196">
      <params/>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="bipolar2unipolar1" outlet="o"/>
         <dest obj="vca_1" inlet="a"/>
      </net>
      <net>
         <source obj="vca_1" outlet="result"/>
         <dest obj="interp_1" inlet="i"/>
      </net>
      <net>
         <source obj="interp_1" outlet="o"/>
         <dest obj="delread21" inlet="time"/>
      </net>
      <net>
         <source obj="in" outlet="inlet"/>
         <dest obj="xfade_1" inlet="i1"/>
      </net>
      <net>
         <source obj="delread21" outlet="out"/>
         <dest obj="xfade_1" inlet="i2"/>
      </net>
      <net>
         <source obj="xfade_1" outlet="o"/>
         <dest obj="dela" inlet="in"/>
         <dest obj="out" inlet="outlet"/>
      </net>
      <net>
         <source obj="depth" outlet="inlet"/>
         <dest obj="vca_1" inlet="b"/>
      </net>
      <net>
         <source obj="speed" outlet="inlet"/>
         <dest obj="speedLfo" inlet="pitch"/>
      </net>
      <net>
         <source obj="speedLfo" outlet="wave"/>
         <dest obj="bipolar2unipolar1" inlet="i"/>
      </net>
      <net>
         <source obj="fdbk" outlet="inlet"/>
         <dest obj="xfade_1" inlet="c"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>normal</subpatchmode>
      <MidiChannel>0</MidiChannel>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>-1152</x>
      <y>411</y>
      <width>930</width>
      <height>530</height>
   </windowPos>
</patch-1.0>