--
--  FreeImage v3.15.4 build script
--

-- Set a prefix for the install action below
local prefix = _OPTIONS["prefix"] or "./dist/freeimage"

-----------------------------------------------------------------------------------------------------------------------------------------------------

solution "freeimage"
    configurations { "debug", "release" }
    platforms { "x32", "x64" }

-----------------------------------------------------------------------------------------------------------------------------------------------------

project "freeimagelib"
    kind "StaticLib"
    language "C++"
       
    includedirs
    {
		"source",
		"source/zlib",
		"source/deprecationmanager",
		"source/openexr/half",
		"source/openexr/iex",
		"source/openexr/ilmimf",
		"source/openexr/imath",
		"source/openexr/ilmthread",
    }
        
    files 
    { 
		"source/*.h",
		"source/deprecationmanager/*.h",
		"source/deprecationmanager/*.cpp",
		"source/freeimage/*.cpp",
		"source/metadata/*.cpp",
		"source/freeimagetoolkit/*.h",
		"source/freeimagetoolkit/*.cpp",	
    }
    
    excludes
    {
      
    }
    
    defines 
    { 
      "WIN32",
      "WIN32_LEAN_AND_MEAN",
      "VC_EXTRALEAN",
      "_LIB",
      "OPJ_STATIC",
	  "LIBRAW_NODLL",
      "FREEIMAGE_LIB",
      "_CRT_SECURE_NO_DEPRECATE"
    }
    
    configuration "debug"
        defines { "DEBUG" }
        flags { "Symbols" }	  
        targetname "freeimage"
           
    configuration "release"
        defines { "NDEBUG" }
        flags { "Optimize" }      	  
        targetname "freeimage"

    configuration { "debug", "x32" }
        targetdir ( "lib/x32/debug" )

    configuration { "debug", "x64" }
        targetdir ( "lib/x64/debug" )
        
    configuration { "release", "x32" }
        targetdir ( "lib/x32/release" )
    
    configuration { "release", "x64"}
        targetdir ( "lib/x64/release" )
		
------------------------------------------------------------------------------------------------------------------------------------------------------- ===================================================================================================================================================================
  
project "freeimageplus"
    kind "StaticLib"
    language "C++"
    
    includedirs
    {
        "wrapper/freeimageplus/",
        "source",
    }
        
    files 
    { 
        "wrapper/freeimageplus/*.h",
        "wrapper/freeimageplus/src/*.cpp",
    }
    
    defines 
    { 
        "WIN32",
        "WIN32_LEAN_AND_MEAN",
        "VC_EXTRALEAN",
        "_LIB",
        "FIP_EXPORTS",
        "FREEIMAGE_LIB",
        "_CRT_SECURE_NO_DEPRECATE"
    }
    
    configuration ( "debug" )
        defines { "DEBUG" }
        flags { "Symbols" }
        targetname "freeimageplus"
      
    configuration ( "release" )
        defines { "NDEBUG" }
        flags { "Optimize" }
        targetname "freeimageplus"

    configuration { "debug", "x32" }
        targetdir ( "lib/x32/debug" )

    configuration { "debug", "x64" }
        targetdir ( "lib/x64/debug" )
        
    configuration { "release", "x32" }
        targetdir ( "lib/x32/release" )
    
    configuration { "release", "x64"}
        targetdir ( "lib/x64/release" )
		
-----------------------------------------------------------------------------------------------------------------------------------------------------

project "zlib"
    kind "StaticLib"
    language "C++"
    
    includedirs
    {
        "source/zlib"
    }
        
    files 
    { 
        "source/zlib/*.h",
        "source/zlib/*.c",
    }
    
    excludes
    {
        "source/zlib/example.c",
        "source/zlib/minigzip.c",
    }
    
    defines 
    { 
      "WIN32",
      "_LIB",
      "_CRT_SECURE_NO_DEPRECATE"
    }
    
    configuration ( "debug" )
        defines { "_DEBUG" }
        flags { "Symbols" }
        targetname "zlib"
      
    configuration ( "release" )
        defines { "NDEBUG" }
        flags { "Optimize" }
        targetname "zlib"
      
    configuration { "debug", "x32" }
        targetdir ( "lib/x32/debug" )

    configuration { "debug", "x64" }
        targetdir ( "lib/x64/debug" )
        
    configuration { "release", "x32" }
        targetdir ( "lib/x32/release" )
    
    configuration { "release", "x64"}
        targetdir ( "lib/x64/release" )		
      
