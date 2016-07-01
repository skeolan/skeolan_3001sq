class TextResolution
{
	int columns;
	int rows;

	// Make sure to have a standard constructor to use types with vector<>
	TextResolution()
	{
	}
	
	TextResolution(int c, int r)
	{
		columns = c;
		rows = r;
	}
}

// Text resolutions of displays
vector<TextResolution> resolutions;

// --------------------------------------------------------

// General display helper functions

void setMode(int displayId, int mode, int fdVideo = 0)
{
	vector<var> control = 
	{
		Control_Video_DisplayMode,
		displayId,
		mode
	};
	write(fdVideo, control);
}

void clear(int displayId, int bg = Display_TextBackground_Black, int fdVideo = 0)
{
	vector<var> control = 
	{
		Control_Video_Clear,
		displayId,
		bg
	};
	write(fdVideo, control);
}
	
void printAppend(
	string message,
	int displayId = 0,
	int fg = Display_TextForeground_LightGray,
	int bg = Display_TextBackground_Default,
	int attr = Display_TextAttribute_Normal, 
	int fdVideo = 0)
{
	{
		vector<var> control = 
		{
			Control_Video_AppendCharacters,
			displayId,
			message, 
			fg,
			bg,
			attr
		};
		write(fdVideo, control);
	}
}

void printLine(
	string message,
	int displayId = 0,
	int fg = Display_TextForeground_LightGray,
	int bg = Display_TextBackground_Default,
	int attr = Display_TextAttribute_Normal,
	int fdVideo = 0)
{
	printAppend(message, displayId, fg, bg, attr);

	{
		vector<var> control = 
		{
			Control_Video_Newline, 
			displayId
		};
		write(fdVideo, control);
	}
}

void initialiseDisplay(int displayId, int fdVideo = 0)
{
	setMode(displayId, Display_Mode_Text, fdVideo);
	clear(displayId, Display_TextBackground_Cyan, fdVideo);
	
	printLine(" /dev/iq0", displayId, Display_TextForeground_White, fdVideo);
	printLine(" Display: " + displayId, displayId, Display_TextForeground_White, fdVideo);
	markCorners(displayId, resolutions[displayId].columns,
		resolutions[displayId].rows, fdVideo);
}

void clearCockpitDisplays(int fdVideo = 0)
{
	for (int displayId = 1; displayId < 8; displayId++)
	{
		setMode(displayId, Display_Mode_Text, fdVideo);
		clear(displayId, Display_TextBackground_Black, fdVideo);
	}
}

void printSingleCharacter(string c, int column, int row, int displayId, int fdVideo = 0)
{
	vector<var> singleChar = {
		Control_Video_SetCharacter, displayId, c, column, row,
		Display_TextForeground_Black,
		Display_TextBackground_Yellow,
		Display_TextAttribute_Normal
	};
	write(fdVideo, singleChar);
}

void markCorners(int displayId, int columns, int rows, int fdVideo = 0)
{
	printSingleCharacter("0", 0, 0, displayId, fdVideo);
	printSingleCharacter("1", 0, rows-1, displayId, fdVideo);
	printSingleCharacter("2", columns-1, rows-1, displayId, fdVideo);
	printSingleCharacter("3", columns-1, 0, displayId, fdVideo);
}

// ---------------------------------------------------------

// Common messages

void printOk(int displayId = 0, int fdVideo = 0)
{
	printAppend("[   ", displayId, Display_TextForeground_LightGray, fdVideo);
	printAppend("OK", displayId, Display_TextForeground_Green, Display_TextBackground_Black, fdVideo);
	printLine("   ]", displayId, Display_TextForeground_LightGray, fdVideo);
}

void printFailed(int displayId = 0, int fdVideo = 0)
{
	printAppend("[ ", displayId, Display_TextForeground_LightGray, fdVideo);
	printAppend("FAILED", displayId, Display_TextForeground_Red, Display_TextBackground_Black, fdVideo);
	printLine(" ]", displayId, Display_TextForeground_LightGray, fdVideo);
}

void printDisabled(int displayId = 0, int fdVideo = 0)
{
	printAppend("[", displayId, Display_TextForeground_LightGray, fdVideo);
	printAppend("DISABLED", displayId, Display_TextForeground_Yellow, Display_TextBackground_Black, fdVideo);
	printLine("]", displayId, Display_TextForeground_LightGray, fdVideo);
}

// ---------------------------------------------------------

void initialiseDisplayResolutions()
{
	resolutions.push_back(TextResolution(54, 23));
	resolutions.push_back(TextResolution(58, 20));
	resolutions.push_back(TextResolution(23, 24));
	resolutions.push_back(TextResolution(23, 24));
	resolutions.push_back(TextResolution(23, 24));
	resolutions.push_back(TextResolution(36, 10));
	resolutions.push_back(TextResolution(12, 14));
	resolutions.push_back(TextResolution(101, 12));
}