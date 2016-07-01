void devicePowerOn(string nodePath)
{
	int fd = open(nodePath, O_WRONLY);

	if (fd == -1)
	{
		log("Failed to open " + nodePath);
		return;
	}

	vector<var> controlOn =
	{
		Control_Device_Power,
		Device_PowerMode_On
	};

	write(fd, controlOn);
	close(fd);
}

void devicePowerOff(string nodePath)
{
	int fd = open(nodePath, O_WRONLY);

	if (fd == -1)
	{
		log("Failed to open " + nodePath);
		return;
	}

	vector<var> controlOff =
	{
		Control_Device_Power,
		Device_PowerMode_Off
	};

	write(fd, controlOff);
	close(fd);
}