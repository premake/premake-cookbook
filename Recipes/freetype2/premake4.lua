--
-- freetype2 v2.4.11
--

-- Set a prefix for the install action below
local prefix = _OPTIONS["prefix"] or "./dist/freetype2"

-----------------------------------------------------------------------------------------------------------------------------------------------------

solution "freetype2"
  configurations { "debug", "release" }
  platforms { "x32", "x64" }
  
-----------------------------------------------------------------------------------------------------------------------------------------------------
  
project "freetype2"
    kind "StaticLib"
    language "C++"
    
    includedirs
    {
       "include"
    }
    
    files
    {
        "src/autofit/autofit.c",
        "src/bdf/bdf.c",
        "src/cff/cff.c",
        "src/base/ftbase.c",
        "src/base/ftbitmap.c",
        "src/cache/ftcache.c",
        "builds/win32/ftdebug.c",
        "src/base/ftfstype.c",
        "src/base/ftglyph.c",
        "src/gzip/ftgzip.c",
        "src/base/ftinit.c",
        "src/lzw/ftlzw.c",
        "src/base/ftstroke.c",
        "src/base/ftsystem.c",
        "src/smooth/smooth.c",

        "src/base/ftbbox.c",
        "src/base/ftgxval.c",
        "src/base/ftlcdfil.c",
        "src/base/ftmm.c",
        "src/base/ftotval.c",
        "src/base/ftpatent.c",
        "src/base/ftpfr.c",
        "src/base/ftsynth.c",
        "src/base/ftxf86.c",
        "src/base/ftfstype.c",
        "src/pcf/pcf.c",
        "src/pfr/pfr.c",
        "src/psaux/psaux.c",
        "src/pshinter/pshinter.c",
        "src/psnames/psmodule.c",
        "src/raster/raster.c",
        "src/sfnt/sfnt.c",
        "src/truetype/truetype.c",
        "src/type1/type1.c",
        "src/cid/type1cid.c",
        "src/type42/type42.c",
        "src/winfonts/winfnt.c",      
    }
    
    defines
    {
        "WIN32",
        "WIN32_LEAN_AND_MEAN",
        "VC_EXTRALEAN",
        "_CRT_SECURE_NO_WARNINGS",
        "FT2_BUILD_LIBRARY",      
    }    
    
    configuration "debug"
        defines 
        {
            "FT_DEBUG_LEVEL_ERROR",
            "FT_DEBUG_LEVEL_TRACE"
        }
      
        flags { "Symbols" }
        targetname "freetype2411mt_d"
      
      configuration "release"
        defines
        {
            "NDEBUG"
        }

        flags { "Optimize" }
        targetname "freetype2411mt"
        
    configuration { "debug", "x32" }
        targetdir ( "lib/x32/debug" )

    configuration { "debug", "x64" }
        targetdir ( "lib/x64/debug" )
        
    configuration { "release", "x32" }
        targetdir ( "lib/x32/release" )
    
    configuration { "release", "x64"}
        targetdir ( "lib/x64/release" )		        
        
-----------------------------------------------------------------------------------------------------------------------------------------------------
        
newaction 
{
    trigger     = "install",
    description = "Install freetype2 library",
    execute = function ()
        -- copy files, etc. here
        os.mkdir(prefix .. "/inc/freetype2");
        os.mkdir(prefix .. "/inc/freetype2/freetype");
        os.mkdir(prefix .. "/inc/freetype2/freetype/config");
        os.mkdir(prefix .. "/inc/freetype2/freetype/internal");
        os.mkdir(prefix .. "/inc/freetype2/freetype/internal/services");
        os.mkdir(prefix .. "/lib/x32");
        os.mkdir(prefix .. "/lib/x32/debug");
        os.mkdir(prefix .. "/lib/x32/release");
        os.mkdir(prefix .. "/lib/x64");
        os.mkdir(prefix .. "/lib/x64/debug");
        os.mkdir(prefix .. "/lib/x64/release");

        -- Copy header files
        files = os.matchfiles(  "include/*.h");
        for k, f in pairs(files) do
            os.copyfile(f, prefix .. "/inc/freetype2/" .. path.getname(f));
        end

        files = os.matchfiles(  "include/freetype/*.h");
        for k, f in pairs(files) do
            os.copyfile(f, prefix .. "/inc/freetype2/freetype/" .. path.getname(f));
        end
        
        files = os.matchfiles(  "include/freetype/config/*.h");
        for k, f in pairs(files) do
            os.copyfile(f, prefix .. "/inc/freetype2/freetype/config/" .. path.getname(f));
        end

        files = os.matchfiles(  "include/freetype/internal/*.h");
        for k, f in pairs(files) do
            os.copyfile(f, prefix .. "/inc/freetype2/freetype/internal/" .. path.getname(f));
        end

        files = os.matchfiles(  "include/freetype/internal/services/*.h");
        for k, f in pairs(files) do
            os.copyfile(f, prefix .. "/inc/freetype2/freetype/internal/services/" .. path.getname(f));
        end        
        
         -- Library files created in dist directory
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