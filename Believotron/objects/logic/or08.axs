<patch-1.0 appVersion="1.0.10">
   <comment type="patch/comment" x="14" y="14" text="IMPORTANT: needs samples on sdcard!"/>
   <comment type="patch/comment" x="756" y="42" text="tbd refactor as script"/>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="i00" x="686" y="84">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/or 2" uuid="3805d3c84d30032a44fbdbe42d9a2988a1790a3e" name="or_1" x="854" y="84">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="i01" x="686" y="126">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/or 2" uuid="3805d3c84d30032a44fbdbe42d9a2988a1790a3e" name="or_9" x="924" y="140">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="i02" x="686" y="168">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/or 2" uuid="3805d3c84d30032a44fbdbe42d9a2988a1790a3e" name="or_2" x="854" y="182">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="i03" x="686" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/or 2" uuid="3805d3c84d30032a44fbdbe42d9a2988a1790a3e" name="or_13" x="1008" y="224">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet b" uuid="191792f616d4835dba0b55375474a12942e5bcbd" name="or16" x="1134" y="224">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="i04" x="686" y="294">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/or 2" uuid="3805d3c84d30032a44fbdbe42d9a2988a1790a3e" name="or_3" x="854" y="294">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="i05" x="686" y="336">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/or 2" uuid="3805d3c84d30032a44fbdbe42d9a2988a1790a3e" name="or_10" x="924" y="336">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="i06" x="686" y="378">
      <params/>
      <attribs/>
   </obj>
   <obj type="logic/or 2" uuid="3805d3c84d30032a44fbdbe42d9a2988a1790a3e" name="or_4" x="854" y="392">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="i07" x="686" y="420">
      <params/>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="i00" outlet="inlet"/>
         <dest obj="or_1" inlet="i1"/>
      </net>
      <net>
         <source obj="i01" outlet="inlet"/>
         <dest obj="or_1" inlet="i2"/>
      </net>
      <net>
         <source obj="i02" outlet="inlet"/>
         <dest obj="or_2" inlet="i1"/>
      </net>
      <net>
         <source obj="i03" outlet="inlet"/>
         <dest obj="or_2" inlet="i2"/>
      </net>
      <net>
         <source obj="or_2" outlet="o"/>
         <dest obj="or_9" inlet="i2"/>
      </net>
      <net>
         <source obj="or_1" outlet="o"/>
         <dest obj="or_9" inlet="i1"/>
      </net>
      <net>
         <source obj="i04" outlet="inlet"/>
         <dest obj="or_3" inlet="i1"/>
      </net>
      <net>
         <source obj="i05" outlet="inlet"/>
         <dest obj="or_3" inlet="i2"/>
      </net>
      <net>
         <source obj="i06" outlet="inlet"/>
         <dest obj="or_4" inlet="i1"/>
      </net>
      <net>
         <source obj="i07" outlet="inlet"/>
         <dest obj="or_4" inlet="i2"/>
      </net>
      <net>
         <source obj="or_4" outlet="o"/>
         <dest obj="or_10" inlet="i2"/>
      </net>
      <net>
         <source obj="or_3" outlet="o"/>
         <dest obj="or_10" inlet="i1"/>
      </net>
      <net>
         <source obj="or_9" outlet="o"/>
         <dest obj="or_13" inlet="i1"/>
      </net>
      <net>
         <source obj="or_10" outlet="o"/>
         <dest obj="or_13" inlet="i2"/>
      </net>
      <net>
         <source obj="or_13" outlet="o"/>
         <dest obj="or16" inlet="outlet"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>no</subpatchmode>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>-2374</x>
      <y>226</y>
      <width>2279</width>
      <height>812</height>
   </windowPos>
</patch-1.0>