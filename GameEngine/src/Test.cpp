#include "Test.h"
#include <stdio.h>



namespace GameEngine
{
	__declspec(dllexport) void Print()
	{
		printf("Hello Game Engine!\n");
	}
}
