// Select which chip to compile for
//#define CAP_MODE_MPR121 1
#define CAP_MODE_CPT112S 1

#include "C:\\Users\\danie\\Documents\\WIP\\Believotron\\Believotron-Github\\Axoloti-Patches\\Believotron\\objects\\script\\Padcaps_MPR121.c"
#include "C:\\Users\\danie\\Documents\\WIP\\Believotron\\Believotron-Github\\Axoloti-Patches\\Believotron\\objects\\script\\Padcaps_CPT112S.c"

void PadcapSetup()
{
	#ifdef 	CAP_MODE_MPR121
		setupMPR121();
	#endif

	#ifdef CAP_MODE_CPT112S
		setupCPT112S();
	#endif
}

void servicePadCaps()
{
	#ifdef 	CAP_MODE_MPR121
		serviceMPR121();
	#endif

	#ifdef CAP_MODE_CPT112S
		serviceCPT112S();
	#endif
}
