<patch-1.0 appVersion="1.0.10">
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="stepFrq" x="56" y="28">
      <params/>
      <attribs/>
   </obj>
   <obj type="lfo/saw r" uuid="6f79e6694e3e4b26c8732e836e54962eaf88dd1a" name="saw_1" x="196" y="28">
      <params>
         <frac32.s.map name="pitch" onParent="true" value="-22.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="disp/dial p" uuid="44fd18b562e434b3230441681132dbeabb15cdc5" name="dial_4" x="294" y="28">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet f" uuid="d18a9a550bcaaebac94e25983bd0e27dbfd7233c" name="intensity" x="1106" y="28">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="sync" x="56" y="84">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="dial_3" x="392" y="126">
      <params>
         <frac32.u.map name="value" value="32.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="math/+" uuid="44553fdc8628c67ab535845ed1be304ad6c9553b" name="+_1" x="476" y="126">
      <params/>
      <attribs/>
   </obj>
   <obj type="conv/to i" uuid="305966430ee86b5c3b8e18cde0c721657c558a87" name="to_1" x="602" y="140">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/i" uuid="5e35fd0c62d81e70017289250cf28edd26e19e4a" name="i_3" x="658" y="140">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/&lt;" uuid="e1b31418165304d34c713638837722589dcacb6" name="&lt;_2" x="854" y="140">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/counter2" sha="520bfefaef89b5ba4deb2a4d79b4236f0b321489" uuid="d9536f238ab92e53ac93d5927c3b43ceef998dc1" name="counter2_1" x="924" y="140">
      <params>
         <int32 name="maximum" onParent="true" value="16"/>
      </params>
      <attribs/>
   </obj>
   <obj type="disp/i" uuid="5e35fd0c62d81e70017289250cf28edd26e19e4a" name="i_4" x="1008" y="140">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet i" uuid="aae2176b26209e34e4fdeba5edb1ace82d178655" name="step" x="1106" y="140">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/i" uuid="a3786816db6ea5bc6ac4193a5cccdb2c83b83496" name="i_6" x="784" y="196">
      <params>
         <int32 name="value" value="34"/>
      </params>
      <attribs/>
   </obj>
   <obj type="math/div 2" uuid="f14884de1baf3e615e12ee162a96a013eca76789" name="div_1" x="392" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/&gt;" uuid="a459588d6498caeb4daf3a07f9d5e9b4a657262f" name="&gt;_1" x="630" y="364">
      <params/>
      <attribs/>
   </obj>
   <obj type="const/i" uuid="e202f44b2df17ae0b3e663b98ea6b14c8ff00408" name="i_5" x="518" y="378">
      <params/>
      <attribs>
         <spinner attributeName="value" value="1"/>
      </attribs>
   </obj>
   <comment type="patch/comment" x="700" y="392" text="old debug stub"/>
   <nets>
      <net>
         <source obj="dial_3" outlet="out"/>
         <dest obj="+_1" inlet="in1"/>
      </net>
      <net>
         <source obj="div_1" outlet="out"/>
         <dest obj="+_1" inlet="in2"/>
      </net>
      <net>
         <source obj="+_1" outlet="out"/>
         <dest obj="to_1" inlet="i"/>
      </net>
      <net>
         <source obj="to_1" outlet="o"/>
         <dest obj="i_3" inlet="in"/>
         <dest obj="&gt;_1" inlet="in1"/>
         <dest obj="&lt;_2" inlet="in1"/>
      </net>
      <net>
         <source obj="counter2_1" outlet="o"/>
         <dest obj="i_4" inlet="in"/>
         <dest obj="step" inlet="outlet"/>
      </net>
      <net>
         <source obj="i_5" outlet="out"/>
         <dest obj="&gt;_1" inlet="in2"/>
      </net>
      <net>
         <source obj="i_6" outlet="out"/>
         <dest obj="&lt;_2" inlet="in2"/>
      </net>
      <net>
         <source obj="&lt;_2" outlet="out"/>
         <dest obj="counter2_1" inlet="inc"/>
      </net>
      <net>
         <source obj="saw_1" outlet="wave"/>
         <dest obj="div_1" inlet="in"/>
         <dest obj="dial_4" inlet="in"/>
         <dest obj="intensity" inlet="outlet"/>
      </net>
      <net>
         <source obj="stepFrq" outlet="inlet"/>
         <dest obj="saw_1" inlet="pitch"/>
      </net>
      <net>
         <source obj="sync" outlet="inlet"/>
         <dest obj="saw_1" inlet="reset"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>no</subpatchmode>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>-2091</x>
      <y>20</y>
      <width>1839</width>
      <height>1036</height>
   </windowPos>
</patch-1.0>