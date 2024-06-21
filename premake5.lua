-- premake5.lua
workspace "sim2d"
    configurations { "debug", "release" }

-- example to build
example = "simple_test"

-- output directory
outputdir = "%{cfg.buildcfg}"

-- include directories
IncludeDir = {}

project "examples"
    location "examples"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++17"
    staticruntime "on"
    
    targetname (example)

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "%{prj.name}/" .. example .. ".cpp"
    }

    filter "configurations:debug"
		defines "SIM2D_DEBUG"
		runtime "debug"
		symbols "on"

	filter "configurations:release"
		defines "SIM2D_RELEASE"
		runtime "release"
		optimize "on"
