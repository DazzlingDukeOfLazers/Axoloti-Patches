<patch-1.0 appVersion="1.0.12">
   <comment type="patch/comment" x="42" y="14" text="Triggers boolean every time knob changes if enabled. Ignores first stale value after enable"/>
   <comment type="patch/comment" x="42" y="42" text="Ignores the first value upon enable, allows for Muxing without disturbing old value"/>
   <comment type="patch/comment" x="140" y="140" text="OnEnable save stale value"/>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="enable" x="28" y="168">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/latch" uuid="14750683752bd43205826430adb7168dae3cc2c" name="latch_1" x="140" y="168">
      <params/>
      <attribs/>
   </obj>
   <comment type="patch/comment" x="252" y="168" text="If the in val is different from the stale value"/>
   <obj type="pmj/math/!=" uuid="a3f5fc31-58a5-40ec-8f53-957bb989c93b" name="!=_1" x="252" y="182">
      <params/>
      <attribs/>
   </obj>
   <comment type="patch/comment" x="350" y="182" text="and the channel is enabled"/>
   <comment type="patch/comment" x="518" y="210" text="unless the channel becomes disabled"/>
   <obj type="logic/and 2" uuid="c67031682f552aa0a80b23377495c51ea28a8c9c" name="and_2" x="350" y="224">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/flipflop" uuid="f9b15363f5ee203152e062c08a8846f0074b0ea5" name="flipflop_1" x="518" y="224">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/and 2" uuid="c67031682f552aa0a80b23377495c51ea28a8c9c" name="and_1" x="756" y="224">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="Changed" x="868" y="224">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="val" x="28" y="238">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/inv" uuid="2bd44b865d3b63ff9b80862242bf5be779e3ad5" name="inv_1" x="434" y="266">
      <params/>
      <attribs/>
   </obj>
   <comment type="patch/comment" x="518" y="294" text="whenever the input changes"/>
   <obj type="logic/change" uuid="42071f8cb4cfe1f35956c0bd5a313a57e049bec4" name="change_1" x="518" y="308">
      <params/>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="change_1" outlet="trig"/>
         <dest obj="and_1" inlet="i2"/>
      </net>
      <net>
         <source obj="enable" outlet="inlet"/>
         <dest obj="latch_1" inlet="trig"/>
         <dest obj="inv_1" inlet="i"/>
         <dest obj="and_2" inlet="i2"/>
      </net>
      <net>
         <source obj="latch_1" outlet="o"/>
         <dest obj="!=_1" inlet="in1"/>
      </net>
      <net>
         <source obj="!=_1" outlet="out"/>
         <dest obj="and_2" inlet="i1"/>
      </net>
      <net>
         <source obj="and_2" outlet="o"/>
         <dest obj="flipflop_1" inlet="set"/>
      </net>
      <net>
         <source obj="inv_1" outlet="o"/>
         <dest obj="flipflop_1" inlet="reset"/>
      </net>
      <net>
         <source obj="flipflop_1" outlet="o"/>
         <dest obj="and_1" inlet="i1"/>
      </net>
      <net>
         <source obj="and_1" outlet="o"/>
         <dest obj="Changed" inlet="outlet"/>
      </net>
      <net>
         <source obj="val" outlet="inlet"/>
         <dest obj="latch_1" inlet="i"/>
         <dest obj="!=_1" inlet="in2"/>
         <dest obj="change_1" inlet="in"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>no</subpatchmode>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>-1928</x>
      <y>-91</y>
      <width>1723</width>
      <height>976</height>
   </windowPos>
</patch-1.0>