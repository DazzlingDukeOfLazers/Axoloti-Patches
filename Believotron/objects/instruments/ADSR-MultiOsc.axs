<patch-1.0 appVersion="1.0.12">
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="trigger" x="28" y="84">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="attack" x="28" y="140">
      <params/>
      <attribs/>
   </obj>
   <obj type="osc/multiwaveADSR" uuid="60014d06-2b04-4943-93e6-f2c1d6b4cddb" name="multiwaveADSR_1" x="392" y="168">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="decay" x="28" y="182">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="sustain" x="28" y="224">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="release" x="28" y="266">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/outlet a" uuid="abd8c5fd3b0524a6630f65cad6dc27f6c58e2a3e" name="out" x="742" y="266">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="volume" x="28" y="322">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="Base Note" x="28" y="378">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet a" uuid="b577fe41e0a6bc7b5502ce33cb8a3129e2e28ee5" name="modFreq" x="28" y="420">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="shape" x="28" y="462">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet i" uuid="f11927f00c59219df0c50f73056aa19f125540b7" name="waveSel" x="28" y="518">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="amount" x="28" y="574">
      <params/>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="Base Note" outlet="inlet"/>
         <dest obj="multiwaveADSR_1" inlet="pitch"/>
      </net>
      <net>
         <source obj="release" outlet="inlet"/>
         <dest obj="multiwaveADSR_1" inlet="r"/>
      </net>
      <net>
         <source obj="waveSel" outlet="inlet"/>
         <dest obj="multiwaveADSR_1" inlet="wave"/>
      </net>
      <net>
         <source obj="shape" outlet="inlet"/>
         <dest obj="multiwaveADSR_1" inlet="shape"/>
      </net>
      <net>
         <source obj="modFreq" outlet="inlet"/>
         <dest obj="multiwaveADSR_1" inlet="freq"/>
      </net>
      <net>
         <source obj="attack" outlet="inlet"/>
         <dest obj="multiwaveADSR_1" inlet="a"/>
      </net>
      <net>
         <source obj="decay" outlet="inlet"/>
         <dest obj="multiwaveADSR_1" inlet="d"/>
      </net>
      <net>
         <source obj="sustain" outlet="inlet"/>
         <dest obj="multiwaveADSR_1" inlet="s"/>
      </net>
      <net>
         <source obj="volume" outlet="inlet"/>
         <dest obj="multiwaveADSR_1" inlet="v"/>
      </net>
      <net>
         <source obj="trigger" outlet="inlet"/>
         <dest obj="multiwaveADSR_1" inlet="gate"/>
      </net>
      <net>
         <source obj="amount" outlet="inlet"/>
         <dest obj="multiwaveADSR_1" inlet="amount"/>
      </net>
      <net>
         <source obj="multiwaveADSR_1" outlet="o"/>
         <dest obj="out" inlet="outlet"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>no</subpatchmode>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>-1319</x>
      <y>-61</y>
      <width>893</width>
      <height>772</height>
   </windowPos>
</patch-1.0>