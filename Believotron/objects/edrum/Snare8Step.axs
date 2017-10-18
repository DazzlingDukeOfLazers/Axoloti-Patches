<patch-1.0 appVersion="1.0.12">
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="pitch" x="98" y="14">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/or08" uuid="68be7a83-2512-4b47-b983-21156b6a20d8" name="obj_4" x="770" y="14">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/monophonicKBSel" uuid="eb493a19-36a5-41cc-a687-077dfdc6483a" name="monophonicKBSel_1" x="462" y="28">
      <params/>
      <attribs/>
   </obj>
   <obj type="mux/mux 8" uuid="de5167d9da39b04039376e8cc620ea2afc22e28a" name="mux_1" x="910" y="28">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="dial_3" x="686" y="98">
      <params>
         <frac32.u.map name="value" value="0.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="dial_4" x="686" y="196">
      <params>
         <frac32.u.map name="value" value="8.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="i0" x="126" y="224">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="i1" x="126" y="266">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="dial_5" x="686" y="280">
      <params>
         <frac32.u.map name="value" value="16.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="i2" x="126" y="308">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="i3" x="126" y="350">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="dial_13" x="686" y="364">
      <params>
         <frac32.u.map name="value" value="24.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="i4" x="126" y="392">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="i5" x="126" y="434">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="dial_14" x="686" y="448">
      <params>
         <frac32.u.map name="value" value="32.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="i6" x="126" y="476">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="i7" x="126" y="518">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="dial_15" x="686" y="532">
      <params>
         <frac32.u.map name="value" value="32.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="osc/brds/snare" uuid="6cfef612-0d2d-4dbf-9e01-ce8704bf86c9" name="snare_1" x="1162" y="602">
      <params>
         <frac32.s.map name="pitch" value="0.0"/>
         <frac32.u.map name="timbre" value="28.5"/>
         <frac32.u.map name="color" value="0.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="dial_16" x="686" y="616">
      <params>
         <frac32.u.map name="value" value="32.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet a" uuid="abd8c5fd3b0524a6630f65cad6dc27f6c58e2a3e" name="snareOut" x="1330" y="616">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="trig" x="1330" y="686">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="dial_17" x="686" y="700">
      <params>
         <frac32.u.map name="value" value="32.0"/>
      </params>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="i0" outlet="inlet"/>
         <dest obj="monophonicKBSel_1" inlet="b0"/>
         <dest obj="obj_4" inlet="i00"/>
      </net>
      <net>
         <source obj="i1" outlet="inlet"/>
         <dest obj="monophonicKBSel_1" inlet="b1"/>
         <dest obj="obj_4" inlet="i01"/>
      </net>
      <net>
         <source obj="i2" outlet="inlet"/>
         <dest obj="monophonicKBSel_1" inlet="b2"/>
         <dest obj="obj_4" inlet="i02"/>
      </net>
      <net>
         <source obj="monophonicKBSel_1" outlet="out"/>
         <dest obj="mux_1" inlet="s"/>
      </net>
      <net>
         <source obj="i3" outlet="inlet"/>
         <dest obj="monophonicKBSel_1" inlet="b3"/>
         <dest obj="obj_4" inlet="i03"/>
      </net>
      <net>
         <source obj="i4" outlet="inlet"/>
         <dest obj="monophonicKBSel_1" inlet="b4"/>
         <dest obj="obj_4" inlet="i04"/>
      </net>
      <net>
         <source obj="i5" outlet="inlet"/>
         <dest obj="monophonicKBSel_1" inlet="b5"/>
         <dest obj="obj_4" inlet="i05"/>
      </net>
      <net>
         <source obj="i6" outlet="inlet"/>
         <dest obj="monophonicKBSel_1" inlet="b6"/>
         <dest obj="obj_4" inlet="i06"/>
      </net>
      <net>
         <source obj="i7" outlet="inlet"/>
         <dest obj="monophonicKBSel_1" inlet="b7"/>
         <dest obj="obj_4" inlet="i07"/>
      </net>
      <net>
         <source obj="mux_1" outlet="o"/>
         <dest obj="snare_1" inlet="color"/>
      </net>
      <net>
         <source obj="dial_3" outlet="out"/>
         <dest obj="mux_1" inlet="i0"/>
      </net>
      <net>
         <source obj="dial_4" outlet="out"/>
         <dest obj="mux_1" inlet="i1"/>
      </net>
      <net>
         <source obj="dial_5" outlet="out"/>
         <dest obj="mux_1" inlet="i2"/>
      </net>
      <net>
         <source obj="obj_4" outlet="or16"/>
         <dest obj="snare_1" inlet="strike"/>
         <dest obj="trig" inlet="outlet"/>
      </net>
      <net>
         <source obj="dial_13" outlet="out"/>
         <dest obj="mux_1" inlet="i3"/>
      </net>
      <net>
         <source obj="dial_14" outlet="out"/>
         <dest obj="mux_1" inlet="i4"/>
      </net>
      <net>
         <source obj="dial_15" outlet="out"/>
         <dest obj="mux_1" inlet="i5"/>
      </net>
      <net>
         <source obj="dial_16" outlet="out"/>
         <dest obj="mux_1" inlet="i6"/>
      </net>
      <net>
         <source obj="dial_17" outlet="out"/>
         <dest obj="mux_1" inlet="i7"/>
      </net>
      <net>
         <source obj="pitch" outlet="inlet"/>
         <dest obj="snare_1" inlet="pitch"/>
      </net>
      <net>
         <source obj="snare_1" outlet="wave"/>
         <dest obj="snareOut" inlet="outlet"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>no</subpatchmode>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>-8</x>
      <y>-8</y>
      <width>1514</width>
      <height>1014</height>
   </windowPos>
</patch-1.0>