-----------------------------------------------------------------------------------------------------------------------------------------------------

project "openexr"
    kind "StaticLib"
    language "C++"
    
    includedirs
    {
        "source/openexr",
        "source/openexr/ilmimf",
        "source/openexr/imath",
        "source/openexr/iex",
        "source/openexr/half",
        "source/openexr/ilmthread",
        "source/zlib",
    }
        
    files 
    { 
        "source/openexr/half/half.h",
        "source/openexr/half/half.cpp",
        
        "source/openexr/iex/*.h",
        "source/openexr/iex/iexbaseexc.cpp",
        "source/openexr/iex/iexthrowerrnoexc.cpp",
      
        "source/openexr/ilmimf/*.h",
        "source/openexr/ilmimf/imfattribute.cpp",
        "source/openexr/ilmimf/imfb44compressor.cpp",
        "source/openexr/ilmimf/imfboxattribute.cpp",
        "source/openexr/ilmimf/imfchannellist.cpp",
        "source/openexr/ilmimf/imfchannellistattribute.cpp",
        "source/openexr/ilmimf/imfchromaticities.cpp",
        "source/openexr/ilmimf/imfchromaticitiesattribute.cpp",
        "source/openexr/ilmimf/imfcompressionattribute.cpp",
        "source/openexr/ilmimf/imfcompressor.cpp",
        "source/openexr/ilmimf/imfconvert.cpp",
        "source/openexr/ilmimf/imfcrgbafile.cpp",
        "source/openexr/ilmimf/imfdoubleattribute.cpp",
        "source/openexr/ilmimf/imfenvmap.cpp",
        "source/openexr/ilmimf/imfenvmapattribute.cpp",
        "source/openexr/ilmimf/imffloatattribute.cpp",
        "source/openexr/ilmimf/imfframebuffer.cpp",
        "source/openexr/ilmimf/imfframespersecond.cpp",
        "source/openexr/ilmimf/imfheader.cpp",
        "source/openexr/ilmimf/imfhuf.cpp",
        "source/openexr/ilmimf/imfinputfile.cpp",
        "source/openexr/ilmimf/imfintattribute.cpp",
        "source/openexr/ilmimf/imfio.cpp",
        "source/openexr/ilmimf/imfkeycode.cpp",
        "source/openexr/ilmimf/imfkeycodeattribute.cpp",
        "source/openexr/ilmimf/imflineorderattribute.cpp",
        "source/openexr/ilmimf/imflut.cpp",
        "source/openexr/ilmimf/imfmatrixattribute.cpp",
        "source/openexr/ilmimf/imfmisc.cpp",
        "source/openexr/ilmimf/imfopaqueattribute.cpp",
        "source/openexr/ilmimf/imfoutputfile.cpp",
        "source/openexr/ilmimf/imfpizcompressor.cpp",
        "source/openexr/ilmimf/imfpreviewimage.cpp",
        "source/openexr/ilmimf/imfpreviewimageattribute.cpp",
        "source/openexr/ilmimf/imfpxr24compressor.cpp",
        "source/openexr/ilmimf/imfrational.cpp",
        "source/openexr/ilmimf/imfrationalattribute.cpp",
        "source/openexr/ilmimf/imfrgbafile.cpp",
        "source/openexr/ilmimf/imfrgbayca.cpp",
        "source/openexr/ilmimf/imfrlecompressor.cpp",
        "source/openexr/ilmimf/imfscanlineinputfile.cpp",
        "source/openexr/ilmimf/imfstandardattributes.cpp",
        "source/openexr/ilmimf/imfstdio.cpp",
        "source/openexr/ilmimf/imfstringattribute.cpp",
        "source/openexr/ilmimf/imfstringvectorattribute.cpp",
        "source/openexr/ilmimf/imftestfile.cpp",
        "source/openexr/ilmimf/imfthreading.cpp",
        "source/openexr/ilmimf/imftiledescriptionattribute.cpp",
        "source/openexr/ilmimf/imftiledinputfile.cpp",
        "source/openexr/ilmimf/imftiledmisc.cpp",
        "source/openexr/ilmimf/imftiledoutputfile.cpp",
        "source/openexr/ilmimf/imftiledrgbafile.cpp",
        "source/openexr/ilmimf/imftileoffsets.cpp",
        "source/openexr/ilmimf/imftimecode.cpp",
        "source/openexr/ilmimf/imftimecodeattribute.cpp",
        "source/openexr/ilmimf/imfvecattribute.cpp",
        "source/openexr/ilmimf/imfversion.cpp",
        "source/openexr/ilmimf/imfwav.cpp",
        "source/openexr/ilmimf/imfzipcompressor.cpp",
      
        "source/openexr/ilmthread/*.h",
        "source/openexr/ilmthread/ilmthread.cpp",
        "source/openexr/ilmthread/ilmthreadmutex.cpp",
        "source/openexr/ilmthread/ilmthreadpool.cpp",
        "source/openexr/ilmthread/ilmthreadsemaphore.cpp",
      
        "source/openexr/imath/*.h",
        "source/openexr/imath/imathbox.cpp",
        "source/openexr/imath/imathcoloralgo.cpp",
        "source/openexr/imath/imathfun.cpp",
        "source/openexr/imath/imathmatrixalgo.cpp",
        "source/openexr/imath/imathrandom.cpp",
        "source/openexr/imath/imathshear.cpp",
        "source/openexr/imath/imathvec.cpp"      
    }
    
    excludes
    {
        "source/openexr/ilmthread/ilmthreadmutexposix.cpp",      
        "source/openexr/ilmthread/ilmthreadmutexwin32.cpp",
        "source/openexr/ilmthread/ilmthreadsemaphoreposix.cpp",
        "source/openexr/ilmthread/ilmthreadsemaphoreposixcompat.cpp",
        "source/openexr/ilmthread/ilmthreadsemaphorewin32.cpp",
        "source/openexr/ilmthread/ilmthreadwin32.cpp",
    }
    
    defines 
    { 
        "WIN32",
        "WIN32_LEAN_AND_MEAN",
        "VC_EXTRALEAN",
        "_LIB",
        "_CRT_SECURE_NO_DEPRECATE"
    }
    
    configuration ( "debug" )
        defines { "DEBUG" }
        flags { "Symbols" }
        targetname "openexr"
      
    configuration ( "release" )
        defines { "NDEBUG" }
        flags { "Optimize" }
        targetname "openexr"

    configuration { "debug", "x32" }
        targetdir ( "lib/x32/debug" )

    configuration { "debug", "x64" }
        targetdir ( "lib/x64/debug" )
        
    configuration { "release", "x32" }
        targetdir ( "lib/x32/release" )
    
    configuration { "release", "x64"}
        targetdir ( "lib/x64/release" )		
      
