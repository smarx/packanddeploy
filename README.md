This is a simple scaffold for packaging a Windows Azure app that just runs an executable. The example app being executed is [mongoose](http://code.google.com/p/mongoose/), but anything could take its place, including apps that *don't* serve up content on port 80.

Usage
=====

1. Edit `WorkerRole\run.cmd` to do whatever you want. (Typically launch some sort of web server or a worker process. Either way, that process should run indefinitely.)
2. Run `build.cmd & run.cmd` to build and run the application locally.
3. Run `pack.cmd` to output `PackAndRun.cspkg`. That file, along with `ServiceConfiguration.cscfg` is what you need to deploy via the Windows Azure portal (or with some other tool) to get the app running in the cloud.

Understanding the Code
======================

`ServiceDefinition.csdef` specifies the following:

1. What size of VM to use (`ExtraSmall`)
2. Any input endpoints (`HttpIn`)
3. What command line to run (`run.cmd`)
4. What environment variables to make available to the app (`ADDRESS` and `PORT`)

`WorkerRole\run.cmd` is just a script to launch `mongoose-0.3.exe` with the right parameters (passing the address and port from the environment).

`start /w` is used to ensure that `run.cmd` doesn't prematurely exit. If the mongoose process ever exits, so will `run.cmd`. Windows Azure would then consider the role instance to have failed, and it would restart the instance.