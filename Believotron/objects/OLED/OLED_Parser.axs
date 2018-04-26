<patch-1.0 appVersion="1.0.12">
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="DisplayNumbers" x="154" y="0">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/toggle" uuid="42b8134fa729d54bfc8d62d6ef3fa99498c1de99" name="ForceDisplayNumbers" x="434" y="14">
      <params>
         <bool32.tgl name="b" onParent="true" value="1"/>
      </params>
      <attribs/>
   </obj>
   <obj type="logic/or 2" uuid="3805d3c84d30032a44fbdbe42d9a2988a1790a3e" name="or_1" x="602" y="14">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/toggle" uuid="42b8134fa729d54bfc8d62d6ef3fa99498c1de99" name="Default_OLED_TXT" x="854" y="14">
      <params>
         <bool32.tgl name="b" onParent="true" value="1"/>
      </params>
      <attribs/>
   </obj>
   <obj type="logic/inv" uuid="2bd44b865d3b63ff9b80862242bf5be779e3ad5" name="inv_2" x="980" y="14">
      <params/>
      <attribs/>
   </obj>
   <obj type="gpio/serial/config" uuid="8ec617bbe7b552a58656442e87513d8b4c69833a" name="serial.begin_1" x="1246" y="14">
      <params/>
      <attribs>
         <combo attributeName="baudrate" selection="115200"/>
      </attribs>
   </obj>
   <obj type="patch/inlet b" uuid="3b0d3eacb5bb978cb05d1372aa2714d5a4790844" name="trigStringWrite" x="154" y="42">
      <params/>
      <attribs/>
   </obj>
   <obj type="OLED/OLED_Parser" uuid="d455c788-2a8a-4096-85d1-2e1302ed60e6" name="OLED_Parser_1" x="1246" y="70">
      <params/>
      <attribs>
         <text attributeName="script">
            <sText><![CDATA[// demo serial transmission and reception using SD2 (USART2)

#define UARTWriteByte( a ) (sdPut(&SD2,a))

// void writeLine( char * chBuff, uint8_t iLength)
void writeLine( char * chBuff, uint8_t iDisplay, uint8_t iLine, uint8_t iLength)
{
	char cBuff;
	
	UARTWriteByte('{');
	UARTWriteByte('W');
	UARTWriteByte('L');
	UARTWriteByte(',');
	cBuff = '0' + iDisplay;
	UARTWriteByte( cBuff );
	UARTWriteByte(',');
	cBuff = '0' + iLine;
	UARTWriteByte( cBuff );
	UARTWriteByte(',');
	UARTWriteByte('0');
	UARTWriteByte(',');
	//UARTWriteByte('1');
	//UARTWriteByte('6');
	//UARTWriteByte(',');
	UARTWriteByte('"');
	
	
	for (int i=0; i<iLength; i++)
	{		
		UARTWriteByte( chBuff[i] );
		if (chBuff[i] == '\0') break;
	}

	UARTWriteByte('"');
	UARTWriteByte('}');	
	
}

void writeScreen(){
	UARTWriteByte('{');
	UARTWriteByte('W');
	UARTWriteByte('S');
}


union float2bytes { float f; char b[sizeof(float)]; };

void writeFloat(float fVal, int iDevice, int iRow, int iOffset, int iWidth)
{
	char cBuff;
	
	UARTWriteByte('{');
	UARTWriteByte('W');
	UARTWriteByte('F');
	UARTWriteByte(',');
	//UARTWriteByte('1');
	//itoa(iDevice,  cBuff, 10);
	//UARTWriteByte( cBuff[0] );
	cBuff = '0' + iDevice;
	UARTWriteByte( cBuff );
	UARTWriteByte(',');
	//UARTWriteByte('0');
	cBuff = '0' + iRow;
	UARTWriteByte( cBuff );
	UARTWriteByte(',');
	cBuff = '0' + iOffset;
	UARTWriteByte( cBuff );
	//UARTWriteByte('0');
	UARTWriteByte(',');
	UARTWriteByte('9');
	UARTWriteByte(',');
	//UARTWriteByte(0);
	//UARTWriteByte(0);
	//UARTWriteByte(0);
	//UARTWriteByte(1);

	float2bytes f2b;
	f2b.f = fVal;

	UARTWriteByte( f2b.b[0] );
	UARTWriteByte( f2b.b[1] );
	UARTWriteByte( f2b.b[2] );
	UARTWriteByte( f2b.b[3] );
	UARTWriteByte('}');	

	//chThdSleepMilliseconds(1);
}


void writeInt(int32_t i32Val, int iDevice, int iRow, int iOffset, int iWidth)
{
	UARTWriteByte('{');
	UARTWriteByte('W');
	UARTWriteByte('I');
	UARTWriteByte(',');
	UARTWriteByte('1');
	UARTWriteByte(',');
	UARTWriteByte('0');
	UARTWriteByte(',');
	UARTWriteByte('0');
	UARTWriteByte(',');
	UARTWriteByte('9');
	UARTWriteByte(',');
	//UARTWriteByte(0);
	//UARTWriteByte(0);
	//UARTWriteByte(0);
	//UARTWriteByte(1);

	UARTWriteByte( (char) ( (i32Val >> 24) & 0xFF ) );
	UARTWriteByte( (char) ( (i32Val >> 16) & 0xFF ) );
	UARTWriteByte( (char) ( (i32Val >>  8) & 0xFF ) );
	UARTWriteByte( (char) ( (i32Val      ) & 0xFF ) );		
	UARTWriteByte('}');	
}

void writeClear()
{
	UARTWriteByte('{');
	UARTWriteByte('W');
	UARTWriteByte('C');	
}

void writeStrings()
{
	int iDelay = 125;
	writeLine( OLEDTxt[0][0], 0, 0, 16); chThdSleepMilliseconds(iDelay);
	writeLine( OLEDTxt[0][1], 0, 1, 16); chThdSleepMilliseconds(iDelay);
	writeLine( OLEDTxt[0][2], 0, 2, 16); chThdSleepMilliseconds(iDelay);

	writeLine( OLEDTxt[1][0], 1, 0, 16); chThdSleepMilliseconds(iDelay);
	writeLine( OLEDTxt[1][1], 1, 1, 16); chThdSleepMilliseconds(iDelay);
	writeLine( OLEDTxt[1][2], 1, 2, 16); chThdSleepMilliseconds(iDelay);
	
	writeLine( OLEDTxt[2][0], 2, 0, 16); chThdSleepMilliseconds(iDelay);
	writeLine( OLEDTxt[2][1], 2, 1, 16); chThdSleepMilliseconds(iDelay);
	writeLine( OLEDTxt[2][2], 2, 2, 16); chThdSleepMilliseconds(iDelay);

	writeLine( OLEDTxt[3][0], 3, 0, 16); chThdSleepMilliseconds(iDelay);
	writeLine( OLEDTxt[3][1], 3, 1, 16); chThdSleepMilliseconds(iDelay);
	writeLine( OLEDTxt[3][2], 3, 2, 16); chThdSleepMilliseconds(iDelay);
	
	if (!bDispNums)	{
		writeLine( OLEDTxt[0][3], 0, 3, 16); chThdSleepMilliseconds(iDelay);
		writeLine( OLEDTxt[1][3], 1, 3, 16); chThdSleepMilliseconds(iDelay);
		writeLine( OLEDTxt[2][3], 2, 3, 16); chThdSleepMilliseconds(iDelay);
		writeLine( OLEDTxt[3][3], 3, 3, 16); chThdSleepMilliseconds(iDelay);
	}
	else {
		writeLine( "                ", 0, 3, 16); chThdSleepMilliseconds(iDelay);
		writeLine( "                ", 1, 3, 16); chThdSleepMilliseconds(iDelay);
		writeLine( "                ", 2, 3, 16); chThdSleepMilliseconds(iDelay);
		writeLine( "                ", 3, 3, 16); chThdSleepMilliseconds(iDelay);
	}
}


void setup(void) {

	UARTWriteByte( 'A' );
	UARTWriteByte( 'B' );
	UARTWriteByte( 'C' );
	UARTWriteByte( 'D' );

	writeClear();
	chThdSleepMilliseconds(200);
	

	//writeLine( char * chBuff, uint8_t iDisplay, uint8_t iLine, uint8_t iLength)
	//writeLine( "The fever is in ", 0, 2, 16);

	//writeLine("Proof of UART", 13);
	//writeInt(in1, 2, 1, 3, 8);
	
	
} 


float ConvertPolarToFloat(int32_t i32Val)
{
	return (i32Val * 0.000000476835);
}


void loop(void) {
	uint8_t foo;
	static int32_t iCount = 0;
	
	static uint8_t bPrevTrig=0;
	static int32_t inPrev[8] = {0,0,0,0,0,0,0,0};

	if (bTrig == 1 && bPrevTrig ==0) {
		writeStrings();
	}
	bPrevTrig = bTrig;


	//if (in2 != in2Prev)	{
	float fFoo;
	o1 = iCount;
if (bDispNums){
	switch( iCount )
	{
		case 0:
			writeFloat( ConvertPolarToFloat(in[0]) , 0, 3, 0, 8);
			break;

		case 1:
			writeFloat( ConvertPolarToFloat(in[1]) , 0, 3, 8, 8); 
			break;
		
		case 2:
			writeFloat( ConvertPolarToFloat(in[2]) , 1, 3, 0, 8);
			break;

		case 3:
			writeFloat( ConvertPolarToFloat(in[3]) , 1, 3, 8, 8);
			break;
			
		case 4:
			writeFloat( ConvertPolarToFloat(in[4]) , 2, 3, 0, 8);
			break;
			
		case 5:
			writeFloat( ConvertPolarToFloat(in[5]) , 2, 3, 8, 8);
			break;

		case 6:
			writeFloat( ConvertPolarToFloat(in[6]) , 3, 3, 0, 8);
			break;

		case 7:
			writeFloat( ConvertPolarToFloat(in[7]) , 3, 3, 8, 8);			
			break;
		
		default:	
			iCount = 0;		
			break;
	}
	iCount++;
	if (iCount > 7) iCount = 0;
}
	
	//fFoo = ConvertPolarToFloat(in2);
	//writeInt(in1, 2, 1, 3, 8);				
	//writeFloat( fFoo     , 0, 0, 3, 8);

	//writeInt(in1, 0, 2, 3, 8);	
	//writeFloat( fFoo     , 0, 0, 3, 8);
	bOut = 1;

	int iDelay = 1;	
	//if (inPrev[0] == in[0]) { writeFloat( ConvertPolarToFloat(in[0]) , 0, 0, 3, 8); chThdSleepMilliseconds(iDelay); }
	//if (inPrev[1] == in[1]) { writeFloat( ConvertPolarToFloat(in[1]) , 1, 0, 3, 8); chThdSleepMilliseconds(iDelay); }
	//if (inPrev[2] == in[2]) { writeFloat( ConvertPolarToFloat(in[2]) , 2, 0, 3, 8); chThdSleepMilliseconds(iDelay); }
	//if (inPrev[3] == in[3]) { writeFloat( ConvertPolarToFloat(in[3]) , 3, 0, 3, 8); chThdSleepMilliseconds(iDelay); }

	//if (inPrev[4] == in[4]) { writeFloat( ConvertPolarToFloat(in[4]) , 0, 1, 3, 8); chThdSleepMilliseconds(iDelay); }
	//if (inPrev[5] == in[5]) { writeFloat( ConvertPolarToFloat(in[5]) , 1, 1, 3, 8); chThdSleepMilliseconds(iDelay); }
	//if (inPrev[6] == in[6]) { writeFloat( ConvertPolarToFloat(in[6]) , 2, 1, 3, 8); chThdSleepMilliseconds(iDelay); }
	//if (inPrev[7] == in[7]) { writeFloat( ConvertPolarToFloat(in[7]) , 3, 1, 3, 8); chThdSleepMilliseconds(iDelay); }
	
	
	/*
	writeFloat( ConvertPolarToFloat(in[0]) , 0, 0, 3, 8);	
	writeFloat( ConvertPolarToFloat(in[1]) , 1, 0, 3, 8);
	writeFloat( ConvertPolarToFloat(in[2]) , 2, 0, 3, 8);
	writeFloat( ConvertPolarToFloat(in[3]) , 3, 0, 3, 8);

	writeFloat( ConvertPolarToFloat(in[4]) , 0, 1, 3, 8);
	writeFloat( ConvertPolarToFloat(in[5]) , 1, 1, 3, 8);
	writeFloat( ConvertPolarToFloat(in[6]) , 2, 1, 3, 8);
	writeFloat( ConvertPolarToFloat(in[7]) , 3, 1, 3, 8);
	
	//writeFloat( ConvertPolarToFloat(in[1]) , 1, 0, 3, 8);
	//writeFloat( ConvertPolarToFloat(in[2]) , 2, 0, 3, 8);
	//writeFloat( ConvertPolarToFloat(in[3]) , 3, 0, 3, 8);
	//writeFloat( ConvertPolarToFloat(in[0]) , 0, 0, 3, 8);
	//writeFloat( ConvertPolarToFloat(in[0]) , 0, 0, 3, 8);
	*/
	bOut = 0;

	//writeScreen();
	//}

	//in2Prev = in2;

	for (int i=0; i< 8; i++)	{
		inPrev[i] = in[i];	
	}
	

	//if (bLastVal == 0 && bTrig)
	//{	
	//	float fFoo;
	//	fFoo = ConvertPolarToFloat(in2);
	//	//writeInt(in1, 2, 1, 3, 8);		
	//	writeFloat( ConvertPolarToFloat(in2) , 2, 1, 3, 8);		
	//}

	
	
	
	// send a single byte, value from in1
	//sdPut(&SD2, 'b'); 
	//sdPut(&SD2, in1>>21); 
	//UARTWriteByte( 'A' );
	//UARTWriteByte( 'B' );

	//char cBuff[16] = "Them apples";

	//writeLine(cBuff, strlen(cBuff) );

	// read all pending bytes, value to out1
	while(!sdGetWouldBlock(&SD2)){
		out1 = sdGet(&SD2)<<21;
	}
	//chThdSleepMilliseconds(100);
	chThdSleepMilliseconds(20);
}


]]></sText>
         </text>
      </attribs>
   </obj>
   <obj type="patch/inlet string" uuid="6c562c1a7890cccf18fa7327d8baa476d0926cd8" name="OLED0_0" x="140" y="84">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/button" uuid="ef3d13774349df85aa9bfecf30dbc91ab8488b3f" name="button_1" x="462" y="98">
      <params>
         <bool32.mom name="b" value="0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="logic/or 2" uuid="3805d3c84d30032a44fbdbe42d9a2988a1790a3e" name="or_2" x="602" y="98">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/c" uuid="4aa90a90c435a742ddfa152d232883fc5b2f1b3" name="c_17" x="938" y="98">
      <params/>
      <attribs>
         <table attributeName="str" table="OLED Test (0,0)-"/>
      </attribs>
   </obj>
   <obj type="mux/mux 2" uuid="777491e645978e331fcbab6610f52c1aaa5ade0e" name="mux_2" x="1148" y="98">
      <params/>
      <attribs/>
   </obj>
   <obj type="disp/i" uuid="5e35fd0c62d81e70017289250cf28edd26e19e4a" name="i_1" x="1414" y="98">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet string" uuid="6c562c1a7890cccf18fa7327d8baa476d0926cd8" name="OLED0_1" x="140" y="126">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet string" uuid="6c562c1a7890cccf18fa7327d8baa476d0926cd8" name="OLED0_2" x="140" y="168">
      <params/>
      <attribs/>
   </obj>
   <obj type="math/+" uuid="44553fdc8628c67ab535845ed1be304ad6c9553b" name="+_1" x="770" y="168">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/c" uuid="4aa90a90c435a742ddfa152d232883fc5b2f1b3" name="c_18" x="938" y="168">
      <params/>
      <attribs>
         <table attributeName="str" table="OLED Test (0,1)-"/>
      </attribs>
   </obj>
   <obj type="mux/mux 2" uuid="777491e645978e331fcbab6610f52c1aaa5ade0e" name="mux_3" x="1148" y="168">
      <params/>
      <attribs/>
   </obj>
   <obj type="ctrl/dial b" uuid="862e7d7f29093cb1ce4aed72244d118ad4d46692" name="dial_1" x="672" y="182">
      <params>
         <frac32.s.map name="value" value="0.0"/>
      </params>
      <attribs/>
   </obj>
   <obj type="patch/inlet string" uuid="6c562c1a7890cccf18fa7327d8baa476d0926cd8" name="OLED0_3" x="140" y="210">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/c" uuid="4aa90a90c435a742ddfa152d232883fc5b2f1b3" name="c_19" x="938" y="238">
      <params/>
      <attribs>
         <table attributeName="str" table="OLED Test (0,2)-"/>
      </attribs>
   </obj>
   <obj type="mux/mux 2" uuid="777491e645978e331fcbab6610f52c1aaa5ade0e" name="mux_4" x="1148" y="238">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="inlet_1" x="168" y="252">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="inlet_2" x="168" y="294">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/c" uuid="4aa90a90c435a742ddfa152d232883fc5b2f1b3" name="c_20" x="938" y="308">
      <params/>
      <attribs>
         <table attributeName="str" table="OLED Test (0,3)-"/>
      </attribs>
   </obj>
   <obj type="mux/mux 2" uuid="777491e645978e331fcbab6610f52c1aaa5ade0e" name="mux_5" x="1148" y="308">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet string" uuid="6c562c1a7890cccf18fa7327d8baa476d0926cd8" name="OLED1_0" x="140" y="364">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet string" uuid="6c562c1a7890cccf18fa7327d8baa476d0926cd8" name="OLED1_1" x="140" y="406">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/c" uuid="4aa90a90c435a742ddfa152d232883fc5b2f1b3" name="c_21" x="938" y="406">
      <params/>
      <attribs>
         <table attributeName="str" table="OLED Test (1,0)-"/>
      </attribs>
   </obj>
   <obj type="mux/mux 2" uuid="777491e645978e331fcbab6610f52c1aaa5ade0e" name="mux_6" x="1148" y="406">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/c" uuid="4aa90a90c435a742ddfa152d232883fc5b2f1b3" name="c_15" x="378" y="434">
      <params/>
      <attribs>
         <table attributeName="str" table="OLED Test (0,2)"/>
      </attribs>
   </obj>
   <obj type="patch/inlet string" uuid="6c562c1a7890cccf18fa7327d8baa476d0926cd8" name="OLED1_2" x="140" y="448">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/c" uuid="4aa90a90c435a742ddfa152d232883fc5b2f1b3" name="c_22" x="938" y="476">
      <params/>
      <attribs>
         <table attributeName="str" table="OLED Test (1,1)-"/>
      </attribs>
   </obj>
   <obj type="mux/mux 2" uuid="777491e645978e331fcbab6610f52c1aaa5ade0e" name="mux_7" x="1148" y="476">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet string" uuid="6c562c1a7890cccf18fa7327d8baa476d0926cd8" name="OLED1_3" x="140" y="490">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="inlet_3" x="168" y="532">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/c" uuid="4aa90a90c435a742ddfa152d232883fc5b2f1b3" name="c_16" x="406" y="532">
      <params/>
      <attribs>
         <table attributeName="str" table="OLED Test (0,3)"/>
      </attribs>
   </obj>
   <obj type="string/c" uuid="4aa90a90c435a742ddfa152d232883fc5b2f1b3" name="c_23" x="938" y="546">
      <params/>
      <attribs>
         <table attributeName="str" table="OLED Test (1,2)-"/>
      </attribs>
   </obj>
   <obj type="mux/mux 2" uuid="777491e645978e331fcbab6610f52c1aaa5ade0e" name="mux_8" x="1148" y="546">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="inlet_4" x="168" y="574">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/c" uuid="4aa90a90c435a742ddfa152d232883fc5b2f1b3" name="c_24" x="938" y="616">
      <params/>
      <attribs>
         <table attributeName="str" table="OLED Test (1,3)-"/>
      </attribs>
   </obj>
   <obj type="mux/mux 2" uuid="777491e645978e331fcbab6610f52c1aaa5ade0e" name="mux_9" x="1148" y="616">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet string" uuid="6c562c1a7890cccf18fa7327d8baa476d0926cd8" name="OLED2_0" x="140" y="672">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet string" uuid="6c562c1a7890cccf18fa7327d8baa476d0926cd8" name="OLED2_1" x="140" y="714">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet string" uuid="6c562c1a7890cccf18fa7327d8baa476d0926cd8" name="OLED2_2" x="140" y="756">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/c" uuid="4aa90a90c435a742ddfa152d232883fc5b2f1b3" name="c_25" x="938" y="756">
      <params/>
      <attribs>
         <table attributeName="str" table="OLED Test (2,0)-"/>
      </attribs>
   </obj>
   <obj type="mux/mux 2" uuid="777491e645978e331fcbab6610f52c1aaa5ade0e" name="mux_10" x="1148" y="756">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet string" uuid="6c562c1a7890cccf18fa7327d8baa476d0926cd8" name="OLED2_3" x="140" y="798">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/c" uuid="4aa90a90c435a742ddfa152d232883fc5b2f1b3" name="c_26" x="938" y="826">
      <params/>
      <attribs>
         <table attributeName="str" table="OLED Test (2,1)-"/>
      </attribs>
   </obj>
   <obj type="mux/mux 2" uuid="777491e645978e331fcbab6610f52c1aaa5ade0e" name="mux_11" x="1148" y="826">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="inlet_5" x="168" y="840">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="inlet_6" x="168" y="882">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/c" uuid="4aa90a90c435a742ddfa152d232883fc5b2f1b3" name="c_27" x="938" y="896">
      <params/>
      <attribs>
         <table attributeName="str" table="OLED Test (2,2)-"/>
      </attribs>
   </obj>
   <obj type="mux/mux 2" uuid="777491e645978e331fcbab6610f52c1aaa5ade0e" name="mux_12" x="1148" y="896">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/c" uuid="4aa90a90c435a742ddfa152d232883fc5b2f1b3" name="c_28" x="938" y="966">
      <params/>
      <attribs>
         <table attributeName="str" table="OLED Test (2,3)-"/>
      </attribs>
   </obj>
   <obj type="mux/mux 2" uuid="777491e645978e331fcbab6610f52c1aaa5ade0e" name="mux_13" x="1148" y="966">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet string" uuid="6c562c1a7890cccf18fa7327d8baa476d0926cd8" name="OLED3_0" x="140" y="994">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet string" uuid="6c562c1a7890cccf18fa7327d8baa476d0926cd8" name="OLED3_1" x="140" y="1036">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/c" uuid="4aa90a90c435a742ddfa152d232883fc5b2f1b3" name="c_29" x="938" y="1064">
      <params/>
      <attribs>
         <table attributeName="str" table="OLED Test (3,0)-"/>
      </attribs>
   </obj>
   <obj type="mux/mux 2" uuid="777491e645978e331fcbab6610f52c1aaa5ade0e" name="mux_14" x="1148" y="1064">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet string" uuid="6c562c1a7890cccf18fa7327d8baa476d0926cd8" name="OLED3_2" x="140" y="1078">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet string" uuid="6c562c1a7890cccf18fa7327d8baa476d0926cd8" name="OLED3_3" x="140" y="1120">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/c" uuid="4aa90a90c435a742ddfa152d232883fc5b2f1b3" name="c_30" x="938" y="1134">
      <params/>
      <attribs>
         <table attributeName="str" table="OLED Test (3,1)-"/>
      </attribs>
   </obj>
   <obj type="mux/mux 2" uuid="777491e645978e331fcbab6610f52c1aaa5ade0e" name="mux_15" x="1148" y="1134">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="inlet_7" x="168" y="1162">
      <params/>
      <attribs/>
   </obj>
   <obj type="patch/inlet f" uuid="5c585d2dcd9c05631e345ac09626a22a639d7c13" name="inlet_8" x="168" y="1204">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/c" uuid="4aa90a90c435a742ddfa152d232883fc5b2f1b3" name="c_31" x="938" y="1204">
      <params/>
      <attribs>
         <table attributeName="str" table="OLED Test (3,2)-"/>
      </attribs>
   </obj>
   <obj type="mux/mux 2" uuid="777491e645978e331fcbab6610f52c1aaa5ade0e" name="mux_16" x="1148" y="1204">
      <params/>
      <attribs/>
   </obj>
   <obj type="string/c" uuid="4aa90a90c435a742ddfa152d232883fc5b2f1b3" name="c_32" x="938" y="1274">
      <params/>
      <attribs>
         <table attributeName="str" table="OLED Test (3,3)-"/>
      </attribs>
   </obj>
   <obj type="mux/mux 2" uuid="777491e645978e331fcbab6610f52c1aaa5ade0e" name="mux_17" x="1148" y="1274">
      <params/>
      <attribs/>
   </obj>
   <nets>
      <net>
         <source obj="DisplayNumbers" outlet="inlet"/>
         <dest obj="or_1" inlet="i2"/>
      </net>
      <net>
         <source obj="Default_OLED_TXT" outlet="o"/>
         <dest obj="inv_2" inlet="i"/>
      </net>
      <net>
         <source obj="inv_2" outlet="o"/>
         <dest obj="mux_2" inlet="s"/>
         <dest obj="mux_3" inlet="s"/>
         <dest obj="mux_4" inlet="s"/>
         <dest obj="mux_5" inlet="s"/>
         <dest obj="mux_6" inlet="s"/>
         <dest obj="mux_7" inlet="s"/>
         <dest obj="mux_8" inlet="s"/>
         <dest obj="mux_9" inlet="s"/>
         <dest obj="mux_10" inlet="s"/>
         <dest obj="mux_11" inlet="s"/>
         <dest obj="mux_12" inlet="s"/>
         <dest obj="mux_13" inlet="s"/>
         <dest obj="mux_14" inlet="s"/>
         <dest obj="mux_15" inlet="s"/>
         <dest obj="mux_16" inlet="s"/>
         <dest obj="mux_17" inlet="s"/>
      </net>
      <net>
         <source obj="ForceDisplayNumbers" outlet="o"/>
         <dest obj="or_1" inlet="i1"/>
      </net>
      <net>
         <source obj="button_1" outlet="o"/>
         <dest obj="or_2" inlet="i2"/>
      </net>
      <net>
         <source obj="trigStringWrite" outlet="inlet"/>
         <dest obj="or_2" inlet="i1"/>
      </net>
      <net>
         <source obj="dial_1" outlet="out"/>
         <dest obj="+_1" inlet="in2"/>
      </net>
      <net>
         <source obj="OLED_Parser_1" outlet="o1_"/>
         <dest obj="i_1" inlet="in"/>
      </net>
      <net>
         <source obj="+_1" outlet="out"/>
         <dest obj="OLED_Parser_1" inlet="in1_"/>
      </net>
      <net>
         <source obj="inlet_1" outlet="inlet"/>
         <dest obj="+_1" inlet="in1"/>
      </net>
      <net>
         <source obj="inlet_2" outlet="inlet"/>
         <dest obj="OLED_Parser_1" inlet="in2_"/>
      </net>
      <net>
         <source obj="or_2" outlet="o"/>
         <dest obj="OLED_Parser_1" inlet="trig_"/>
      </net>
      <net>
         <source obj="or_1" outlet="o"/>
         <dest obj="OLED_Parser_1" inlet="dispNums_"/>
      </net>
      <net>
         <source obj="mux_2" outlet="o"/>
         <dest obj="OLED_Parser_1" inlet="OLEDA0_"/>
      </net>
      <net>
         <source obj="c_17" outlet="out"/>
         <dest obj="mux_2" inlet="i1"/>
      </net>
      <net>
         <source obj="OLED0_0" outlet="inlet"/>
         <dest obj="mux_2" inlet="i2"/>
      </net>
      <net>
         <source obj="mux_3" outlet="o"/>
         <dest obj="OLED_Parser_1" inlet="OLEDA1_"/>
      </net>
      <net>
         <source obj="mux_4" outlet="o"/>
         <dest obj="OLED_Parser_1" inlet="OLEDA2_"/>
      </net>
      <net>
         <source obj="mux_5" outlet="o"/>
         <dest obj="OLED_Parser_1" inlet="OLEDA3_"/>
      </net>
      <net>
         <source obj="mux_6" outlet="o"/>
         <dest obj="OLED_Parser_1" inlet="OLEDB0_"/>
      </net>
      <net>
         <source obj="mux_7" outlet="o"/>
         <dest obj="OLED_Parser_1" inlet="OLEDB1_"/>
      </net>
      <net>
         <source obj="mux_8" outlet="o"/>
         <dest obj="OLED_Parser_1" inlet="OLEDB2_"/>
      </net>
      <net>
         <source obj="mux_9" outlet="o"/>
         <dest obj="OLED_Parser_1" inlet="OLEDB3_"/>
      </net>
      <net>
         <source obj="mux_10" outlet="o"/>
         <dest obj="OLED_Parser_1" inlet="OLEDC0_"/>
      </net>
      <net>
         <source obj="mux_11" outlet="o"/>
         <dest obj="OLED_Parser_1" inlet="OLEDC1_"/>
      </net>
      <net>
         <source obj="mux_12" outlet="o"/>
         <dest obj="OLED_Parser_1" inlet="OLEDC2_"/>
      </net>
      <net>
         <source obj="mux_13" outlet="o"/>
         <dest obj="OLED_Parser_1" inlet="OLEDC3_"/>
      </net>
      <net>
         <source obj="mux_14" outlet="o"/>
         <dest obj="OLED_Parser_1" inlet="OLEDD0_"/>
      </net>
      <net>
         <source obj="mux_15" outlet="o"/>
         <dest obj="OLED_Parser_1" inlet="OLEDD1_"/>
      </net>
      <net>
         <source obj="mux_16" outlet="o"/>
         <dest obj="OLED_Parser_1" inlet="OLEDD2_"/>
      </net>
      <net>
         <source obj="mux_17" outlet="o"/>
         <dest obj="OLED_Parser_1" inlet="OLEDD3_"/>
      </net>
      <net>
         <source obj="OLED0_1" outlet="inlet"/>
         <dest obj="mux_3" inlet="i2"/>
      </net>
      <net>
         <source obj="OLED0_2" outlet="inlet"/>
         <dest obj="mux_4" inlet="i2"/>
      </net>
      <net>
         <source obj="OLED0_3" outlet="inlet"/>
         <dest obj="mux_5" inlet="i2"/>
      </net>
      <net>
         <source obj="OLED1_0" outlet="inlet"/>
         <dest obj="mux_6" inlet="i2"/>
      </net>
      <net>
         <source obj="OLED1_1" outlet="inlet"/>
         <dest obj="mux_7" inlet="i2"/>
      </net>
      <net>
         <source obj="OLED1_2" outlet="inlet"/>
         <dest obj="mux_8" inlet="i2"/>
      </net>
      <net>
         <source obj="OLED1_3" outlet="inlet"/>
         <dest obj="mux_9" inlet="i2"/>
      </net>
      <net>
         <source obj="OLED2_0" outlet="inlet"/>
         <dest obj="mux_10" inlet="i2"/>
      </net>
      <net>
         <source obj="OLED2_1" outlet="inlet"/>
         <dest obj="mux_11" inlet="i2"/>
      </net>
      <net>
         <source obj="OLED2_2" outlet="inlet"/>
         <dest obj="mux_12" inlet="i2"/>
      </net>
      <net>
         <source obj="OLED2_3" outlet="inlet"/>
         <dest obj="mux_13" inlet="i2"/>
      </net>
      <net>
         <source obj="OLED3_0" outlet="inlet"/>
         <dest obj="mux_14" inlet="i2"/>
      </net>
      <net>
         <source obj="OLED3_1" outlet="inlet"/>
         <dest obj="mux_15" inlet="i2"/>
      </net>
      <net>
         <source obj="OLED3_2" outlet="inlet"/>
         <dest obj="mux_16" inlet="i2"/>
      </net>
      <net>
         <source obj="OLED3_3" outlet="inlet"/>
         <dest obj="mux_17" inlet="i2"/>
      </net>
      <net>
         <source obj="c_18" outlet="out"/>
         <dest obj="mux_3" inlet="i1"/>
      </net>
      <net>
         <source obj="c_19" outlet="out"/>
         <dest obj="mux_4" inlet="i1"/>
      </net>
      <net>
         <source obj="c_20" outlet="out"/>
         <dest obj="mux_5" inlet="i1"/>
      </net>
      <net>
         <source obj="c_21" outlet="out"/>
         <dest obj="mux_6" inlet="i1"/>
      </net>
      <net>
         <source obj="c_22" outlet="out"/>
         <dest obj="mux_7" inlet="i1"/>
      </net>
      <net>
         <source obj="c_23" outlet="out"/>
         <dest obj="mux_8" inlet="i1"/>
      </net>
      <net>
         <source obj="c_24" outlet="out"/>
         <dest obj="mux_9" inlet="i1"/>
      </net>
      <net>
         <source obj="c_25" outlet="out"/>
         <dest obj="mux_10" inlet="i1"/>
      </net>
      <net>
         <source obj="c_26" outlet="out"/>
         <dest obj="mux_11" inlet="i1"/>
      </net>
      <net>
         <source obj="c_27" outlet="out"/>
         <dest obj="mux_12" inlet="i1"/>
      </net>
      <net>
         <source obj="c_28" outlet="out"/>
         <dest obj="mux_13" inlet="i1"/>
      </net>
      <net>
         <source obj="c_29" outlet="out"/>
         <dest obj="mux_14" inlet="i1"/>
      </net>
      <net>
         <source obj="c_30" outlet="out"/>
         <dest obj="mux_15" inlet="i1"/>
      </net>
      <net>
         <source obj="c_31" outlet="out"/>
         <dest obj="mux_16" inlet="i1"/>
      </net>
      <net>
         <source obj="c_32" outlet="out"/>
         <dest obj="mux_17" inlet="i1"/>
      </net>
      <net>
         <source obj="inlet_3" outlet="inlet"/>
         <dest obj="OLED_Parser_1" inlet="in3_"/>
      </net>
      <net>
         <source obj="inlet_4" outlet="inlet"/>
         <dest obj="OLED_Parser_1" inlet="in4_"/>
      </net>
      <net>
         <source obj="inlet_5" outlet="inlet"/>
         <dest obj="OLED_Parser_1" inlet="in5_"/>
      </net>
      <net>
         <source obj="inlet_6" outlet="inlet"/>
         <dest obj="OLED_Parser_1" inlet="in6_"/>
      </net>
      <net>
         <source obj="inlet_7" outlet="inlet"/>
         <dest obj="OLED_Parser_1" inlet="in7_"/>
      </net>
      <net>
         <source obj="inlet_8" outlet="inlet"/>
         <dest obj="OLED_Parser_1" inlet="in8_"/>
      </net>
   </nets>
   <settings>
      <subpatchmode>no</subpatchmode>
   </settings>
   <notes><![CDATA[]]></notes>
   <windowPos>
      <x>143</x>
      <y>360</y>
      <width>1692</width>
      <height>758</height>
   </windowPos>
</patch-1.0>