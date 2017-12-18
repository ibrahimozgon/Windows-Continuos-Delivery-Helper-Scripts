### Jenkins CI Files
This repo contains windows batch scripts that used in arabam.com continuous delivery pipeline.

You can find detailed article here: https://medium.com/@ibrahimozgon/blue-green-deployment-with-jenkins-98393bba2327

### Usages

**ActivateStatus.bat**

We use this for copying active status files to production environment.

::1 => Sitepath
```
ActivateStatus.bat c:\Webroot\loadbalancer-status
```

**AssetBuild.bat**

Runs gulp command and copies files to ouput directory

::1 => Gulp command
::2 => Asset folder path
::3 => To Copy Build Path
```
AssetBuild.bat gulp-production C:\Webroot\Asset C:\Publish\Asset
```

**Copy.bat**

We use this for copying files.

::1 => From Path
::2 => To Path
```
Copy.bat C:\Publish\Build\1 E:\Webroot\1
```

**FolderExist.bat**

We use this in Green pipeline. If checks packacge path is true!

::1 => Folder Path
```
FolderExist.bat C:\Publish\Build\1
```

**MsBuild.bat**

We use this for building .net app

%* => Project name and Ms Build Parameters
```
MsBuild.bat C:\Publish\Arabam.com.sln /p:Configuration=Release /t:Clean;Rebuild /m:4 /clp:ErrorsOnly
```

**NugetRestore.bat**

We use this for restoring nuget packages for solution or project

::1 => solution path
```
NugetRestore.bat C:\Publish\Arabam.com.sln
```

**PassivateStatus.bat**

We use this for copying passive status files to production environment.

::1 => Sitepath
```
PassivateStatus.bat c:\Webroot\loadbalancer-status
```

**SCM.bat**

We use this for updating mercurial source control to last revision.

::1 => repo location
::2 => branch name
```
SCM.bat C:\Publish\arabam.con production
```

**StartSite.bat**

We use this for starting iis application pool and web site.

::1 => IP Address
::2 => site-name
```
StartSite.bat 127.0.0.1 arabamsite
```

**StopSite.bat**

We use this for stopping iis application pool and web site
::1 => IP Address
::2 => site-name
```
StopSite.bat 127.0.0.1 arabamsite
```

**replace.vbs**
 We use this for replacing development config file values with production values.
::1 => value to be changed
::2 => future value
```
replace.vbs "C:\publish\LogFiles\log4net.config" "@ServerName@" "%1" "%2"
```
