#pragma once
#include "Core.h"
#include "GameEngine/Window.h"
#include "Events/Event.h"

namespace Engine
{

	class ENG_API Application
	{
	public:
		Application();
		virtual ~Application();
		void Run();
	private:
		std::unique_ptr<Window> m_Window;
		bool m_Running = true;
	};

	// to be defined in CLIENT
	Application* CreateApplication();
}
