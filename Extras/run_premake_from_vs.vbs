' A tedious task I'm often repeating while working with Visual Studio is
' generating a new solution after new files have been added or some
' configuration has changed. This usually forces me to close the solution,
' run some batch file which calls Premake, and open the last solution again.
'
' This can be nicely automated with a VBA macro: Open the Macro Explorer
' (Tools/Macros/Macro Explorer), create a new Module, and add the following
' subroutine.
'
' This code makes some assumptions about where the generated solution is stored,
' mine is in a directory named after the Premake target, e.g. vs2008, which is
' located in the directory where the premake4.lua script is stored.
'
' To have the macro easily accessible, I added it to the Build toolbar: open
' Tools/Customize..., select the Commands tab and the Macros item. Find the
' RunPremake macro and drag it to a toolbar of your choice, then select "Default
' style" from the button's context menu to only display an icon instead of the
' macro name, and choose a nice icon (I recommend the coffee cup!).
'
' Contributed by jspohr (http://industriousone.com/topic/running-premake-visual-studio)

 Sub RunPremake()
        If Not DTE.Solution Is Nothing And Not String.IsNullOrEmpty(DTE.Solution.FullName) Then
            Dim solutionPath, solutionDir, premakeTarget, premakeFlags, premakeExePath, premakeScriptDir As String
            solutionPath = DTE.Solution.FullName
            solutionDir = solutionPath.Substring(0, solutionPath.LastIndexOf("\"))
            premakeTarget = solutionDir.Substring(solutionDir.LastIndexOf("\") + 1)

            ' You might need to adjust these
            premakeFlags = ""
            premakeExePath = "C:\tools\premake\release\premake4.exe"
            premakeScriptDir = solutionDir + "\.."

            DTE.ExecuteCommand("File.CloseSolution")

            ChDir(premakeScriptDir)
            Dim command As String
            command =  premakeExePath + " " + premakeFlags + " " + premakeTarget
            Shell(command, AppWinStyle.NormalFocus, True)

            DTE.Solution.Open(solutionPath)
        Else
            MsgBox("No solution!")
        End If
    End Sub
