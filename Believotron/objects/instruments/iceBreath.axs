<patch-1.0 appVersion="1.0.12">
   <obj type="logic/change" uuid="42071f8cb4cfe1f35956c0bd5a313a57e049bec4" name="change_2" x="308" y="112">
      <params/>
      <attribs/>
   </obj>
   <comment type="patch/comment" x="420" y="126" text="noise burst as excitation"/>
   <obj type="noise/uniform" uuid="a3926ef22ae9ac217cd09933d90101848796eb78" name="rand_2" x="462" y="168">
      <params/>
      <attribs/>
   </obj>
   <comment type="patch/comment" x="560" y="168" text="lowpass for softer sound"/>
   <comment type="patch/comment" x="686" y="182" text="(prevent clipping)"/>
   <comment type="patch/comment" x="798" y="182" text="resonating &quot;body&quot; composed out of 3 simple resonances"/>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="inlet_1" x="98" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="env/d" uuid="190ae648e41832b41adbedb465317c18a010aefe" name="envd1__" x="364" y="224">
      <params>
         <frac32.s.map name="d" value="18.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="gain/vca" uuid="a9f2dcd18043e2f47364e45cb8814f63c2a37c0d" name="vca_8" x="490" y="224">
      <params/>
      <attribs/>
   </obj>
   <obj type="filter/lp" uuid="1427779cf086ab83c8b03eeeac69c2a97759c651" name="lpf_1" x="560" y="224">
      <params>
         <frac32.s.map name="pitch" value="26.0"/>
         <frac32.u.map name="reso" value="5.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="math/*c" uuid="7a66f52a9594e7e9eb31328ea725cb3641a80b55" name="*c_3" x="686" y="224">
      <params>
         <frac32.u.map name="amp" value="60.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="filter/vcf3" uuid="92455c652cd098cbb682a5497baa18abbf2ef865" name="voice 1" x="798" y="224">
      <params>
         <frac32.s.map name="pitch" onParent="true" value="-13.0"/>
         <frac32.u.map name="reso" value="60.0"/>
      </params>
      <attribs/>
   </obj>
   <comment type="patch/comment" x="364" y="322" text="high = short burst"/>
   <comment type="patch/comment" x="364" y="336" text="low = long burst"/>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="resonate1" x="98" y="364">
      <params/>
      <attribs/>
   </obj>
   <obj type="filter/vcf3" uuid="92455c652cd098cbb682a5497baa18abbf2ef865" name="voice 2" x="798" y="364">
      <params>
         <frac32.s.map name="pitch" onParent="true" value="-6.0"/>
         <frac32.u.map name="reso" value="63.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="resonate2" x="98" y="462">
      <params/>
      <attribs/>
   </obj>
   <comment type="patch/comment" x="1078" y="490" text="volume"/>
   <obj type="filter/vcf3" uuid="92455c652cd098cbb682a5497baa18abbf2ef865" name="voice 3" x="798" y="518">
      <params>
         <frac32.s.map name="pitch" onParent="true" value="-15.0"/>
         <frac32.u.map name="reso" value="60.5"/>
      </params>
      <attribs/>
   </obj>
   <obj type="mix/mix 3" uuid="8be16f2156012a4a8974804178cece51555f272b" name="mix_3" x="952" y="518">
      <params>
         <frac32.u.map name="gain1" value="64.0"/>
         <frac32.u.map name="gain2" value="64.0"/>
         <frac32.u.map name="gain3" value="64.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="math/*c" uuid="7a66f52a9594e7e9eb31328ea725cb3641a80b55" name="*c_5" x="1078" y="518">
      <params>
         <frac32.u.map name="amp" value="64.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet a" uuid="abd8c5fd3b0524a6630f65cad6dc27f6c58e2a3e" name="outlet_1" x="1218" y="518">
      <params/>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="envd1__" outlet="env"/>
         <dest obj="vca_8" inlet="v"/>
      </net>
      <net>
         <source obj="rand_2" outlet="wave"/>
         <dest obj="vca_8" inlet="a"/>
      </net>
      <net>
         <source obj="vca_8" outlet="o"/>
         <dest obj="lpf_1" inlet="in"/>
      </net>
      <net>
         <source obj="*c_3" outlet="out"/>
         <dest obj="voice 1" inlet="in"/>
         <dest obj="voice 2" inlet="in"/>
         <dest obj="voice 3" inlet="in"/>
      </net>
      <net>
         <source obj="voice 1" outlet="out"/>
         <dest obj="mix_3" inlet="in1"/>
      </net>
      <net>
         <source obj="voice 2" outlet="out"/>
         <dest obj="mix_3" inlet="in2"/>
      </net>
      <net>
         <source obj="voice 3" outlet="out"/>
         <dest obj="mix_3" inlet="in3"/>
      </net>
      <net>
         <source obj="mix_3" outlet="out"/>
         <dest obj="*c_5" inlet="in"/>
      </net>
      <net>
         <source obj="lpf_1" outlet="out"/>
         <dest obj="*c_3" inlet="in"/>
      </net>
      <net>
         <source obj="change_2" outlet="trig"/>
         <dest obj="envd1__" inlet="trig"/>
      </net>
      <net>
         <source obj="inlet_1" outlet="inlet"/>
         <dest obj="change_2" inlet="in"/>
         <dest obj="voice 1" inlet="pitch"/>
         <dest obj="voice 2" inlet="pitch"/>
         <dest obj="voice 3" inlet="pitch"/>
      </net>
      <net>
         <source obj="*c_5" outlet="out"/>
         <dest obj="outlet_1" inlet="outlet"/>
      </net>
      <net>
         <source obj="resonate1" outlet="inlet"/>
         <dest obj="voice 1" inlet="reso"/>
      </net>
      <net>
         <source obj="resonate2" outlet="inlet"/>
         <dest obj="voice 2" inlet="reso"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>no</subpatchmode>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>12</x>
      <y>60</y>
      <width>1423</width>
      <height>880</height>
   </windowPos>
</patch-1.0>