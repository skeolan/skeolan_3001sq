//Time
	const int T_MsU      = 1000        ; // 1 millisecond in microseconds
	const int T_100MS    =  100 * T_MsU; // 1/10 second in microseconds
	const int T_200MS    =  200 * T_MsU; // 1/5 second in microseconds
	const int T_HALF_SEC =  500 * T_MsU; // Half a second in microseconds
	const int T_SEC      = 1000 * T_MsU; // Half a second in microseconds

//Lights
	const string lightCeiling   = "/dev/light0";
	const string lightSeat      = "/dev/light1";
	const string lightDashLeft  = "/dev/light2";
	const string lightDashRight = "/dev/light3";

//Displays
	const string display        = "/dev/iq0";
	//vector<var> displaysOn = { Control_Device_Power, Device_PowerMode_Off };    // Turn off all displays
	//vector<var> displayOn5 = { Control_Device_Power, Device_PowerMode_On, 5 };  // Turn on display 5

//Life Support
	const string LS_air         = "/dev/air0";   //air revitalisation system
	const string LS_therm_0     = "/dev/therm0"; //active thermal control unit 0
	const string LS_therm_1     = "/dev/therm1"; //active thermal control unit 1
	const string LS_therm_2     = "/dev/therm2"; //active thermal control unit 2
	const string LS_therm_3     = "/dev/therm3"; //active thermal control unit 3
	const string LS_coolant_0   = "/dev/wcl0";   //water coolant loop 0
	const string LS_coolant_1   = "/dev/wcl1";   //water coolant loop 1

//Thrusters
	// vector<var> thrusterHalf = { Control_Thruster_Power, 0.5 };     // set half power output

	//Fore
	const string THR_Fore_Left_Top_Up        = "/dev/thruster0";  //Left Top Front : Up
	const string THR_Fore_Left_Top_Left      = "/dev/thruster1";  //Left Top Front : Left
	const string THR_Fore_Left_Bottom_Left   = "/dev/thruster2";  //Left Bottom Front : Left
	const string THR_Fore_Left_Bottom_Down   = "/dev/thruster3";  //Left Bottom Front : Down
	const string THR_Fore_Right_Bottom_Down  = "/dev/thruster4";  //Right Bottom Front : Down
	const string THR_Fore_Right_Bottom_Right = "/dev/thruster5";  //Right Bottom Front : Right
	const string THR_Fore_Right_Top_Right    = "/dev/thruster6";  //Right Top Front : Right
	const string THR_Fore_Right_Top_Up       = "/dev/thruster7";  //Right Top Front : Up

	//Aft
	const string THR_Aft_Left_Top_Up         = "/dev/thruster9" ; //Left Top Back : Up
	const string THR_Aft_Left_Top_Left       = "/dev/thruster10"; //Left Top Back : Left
	const string THR_Aft_Left_Bottom_Left    = "/dev/thruster11"; //Left Bottom Back : Left
	const string THR_Aft_Left_Bottom_Down    = "/dev/thruster12"; //Left Bottom Back : Down
	const string THR_Aft_Right_Bottom_Down   = "/dev/thruster13"; //Right Bottom Back : Down
	const string THR_Aft_Right_Bottom_Right  = "/dev/thruster14"; //Right Bottom Back : Right
	const string THR_Aft_Right_Top_Right     = "/dev/thruster15"; //Right Top Back : Right
	const string THR_Aft_Right_Top_Up        = "/dev/thruster16"; //Right Top Back : Up

//Collections
	const vector<var> lightDevices = {
		lightCeiling,  
		lightSeat,     
		lightDashLeft, 
		lightDashRight
	};
	
	const vector<var> lifeSupportDevices = {
		LS_air,      
		LS_therm_0,  
		LS_therm_1,  
		LS_therm_2,  
		LS_therm_3,  
		LS_coolant_0,
		LS_coolant_1
	};