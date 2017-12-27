<patch-1.0 appVersion="1.0.10">
   <comment type="patch/comment" x="14" y="14" text="IMPORTANT: needs samples on sdcard!"/>
   <obj type="patch/inlet string" uuid="6c562c1a7890cccf18fa7327d8baa476d0926cd8" name="folder path" x="252" y="14">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/recv b" uuid="6ce86e0c667a0168b53a910eb891366e96b944d1" name="recv_4" x="1750" y="14">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="kb0"/>
      </attribs>
   </obj>
   <obj type="patch/recv i" uuid="c57c3fb0d08bcb566403f4fb43426338bd37ce1f" name="recv_29" x="854" y="28">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="fileOffset"/>
      </attribs>
   </obj>
   <obj type="math/+" uuid="b94a9b8e9adcb7d18868c0ee808a9b211b65578d" name="+_1" x="1036" y="28">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/PlayFolder" uuid="a883eeb5-f4ef-470e-898d-8fb54eb57f45" name="PlayFolder_1" x="1106" y="28">
      <params/>
      <attribs>
         <table attributeName="prefix" table=""/>
         <table attributeName="suffix" table=".raw"/>
      </attribs>
   </obj>
   <obj type="ctrl/i" uuid="a3786816db6ea5bc6ac4193a5cccdb2c83b83496" name="i_1" x="980" y="42">
      <params>
         <int32 name="value" value="1"/>
      </params>
      <attribs/>
   </obj>
   <obj type="tb/wave/wavetable load fn" uuid="0dffb4b4-fd43-42de-8718-2abe6c653a9a" name="table1" x="1400" y="42">
      <params/>
      <attribs>
         <combo attributeName="waves" selection="512"/>
         <combo attributeName="size" selection="512"/>
      </attribs>
   </obj>
   <obj type="patch/recv b" uuid="6ce86e0c667a0168b53a910eb891366e96b944d1" name="recv_13" x="1274" y="56">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="sampleReload"/>
      </attribs>
   </obj>
   <obj type="patch/recv f" uuid="d36a51b111e0f72d0012e207d467e1f1052116ef" name="recv_1" x="1750" y="70">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="samplePitch"/>
      </attribs>
   </obj>
   <obj type="table/play pitch" uuid="5632a54926261833bbb9fff049e71322c360e57e" name="play_1" x="1890" y="70">
      <params>
         <frac32.s.map name="pitch" value="0.0"/>
      </params>
      <attribs>
         <objref attributeName="table" obj="table1"/>
      </attribs>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="in_kb0" x="308" y="84">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/send b" uuid="b428934ee3ee80efb18736216fd871d264e9b695" name="kb0" x="448" y="84">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial b" uuid="862e7d7f29093cb1ce4aed72244d118ad4d46692" name="dial_1" x="14" y="98">
      <params>
         <frac32.s.map name="value" onParent="true" value="0.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/send f" uuid="8a7799ea1c3b8582991e669a4f70e2f663841f2d" name="samplePitch" x="84" y="98">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial b" uuid="862e7d7f29093cb1ce4aed72244d118ad4d46692" name="dial_2" x="154" y="98">
      <params>
         <frac32.s.map name="value" onParent="true" value="0.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/send f" uuid="8a7799ea1c3b8582991e669a4f70e2f663841f2d" name="samplePos" x="224" y="98">
      <params/>
      <attribs/>
   </obj>
   <obj type="mix/mix 6 g" uuid="2dd642dee5072357722740c850699b79b8da3008" name="mix_1" x="2156" y="112">
      <params>
         <frac32.u.map name="gain1" value="64.0">
            <presets/>
         </frac32.u.map>
         <frac32.u.map name="gain2" value="64.0">
            <presets/>
         </frac32.u.map>
         <frac32.u.map name="gain3" value="63.5"/>
         <frac32.u.map name="gain4" value="64.0">
            <presets/>
         </frac32.u.map>
         <frac32.u.map name="gain5" value="64.0">
            <presets/>
         </frac32.u.map>
         <frac32.u.map name="gain6" value="64.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="in_kb1" x="308" y="126">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/send b" uuid="b428934ee3ee80efb18736216fd871d264e9b695" name="kb1" x="448" y="126">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/recv i" uuid="c57c3fb0d08bcb566403f4fb43426338bd37ce1f" name="recv_40" x="854" y="140">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="fileOffset"/>
      </attribs>
   </obj>
   <obj type="math/+" uuid="b94a9b8e9adcb7d18868c0ee808a9b211b65578d" name="+_2" x="1036" y="140">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/PlayFolder" uuid="a883eeb5-f4ef-470e-898d-8fb54eb57f45" name="PlayFolder_2" x="1106" y="140">
      <params/>
      <attribs>
         <table attributeName="prefix" table=""/>
         <table attributeName="suffix" table=".raw"/>
      </attribs>
   </obj>
   <obj type="tb/wave/wavetable load fn" uuid="0dffb4b4-fd43-42de-8718-2abe6c653a9a" name="table2" x="1400" y="140">
      <params/>
      <attribs>
         <combo attributeName="waves" selection="512"/>
         <combo attributeName="size" selection="512"/>
      </attribs>
   </obj>
   <obj type="patch/recv f" uuid="d36a51b111e0f72d0012e207d467e1f1052116ef" name="recv_2" x="1750" y="140">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="samplePos"/>
      </attribs>
   </obj>
   <obj type="ctrl/i" uuid="a3786816db6ea5bc6ac4193a5cccdb2c83b83496" name="i_2" x="980" y="154">
      <params>
         <int32 name="value" value="2"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/recv b" uuid="6ce86e0c667a0168b53a910eb891366e96b944d1" name="recv_39" x="1274" y="154">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="sampleReload"/>
      </attribs>
   </obj>
   <obj type="audio/out stereo" sha="b933bb91801a126126313c11f773158b5ca2face" name="out_1" x="2464" y="154">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="in_kb2" x="308" y="168">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/send b" uuid="b428934ee3ee80efb18736216fd871d264e9b695" name="kb2" x="448" y="168">
      <params/>
      <attribs/>
   </obj>
   <obj type="mix/mix 2" uuid="30c04239c88e09d3fa5c333b784ecf54f1b0e268" name="mix_3" x="2324" y="182">
      <params>
         <frac32.u.map name="gain1" value="32.0"/>
         <frac32.u.map name="gain2" value="32.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="in_kb3" x="308" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/send b" uuid="b428934ee3ee80efb18736216fd871d264e9b695" name="kb3" x="448" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/recv b" uuid="6ce86e0c667a0168b53a910eb891366e96b944d1" name="recv_6" x="1750" y="224">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="kb1"/>
      </attribs>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="in_kb4" x="308" y="252">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/send b" uuid="b428934ee3ee80efb18736216fd871d264e9b695" name="kb4" x="448" y="252">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/recv i" uuid="c57c3fb0d08bcb566403f4fb43426338bd37ce1f" name="recv_41" x="854" y="252">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="fileOffset"/>
      </attribs>
   </obj>
   <obj type="math/+" uuid="b94a9b8e9adcb7d18868c0ee808a9b211b65578d" name="+_3" x="1036" y="252">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/PlayFolder" uuid="a883eeb5-f4ef-470e-898d-8fb54eb57f45" name="PlayFolder_3" x="1106" y="252">
      <params/>
      <attribs>
         <table attributeName="prefix" table=""/>
         <table attributeName="suffix" table=".raw"/>
      </attribs>
   </obj>
   <obj type="tb/wave/wavetable load fn" uuid="0dffb4b4-fd43-42de-8718-2abe6c653a9a" name="table3" x="1400" y="252">
      <params/>
      <attribs>
         <combo attributeName="waves" selection="512"/>
         <combo attributeName="size" selection="512"/>
      </attribs>
   </obj>
   <obj type="ctrl/i" uuid="a3786816db6ea5bc6ac4193a5cccdb2c83b83496" name="i_3" x="980" y="266">
      <params>
         <int32 name="value" value="3"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/recv b" uuid="6ce86e0c667a0168b53a910eb891366e96b944d1" name="recv_43" x="1274" y="266">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="sampleReload"/>
      </attribs>
   </obj>
   <obj type="patch/outlet a" uuid="abd8c5fd3b0524a6630f65cad6dc27f6c58e2a3e" name="mix" x="2464" y="266">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="in_kb5" x="308" y="294">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/send b" uuid="b428934ee3ee80efb18736216fd871d264e9b695" name="kb5" x="448" y="294">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/recv f" uuid="d36a51b111e0f72d0012e207d467e1f1052116ef" name="recv_3" x="1750" y="294">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="samplePitch"/>
      </attribs>
   </obj>
   <obj type="table/play pitch" uuid="5632a54926261833bbb9fff049e71322c360e57e" name="play_2" x="1890" y="294">
      <params>
         <frac32.s.map name="pitch" value="0.0"/>
      </params>
      <attribs>
         <objref attributeName="table" obj="table2"/>
      </attribs>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="in_kb6" x="308" y="336">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/send b" uuid="b428934ee3ee80efb18736216fd871d264e9b695" name="kb6" x="448" y="336">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/recv i" uuid="c57c3fb0d08bcb566403f4fb43426338bd37ce1f" name="recv_42" x="854" y="364">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="fileOffset"/>
      </attribs>
   </obj>
   <obj type="math/+" uuid="b94a9b8e9adcb7d18868c0ee808a9b211b65578d" name="+_4" x="1036" y="364">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/PlayFolder" uuid="a883eeb5-f4ef-470e-898d-8fb54eb57f45" name="PlayFolder_4" x="1106" y="364">
      <params/>
      <attribs>
         <table attributeName="prefix" table=""/>
         <table attributeName="suffix" table=".raw"/>
      </attribs>
   </obj>
   <obj type="tb/wave/wavetable load fn" uuid="0dffb4b4-fd43-42de-8718-2abe6c653a9a" name="table4" x="1400" y="364">
      <params/>
      <attribs>
         <combo attributeName="waves" selection="512"/>
         <combo attributeName="size" selection="512"/>
      </attribs>
   </obj>
   <obj type="patch/recv f" uuid="d36a51b111e0f72d0012e207d467e1f1052116ef" name="recv_5" x="1750" y="364">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="samplePos"/>
      </attribs>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="in_kb7" x="308" y="378">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/send b" uuid="b428934ee3ee80efb18736216fd871d264e9b695" name="kb7" x="448" y="378">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/i" uuid="a3786816db6ea5bc6ac4193a5cccdb2c83b83496" name="i_4" x="980" y="378">
      <params>
         <int32 name="value" value="4"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/recv b" uuid="6ce86e0c667a0168b53a910eb891366e96b944d1" name="recv_44" x="1274" y="379">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="sampleReload"/>
      </attribs>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="in_kb8" x="308" y="420">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/send b" uuid="b428934ee3ee80efb18736216fd871d264e9b695" name="kb8" x="448" y="420">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/recv b" uuid="6ce86e0c667a0168b53a910eb891366e96b944d1" name="recv_9" x="1750" y="448">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="kb2"/>
      </attribs>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="in_kb9" x="308" y="462">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/send b" uuid="b428934ee3ee80efb18736216fd871d264e9b695" name="kb9" x="448" y="462">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_1" x="658" y="462">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/recv i" uuid="c57c3fb0d08bcb566403f4fb43426338bd37ce1f" name="recv_53" x="854" y="476">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="fileOffset"/>
      </attribs>
   </obj>
   <obj type="math/+" uuid="b94a9b8e9adcb7d18868c0ee808a9b211b65578d" name="+_5" x="1036" y="476">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/PlayFolder" uuid="a883eeb5-f4ef-470e-898d-8fb54eb57f45" name="PlayFolder_5" x="1106" y="476">
      <params/>
      <attribs>
         <table attributeName="prefix" table=""/>
         <table attributeName="suffix" table=".raw"/>
      </attribs>
   </obj>
   <obj type="script/BTWavLoadFn" uuid="3529e74f-e1ca-4e5f-8603-086e8c2dca14" name="table5" x="1400" y="476">
      <params/>
      <attribs>
         <combo attributeName="waves" selection="512"/>
         <combo attributeName="size" selection="512"/>
      </attribs>
   </obj>
   <obj type="mix/mix 6 g" uuid="2dd642dee5072357722740c850699b79b8da3008" name="mix_2" x="2156" y="476">
      <params>
         <frac32.u.map name="gain1" value="64.0">
            <presets/>
         </frac32.u.map>
         <frac32.u.map name="gain2" value="64.0">
            <presets/>
         </frac32.u.map>
         <frac32.u.map name="gain3" value="64.0"/>
         <frac32.u.map name="gain4" value="64.0">
            <presets/>
         </frac32.u.map>
         <frac32.u.map name="gain5" value="64.0">
            <presets/>
         </frac32.u.map>
         <frac32.u.map name="gain6" value="64.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="ctrl/i" uuid="a3786816db6ea5bc6ac4193a5cccdb2c83b83496" name="i_5" x="980" y="490">
      <params>
         <int32 name="value" value="5"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/recv b" uuid="6ce86e0c667a0168b53a910eb891366e96b944d1" name="recv_45" x="1274" y="490">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="sampleReload"/>
      </attribs>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="inkb10" x="308" y="504">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/send b" uuid="b428934ee3ee80efb18736216fd871d264e9b695" name="kb10" x="448" y="504">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_3" x="672" y="518">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/recv f" uuid="d36a51b111e0f72d0012e207d467e1f1052116ef" name="recv_7" x="1750" y="518">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="samplePitch"/>
      </attribs>
   </obj>
   <obj type="table/play pitch" uuid="5632a54926261833bbb9fff049e71322c360e57e" name="play_3" x="1890" y="518">
      <params>
         <frac32.s.map name="pitch" value="0.0"/>
      </params>
      <attribs>
         <objref attributeName="table" obj="table3"/>
      </attribs>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="inkb11" x="308" y="546">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/send b" uuid="b428934ee3ee80efb18736216fd871d264e9b695" name="kb11" x="448" y="546">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_4" x="686" y="574">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/recv i" uuid="c57c3fb0d08bcb566403f4fb43426338bd37ce1f" name="recv_54" x="854" y="588">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="fileOffset"/>
      </attribs>
   </obj>
   <obj type="math/+" uuid="b94a9b8e9adcb7d18868c0ee808a9b211b65578d" name="+_6" x="1036" y="588">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/PlayFolder" uuid="a883eeb5-f4ef-470e-898d-8fb54eb57f45" name="PlayFolder_6" x="1106" y="588">
      <params/>
      <attribs>
         <table attributeName="prefix" table=""/>
         <table attributeName="suffix" table=".raw"/>
      </attribs>
   </obj>
   <obj type="tb/wave/wavetable load fn" uuid="0dffb4b4-fd43-42de-8718-2abe6c653a9a" name="table6" x="1400" y="588">
      <params/>
      <attribs>
         <combo attributeName="waves" selection="512"/>
         <combo attributeName="size" selection="512"/>
      </attribs>
   </obj>
   <obj type="patch/recv f" uuid="d36a51b111e0f72d0012e207d467e1f1052116ef" name="recv_8" x="1750" y="588">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="samplePos"/>
      </attribs>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="in_sampleReload" x="308" y="602">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/send b" uuid="b428934ee3ee80efb18736216fd871d264e9b695" name="sampleReload" x="448" y="602">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_2" x="588" y="602">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/i" uuid="a3786816db6ea5bc6ac4193a5cccdb2c83b83496" name="i_6" x="980" y="602">
      <params>
         <int32 name="value" value="6"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/recv b" uuid="6ce86e0c667a0168b53a910eb891366e96b944d1" name="recv_46" x="1274" y="602">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="sampleReload"/>
      </attribs>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_5" x="686" y="630">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="inc" x="280" y="672">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/recv b" uuid="6ce86e0c667a0168b53a910eb891366e96b944d1" name="recv_12" x="1750" y="672">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="kb3"/>
      </attribs>
   </obj>
   <obj type="patch/recv i" uuid="c57c3fb0d08bcb566403f4fb43426338bd37ce1f" name="recv_55" x="854" y="700">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="fileOffset"/>
      </attribs>
   </obj>
   <obj type="math/+" uuid="b94a9b8e9adcb7d18868c0ee808a9b211b65578d" name="+_7" x="1036" y="700">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/PlayFolder" uuid="a883eeb5-f4ef-470e-898d-8fb54eb57f45" name="PlayFolder_7" x="1106" y="700">
      <params/>
      <attribs>
         <table attributeName="prefix" table=""/>
         <table attributeName="suffix" table=".raw"/>
      </attribs>
   </obj>
   <obj type="tb/wave/wavetable load fn" uuid="0dffb4b4-fd43-42de-8718-2abe6c653a9a" name="table7" x="1400" y="700">
      <params/>
      <attribs>
         <combo attributeName="waves" selection="512"/>
         <combo attributeName="size" selection="512"/>
      </attribs>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="dec" x="280" y="714">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/i" uuid="a3786816db6ea5bc6ac4193a5cccdb2c83b83496" name="i_7" x="980" y="714">
      <params>
         <int32 name="value" value="7"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/recv b" uuid="6ce86e0c667a0168b53a910eb891366e96b944d1" name="recv_47" x="1274" y="714">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="sampleReload"/>
      </attribs>
   </obj>
   <obj type="patch/recv f" uuid="d36a51b111e0f72d0012e207d467e1f1052116ef" name="recv_10" x="1750" y="728">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="samplePitch"/>
      </attribs>
   </obj>
   <obj type="table/play pitch" uuid="5632a54926261833bbb9fff049e71322c360e57e" name="play_4" x="1890" y="728">
      <params>
         <frac32.s.map name="pitch" value="0.0"/>
      </params>
      <attribs>
         <objref attributeName="table" obj="table4"/>
      </attribs>
   </obj>
   <obj type="disp/hex" uuid="3ce415f2f0e09f5b3cf10e5d355274847fd063b2" name="hex_2" x="350" y="784">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/recv f" uuid="d36a51b111e0f72d0012e207d467e1f1052116ef" name="recv_11" x="1750" y="798">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="samplePos"/>
      </attribs>
   </obj>
   <obj type="djrm/logic/counter2_init_start" uuid="d5936f238ab92e53ac93d5927c3b43ceef998dc1" name="counter2_init_start_1" x="140" y="812">
      <params>
         <int32 name="maximum" value="11"/>
         <int32 name="init" value="0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/recv i" uuid="c57c3fb0d08bcb566403f4fb43426338bd37ce1f" name="recv_56" x="854" y="812">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="fileOffset"/>
      </attribs>
   </obj>
   <obj type="math/+" uuid="b94a9b8e9adcb7d18868c0ee808a9b211b65578d" name="+_8" x="1036" y="812">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/PlayFolder" uuid="a883eeb5-f4ef-470e-898d-8fb54eb57f45" name="PlayFolder_8" x="1106" y="812">
      <params/>
      <attribs>
         <table attributeName="prefix" table=""/>
         <table attributeName="suffix" table=".raw"/>
      </attribs>
   </obj>
   <obj type="tb/wave/wavetable load fn" uuid="0dffb4b4-fd43-42de-8718-2abe6c653a9a" name="table8" x="1400" y="812">
      <params/>
      <attribs>
         <combo attributeName="waves" selection="512"/>
         <combo attributeName="size" selection="512"/>
      </attribs>
   </obj>
   <obj type="ctrl/i" uuid="a3786816db6ea5bc6ac4193a5cccdb2c83b83496" name="i_8" x="980" y="826">
      <params>
         <int32 name="value" value="8"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/recv b" uuid="6ce86e0c667a0168b53a910eb891366e96b944d1" name="recv_48" x="1274" y="826">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="sampleReload"/>
      </attribs>
   </obj>
   <obj type="disp/bool" uuid="a0ee71d48208b71752cbb8c05e55145106ef3946" name="bool_6" x="350" y="840">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/recv b" uuid="6ce86e0c667a0168b53a910eb891366e96b944d1" name="recv_16" x="1750" y="882">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="kb4"/>
      </attribs>
   </obj>
   <obj type="patch/recv i" uuid="c57c3fb0d08bcb566403f4fb43426338bd37ce1f" name="recv_57" x="854" y="924">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="fileOffset"/>
      </attribs>
   </obj>
   <obj type="math/+" uuid="b94a9b8e9adcb7d18868c0ee808a9b211b65578d" name="+_9" x="1036" y="924">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/PlayFolder" uuid="a883eeb5-f4ef-470e-898d-8fb54eb57f45" name="PlayFolder_9" x="1106" y="924">
      <params/>
      <attribs>
         <table attributeName="prefix" table=""/>
         <table attributeName="suffix" table=".raw"/>
      </attribs>
   </obj>
   <obj type="script/BTWavLoadFn" uuid="3529e74f-e1ca-4e5f-8603-086e8c2dca14" name="table9" x="1400" y="924">
      <params/>
      <attribs>
         <combo attributeName="waves" selection="512"/>
         <combo attributeName="size" selection="512"/>
      </attribs>
   </obj>
   <obj type="ctrl/i" uuid="a3786816db6ea5bc6ac4193a5cccdb2c83b83496" name="i_9" x="980" y="938">
      <params>
         <int32 name="value" value="9"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/recv b" uuid="6ce86e0c667a0168b53a910eb891366e96b944d1" name="recv_49" x="1274" y="938">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="sampleReload"/>
      </attribs>
   </obj>
   <obj type="patch/recv f" uuid="d36a51b111e0f72d0012e207d467e1f1052116ef" name="recv_14" x="1750" y="952">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="samplePitch"/>
      </attribs>
   </obj>
   <obj type="table/play pitch" uuid="5632a54926261833bbb9fff049e71322c360e57e" name="play_5" x="1890" y="952">
      <params>
         <frac32.s.map name="pitch" value="0.0"/>
      </params>
      <attribs>
         <objref attributeName="table" obj="table5"/>
      </attribs>
   </obj>
   <obj type="disp/hex" uuid="3ce415f2f0e09f5b3cf10e5d355274847fd063b2" name="hex_1" x="308" y="966">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/i" uuid="a3786816db6ea5bc6ac4193a5cccdb2c83b83496" name="offset" x="84" y="1008">
      <params>
         <int32 name="value" value="0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="math/+" uuid="b94a9b8e9adcb7d18868c0ee808a9b211b65578d" name="+_13" x="182" y="1008">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/send i" uuid="452e1d7a88de691f954015e6fec2f6994e1b35fc" name="fileOffset" x="294" y="1022">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/recv f" uuid="d36a51b111e0f72d0012e207d467e1f1052116ef" name="recv_15" x="1750" y="1022">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="samplePos"/>
      </attribs>
   </obj>
   <obj type="patch/recv i" uuid="c57c3fb0d08bcb566403f4fb43426338bd37ce1f" name="recv_58" x="854" y="1036">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="fileOffset"/>
      </attribs>
   </obj>
   <obj type="math/+" uuid="b94a9b8e9adcb7d18868c0ee808a9b211b65578d" name="+_10" x="1036" y="1036">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/PlayFolder" uuid="a883eeb5-f4ef-470e-898d-8fb54eb57f45" name="PlayFolder_10" x="1106" y="1036">
      <params/>
      <attribs>
         <table attributeName="prefix" table=""/>
         <table attributeName="suffix" table=".raw"/>
      </attribs>
   </obj>
   <obj type="tb/wave/wavetable load fn" uuid="0dffb4b4-fd43-42de-8718-2abe6c653a9a" name="table10" x="1400" y="1036">
      <params/>
      <attribs>
         <combo attributeName="waves" selection="512"/>
         <combo attributeName="size" selection="512"/>
      </attribs>
   </obj>
   <obj type="ctrl/i" uuid="a3786816db6ea5bc6ac4193a5cccdb2c83b83496" name="i_12" x="980" y="1050">
      <params>
         <int32 name="value" value="10"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/recv b" uuid="6ce86e0c667a0168b53a910eb891366e96b944d1" name="recv_50" x="1274" y="1050">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="sampleReload"/>
      </attribs>
   </obj>
   <obj type="patch/recv b" uuid="6ce86e0c667a0168b53a910eb891366e96b944d1" name="recv_19" x="1750" y="1120">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="kb5"/>
      </attribs>
   </obj>
   <obj type="patch/recv i" uuid="c57c3fb0d08bcb566403f4fb43426338bd37ce1f" name="recv_59" x="854" y="1148">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="fileOffset"/>
      </attribs>
   </obj>
   <obj type="math/+" uuid="b94a9b8e9adcb7d18868c0ee808a9b211b65578d" name="+_11" x="1036" y="1148">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/PlayFolder" uuid="a883eeb5-f4ef-470e-898d-8fb54eb57f45" name="PlayFolder_11" x="1106" y="1148">
      <params/>
      <attribs>
         <table attributeName="prefix" table=""/>
         <table attributeName="suffix" table=".raw"/>
      </attribs>
   </obj>
   <obj type="tb/wave/wavetable load fn" uuid="0dffb4b4-fd43-42de-8718-2abe6c653a9a" name="table11" x="1400" y="1148">
      <params/>
      <attribs>
         <combo attributeName="waves" selection="512"/>
         <combo attributeName="size" selection="512"/>
      </attribs>
   </obj>
   <obj type="ctrl/i" uuid="a3786816db6ea5bc6ac4193a5cccdb2c83b83496" name="i_13" x="980" y="1162">
      <params>
         <int32 name="value" value="11"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/recv b" uuid="6ce86e0c667a0168b53a910eb891366e96b944d1" name="recv_51" x="1274" y="1162">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="sampleReload"/>
      </attribs>
   </obj>
   <obj type="patch/recv f" uuid="d36a51b111e0f72d0012e207d467e1f1052116ef" name="recv_17" x="1750" y="1176">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="samplePitch"/>
      </attribs>
   </obj>
   <obj type="table/play pitch" uuid="5632a54926261833bbb9fff049e71322c360e57e" name="play_6" x="1890" y="1176">
      <params>
         <frac32.s.map name="pitch" value="0.0"/>
      </params>
      <attribs>
         <objref attributeName="table" obj="table6"/>
      </attribs>
   </obj>
   <obj type="patch/recv f" uuid="d36a51b111e0f72d0012e207d467e1f1052116ef" name="recv_18" x="1750" y="1246">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="samplePos"/>
      </attribs>
   </obj>
   <obj type="patch/recv i" uuid="c57c3fb0d08bcb566403f4fb43426338bd37ce1f" name="recv_60" x="854" y="1260">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="fileOffset"/>
      </attribs>
   </obj>
   <obj type="math/+" uuid="b94a9b8e9adcb7d18868c0ee808a9b211b65578d" name="+_12" x="1036" y="1260">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/PlayFolder" uuid="a883eeb5-f4ef-470e-898d-8fb54eb57f45" name="PlayFolder_12" x="1106" y="1260">
      <params/>
      <attribs>
         <table attributeName="prefix" table=""/>
         <table attributeName="suffix" table=".wav"/>
      </attribs>
   </obj>
   <obj type="tb/wave/wavetable load fn" uuid="0dffb4b4-fd43-42de-8718-2abe6c653a9a" name="table12" x="1400" y="1260">
      <params/>
      <attribs>
         <combo attributeName="waves" selection="512"/>
         <combo attributeName="size" selection="512"/>
      </attribs>
   </obj>
   <obj type="ctrl/i" uuid="a3786816db6ea5bc6ac4193a5cccdb2c83b83496" name="i_14" x="980" y="1274">
      <params>
         <int32 name="value" value="12"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/recv b" uuid="6ce86e0c667a0168b53a910eb891366e96b944d1" name="recv_52" x="1274" y="1274">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="sampleReload"/>
      </attribs>
   </obj>
   <obj type="patch/recv b" uuid="6ce86e0c667a0168b53a910eb891366e96b944d1" name="recv_22" x="1750" y="1344">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="kb6"/>
      </attribs>
   </obj>
   <obj type="patch/recv f" uuid="d36a51b111e0f72d0012e207d467e1f1052116ef" name="recv_20" x="1750" y="1400">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="samplePitch"/>
      </attribs>
   </obj>
   <obj type="table/play pitch" uuid="5632a54926261833bbb9fff049e71322c360e57e" name="play_7" x="1890" y="1400">
      <params>
         <frac32.s.map name="pitch" value="0.0"/>
      </params>
      <attribs>
         <objref attributeName="table" obj="table7"/>
      </attribs>
   </obj>
   <obj type="patch/recv f" uuid="d36a51b111e0f72d0012e207d467e1f1052116ef" name="recv_21" x="1750" y="1470">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="samplePos"/>
      </attribs>
   </obj>
   <obj type="patch/recv b" uuid="6ce86e0c667a0168b53a910eb891366e96b944d1" name="recv_25" x="1750" y="1568">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="kb7"/>
      </attribs>
   </obj>
   <obj type="table/play pitch" uuid="5632a54926261833bbb9fff049e71322c360e57e" name="play_8" x="1890" y="1624">
      <params>
         <frac32.s.map name="pitch" value="0.0"/>
      </params>
      <attribs>
         <objref attributeName="table" obj="table8"/>
      </attribs>
   </obj>
   <obj type="patch/recv f" uuid="d36a51b111e0f72d0012e207d467e1f1052116ef" name="recv_23" x="1750" y="1638">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="samplePitch"/>
      </attribs>
   </obj>
   <obj type="patch/recv f" uuid="d36a51b111e0f72d0012e207d467e1f1052116ef" name="recv_24" x="1750" y="1694">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="samplePos"/>
      </attribs>
   </obj>
   <obj type="patch/recv b" uuid="6ce86e0c667a0168b53a910eb891366e96b944d1" name="recv_28" x="1750" y="1792">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="kb8"/>
      </attribs>
   </obj>
   <obj type="table/play pitch" uuid="5632a54926261833bbb9fff049e71322c360e57e" name="play_9" x="1890" y="1848">
      <params>
         <frac32.s.map name="pitch" value="0.0"/>
      </params>
      <attribs>
         <objref attributeName="table" obj="table9"/>
      </attribs>
   </obj>
   <obj type="patch/recv f" uuid="d36a51b111e0f72d0012e207d467e1f1052116ef" name="recv_26" x="1750" y="1862">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="samplePitch"/>
      </attribs>
   </obj>
   <obj type="patch/recv f" uuid="d36a51b111e0f72d0012e207d467e1f1052116ef" name="recv_27" x="1750" y="1918">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="samplePos"/>
      </attribs>
   </obj>
   <obj type="patch/recv b" uuid="6ce86e0c667a0168b53a910eb891366e96b944d1" name="recv_32" x="1750" y="2002">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="kb9"/>
      </attribs>
   </obj>
   <obj type="table/play pitch" uuid="5632a54926261833bbb9fff049e71322c360e57e" name="play_10" x="1890" y="2058">
      <params>
         <frac32.s.map name="pitch" value="0.0"/>
      </params>
      <attribs>
         <objref attributeName="table" obj="table10"/>
      </attribs>
   </obj>
   <obj type="patch/recv f" uuid="d36a51b111e0f72d0012e207d467e1f1052116ef" name="recv_30" x="1750" y="2072">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="samplePitch"/>
      </attribs>
   </obj>
   <obj type="patch/recv f" uuid="d36a51b111e0f72d0012e207d467e1f1052116ef" name="recv_31" x="1750" y="2128">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="samplePos"/>
      </attribs>
   </obj>
   <obj type="patch/recv b" uuid="6ce86e0c667a0168b53a910eb891366e96b944d1" name="recv_35" x="1750" y="2212">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="kb10"/>
      </attribs>
   </obj>
   <obj type="patch/recv f" uuid="d36a51b111e0f72d0012e207d467e1f1052116ef" name="recv_33" x="1750" y="2282">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="samplePitch"/>
      </attribs>
   </obj>
   <obj type="table/play pitch" uuid="5632a54926261833bbb9fff049e71322c360e57e" name="play_11" x="1890" y="2282">
      <params>
         <frac32.s.map name="pitch" value="0.0"/>
      </params>
      <attribs>
         <objref attributeName="table" obj="table11"/>
      </attribs>
   </obj>
   <obj type="patch/recv f" uuid="d36a51b111e0f72d0012e207d467e1f1052116ef" name="recv_34" x="1750" y="2352">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="samplePos"/>
      </attribs>
   </obj>
   <obj type="patch/recv b" uuid="6ce86e0c667a0168b53a910eb891366e96b944d1" name="recv_38" x="1750" y="2436">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="kb11"/>
      </attribs>
   </obj>
   <obj type="table/play pitch" uuid="5632a54926261833bbb9fff049e71322c360e57e" name="play_12" x="1890" y="2492">
      <params>
         <frac32.s.map name="pitch" value="0.0"/>
      </params>
      <attribs>
         <objref attributeName="table" obj="table12"/>
      </attribs>
   </obj>
   <obj type="patch/recv f" uuid="d36a51b111e0f72d0012e207d467e1f1052116ef" name="recv_36" x="1750" y="2506">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="samplePitch"/>
      </attribs>
   </obj>
   <obj type="patch/recv f" uuid="d36a51b111e0f72d0012e207d467e1f1052116ef" name="recv_37" x="1750" y="2562">
      <params/>
      <attribs>
         <objref attributeName="sender" obj="samplePos"/>
      </attribs>
   </obj>
   <nets>
      <net>
         <source obj="dial_2" outlet="out"/>
         <dest obj="samplePos" inlet="v"/>
      </net>
      <net>
         <source obj="dial_1" outlet="out"/>
         <dest obj="samplePitch" inlet="v"/>
      </net>
      <net>
         <source obj="play_1" outlet="wave"/>
         <dest obj="mix_1" inlet="in1"/>
      </net>
      <net>
         <source obj="play_2" outlet="wave"/>
         <dest obj="mix_1" inlet="in2"/>
      </net>
      <net>
         <source obj="play_3" outlet="wave"/>
         <dest obj="mix_1" inlet="in3"/>
      </net>
      <net>
         <source obj="play_4" outlet="wave"/>
         <dest obj="mix_1" inlet="in4"/>
      </net>
      <net>
         <source obj="i_1" outlet="out"/>
         <dest obj="+_1" inlet="in2"/>
      </net>
      <net>
         <source obj="+_13" outlet="out"/>
         <dest obj="fileOffset" inlet="v"/>
         <dest obj="hex_1" inlet="in"/>
      </net>
      <net>
         <source obj="i_2" outlet="out"/>
         <dest obj="+_2" inlet="in2"/>
      </net>
      <net>
         <source obj="i_3" outlet="out"/>
         <dest obj="+_3" inlet="in2"/>
      </net>
      <net>
         <source obj="i_4" outlet="out"/>
         <dest obj="+_4" inlet="in2"/>
      </net>
      <net>
         <source obj="i_5" outlet="out"/>
         <dest obj="+_5" inlet="in2"/>
      </net>
      <net>
         <source obj="i_6" outlet="out"/>
         <dest obj="+_6" inlet="in2"/>
      </net>
      <net>
         <source obj="i_7" outlet="out"/>
         <dest obj="+_7" inlet="in2"/>
      </net>
      <net>
         <source obj="i_8" outlet="out"/>
         <dest obj="+_8" inlet="in2"/>
      </net>
      <net>
         <source obj="play_5" outlet="wave"/>
         <dest obj="mix_1" inlet="in5"/>
      </net>
      <net>
         <source obj="play_6" outlet="wave"/>
         <dest obj="mix_1" inlet="in6"/>
      </net>
      <net>
         <source obj="play_7" outlet="wave"/>
         <dest obj="mix_2" inlet="in1"/>
      </net>
      <net>
         <source obj="play_8" outlet="wave"/>
         <dest obj="mix_2" inlet="in2"/>
      </net>
      <net>
         <source obj="i_9" outlet="out"/>
         <dest obj="+_9" inlet="in2"/>
      </net>
      <net>
         <source obj="i_12" outlet="out"/>
         <dest obj="+_10" inlet="in2"/>
      </net>
      <net>
         <source obj="i_13" outlet="out"/>
         <dest obj="+_11" inlet="in2"/>
      </net>
      <net>
         <source obj="i_14" outlet="out"/>
         <dest obj="+_12" inlet="in2"/>
      </net>
      <net>
         <source obj="play_9" outlet="wave"/>
         <dest obj="mix_2" inlet="in3"/>
      </net>
      <net>
         <source obj="play_10" outlet="wave"/>
         <dest obj="mix_2" inlet="in4"/>
      </net>
      <net>
         <source obj="play_11" outlet="wave"/>
         <dest obj="mix_2" inlet="in5"/>
      </net>
      <net>
         <source obj="play_12" outlet="wave"/>
         <dest obj="mix_2" inlet="in6"/>
      </net>
      <net>
         <source obj="mix_3" outlet="out"/>
         <dest obj="out_1" inlet="right"/>
         <dest obj="out_1" inlet="left"/>
         <dest obj="mix" inlet="outlet"/>
      </net>
      <net>
         <source obj="mix_1" outlet="out"/>
         <dest obj="mix_3" inlet="in1"/>
      </net>
      <net>
         <source obj="mix_2" outlet="out"/>
         <dest obj="mix_3" inlet="in2"/>
      </net>
      <net>
         <source obj="+_1" outlet="out"/>
         <dest obj="PlayFolder_1" inlet="index"/>
      </net>
      <net>
         <source obj="recv_1" outlet="v"/>
         <dest obj="play_1" inlet="pitch"/>
      </net>
      <net>
         <source obj="recv_2" outlet="v"/>
         <dest obj="play_1" inlet="pos"/>
      </net>
      <net>
         <source obj="recv_4" outlet="v"/>
         <dest obj="play_1" inlet="start"/>
      </net>
      <net>
         <source obj="recv_6" outlet="v"/>
         <dest obj="play_2" inlet="start"/>
      </net>
      <net>
         <source obj="recv_3" outlet="v"/>
         <dest obj="play_2" inlet="pitch"/>
      </net>
      <net>
         <source obj="recv_5" outlet="v"/>
         <dest obj="play_2" inlet="pos"/>
      </net>
      <net>
         <source obj="recv_38" outlet="v"/>
         <dest obj="play_12" inlet="start"/>
      </net>
      <net>
         <source obj="recv_36" outlet="v"/>
         <dest obj="play_12" inlet="pitch"/>
      </net>
      <net>
         <source obj="recv_37" outlet="v"/>
         <dest obj="play_12" inlet="pos"/>
      </net>
      <net>
         <source obj="recv_34" outlet="v"/>
         <dest obj="play_11" inlet="pos"/>
      </net>
      <net>
         <source obj="recv_33" outlet="v"/>
         <dest obj="play_11" inlet="pitch"/>
      </net>
      <net>
         <source obj="recv_35" outlet="v"/>
         <dest obj="play_11" inlet="start"/>
      </net>
      <net>
         <source obj="recv_31" outlet="v"/>
         <dest obj="play_10" inlet="pos"/>
      </net>
      <net>
         <source obj="recv_30" outlet="v"/>
         <dest obj="play_10" inlet="pitch"/>
      </net>
      <net>
         <source obj="recv_32" outlet="v"/>
         <dest obj="play_10" inlet="start"/>
      </net>
      <net>
         <source obj="recv_27" outlet="v"/>
         <dest obj="play_9" inlet="pos"/>
      </net>
      <net>
         <source obj="recv_26" outlet="v"/>
         <dest obj="play_9" inlet="pitch"/>
      </net>
      <net>
         <source obj="recv_28" outlet="v"/>
         <dest obj="play_9" inlet="start"/>
      </net>
      <net>
         <source obj="recv_24" outlet="v"/>
         <dest obj="play_8" inlet="pos"/>
      </net>
      <net>
         <source obj="recv_23" outlet="v"/>
         <dest obj="play_8" inlet="pitch"/>
      </net>
      <net>
         <source obj="recv_25" outlet="v"/>
         <dest obj="play_8" inlet="start"/>
      </net>
      <net>
         <source obj="recv_21" outlet="v"/>
         <dest obj="play_7" inlet="pos"/>
      </net>
      <net>
         <source obj="recv_20" outlet="v"/>
         <dest obj="play_7" inlet="pitch"/>
      </net>
      <net>
         <source obj="recv_22" outlet="v"/>
         <dest obj="play_7" inlet="start"/>
      </net>
      <net>
         <source obj="recv_18" outlet="v"/>
         <dest obj="play_6" inlet="pos"/>
      </net>
      <net>
         <source obj="recv_17" outlet="v"/>
         <dest obj="play_6" inlet="pitch"/>
      </net>
      <net>
         <source obj="recv_19" outlet="v"/>
         <dest obj="play_6" inlet="start"/>
      </net>
      <net>
         <source obj="recv_15" outlet="v"/>
         <dest obj="play_5" inlet="pos"/>
      </net>
      <net>
         <source obj="recv_14" outlet="v"/>
         <dest obj="play_5" inlet="pitch"/>
      </net>
      <net>
         <source obj="recv_16" outlet="v"/>
         <dest obj="play_5" inlet="start"/>
      </net>
      <net>
         <source obj="recv_11" outlet="v"/>
         <dest obj="play_4" inlet="pos"/>
      </net>
      <net>
         <source obj="recv_10" outlet="v"/>
         <dest obj="play_4" inlet="pitch"/>
      </net>
      <net>
         <source obj="recv_12" outlet="v"/>
         <dest obj="play_4" inlet="start"/>
      </net>
      <net>
         <source obj="recv_8" outlet="v"/>
         <dest obj="play_3" inlet="pos"/>
      </net>
      <net>
         <source obj="recv_7" outlet="v"/>
         <dest obj="play_3" inlet="pitch"/>
      </net>
      <net>
         <source obj="recv_9" outlet="v"/>
         <dest obj="play_3" inlet="start"/>
      </net>
      <net>
         <source obj="recv_29" outlet="v"/>
         <dest obj="+_1" inlet="in1"/>
      </net>
      <net>
         <source obj="offset" outlet="out"/>
         <dest obj="+_13" inlet="in2"/>
      </net>
      <net>
         <source obj="counter2_init_start_1" outlet="o"/>
         <dest obj="hex_2" inlet="in"/>
         <dest obj="+_13" inlet="in1"/>
      </net>
      <net>
         <source obj="counter2_init_start_1" outlet="c"/>
         <dest obj="bool_6" inlet="in"/>
      </net>
      <net>
         <source obj="recv_39" outlet="v"/>
         <dest obj="table2" inlet="trig"/>
      </net>
      <net>
         <source obj="PlayFolder_2" outlet="out"/>
         <dest obj="table2" inlet="filename"/>
      </net>
      <net>
         <source obj="recv_40" outlet="v"/>
         <dest obj="+_2" inlet="in1"/>
      </net>
      <net>
         <source obj="recv_41" outlet="v"/>
         <dest obj="+_3" inlet="in1"/>
      </net>
      <net>
         <source obj="recv_42" outlet="v"/>
         <dest obj="+_4" inlet="in1"/>
      </net>
      <net>
         <source obj="PlayFolder_4" outlet="out"/>
         <dest obj="table4" inlet="filename"/>
      </net>
      <net>
         <source obj="PlayFolder_3" outlet="out"/>
         <dest obj="table3" inlet="filename"/>
      </net>
      <net>
         <source obj="recv_43" outlet="v"/>
         <dest obj="table3" inlet="trig"/>
      </net>
      <net>
         <source obj="recv_44" outlet="v"/>
         <dest obj="table4" inlet="trig"/>
      </net>
      <net>
         <source obj="recv_49" outlet="v"/>
         <dest obj="table9" inlet="trig"/>
      </net>
      <net>
         <source obj="recv_52" outlet="v"/>
         <dest obj="table12" inlet="trig"/>
      </net>
      <net>
         <source obj="recv_51" outlet="v"/>
         <dest obj="table11" inlet="trig"/>
      </net>
      <net>
         <source obj="recv_50" outlet="v"/>
         <dest obj="table10" inlet="trig"/>
      </net>
      <net>
         <source obj="recv_48" outlet="v"/>
         <dest obj="table8" inlet="trig"/>
      </net>
      <net>
         <source obj="recv_47" outlet="v"/>
         <dest obj="table7" inlet="trig"/>
      </net>
      <net>
         <source obj="recv_46" outlet="v"/>
         <dest obj="table6" inlet="trig"/>
      </net>
      <net>
         <source obj="recv_45" outlet="v"/>
         <dest obj="table5" inlet="trig"/>
      </net>
      <net>
         <source obj="PlayFolder_5" outlet="out"/>
         <dest obj="table5" inlet="filename"/>
      </net>
      <net>
         <source obj="PlayFolder_6" outlet="out"/>
         <dest obj="table6" inlet="filename"/>
      </net>
      <net>
         <source obj="PlayFolder_7" outlet="out"/>
         <dest obj="table7" inlet="filename"/>
      </net>
      <net>
         <source obj="PlayFolder_8" outlet="out"/>
         <dest obj="table8" inlet="filename"/>
      </net>
      <net>
         <source obj="PlayFolder_9" outlet="out"/>
         <dest obj="table9" inlet="filename"/>
      </net>
      <net>
         <source obj="PlayFolder_10" outlet="out"/>
         <dest obj="table10" inlet="filename"/>
      </net>
      <net>
         <source obj="PlayFolder_11" outlet="out"/>
         <dest obj="table11" inlet="filename"/>
      </net>
      <net>
         <source obj="PlayFolder_12" outlet="out"/>
         <dest obj="table12" inlet="filename"/>
      </net>
      <net>
         <source obj="+_12" outlet="out"/>
         <dest obj="PlayFolder_12" inlet="index"/>
      </net>
      <net>
         <source obj="+_11" outlet="out"/>
         <dest obj="PlayFolder_11" inlet="index"/>
      </net>
      <net>
         <source obj="+_10" outlet="out"/>
         <dest obj="PlayFolder_10" inlet="index"/>
      </net>
      <net>
         <source obj="+_9" outlet="out"/>
         <dest obj="PlayFolder_9" inlet="index"/>
      </net>
      <net>
         <source obj="+_8" outlet="out"/>
         <dest obj="PlayFolder_8" inlet="index"/>
      </net>
      <net>
         <source obj="+_7" outlet="out"/>
         <dest obj="PlayFolder_7" inlet="index"/>
      </net>
      <net>
         <source obj="+_6" outlet="out"/>
         <dest obj="PlayFolder_6" inlet="index"/>
      </net>
      <net>
         <source obj="+_5" outlet="out"/>
         <dest obj="PlayFolder_5" inlet="index"/>
      </net>
      <net>
         <source obj="+_4" outlet="out"/>
         <dest obj="PlayFolder_4" inlet="index"/>
      </net>
      <net>
         <source obj="+_3" outlet="out"/>
         <dest obj="PlayFolder_3" inlet="index"/>
      </net>
      <net>
         <source obj="+_2" outlet="out"/>
         <dest obj="PlayFolder_2" inlet="index"/>
      </net>
      <net>
         <source obj="recv_60" outlet="v"/>
         <dest obj="+_12" inlet="in1"/>
      </net>
      <net>
         <source obj="recv_59" outlet="v"/>
         <dest obj="+_11" inlet="in1"/>
      </net>
      <net>
         <source obj="recv_58" outlet="v"/>
         <dest obj="+_10" inlet="in1"/>
      </net>
      <net>
         <source obj="recv_57" outlet="v"/>
         <dest obj="+_9" inlet="in1"/>
      </net>
      <net>
         <source obj="recv_56" outlet="v"/>
         <dest obj="+_8" inlet="in1"/>
      </net>
      <net>
         <source obj="recv_55" outlet="v"/>
         <dest obj="+_7" inlet="in1"/>
      </net>
      <net>
         <source obj="recv_54" outlet="v"/>
         <dest obj="+_6" inlet="in1"/>
      </net>
      <net>
         <source obj="recv_53" outlet="v"/>
         <dest obj="+_5" inlet="in1"/>
      </net>
      <net>
         <source obj="in_kb0" outlet="inlet"/>
         <dest obj="kb0" inlet="v"/>
      </net>
      <net>
         <source obj="in_kb2" outlet="inlet"/>
         <dest obj="kb2" inlet="v"/>
      </net>
      <net>
         <source obj="in_kb1" outlet="inlet"/>
         <dest obj="kb1" inlet="v"/>
      </net>
      <net>
         <source obj="in_kb3" outlet="inlet"/>
         <dest obj="kb3" inlet="v"/>
      </net>
      <net>
         <source obj="in_kb4" outlet="inlet"/>
         <dest obj="kb4" inlet="v"/>
      </net>
      <net>
         <source obj="in_kb5" outlet="inlet"/>
         <dest obj="kb5" inlet="v"/>
      </net>
      <net>
         <source obj="in_kb6" outlet="inlet"/>
         <dest obj="kb6" inlet="v"/>
      </net>
      <net>
         <source obj="in_kb7" outlet="inlet"/>
         <dest obj="kb7" inlet="v"/>
      </net>
      <net>
         <source obj="in_kb8" outlet="inlet"/>
         <dest obj="kb8" inlet="v"/>
      </net>
      <net>
         <source obj="in_kb9" outlet="inlet"/>
         <dest obj="kb9" inlet="v"/>
      </net>
      <net>
         <source obj="inkb10" outlet="inlet"/>
         <dest obj="kb10" inlet="v"/>
      </net>
      <net>
         <source obj="inkb11" outlet="inlet"/>
         <dest obj="kb11" inlet="v"/>
      </net>
      <net>
         <source obj="in_sampleReload" outlet="inlet"/>
         <dest obj="sampleReload" inlet="v"/>
      </net>
      <net>
         <source obj="inc" outlet="inlet"/>
         <dest obj="counter2_init_start_1" inlet="inc"/>
      </net>
      <net>
         <source obj="dec" outlet="inlet"/>
         <dest obj="counter2_init_start_1" inlet="dec"/>
      </net>
      <net>
         <source obj="folder path" outlet="inlet"/>
         <dest obj="PlayFolder_1" inlet="filename"/>
         <dest obj="PlayFolder_2" inlet="filename"/>
         <dest obj="PlayFolder_3" inlet="filename"/>
         <dest obj="PlayFolder_5" inlet="filename"/>
         <dest obj="PlayFolder_4" inlet="filename"/>
         <dest obj="PlayFolder_6" inlet="filename"/>
         <dest obj="PlayFolder_7" inlet="filename"/>
         <dest obj="PlayFolder_8" inlet="filename"/>
         <dest obj="PlayFolder_9" inlet="filename"/>
         <dest obj="PlayFolder_10" inlet="filename"/>
         <dest obj="PlayFolder_11" inlet="filename"/>
         <dest obj="PlayFolder_12" inlet="filename"/>
      </net>
      <net>
         <source obj="recv_13" outlet="v"/>
         <dest obj="table1" inlet="trig"/>
      </net>
      <net>
         <source obj="PlayFolder_1" outlet="out"/>
         <dest obj="table1" inlet="filename"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>no</subpatchmode>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>-2288</x>
      <y>127</y>
      <width>2188</width>
      <height>812</height>
   </windowPos>
</patch-1.0>