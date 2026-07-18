#pragma once
#include "Core.h"
#include "GameEngine/Window.h"
#include "LayerStack.h"
#include "GameEngine/Events/ApplicationEvent.h"
#include "Events/Event.h"

namespace Engine
{

	class ENG_API Application
	{
	public:
		Application();
		virtual ~Application();
		void Run();
		void OnEvent(Event& e);
		void PushLayer(Layer* layer);
		void PushOverlay(Layer* overlay);
	private:
		bool OnWindowClosed(WindowCloseEvent& e);
		std::unique_ptr<Window> m_Window;
		bool m_Running = true;
		LayerStack m_LayerStack;
	};

	// to be defined in CLIENT
	Application* CreateApplication();
}
