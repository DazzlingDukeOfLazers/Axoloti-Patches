<patch-1.0 appVersion="1.0.10">
   <comment type="patch/comment" x="616" y="28" text="fire event on start"/>
   <comment type="patch/comment" x="994" y="28" text="index display"/>
   <obj type="const/i" sha="15b9dce9232a04e8881936a6ea800e66ae8e0da9" uuid="e202f44b2df17ae0b3e663b98ea6b14c8ff00408" name="counter_1" x="616" y="42">
      <params/>
      <attribs>
         <spinner attributeName="value" value="1"/>
      </attribs>
   </obj>
   <obj type="logic/change" uuid="96e39ae624c3f3c952cec4a95e1986ee0104f718" name="change_1" x="714" y="42">
      <params/>
      <attribs/>
   </obj>
   <comment type="patch/comment" x="854" y="42" text="very simple sequencer"/>
   <obj type="disp/ibar 16" sha="6998eafb11a17e8569492b9ac4fa9710eb907cb8" uuid="302bfed4cde8894229679ce81f6b8a5c5212dd98" name="ibar_1" x="994" y="42">
      <params/>
      <attribs/>
   </obj>
   <comment type="patch/comment" x="616" y="112" text="tempo"/>
   <comment type="patch/comment" x="868" y="112" text="end step"/>
   <obj type="lfo/square" sha="b4420b58ca2ae5ece53d53540bc91bc9ed7a4b83" uuid="fb76624a81ec92d244b83f94dedcd4c07935d848" name="square_1" x="616" y="126">
      <params>
         <frac32.s.map name="pitch" onParent="true" value="7.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="demux/demux 2" uuid="28788637ca4264670042a31303a9d6e100646ff0" name="demux_1" x="756" y="126">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/counter2" sha="520bfefaef89b5ba4deb2a4d79b4236f0b321489" uuid="d9536f238ab92e53ac93d5927c3b43ceef998dc1" name="counter2_1" x="868" y="126">
      <params>
         <int32 name="maximum" onParent="true" value="16"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet i" uuid="aae2176b26209e34e4fdeba5edb1ace82d178655" name="step_o" x="1022" y="126">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="offset_i" x="42" y="140">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/+" uuid="44553fdc8628c67ab535845ed1be304ad6c9553b" name="+_1" x="518" y="140">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/*" uuid="922423f2db9f222aa3e5ba095778288c446da47a" name="*_1" x="448" y="196">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="inc tempo" x="28" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="djrm/logic/counter2_init_start" uuid="d5936f238ab92e53ac93d5927c3b43ceef998dc1" name="counter2_init_start_1" x="154" y="210">
      <params>
         <int32 name="maximum" value="1000"/>
         <int32 name="init" value="500"/>
      </params>
      <attribs/>
   </obj>
   <obj type="phi/math/-+i" uuid="e5bf3953ead204874692ae5d85c0e43b027g74f1" name="-+i_1" x="350" y="210">
      <params>
         <int32 name="c" value="-500"/>
      </params>
      <attribs/>
   </obj>
   <comment type="patch/comment" x="616" y="238" text="fwd/rev"/>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="dec tempo" x="28" y="252">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/toggle" sha="f5742cc9eee76fae90a4e570c34596dd327b6c28" uuid="42b8134fa729d54bfc8d62d6ef3fa99498c1de99" name="toggle_1" x="616" y="252">
      <params>
         <bool32.tgl name="b" onParent="true" value="0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="ctrl/dial b" uuid="862e7d7f29093cb1ce4aed72244d118ad4d46692" name="stepSize" x="364" y="280">
      <params>
         <frac32.s.map name="value" onParent="true" value="0.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="addval" x="1022" y="364">
      <params/>
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
         <dest obj="counter2_init_start_1" inlet="r"/>
      </net>
      <net>
         <source obj="counter_1" outlet="out"/>
         <dest obj="change_1" inlet="in"/>
      </net>
      <net>
         <source obj="offset_i" outlet="inlet"/>
         <dest obj="+_1" inlet="in1"/>
      </net>
      <net>
         <source obj="inc tempo" outlet="inlet"/>
         <dest obj="counter2_init_start_1" inlet="inc"/>
      </net>
      <net>
         <source obj="dec tempo" outlet="inlet"/>
         <dest obj="counter2_init_start_1" inlet="dec"/>
      </net>
      <net>
         <source obj="stepSize" outlet="out"/>
         <dest obj="*_1" inlet="b"/>
      </net>
      <net>
         <source obj="+_1" outlet="out"/>
         <dest obj="square_1" inlet="pitch"/>
      </net>
      <net>
         <source obj="*_1" outlet="result"/>
         <dest obj="addval" inlet="outlet"/>
         <dest obj="+_1" inlet="in2"/>
      </net>
      <net>
         <source obj="counter2_init_start_1" outlet="o"/>
         <dest obj="-+i_1" inlet="in"/>
      </net>
      <net>
         <source obj="-+i_1" outlet="out"/>
         <dest obj="*_1" inlet="a"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>no</subpatchmode>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>-2020</x>
      <y>374</y>
      <width>1238</width>
      <height>896</height>
   </windowPos>
</patch-1.0>