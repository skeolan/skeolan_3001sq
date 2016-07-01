void devicePowerOn(string nodePath)
{
	devicePowerSwitch(nodePath, -1, true);
}

void devicePowerOn(string nodePath, int subIndex)
{
	devicePowerSwitch(nodePath, subIndex, true);
}

void devicePowerOff(string nodePath)
{
	devicePowerSwitch(nodePath, -1, false);
}

void devicePowerOff(string nodePath, int subIndex)
{
	devicePowerSwitch(nodePath, subIndex, false);
}

void devicePowerSwitch(string nodePath, int subIndex, bool powerOn)
{
	int fd = open(nodePath, O_WRONLY);
	

	if (fd == -1)
	{
		log("Failed to open " + nodePath);
		return;
	}

	vector<var> controlMsg = { Control_Device_Power   };
	if(powerOn)              { controlMsg.push_back(Device_PowerMode_On ); }
	else                     { controlMsg.push_back(Device_PowerMode_Off); }
	if(subIndex != -1)       { controlMsg.push_back(subIndex);	}

	write(fd, controlMsg);

	
	close(fd);
}