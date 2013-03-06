---
--- pthreads for windows
---
--- http://www.sourceware.org/pthreads-win32/
---

-- Set a prefix for the install action below
local prefix = _OPTIONS["prefix"] or "./dist/pthreads"

-----------------------------------------------------------------------------------------------------------------------------------------------------

solution "pthreads"
    configurations { "debug", "release" }
    platforms { "x32", "x64" }

-----------------------------------------------------------------------------------------------------------------------------------------------------
  
project "pthreads"
    kind "StaticLib"
    language "C++"
    
    includedirs
    {
        "."
    }
        
    files 
    { 
        "*.h",
        "pthread.c"
    }
    
    excludes
    {      
    }
    
    defines 
    { 
        "WIN32_LEAN_AND_MEAN",
        "VC_EXTRALEAN",
        "_LIB",
        "__CLEANUP_C",
        "WIN32",
        "_WINDOWS",
        "PTW32_STATIC_LIB",
        "HAVE_CONFIG_H",
    }
    
    configuration "debug"
      defines { "DEBUG" }
      flags { "Symbols" }
      
    configuration "release"
      defines { "NDEBUG" }
      flags { "Optimize" }

    configuration "debug"
        defines { "DEBUG" }
        flags { "Symbols" }

    configuration "release"
        defines { "NDEBUG" }
        flags { "Optimize" }
        
	configuration { "debug", "x32" }
        targetdir ( "lib/x32/debug" )
        targetname "pthreadd"

	configuration  { "debug", "x64" }
        targetdir ( "lib/x64/debug" )
        targetname "pthreadd"

	configuration { "release", "x32" }
        targetdir ( "lib/x32/release" )
        targetname "pthread"       
        
	configuration  { "release", "x64" }
        targetdir ( "lib/x64/release" )
        targetname "pthread"
        
newaction 
{
    trigger     = "install",
    description = "Install pthreads library",
    execute = function ()
        -- copy files, etc. here
        os.mkdir(prefix .. "/inc/pthreads");
        os.mkdir(prefix .. "/lib/x32");
        os.mkdir(prefix .. "/lib/x32/debug");
        os.mkdir(prefix .. "/lib/x32/release");
        os.mkdir(prefix .. "/lib/x64");
        os.mkdir(prefix .. "/lib/x64/debug");
        os.mkdir(prefix .. "/lib/x64/release");

        -- Copy header files
        files = os.matchfiles( "*.h");
        for k, f in pairs(files) do
            os.copyfile(f, prefix .. "/inc/pthreads/" .. path.getname(f));
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