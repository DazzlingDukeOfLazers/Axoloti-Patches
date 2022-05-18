<patch-1.0 appVersion="1.0.12">
   <obj type="env/d m" uuid="85e82f54dfc28839d300cda777af8907ae2a28d0" name="d_1" x="504" y="42">
      <params>
         <frac32.s.map name="d" value="-9.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="space_in" x="84" y="112">
      <params/>
      <attribs/>
   </obj>
   <comment type="patch/comment" x="434" y="140" text="generates a short burst of noise"/>
   <obj type="logic/change" uuid="42071f8cb4cfe1f35956c0bd5a313a57e049bec4" name="change_1" x="350" y="182">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="spacetime_in" x="70" y="196">
      <params/>
      <attribs/>
   </obj>
   <obj type="gain/vca" uuid="a9f2dcd18043e2f47364e45cb8814f63c2a37c0d" name="vca_3" x="714" y="196">
      <params/>
      <attribs/>
   </obj>
   <obj type="noise/uniform" uuid="a3926ef22ae9ac217cd09933d90101848796eb78" name="rand_1" x="616" y="238">
      <params/>
      <attribs/>
   </obj>
   <comment type="patch/comment" x="532" y="294" text="interpolating delayline read"/>
   <comment type="patch/comment" x="728" y="294" text="99% feedback"/>
   <comment type="patch/comment" x="840" y="294" text="delayline write"/>
   <comment type="patch/comment" x="322" y="308" text="compute the right delay time from pitch"/>
   <obj type="delay/mtod" uuid="bbaeb53acbf18f926c5febae31d8bf2f52725ee" name="space" x="350" y="336">
      <params>
         <frac32.s.map name="pitch" onParent="true" value="8.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="math/-c" uuid="bc70bed87e5405985ade03f4806b9450609a9093" name="-c_1" x="462" y="336">
      <params>
         <frac32.u.map name="c" value="0.5"/>
      </params>
      <attribs/>
   </obj>
   <obj type="conv/interp" uuid="d68c1a8709d8b55e3de8715d727ec0a2d8569d9a" name="interp_1" x="532" y="336">
      <params/>
      <attribs/>
   </obj>
   <obj type="delay/read interp" uuid="e3d8b8823ab551c588659520bf6cc25c630466c7" name="read_1" x="616" y="336">
      <params>
         <frac32.u.map name="time" onParent="true" value="0.0"/>
      </params>
      <attribs>
         <objref attributeName="delayname" obj="d1"/>
      </attribs>
   </obj>
   <obj type="mix/mix 1" uuid="e8f482af5b1ec4a2e9cf8ac7ce09e7c0e43cea08" name="mix_2" x="812" y="336">
      <params>
         <frac32.u.map name="gain1" value="63.5"/>
      </params>
      <attribs/>
   </obj>
   <obj type="delay/write" uuid="bd73958e3830021807ee97a8cff4500a72a5710d" name="d1" x="924" y="336">
      <params/>
      <attribs>
         <combo attributeName="size" selection="2048 (42.66ms)"/>
      </attribs>
   </obj>
   <obj type="math/*c" uuid="7a66f52a9594e7e9eb31328ea725cb3641a80b55" name="*c_3" x="924" y="406">
      <params>
         <frac32.u.map name="amp" value="15.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet a" uuid="abd8c5fd3b0524a6630f65cad6dc27f6c58e2a3e" name="outlet_1" x="1064" y="406">
      <params/>
      <attribs/>
   </obj>
   <comment type="patch/comment" x="350" y="434" text="bug: tuning reference is incorrect"/>
   <nets>
      <net>
         <source obj="rand_1" outlet="wave"/>
         <dest obj="vca_3" inlet="a"/>
      </net>
      <net>
         <source obj="vca_3" outlet="o"/>
         <dest obj="mix_2" inlet="bus_in"/>
      </net>
      <net>
         <source obj="mix_2" outlet="out"/>
         <dest obj="d1" inlet="in"/>
         <dest obj="*c_3" inlet="in"/>
      </net>
      <net>
         <source obj="interp_1" outlet="o"/>
         <dest obj="read_1" inlet="time"/>
      </net>
      <net>
         <source obj="-c_1" outlet="out"/>
         <dest obj="interp_1" inlet="i"/>
      </net>
      <net>
         <source obj="space" outlet="delay"/>
         <dest obj="-c_1" inlet="in"/>
      </net>
      <net>
         <source obj="read_1" outlet="out"/>
         <dest obj="mix_2" inlet="in1"/>
      </net>
      <net>
         <source obj="change_1" outlet="trig"/>
         <dest obj="d_1" inlet="trig"/>
      </net>
      <net>
         <source obj="space_in" outlet="inlet"/>
         <dest obj="change_1" inlet="in"/>
         <dest obj="space" inlet="pitch"/>
      </net>
      <net>
         <source obj="*c_3" outlet="out"/>
         <dest obj="outlet_1" inlet="outlet"/>
      </net>
      <net>
         <source obj="d_1" outlet="env"/>
         <dest obj="vca_3" inlet="v"/>
      </net>
      <net>
         <source obj="spacetime_in" outlet="inlet"/>
         <dest obj="d_1" inlet="d"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>no</subpatchmode>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>-1826</x>
      <y>220</y>
      <width>1283</width>
      <height>701</height>
   </windowPos>
</patch-1.0>