-----------------------------------------------------------------------------------------------------------------------------------------------------

project "libtiff4"
    kind "StaticLib"
    language "C++"
    
    includedirs
    {
        "source/libtiff4"
    }
        
    files 
    { 
        "source/libtiff4/*.h",
        "source/libtiff4/*.c",
    }
    
    excludes
    {
        "source/libtiff4/mkg3states.c",
        "source/libtiff4/mkspans.c",
        "source/libtiff4/tif_acorn.c",
        "source/libtiff4/tif_atari.c",
        "source/libtiff4/tif_apple.c",
        "source/libtiff4/tif_msdos.c",
        "source/libtiff4/tif_unix.c",
        "source/libtiff4/tif_vms.c",
        "source/libtiff4/tif_wince.c",
        "source/libtiff4/tif_win3.c",
        "source/libtiff4/tif_win32.c"
    }
    
    defines 
    { 
        "WIN32",
        "_LIB",
    }
    
    configuration "debug"
        defines { "DEBUG" }
        flags { "Symbols" }
        targetname "libtiff"
      
    configuration "release"
        defines { "NDEBUG" }
        flags { "Optimize" }
        targetname "libtiff"

    configuration { "debug", "x32" }
        targetdir ( "lib/x32/debug" )

    configuration { "debug", "x64" }
        targetdir ( "lib/x64/debug" )
        
    configuration { "release", "x32" }
        targetdir ( "lib/x32/release" )
    
    configuration { "release", "x64"}
        targetdir ( "lib/x64/release" )
		
