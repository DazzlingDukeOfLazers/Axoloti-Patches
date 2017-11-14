<patch-1.0 appVersion="1.0.12">
   <obj type="midi/in/keyb zone lru" uuid="36a44968a4f8b980273e94dca846b7544a3c45d2" name="keyb1" x="28" y="0">
      <params/>
      <attribs>
         <spinner attributeName="startNote" value="0"/>
         <spinner attributeName="endNote" value="127"/>
      </attribs>
   </obj>
   <obj type="sss/math/glide_multi" uuid="78ca6107-ebdf-439f-9aad-d112fe763f7a" name="glide_multi_1" x="168" y="0">
      <params>
         <frac32.u.map name="glide" MidiCC="51" value="0.0"/>
         <int32.hradio name="mode" value="1"/>
      </params>
      <attribs/>
   </obj>
   <comment type="patch/comment" x="574" y="84" text="play the modulation wheel!"/>
   <obj type="env/adsr m" uuid="98bd39fb828c392b28126d259cb5175e6f6ea34b" name="adsr_1" x="364" y="112">
      <params>
         <frac32.s.map name="a" value="2.0"/>
         <frac32.s.map name="d" value="0.0"/>
         <frac32.u.map name="s" value="0.0"/>
         <frac32.s.map name="r" value="0.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="ctrl/dial p" uuid="cc5d2846c3d50e425f450c4b9851371b54f4d674" name="c1" x="448" y="112">
      <params>
         <frac32.u.map name="value" MidiCC="1" value="0.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="math/+" uuid="44553fdc8628c67ab535845ed1be304ad6c9553b" name="+_1" x="560" y="112">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/&gt;&gt;" uuid="d883beaf50b7aae4803ed9941e8f123e87e1e3aa" name="&gt;&gt;_1" x="658" y="112">
      <params/>
      <attribs>
         <spinner attributeName="shift" value="1"/>
      </attribs>
   </obj>
   <obj type="math/+c" uuid="13eec32bd8ad57dd0bb18a02566cc0a117d320e3" name="+c_1" x="756" y="112">
      <params>
         <frac32.u.map name="c" value="26.5"/>
      </params>
      <attribs/>
   </obj>
   <obj type="math/smooth" uuid="6c5d08c282bb08bff24af85b4891447f99bcbc97" name="smooth1" x="826" y="112">
      <params>
         <frac32.u.map name="time" value="34.5"/>
      </params>
      <attribs/>
   </obj>
   <obj type="mix/mix 3" uuid="7d947bff9b8466d81c2ddd49b4a7fb702302e05c" name="mix_2" x="952" y="112">
      <params>
         <frac32.u.map name="gain1" value="4.5"/>
         <frac32.u.map name="gain2" value="10.5"/>
         <frac32.u.map name="gain3" value="5.5"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="Attack" x="84" y="154">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="Decay" x="84" y="196">
      <params/>
      <attribs/>
   </obj>
   <obj type="lfo/sine" uuid="75f7330c26a13953215dccc3b7b9008545c9daa9" name="osc1" x="630" y="210">
      <params>
         <frac32.s.map name="pitch" value="-5.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="Sustain" x="84" y="238">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="Release" x="84" y="280">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="Freqmod" x="84" y="336">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet a" uuid="abd8c5fd3b0524a6630f65cad6dc27f6c58e2a3e" name="left" x="1260" y="350">
      <params/>
      <attribs/>
   </obj>
   <obj type="gain/vca" uuid="a9f2dcd18043e2f47364e45cb8814f63c2a37c0d" name="vca_1" x="602" y="378">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/*c" uuid="7a66f52a9594e7e9eb31328ea725cb3641a80b55" name="*c_1" x="686" y="378">
      <params>
         <frac32.u.map name="amp" value="17.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="delay/echo fdbk mix" uuid="15716b14ebe691010ccfd54af72ea23232a843c6" name="echo2_1" x="826" y="378">
      <params>
         <frac32.u.map name="mix" value="13.5"/>
         <frac32.u.map name="feedback" value="3.0"/>
      </params>
      <attribs>
         <spinner attributeName="delaylength" value="10000"/>
      </attribs>
   </obj>
   <obj type="filter/lp1" uuid="1b1fd7085e44d2b7b80b59b8d68796b909c1b2cc" name="lp1_1" x="980" y="378">
      <params>
         <frac32.s.map name="freq" value="38.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="fx/chorus" uuid="cbe6715c-581b-4c25-8158-1a5b192aa043" name="chorus1" x="1120" y="378">
      <params>
         <frac32.u.map name="depth" value="13.5"/>
         <frac32.s.map name="speed" value="-64.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="Modwheel" x="84" y="392">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet a" uuid="abd8c5fd3b0524a6630f65cad6dc27f6c58e2a3e" name="otherleft" x="1260" y="406">
      <params/>
      <attribs/>
   </obj>
   <obj type="lfo/sine" uuid="75f7330c26a13953215dccc3b7b9008545c9daa9" name="osc2" x="84" y="504">
      <params>
         <frac32.s.map name="pitch" value="-4.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="math/div 32" uuid="40e43d0d284fded6b6cfadd45a5cb69c8d713691" name="div321" x="196" y="504">
      <params/>
      <attribs/>
   </obj>
   <obj type="mix/mix 2" uuid="682ea5496ded046d981e26b720a6e7f8eca97541" name="mix_1" x="84" y="602">
      <params>
         <frac32.u.map name="gain1" value="1.5"/>
         <frac32.u.map name="gain2" value="11.999999523162842"/>
      </params>
      <attribs/>
   </obj>
   <obj type="osc/saw" uuid="739ecc36017ef3249479b8f01716b8bbfba9abc1" name="saw_1" x="168" y="602">
      <params>
         <frac32.s.map name="pitch" value="-9.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="filter/lp m" uuid="1aa1bc51da479ed92429af700591f9d7b9f45f22" name="lpf_1" x="294" y="630">
      <params>
         <frac32.s.map name="pitch" value="-14.0"/>
         <frac32.u.map name="reso" value="62.049999713897705"/>
      </params>
      <attribs/>
   </obj>
   <obj type="dist/inf" uuid="d12af924890d417179e6fdbcf71cb1ec3ba31f67" name="inf_1" x="420" y="630">
      <params/>
      <attribs/>
   </obj>
   <obj type="midi/in/bend" uuid="7bd8cace52a8c26ed61d80f65e238408d5d621f4" name="bend_1" x="28" y="770">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/smooth" uuid="6c5d08c282bb08bff24af85b4891447f99bcbc97" name="smooth_1" x="126" y="770">
      <params>
         <frac32.u.map name="time" value="4.0"/>
      </params>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="vca_1" outlet="o"/>
         <dest obj="*c_1" inlet="in"/>
      </net>
      <net>
         <source obj="mix_2" outlet="out"/>
         <dest obj="lpf_1" inlet="pitch"/>
      </net>
      <net>
         <source obj="osc1" outlet="wave"/>
         <dest obj="mix_2" inlet="in1"/>
      </net>
      <net>
         <source obj="mix_1" outlet="out"/>
         <dest obj="saw_1" inlet="pitch"/>
         <dest obj="mix_2" inlet="in3"/>
      </net>
      <net>
         <source obj="osc2" outlet="wave"/>
         <dest obj="div321" inlet="in"/>
      </net>
      <net>
         <source obj="div321" outlet="out"/>
         <dest obj="mix_1" inlet="in1"/>
      </net>
      <net>
         <source obj="smooth1" outlet="out"/>
         <dest obj="mix_2" inlet="bus_in"/>
      </net>
      <net>
         <source obj="*c_1" outlet="out"/>
         <dest obj="echo2_1" inlet="in"/>
      </net>
      <net>
         <source obj="keyb1" outlet="gate"/>
         <dest obj="adsr_1" inlet="gate"/>
      </net>
      <net>
         <source obj="lp1_1" outlet="out"/>
         <dest obj="chorus1" inlet="in"/>
      </net>
      <net>
         <source obj="echo2_1" outlet="out"/>
         <dest obj="lp1_1" inlet="in"/>
      </net>
      <net>
         <source obj="bend_1" outlet="bend"/>
         <dest obj="smooth_1" inlet="in"/>
      </net>
      <net>
         <source obj="smooth_1" outlet="out"/>
         <dest obj="mix_1" inlet="in2"/>
      </net>
      <net>
         <source obj="saw_1" outlet="wave"/>
         <dest obj="lpf_1" inlet="in"/>
      </net>
      <net>
         <source obj="+c_1" outlet="out"/>
         <dest obj="smooth1" inlet="in"/>
      </net>
      <net>
         <source obj="&gt;&gt;_1" outlet="result"/>
         <dest obj="+c_1" inlet="in"/>
      </net>
      <net>
         <source obj="keyb1" outlet="note"/>
         <dest obj="glide_multi_1" inlet="in"/>
      </net>
      <net>
         <source obj="glide_multi_1" outlet="out"/>
         <dest obj="mix_1" inlet="bus_in"/>
      </net>
      <net>
         <source obj="inf_1" outlet="out"/>
         <dest obj="vca_1" inlet="a"/>
      </net>
      <net>
         <source obj="lpf_1" outlet="out"/>
         <dest obj="inf_1" inlet="in"/>
      </net>
      <net>
         <source obj="adsr_1" outlet="env"/>
         <dest obj="mix_2" inlet="in2"/>
         <dest obj="vca_1" inlet="v"/>
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
         <source obj="Freqmod" outlet="inlet"/>
         <dest obj="osc1" inlet="pitch"/>
      </net>
      <net>
         <source obj="+_1" outlet="out"/>
         <dest obj="&gt;&gt;_1" inlet="a"/>
      </net>
      <net>
         <source obj="c1" outlet="out"/>
         <dest obj="+_1" inlet="in1"/>
      </net>
      <net>
         <source obj="Modwheel" outlet="inlet"/>
         <dest obj="+_1" inlet="in2"/>
      </net>
      <net>
         <source obj="chorus1" outlet="L"/>
         <dest obj="left" inlet="outlet"/>
      </net>
      <net>
         <source obj="chorus1" outlet="R"/>
         <dest obj="otherleft" inlet="outlet"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>normal</subpatchmode>
      <MidiChannel>1</MidiChannel>
      <NPresets>8</NPresets>
      <NPresetEntries>32</NPresetEntries>
      <NModulationSources>8</NModulationSources>
      <NModulationTargetsPerSource>8</NModulationTargetsPerSource>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>254</x>
      <y>81</y>
      <width>1372</width>
      <height>746</height>
   </windowPos>
</patch-1.0>