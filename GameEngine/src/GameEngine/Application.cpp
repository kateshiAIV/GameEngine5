#include "Application.h"

#include "GameEngine/Events/ApplicationEvent.h"
#include "GameEngine/Log.h"

namespace Engine
{
	Application::Application()
	{
	}

	Application::~Application()
	{
	}

	void Application::Run()
	{

		WindowResizeEvent e(1280, 720);
		ENG_TRACE(e.ToString());

		while (true)
		{
			// Update and render the application
		}
	}

}
