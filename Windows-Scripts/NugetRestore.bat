::We use this for restoring nuget packages for solution or project
::%1 => solution path

CALL %%NugetInstalltionPath%%\nuget.exe restore %1
