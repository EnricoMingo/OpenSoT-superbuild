[![Build Status](https://travis-ci.org/EnricoMingo/OpenSoT-superbuild.svg?branch=master)](https://travis-ci.org/EnricoMingo/OpenSoT-superbuild)

OpenSoT-superbuild
=====================

OpenSoT dedicated building system.

Build and Install instruction (Ubuntu 14.04 LTS & ROS Indigo Igloo):
--------------------------------------------------------------------
Before cloning, make sure to have installed ROS Indigo in your machine.

Clone the repository in any folder you want.

Go in side the scripts folder:

```cd ~/OpenSoT-superbuild/scripts```

and run:

```./get_dependencies.sh```

this will install the needed dependencies.

After finished, open another terminal and create a ```build``` folder inside the ```OpenSoT-superbuild``` folder. Inside the ```build``` folder run:

```cmake ..```

and then:

```make```

The superbuild system will download all the necessary packages inside the  ```OpenSoT-superbuild``` folder and it will compile and install them inside the ```build``` folder. 

Remove the  OpenSoT-superbuild:
-------------------------------
Just remove the ```OpenSoT-superbuild``` folder.

