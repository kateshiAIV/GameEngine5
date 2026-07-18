workspace "GameEngine"
    architecture "x64"

    configurations
    {
        "Debug",
        "Release",
        "Dist"
    }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"


IncludeDir = {}
IncludeDir["GLFW"] = "GameEngine/vendor/GLFW/include"

include "GameEngine/vendor/GLFW"

project "GameEngine"
    location "GameEngine"
    kind "SharedLib"
    language "C++"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    pchheader "engpch.h"
    pchsource "GameEngine/src/engpch.cpp"

    files 
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }
    buildoptions
    {
        "/utf-8"
    }

    includedirs
    {
        "%{prj.name}/src",
        "%{prj.name}/vendor/spdlog/include",
        "%{IncludeDir.GLFW}"
    }
    links
    {
        "GLFW",
        "opengl32.lib"
    }

    filter "system:windows"
        cppdialect "C++23"
        staticruntime "On"
        systemversion "latest"

        defines 
        {
            "ENG_PLATFORM_WINDOWS",
            "ENG_BUILD_DLL"
        }

        postbuildcommands
        {
            '{MKDIR} "../bin/' .. outputdir .. '/Sandbox"',
            '{COPY} "%{cfg.buildtarget.abspath}" "../bin/' .. outputdir .. '/Sandbox"'
        }

    filter "configurations:Debug"
        defines "ENG_DEBUG"
        buildoptions "/MDd"
        symbols "On"

    filter "configurations:Release"
        defines "ENG_RELEASE"
        buildoptions "/MD"
        symbols "On"

    filter "configurations:Dist"
        defines "ENG_DIST"
        buildoptions "/MD"
        symbols "On"



project "Sandbox"
    location "Sandbox"
    kind "ConsoleApp"
    language "C++"
    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
    files 
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }
    buildoptions
    {
        "/utf-8"
    }
    includedirs
    {
        "GameEngine/vendor/spdlog/include",
        "GameEngine/src"
    }
    links
    {
        "GameEngine"
    }
    filter "system:windows"
        cppdialect "C++23"
        staticruntime "On"
        systemversion "latest"
        defines 
        {
            "ENG_PLATFORM_WINDOWS"
        }
    filter "configurations:Debug"
        defines "ENG_DEBUG"
        buildoptions "/MDd"
        symbols "On"
    filter "configurations:Release"
        defines "ENG_RELEASE"
        buildoptions "/MD"
        symbols "On"
    filter "configurations:Dist"
        defines "ENG_DIST"
        buildoptions "/MD"
        symbols "On"