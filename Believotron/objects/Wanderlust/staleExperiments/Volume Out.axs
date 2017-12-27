<patch-1.0 appVersion="1.0.12">
   <obj type="ctrl/dial p" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="manualVol" x="280" y="0">
      <params>
         <frac32.u.map name="value" value="64.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="mux/mux 2" uuid="3bcb8a666381ed18b8962eda50b1aa679136f618" name="mux_1" x="588" y="28">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet a" uuid="b577fe41e0a6bc7b5502ce33cb8a3129e2e28ee5" name="left" x="154" y="42">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/toggle" uuid="42b8134fa729d54bfc8d62d6ef3fa99498c1de99" name="Enable Vol Knob" x="490" y="70">
      <params>
         <bool32.tgl name="b" onParent="true" value="1"/>
      </params>
      <attribs/>
   </obj>
   <comment type="patch/comment" x="154" y="126" text="Uses volume knob on Believotron Wanderlust controller to control the volume to a stereo out"/>
   <obj type="math/*" uuid="3ac307b9f782049739ed62504081b96d580ea336" name="*_1" x="868" y="140">
      <params/>
      <attribs/>
   </obj>
   <obj type="audio/out stereo" uuid="a1ca7a567f535acc21055669829101d3ee7f0189" name="dac_1" x="1008" y="154">
      <params/>
      <attribs/>
   </obj>
   <obj type="gpio/in/analog" uuid="1c0c845ed2d7e06ae5f377ba13d9d09f4747ac87" name="analog_1" x="140" y="168">
      <params/>
      <attribs>
         <combo attributeName="channel" selection="PC0 (ADC1_IN10)"/>
      </attribs>
   </obj>
   <obj type="math/*" uuid="3ac307b9f782049739ed62504081b96d580ea336" name="*_2" x="868" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/-c" uuid="bc70bed87e5405985ade03f4806b9450609a9093" name="-c_1" x="322" y="280">
      <params>
         <frac32.u.map name="c" value="6.199999809265137"/>
      </params>
      <attribs/>
   </obj>
   <obj type="math/max" uuid="12440f9565ca6f036f087665b49fb708062e90d0" name="max_1" x="560" y="294">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/dial p" uuid="44fd18b562e434b3230441681132dbeabb15cdc5" name="dial_1" x="756" y="294">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/*" uuid="13882852b58661ad012ffbe246470b5df4b6c5d1" name="*_3" x="434" y="308">
      <params/>
      <attribs/>
   </obj>
   <obj type="gpio/in/analog" uuid="1c0c845ed2d7e06ae5f377ba13d9d09f4747ac87" name="analog_2" x="0" y="322">
      <params/>
      <attribs>
         <combo attributeName="channel" selection="PA1 (ADC1_IN1)"/>
      </attribs>
   </obj>
   <obj type="drj/math/mov_avg" uuid="bca43539d9ad309ea065379a3145eaac7b1485bf" name="mov_avg_1" x="182" y="322">
      <params/>
      <attribs>
         <combo attributeName="length" selection="128"/>
      </attribs>
   </obj>
   <obj type="ctrl/i" uuid="a3786816db6ea5bc6ac4193a5cccdb2c83b83496" name="i_1" x="322" y="350">
      <params>
         <int32 name="value" value="2"/>
      </params>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="dial_7" x="490" y="378">
      <params>
         <frac32.u.map name="value" value="0.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="ctrl/toggle" uuid="42b8134fa729d54bfc8d62d6ef3fa99498c1de99" name="Reverse knob" x="56" y="406">
      <params>
         <bool32.tgl name="b" onParent="true" value="1"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/inlet a" uuid="b577fe41e0a6bc7b5502ce33cb8a3129e2e28ee5" name="right" x="224" y="504">
      <params/>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="Enable Vol Knob" outlet="o"/>
         <dest obj="mux_1" inlet="s"/>
      </net>
      <net>
         <source obj="manualVol" outlet="out"/>
         <dest obj="mux_1" inlet="i1"/>
      </net>
      <net>
         <source obj="mux_1" outlet="o"/>
         <dest obj="*_1" inlet="a"/>
         <dest obj="*_2" inlet="a"/>
      </net>
      <net>
         <source obj="*_1" outlet="result"/>
         <dest obj="dac_1" inlet="left"/>
      </net>
      <net>
         <source obj="*_2" outlet="result"/>
         <dest obj="dac_1" inlet="right"/>
      </net>
      <net>
         <source obj="-c_1" outlet="out"/>
         <dest obj="*_3" inlet="a"/>
      </net>
      <net>
         <source obj="max_1" outlet="out"/>
         <dest obj="dial_1" inlet="in"/>
         <dest obj="mux_1" inlet="i2"/>
      </net>
      <net>
         <source obj="dial_7" outlet="out"/>
         <dest obj="max_1" inlet="in2"/>
      </net>
      <net>
         <source obj="i_1" outlet="out"/>
         <dest obj="*_3" inlet="b"/>
      </net>
      <net>
         <source obj="*_3" outlet="result"/>
         <dest obj="max_1" inlet="in1"/>
      </net>
      <net>
         <source obj="left" outlet="inlet"/>
         <dest obj="*_1" inlet="b"/>
      </net>
      <net>
         <source obj="right" outlet="inlet"/>
         <dest obj="*_2" inlet="b"/>
      </net>
      <net>
         <source obj="analog_2" outlet="out"/>
         <dest obj="mov_avg_1" inlet="in"/>
      </net>
      <net>
         <source obj="mov_avg_1" outlet="out"/>
         <dest obj="-c_1" inlet="in"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>no</subpatchmode>
      <MidiChannel>1</MidiChannel>
      <NPresets>0</NPresets>
      <NPresetEntries>0</NPresetEntries>
      <NModulationSources>0</NModulationSources>
      <NModulationTargetsPerSource>0</NModulationTargetsPerSource>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>-1781</x>
      <y>24</y>
      <width>1006</width>
      <height>754</height>
   </windowPos>
</patch-1.0>