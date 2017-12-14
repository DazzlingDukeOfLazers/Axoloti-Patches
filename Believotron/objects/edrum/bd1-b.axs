<patch-1.0 appVersion="1.0.12">
   <obj type="filter/lp1 m" uuid="18b561d14f9175f5380e6a1d9d55ca41e0e61974" name="lp1_2" x="406" y="0">
      <params>
         <frac32.u.map name="freq" onParent="true" value="32.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="trig" x="14" y="14">
      <params/>
      <attribs/>
   </obj>
   <obj type="env/d m" uuid="85e82f54dfc28839d300cda777af8907ae2a28d0" name="d_2" x="112" y="14">
      <params>
         <frac32.s.map name="d" onParent="true" value="-16.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="noise/uniform" uuid="a3926ef22ae9ac217cd09933d90101848796eb78" name="noise.uniform_2" x="224" y="14">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/abs" uuid="f4078fd9b2dff40d4f1551b79900c9ab360c99" name="abs_1" x="322" y="14">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/*" uuid="dc7fbdd46e5e6d4b8de62ee63fd6321639b2f167" name="*_1" x="518" y="42">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/*" uuid="c16a625a661f40e4b359db604dcd00b3befcdbe3" name="*_2" x="588" y="42">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet a" uuid="abd8c5fd3b0524a6630f65cad6dc27f6c58e2a3e" name="out" x="658" y="42">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="D1" x="14" y="84">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/*" uuid="922423f2db9f222aa3e5ba095778288c446da47a" name="*_3" x="294" y="98">
      <params/>
      <attribs/>
   </obj>
   <obj type="osc/sine" uuid="6e094045cca76a9dbf7ebfa72e44e4700d2b3ba" name="sine_1" x="378" y="98">
      <params>
         <frac32.s.map name="pitch" onParent="true" value="-44.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="LP1" x="14" y="126">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/+" uuid="44553fdc8628c67ab535845ed1be304ad6c9553b" name="+_1" x="196" y="154">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="D2" x="14" y="168">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="amnt2" x="98" y="182">
      <params>
         <frac32.u.map name="value" onParent="true" value="63.5"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="AMT" x="14" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/+" uuid="44553fdc8628c67ab535845ed1be304ad6c9553b" name="+_2" x="238" y="238">
      <params/>
      <attribs/>
   </obj>
   <obj type="env/d lin m" uuid="e9d9a5152981b17626748fd93e7e6a39c0afe3aa" name="d2" x="462" y="238">
      <params>
         <frac32.s.map name="d" onParent="true" value="-12.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="SIN_FREQ" x="14" y="266">
      <params/>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="noise.uniform_2" outlet="wave"/>
         <dest obj="abs_1" inlet="in"/>
      </net>
      <net>
         <source obj="d2" outlet="env"/>
         <dest obj="*_2" inlet="b"/>
      </net>
      <net>
         <source obj="sine_1" outlet="wave"/>
         <dest obj="*_1" inlet="b"/>
      </net>
      <net>
         <source obj="*_1" outlet="result"/>
         <dest obj="*_2" inlet="a"/>
      </net>
      <net>
         <source obj="abs_1" outlet="out"/>
         <dest obj="lp1_2" inlet="in"/>
      </net>
      <net>
         <source obj="lp1_2" outlet="out"/>
         <dest obj="*_1" inlet="a"/>
      </net>
      <net>
         <source obj="trig" outlet="inlet"/>
         <dest obj="d2" inlet="trig"/>
         <dest obj="d_2" inlet="trig"/>
      </net>
      <net>
         <source obj="d_2" outlet="env"/>
         <dest obj="*_3" inlet="a"/>
      </net>
      <net>
         <source obj="*_2" outlet="result"/>
         <dest obj="out" inlet="outlet"/>
      </net>
      <net>
         <source obj="+_1" outlet="out"/>
         <dest obj="*_3" inlet="b"/>
      </net>
      <net>
         <source obj="amnt2" outlet="out"/>
         <dest obj="+_1" inlet="in2"/>
      </net>
      <net>
         <source obj="D1" outlet="inlet"/>
         <dest obj="d_2" inlet="d"/>
      </net>
      <net>
         <source obj="D2" outlet="inlet"/>
         <dest obj="d2" inlet="d"/>
      </net>
      <net>
         <source obj="LP1" outlet="inlet"/>
         <dest obj="lp1_2" inlet="freq"/>
      </net>
      <net>
         <source obj="AMT" outlet="inlet"/>
         <dest obj="+_1" inlet="in1"/>
      </net>
      <net>
         <source obj="+_2" outlet="out"/>
         <dest obj="sine_1" inlet="pitch"/>
      </net>
      <net>
         <source obj="*_3" outlet="result"/>
         <dest obj="+_2" inlet="in1"/>
      </net>
      <net>
         <source obj="SIN_FREQ" outlet="inlet"/>
         <dest obj="+_2" inlet="in2"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>no</subpatchmode>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>1008</x>
      <y>229</y>
      <width>800</width>
      <height>478</height>
   </windowPos>
</patch-1.0>