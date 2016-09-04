<patch-1.0 appVersion="1.0.10">
   <comment type="patch/comment" x="168" y="56" text="fire event on start"/>
   <comment type="patch/comment" x="546" y="56" text="index display"/>
   <obj type="const/i" sha="15b9dce9232a04e8881936a6ea800e66ae8e0da9" uuid="e202f44b2df17ae0b3e663b98ea6b14c8ff00408" name="counter_1" x="168" y="70">
      <params/>
      <attribs>
         <spinner attributeName="value" value="1"/>
      </attribs>
   </obj>
   <obj type="logic/change" uuid="96e39ae624c3f3c952cec4a95e1986ee0104f718" name="change_1" x="266" y="70">
      <params/>
      <attribs/>
   </obj>
   <comment type="patch/comment" x="406" y="70" text="very simple sequencer"/>
   <obj type="disp/ibar 16" sha="6998eafb11a17e8569492b9ac4fa9710eb907cb8" uuid="302bfed4cde8894229679ce81f6b8a5c5212dd98" name="ibar_1" x="546" y="70">
      <params/>
      <attribs/>
   </obj>
   <comment type="patch/comment" x="168" y="140" text="tempo"/>
   <comment type="patch/comment" x="420" y="140" text="end step"/>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="offset_i" x="56" y="154">
      <params/>
      <attribs/>
   </obj>
   <obj type="lfo/square" sha="b4420b58ca2ae5ece53d53540bc91bc9ed7a4b83" uuid="fb76624a81ec92d244b83f94dedcd4c07935d848" name="square_1" x="168" y="154">
      <params>
         <frac32.s.map name="pitch" onParent="true" value="7.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="demux/demux 2" uuid="28788637ca4264670042a31303a9d6e100646ff0" name="demux_1" x="308" y="154">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/counter2" sha="520bfefaef89b5ba4deb2a4d79b4236f0b321489" uuid="d9536f238ab92e53ac93d5927c3b43ceef998dc1" name="counter2_1" x="420" y="154">
      <params>
         <int32 name="maximum" onParent="true" value="16"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet i" uuid="aae2176b26209e34e4fdeba5edb1ace82d178655" name="step_o" x="574" y="154">
      <params/>
      <attribs/>
   </obj>
   <comment type="patch/comment" x="168" y="266" text="fwd/rev"/>
   <obj type="ctrl/toggle" sha="f5742cc9eee76fae90a4e570c34596dd327b6c28" uuid="42b8134fa729d54bfc8d62d6ef3fa99498c1de99" name="toggle_1" x="168" y="280">
      <params>
         <bool32.tgl name="b" onParent="true" value="0"/>
      </params>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="square_1" outlet="wave"/>
         <dest obj="demux_1" inlet="i"/>
      </net>
      <net>
         <source obj="counter2_1" outlet="o"/>
         <dest obj="ibar_1" inlet="in"/>
         <dest obj="step_o" inlet="outlet"/>
      </net>
      <net>
         <source obj="toggle_1" outlet="o"/>
         <dest obj="demux_1" inlet="s"/>
      </net>
      <net>
         <source obj="demux_1" outlet="o0"/>
         <dest obj="counter2_1" inlet="inc"/>
      </net>
      <net>
         <source obj="demux_1" outlet="o1"/>
         <dest obj="counter2_1" inlet="dec"/>
      </net>
      <net>
         <source obj="change_1" outlet="trig"/>
         <dest obj="counter2_1" inlet="r"/>
      </net>
      <net>
         <source obj="counter_1" outlet="out"/>
         <dest obj="change_1" inlet="in"/>
      </net>
      <net>
         <source obj="offset_i" outlet="inlet"/>
         <dest obj="square_1" inlet="pitch"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>no</subpatchmode>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>-1885</x>
      <y>680</y>
      <width>881</width>
      <height>532</height>
   </windowPos>
</patch-1.0>