void fiatLux()
{	
	for(uint i=0; i<lightDevices.size(); i++)       { devicePowerOff(lightDevices[i]); }
	for(uint i=0; i<lifeSupportDevices.size(); i++) { devicePowerOff(lifeSupportDevices[i]); }
	devicePowerOff(display);
	
	flickerSequence("Seat Lights"           , lightSeat     );
	flickerSequence("Left Dashboard Lights" , lightDashLeft );
	flickerSequence("Right Dashboard Lights", lightDashRight);
	flickerSequence("Ceiling Lights"        , lightCeiling  );
	
	for(uint i=0; i<lifeSupportDevices.size(); i++) { flickerSequence(lifeSupportDevices[i]); }
}

int flickerSequence(string devicePath)
{
	return flickerSequence(devicePath, devicePath);
}

int flickerSequence(const string deviceName, const string devicePath)
{	
	log("Activating: " + deviceName);
	usleep(T_SEC);
	flicker(devicePath, T_100MS);
	usleep(T_100MS);
	flicker(devicePath, T_100MS);
	usleep(T_100MS);
	devicePowerOn(devicePath);
	usleep(T_SEC);
	
	return 0;
}

int flicker(const string device, int flickerInterval)
{
	devicePowerOn(device);
	usleep(flickerInterval);
	devicePowerOff(device);
	
	return 0;
}