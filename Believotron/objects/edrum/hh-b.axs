<patch-1.0 appVersion="1.0.12">
   <obj type="noise/uniform" uuid="a3926ef22ae9ac217cd09933d90101848796eb78" name="noise.uniform_1" x="98" y="14">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="trig" x="0" y="56">
      <params/>
      <attribs/>
   </obj>
   <obj type="env/d lin m" uuid="e9d9a5152981b17626748fd93e7e6a39c0afe3aa" name="d_1" x="98" y="56">
      <params>
         <frac32.s.map name="d" value="13.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="gain/vca" uuid="a9f2dcd18043e2f47364e45cb8814f63c2a37c0d" name="gain.vca~_1" x="196" y="56">
      <params/>
      <attribs/>
   </obj>
   <obj type="filter/bp svf m" uuid="90abfee2793172fc193ec82288a454727134cb31" name="bp_2" x="266" y="56">
      <params>
         <frac32.s.map name="pitch" onParent="true" value="41.0"/>
         <frac32.u.map name="reso" onParent="true" value="0.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet a" uuid="abd8c5fd3b0524a6630f65cad6dc27f6c58e2a3e" name="out" x="364" y="56">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="env_delay" x="0" y="168">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="pitch" x="0" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="resolution" x="0" y="252">
      <params/>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="noise.uniform_1" outlet="wave"/>
         <dest obj="gain.vca~_1" inlet="a"/>
      </net>
      <net>
         <source obj="gain.vca~_1" outlet="o"/>
         <dest obj="bp_2" inlet="in"/>
      </net>
      <net>
         <source obj="trig" outlet="inlet"/>
         <dest obj="d_1" inlet="trig"/>
      </net>
      <net>
         <source obj="bp_2" outlet="out"/>
         <dest obj="out" inlet="outlet"/>
      </net>
      <net>
         <source obj="d_1" outlet="env"/>
         <dest obj="gain.vca~_1" inlet="v"/>
      </net>
      <net>
         <source obj="env_delay" outlet="inlet"/>
         <dest obj="d_1" inlet="d"/>
      </net>
      <net>
         <source obj="pitch" outlet="inlet"/>
         <dest obj="bp_2" inlet="pitch"/>
      </net>
      <net>
         <source obj="resolution" outlet="inlet"/>
         <dest obj="bp_2" inlet="reso"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>no</subpatchmode>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>0</x>
      <y>2</y>
      <width>674</width>
      <height>400</height>
   </windowPos>
</patch-1.0>