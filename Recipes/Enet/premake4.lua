--
-- Enet 1.3.0 build script
-- Requires: Premake 4.4 or later.
--


-- Set a prefix for the install action below
local prefix = _OPTIONS["prefix"] or "./dist/enet"

-----------------------------------------------------------------------------------------------------------------------------------------------------

solution "enet"
	configurations { "Debug", "Release" }
	platforms { "x32", "x64" }

-----------------------------------------------------------------------------------------------------------------------------------------------------

project "enet"
	kind "StaticLib"
	language "C++"

	includedirs
	{
		"include"
	}

	files
	{
		"include/enet/*.h",
		"*.c"
	}

	defines
	{
		"WIN32",
		"WIN32_LEAN_AND_MEAN",
		"VC_EXTRALEAN",
	}

	configuration "Debug"
		defines { "DEBUG" }
		flags { "Symbols" }

	configuration "Release"
		defines { "NDEBUG" }
		flags { "Optimize" }

	configuration { "Debug", "x32" }
		targetdir "lib/x32/Debug"

	configuration  { "Debug", "x64" }
		targetdir "lib/x64/Debug"

	configuration { "Release", "x32" }
		targetdir "lib/x32/Release"

	configuration  { "Release", "x64" }
		targetdir "lib/x64/Release"

-----------------------------------------------------------------------------------------------------------------------------------------------------

newaction
{
	trigger     = "install",
	description = "Install ENET library",
	execute = function ()
		-- copy files, etc. here
		os.mkdir(prefix .. "/inc/enet");
		os.mkdir(prefix .. "/lib/x32");
		os.mkdir(prefix .. "/lib/x32/debug");
		os.mkdir(prefix .. "/lib/x32/release");
		os.mkdir(prefix .. "/lib/x64");
		os.mkdir(prefix .. "/lib/x64/debug");
		os.mkdir(prefix .. "/lib/x64/release");

		-- Copy header files
		files = os.matchfiles( "include/enet/*.h");
		for k, f in pairs(files) do
			os.copyfile(f, prefix .. "/inc/enet/" .. path.getname(f));
		end

		-- Library files created in dist directory on build
		files = os.matchfiles("lib/x32/debug/*.*");
		for k, f in pairs(files) do
			os.copyfile(f, prefix .. "/lib/x32/debug/" .. path.getname(f));
		end

		files = os.matchfiles("lib/x32/release/*.*");
		for k, f in pairs(files) do
			os.copyfile(f, prefix .. "/lib/x32/release/" .. path.getname(f));
		end

		files = os.matchfiles("lib/x64/debug/*.*");
		for k, f in pairs(files) do
			os.copyfile(f, prefix .. "/lib/x64/debug/" .. path.getname(f));
		end

		files = os.matchfiles("lib/x64/release/*.*");
		for k, f in pairs(files) do
			os.copyfile(f, prefix .. "/lib/x64/release/" .. path.getname(f));
		end
	end
}
