
#ifndef __DTS_IMX8MP_MIPI_TIMING_H
#define __DTS_IMX8MP_MIPI_TIMING_H

#define AVT_LINK_FPD_LINK_FREQUENCY    400000000
#define CSIS_HS_SETTLE_FPD_LINK			        	8

#if 0
  #define AVT_LINK_FREQUENCY 		    750000000
  #define CSI_ASSIGNED_CLOCK_RATES	500000000
  #define CSI_DATA_LANES 				4
  #define CSIS_HS_SETTLE				16
  #define CSIS_CLK_SETTLE				2
#else
  #define AVT_LINK_FREQUENCY 		    681250000
  #define CSI_ASSIGNED_CLOCK_RATES	500000000
  #define CSI_DATA_LANES 				4
  #define CSIS_HS_SETTLE				14
  #define CSIS_CLK_SETTLE				2
#endif

#define AVT_CAMERA_DL0	0x01

#if ((CSI_DATA_LANES)>1)
	#define AVT_CAMERA_DL1	0x02
#else
	#define AVT_CAMERA_DL1
#endif

#if ((CSI_DATA_LANES)>2)
	#define AVT_CAMERA_DL2	0x03
#else
	#define AVT_CAMERA_DL2
#endif

#if ((CSI_DATA_LANES)>3)
	#define AVT_CAMERA_DL3	0x04
#else
	#define AVT_CAMERA_DL3
#endif


#endif