-----------------------------------------------------------------------------------------------------------------------------------------------------

project "libpng"
    kind "StaticLib"
    language "C++"
    
    includedirs
    {
        "source/libpng",
        "source/zlib"
    }
        
    files 
    { 
        "source/libpng/*.h",
        "source/libpng/*.c",
    }
    
    excludes
    {
    }
    
    defines 
    { 
        "WIN32",
        "WIN32_LEAN_AND_MEAN",
        "VC_EXTRALEAN",
        "_LIB",
        "_CRT_SECURE_NO_DEPRECATE"
    }
    
    configuration ( "debug" )
        defines { "DEBUG" }
        flags { "Symbols" }
        targetname "libpng"
      
    configuration ( "release" )
        defines { "NDEBUG" }
        flags { "Optimize" }
        targetname "libpng"

    configuration { "debug", "x32" }
        targetdir ( "lib/x32/debug" )

    configuration { "debug", "x64" }
        targetdir ( "lib/x64/debug" )
        
    configuration { "release", "x32" }
        targetdir ( "lib/x32/release" )
    
    configuration { "release", "x64"}
        targetdir ( "lib/x64/release" )		

-----------------------------------------------------------------------------------------------------------------------------------------------------        

project "libopenjpeg"
    kind "StaticLib"
    language "C++"
    
    includedirs
    {
        "source/libopenjpeg",
    }
        
    files 
    { 
        "source/libopenjpeg/*.h",
        "source/libopenjpeg/*.c",
    }
    
    excludes
    {
        "source/t1_generate_luts.c"
    }
    
    defines 
    { 
        "WIN32",
        "WIN32_LEAN_AND_MEAN",
        "VC_EXTRALEAN",
        "_LIB",
        "OPJ_STATIC",
        "_CRT_SECURE_NO_DEPRECATE"
    }
    
    configuration ( "debug" )
        defines { "DEBUG" }
        flags { "Symbols" }
        targetname "libopenjpeg"

    configuration ( "release" )
        defines { "NDEBUG" }
        flags { "Optimize" }
        targetname "libopenjpeg"

    configuration { "debug", "x32" }
        targetdir ( "lib/x32/debug" )

    configuration { "debug", "x64" }
        targetdir ( "lib/x64/debug" )
        
    configuration { "release", "x32" }
        targetdir ( "lib/x32/release" )
    
    configuration { "release", "x64"}
        targetdir ( "lib/x64/release" )		

-----------------------------------------------------------------------------------------------------------------------------------------------------        

