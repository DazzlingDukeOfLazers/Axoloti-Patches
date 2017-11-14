<patch-1.0 appVersion="1.0.12">
   <obj type="midi/in/keyb" uuid="53b04874696932f38aceaa168bd5d9efb743716d" name="keyb_1" x="14" y="14">
      <params/>
      <attribs/>
   </obj>
   <obj type="lfo/sine" uuid="75f7330c26a13953215dccc3b7b9008545c9daa9" name="sine_1" x="112" y="14">
      <params>
         <frac32.s.map name="pitch" value="3.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="math/*c" uuid="7d5ef61c3bcd571ee6bbd8437ef3612125dfb225" name="*c_1" x="210" y="14">
      <params>
         <frac32.u.map name="amp" value="4.5"/>
      </params>
      <attribs/>
   </obj>
   <obj type="mix/mix 2" uuid="682ea5496ded046d981e26b720a6e7f8eca97541" name="mix_1" x="308" y="14">
      <params>
         <frac32.u.map name="gain1" value="7.5"/>
         <frac32.u.map name="gain2" value="32.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="tiar/osc/Steps/SixSteps" uuid="389db1c3-82e5-4d29-b17f-9c96663f66b0" name="SixSteps_1" x="392" y="14">
      <params>
         <frac32.s.map name="pitch" value="-12.0"/>
         <frac32.s.map name="level0" value="42.0"/>
         <frac32.s.map name="level1" value="-40.0"/>
         <frac32.s.map name="level2" value="41.0"/>
         <frac32.s.map name="level3" value="-44.0"/>
         <frac32.s.map name="level4" value="39.0"/>
         <frac32.s.map name="level5" value="0.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="tiar/osc/Steps/SixSteps" uuid="389db1c3-82e5-4d29-b17f-9c96663f66b0" name="SixSteps_2" x="490" y="14">
      <params>
         <frac32.s.map name="pitch" value="-12.010000228881836"/>
         <frac32.s.map name="level0" value="23.0"/>
         <frac32.s.map name="level1" value="-64.0"/>
         <frac32.s.map name="level2" value="64.0"/>
         <frac32.s.map name="level3" value="-26.0"/>
         <frac32.s.map name="level4" value="5.0"/>
         <frac32.s.map name="level5" value="-6.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="mix/mix 2" uuid="30c04239c88e09d3fa5c333b784ecf54f1b0e268" name="mix_3" x="588" y="14">
      <params>
         <frac32.u.map name="gain1" value="32.5"/>
         <frac32.u.map name="gain2" value="33.5"/>
      </params>
      <attribs/>
   </obj>
   <obj type="filter/vcf3" uuid="92455c652cd098cbb682a5497baa18abbf2ef865" name="vcf3_1" x="686" y="14">
      <params>
         <frac32.s.map name="pitch" value="12.0"/>
         <frac32.u.map name="reso" value="59.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="gain/vca" uuid="a9f2dcd18043e2f47364e45cb8814f63c2a37c0d" name="vca_1" x="784" y="14">
      <params/>
      <attribs/>
   </obj>
   <obj type="tiar/dist/DPSoftClip" uuid="4664e423-ca15-4925-952a-6d150aa652da" name="DPSoftClip_1" x="840" y="14">
      <params>
         <frac32.u.map name="InGain" value="21.0"/>
         <frac32.u.map name="OutGain" value="31.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/outlet a" uuid="abd8c5fd3b0524a6630f65cad6dc27f6c58e2a3e" name="audio" x="966" y="14">
      <params/>
      <attribs/>
   </obj>
   <obj type="env/adsr m" uuid="98bd39fb828c392b28126d259cb5175e6f6ea34b" name="adsr_2" x="140" y="182">
      <params>
         <frac32.s.map name="a" value="-64.0"/>
         <frac32.s.map name="d" value="44.0"/>
         <frac32.u.map name="s" value="0.0"/>
         <frac32.s.map name="r" value="8.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="mix/mix 2" uuid="682ea5496ded046d981e26b720a6e7f8eca97541" name="mix_2" x="238" y="182">
      <params>
         <frac32.u.map name="gain1" value="52.0"/>
         <frac32.u.map name="gain2" value="32.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="Attack_" x="28" y="196">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="Decay_" x="28" y="238">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="Sustain_" x="28" y="280">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="Release_" x="28" y="322">
      <params/>
      <attribs/>
   </obj>
   <obj type="env/adsr m" uuid="98bd39fb828c392b28126d259cb5175e6f6ea34b" name="adsr_1" x="420" y="392">
      <params>
         <frac32.s.map name="a" value="-64.0"/>
         <frac32.s.map name="d" value="5.0"/>
         <frac32.u.map name="s" value="9.5"/>
         <frac32.s.map name="r" value="7.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="Attack" x="28" y="448">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="Decay" x="28" y="490">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="Sustain" x="28" y="532">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="Release" x="28" y="574">
      <params/>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="keyb_1" outlet="gate"/>
         <dest obj="adsr_1" inlet="gate"/>
         <dest obj="adsr_2" inlet="gate"/>
      </net>
      <net>
         <source obj="adsr_1" outlet="env"/>
         <dest obj="vca_1" inlet="v"/>
      </net>
      <net>
         <source obj="keyb_1" outlet="note"/>
         <dest obj="mix_1" inlet="bus_in"/>
         <dest obj="mix_2" inlet="bus_in"/>
      </net>
      <net>
         <source obj="mix_1" outlet="out"/>
         <dest obj="SixSteps_1" inlet="pitch"/>
         <dest obj="SixSteps_2" inlet="pitch"/>
      </net>
      <net>
         <source obj="*c_1" outlet="out"/>
         <dest obj="mix_1" inlet="in1"/>
      </net>
      <net>
         <source obj="sine_1" outlet="wave"/>
         <dest obj="*c_1" inlet="in"/>
      </net>
      <net>
         <source obj="SixSteps_1" outlet="out"/>
         <dest obj="mix_3" inlet="in1"/>
      </net>
      <net>
         <source obj="adsr_2" outlet="env"/>
         <dest obj="mix_2" inlet="in1"/>
      </net>
      <net>
         <source obj="vcf3_1" outlet="out"/>
         <dest obj="vca_1" inlet="a"/>
      </net>
      <net>
         <source obj="mix_2" outlet="out"/>
         <dest obj="vcf3_1" inlet="pitch"/>
      </net>
      <net>
         <source obj="mix_3" outlet="out"/>
         <dest obj="vcf3_1" inlet="in"/>
      </net>
      <net>
         <source obj="SixSteps_2" outlet="out"/>
         <dest obj="mix_3" inlet="in2"/>
      </net>
      <net>
         <source obj="vca_1" outlet="o"/>
         <dest obj="DPSoftClip_1" inlet="in"/>
      </net>
      <net>
         <source obj="DPSoftClip_1" outlet="out"/>
         <dest obj="audio" inlet="outlet"/>
      </net>
      <net>
         <source obj="Attack" outlet="inlet"/>
         <dest obj="adsr_1" inlet="a"/>
      </net>
      <net>
         <source obj="Decay" outlet="inlet"/>
         <dest obj="adsr_1" inlet="d"/>
      </net>
      <net>
         <source obj="Sustain" outlet="inlet"/>
         <dest obj="adsr_1" inlet="s"/>
      </net>
      <net>
         <source obj="Release" outlet="inlet"/>
         <dest obj="adsr_1" inlet="r"/>
      </net>
      <net>
         <source obj="Attack_" outlet="inlet"/>
         <dest obj="adsr_2" inlet="a"/>
      </net>
      <net>
         <source obj="Decay_" outlet="inlet"/>
         <dest obj="adsr_2" inlet="d"/>
      </net>
      <net>
         <source obj="Sustain_" outlet="inlet"/>
         <dest obj="adsr_2" inlet="s"/>
      </net>
      <net>
         <source obj="Release_" outlet="inlet"/>
         <dest obj="adsr_2" inlet="r"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>no</subpatchmode>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>541</x>
      <y>119</y>
      <width>1355</width>
      <height>898</height>
   </windowPos>
</patch-1.0>