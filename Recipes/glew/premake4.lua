--
-- Glew 1.9.0 build script
--


-- Set a prefix for the install action below
local prefix = _OPTIONS["prefix"] or "./dist/glew"

-----------------------------------------------------------------------------------------------------------------------------------------------------

solution "glew"
    configurations { "debug", "release" }
    platforms { "x32", "x64" }

-----------------------------------------------------------------------------------------------------------------------------------------------------

project "glew-static"
    kind "StaticLib"
    language "C++"    
    
    includedirs
    {
        "include"
    }
        
    files 
    { 
        "include/gl/*.h",
        "src/*.c"
    }
    
    excludes
    {
        "src/glewinfo.c",
        "src/visualinfo.c"
    }
    
    defines 
    { 
      "WIN32",
      "WIN32_LEAN_AND_MEAN",
      "VC_EXTRALEAN",
      "GLEW_STATIC"
    }
    
    configuration "debug"
        defines { "DEBUG" }
        flags { "Symbols" }

    configuration "release"
        defines { "NDEBUG" }
        flags { "Optimize" }
        
	configuration { "debug", "x32" }
        targetdir ( "lib/x32/debug" )
        targetname "glew32sd"

	configuration  { "debug", "x64" }
        targetdir ( "lib/x64/debug" )
        targetname "glew64sd"

	configuration { "release", "x32" }
        targetdir ( "lib/x32/release" )
        targetname "glew32s"       
        
	configuration  { "release", "x64" }
        targetdir ( "lib/x64/release" )
        targetname "glew64s"

-----------------------------------------------------------------------------------------------------------------------------------------------------
        
newaction 
{
    trigger     = "install",
    description = "Install GLEW library",
    execute = function ()
        -- copy files, etc. here    
        os.mkdir(prefix .. "/inc/gl");
        os.mkdir(prefix .. "/lib/x32");
        os.mkdir(prefix .. "/lib/x32/debug");
        os.mkdir(prefix .. "/lib/x32/release");
        os.mkdir(prefix .. "/lib/x64");
        os.mkdir(prefix .. "/lib/x64/debug");
        os.mkdir(prefix .. "/lib/x64/release");

        -- Copy header files
        files = os.matchfiles( "include/gl/*.h");
        for k, f in pairs(files) do
            os.copyfile(f, prefix .. "/inc/gl/" .. path.getname(f));
        end
          
        -- Library files created in dist directory
        files = os.matchfiles( "lib/x32/debug/*.*");
        for k, f in pairs(files) do
            os.copyfile(f, prefix .. "/lib/x32/debug/" .. path.getname(f));
        end

        files = os.matchfiles( "lib/x32/release/*.*");
        for k, f in pairs(files) do
            os.copyfile(f, prefix .. "/lib/x32/release/" .. path.getname(f));
        end

        files = os.matchfiles( "lib/x64/debug/*.*");
        for k, f in pairs(files) do
            os.copyfile(f, prefix .. "/lib/x64/debug/" .. path.getname(f));
        end

        files = os.matchfiles( "lib/x64/release/*.*");
        for k, f in pairs(files) do
            os.copyfile(f, prefix .. "/lib/x64/release/" .. path.getname(f));
        end    
    end
}
