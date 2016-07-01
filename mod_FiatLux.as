void fiatLux()
{	
	//Everything off
	for(uint i=0; i<lightDevices.size(); i++)       { devicePowerOff(lightDevices[i]); }
	for(uint i=0; i<lifeSupportDevices.size(); i++) { devicePowerOff(lifeSupportDevices[i]); }
	devicePowerOff(display);
	
	//Displays on
	initialiseDisplayResolutions();
	for (uint i=0; i<displayNames.size(); i++) {
		const string displayName = displayNames[i]; 
		flickerSequence("Display - " + displayName, display, i); 
		int fd = open(display, O_WRONLY);
		initialiseDisplay(i, fd);
		close(fd);
	}

	//Life Support on
	for(uint i=0; i<lifeSupportDevices.size(); i++) { flickerSequence(lifeSupportDevices[i]); }

	//Lights on
	flickerSequence("Seat Lights"           , lightSeat     );
	flickerSequence("Left Dashboard Lights" , lightDashLeft );
	flickerSequence("Right Dashboard Lights", lightDashRight);
	flickerSequence("Ceiling Lights"        , lightCeiling  );

}

int flickerSequence(string devicePath)
{
	return flickerSequence(devicePath, devicePath);
}

int flickerSequence(string devicePath, int subIndex)
{
	return flickerSequence(devicePath, devicePath, subIndex);
}

int flickerSequence(const string deviceName, const string devicePath)
{	
	return flickerSequence(deviceName, devicePath, -1);
}

int flickerSequence(const string deviceName, const string devicePath, int subIndex)
{
	
	if(subIndex == -1) { log("Activating " + deviceName); }
	else               { log("Activating " + deviceName + "[" + subIndex +"]"); }
	usleep(T_SEC);
	flicker(devicePath, T_100MS, subIndex);
	usleep(T_100MS);
	flicker(devicePath, T_100MS, subIndex);
	usleep(T_100MS);
	devicePowerOn(devicePath, subIndex);
	usleep(T_SEC);
	
	return 0;	
}

int flicker(const string device, uint flickerInterval)
{
	return flicker(device, flickerInterval, -1);
}

int flicker(const string device, uint flickerInterval, int subIndex)
{
	devicePowerOn(device, subIndex);
	usleep(flickerInterval);
	devicePowerOff(device, subIndex);
	return 0;
}