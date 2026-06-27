#pragma once


#ifdef ENG_PLATFORM_WINDOWS

extern Engine::Application* Engine::CreateApplication();

int main(int argc, char** argv)
{
	Engine::Log::Init();
	ENG_CORE_WARN("Engine Initialized!");
	ENG_INFO("Client Initialized!");

	auto app = Engine::CreateApplication();
	app->Run();
	delete app;
}

#endif