project "libmng"
    kind "StaticLib"
    language "C++"
    
    includedirs
    {
        "source/libmng",
        "source/zlib"
    }
        
    files 
    { 
        "source/libmng/*.h",
        "source/libmng/*.c",
    }
    
    excludes
    {

    }
    
    defines 
    { 
        "WIN32",
        "WIN32_LEAN_AND_MEAN",
        "VC_EXTRALEAN",
        "_LIB",
        "MNG_BUILD_SO",
        "_CRT_SECURE_NO_DEPRECATE"
    }
    
    configuration ( "debug" )
        defines { "DEBUG" }
        flags { "Symbols" }
        targetname "libmng"
      
    configuration ( "release" )
        defines { "NDEBUG" }
        flags { "Optimize" }
        targetname "libmng"

    configuration { "debug", "x32" }
        targetdir ( "lib/x32/debug" )

    configuration { "debug", "x64" }
        targetdir ( "lib/x64/debug" )
        
    configuration { "release", "x32" }
        targetdir ( "lib/x32/release" )
    
    configuration { "release", "x64"}
        targetdir ( "lib/x64/release" )		

-----------------------------------------------------------------------------------------------------------------------------------------------------        

project "libjpeg"
    kind "StaticLib"
    language "C++"
    
    includedirs
    {
        "source/libjpeg",
    }
        
    files 
    { 
        "source/libjpeg/*.h",
        "source/libjpeg/*.c",
    }
    
    excludes
    {
        "source/libjpeg/ansi2knr.c",
        "source/libjpeg/cderror.h",
        "source/libjpeg/cdjpeg.h",
        "source/libjpeg/cdjpeg.c",
        "source/libjpeg/cjpeg.c",
        "source/libjpeg/ckconfig.c",
        "source/libjpeg/djpeg.c",
        "source/libjpeg/example.c",
        "source/libjpeg/jmemdos.c",
        "source/libjpeg/jmemmac.c",
        "source/libjpeg/jmemname.c",
        "source/libjpeg/rd*.c",
        "source/libjpeg/wr*.c"
    }
    
    defines 
    { 
        "WIN32",
        "WIN32_LEAN_AND_MEAN",
        "VC_EXTRALEAN",
        "_LIB",
        "_CRT_SECURE_NO_DEPRECATE"
    }
    
    configuration ( "debug" )
        defines { "DEBUG" }
        flags { "Symbols" }
        targetname "libjpeg"
      
    configuration ( "release" )
        defines { "NDEBUG" }
        flags { "Optimize" }
        targetname "libjpeg"

    configuration { "debug", "x32" }
        targetdir ( "lib/x32/debug" )

    configuration { "debug", "x64" }
        targetdir ( "lib/x64/debug" )
        
    configuration { "release", "x32" }
        targetdir ( "lib/x32/release" )
    
    configuration { "release", "x64"}
        targetdir ( "lib/x64/release" )		
      
-----------------------------------------------------------------------------------------------------------------------------------------------------

project "libraw"
    kind "StaticLib"
    language "C++"
    
    includedirs
    {
        "source/librawlite"
    }
        
    files 
    { 
        "source/librawlite/internal/*.h",
        "source/librawlite/internal/*.cpp",
        "source/librawlite/src/*.cpp",
    }
    
    excludes
    {
    }
    
    defines 
    { 
        "WIN32",
        "_LIB",
        "_CRT_SECURE_NO_DEPRECATE",
        "LIBRAW_NODLL"
    }
    
    configuration ( "debug" )
        defines { "_DEBUG" }
        flags { "Symbols" }
        targetname "libraw"
      
    configuration ( "release" )
        defines { "NDEBUG" }
        flags { "Optimize" }
        targetname "libraw"
      
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
    description = "Install Freeimage library",
    execute = function ()
        -- copy files, etc. here
        os.mkdir(prefix .. "/inc/freeimage");
        os.mkdir(prefix .. "/lib/x32");
        os.mkdir(prefix .. "/lib/x32/debug");
        os.mkdir(prefix .. "/lib/x32/release");
        os.mkdir(prefix .. "/lib/x64");
        os.mkdir(prefix .. "/lib/x64/debug");
        os.mkdir(prefix .. "/lib/x64/release");

        -- Copy header files
        os.copyfile("source/freeimage.h", prefix .. "/inc/freeimage/freeimage.h");
        os.copyfile("wrapper/freeimageplus/freeimageplus.h", prefix .. "/inc/freeimage/freeimageplus.h");
      
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
      