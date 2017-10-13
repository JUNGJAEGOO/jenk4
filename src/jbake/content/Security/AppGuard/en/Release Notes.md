title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Security > AppGuard > Release Notes

### 2017.08.24

#### function upgrade/change
* Removal of charge/free selection window (Apply September 1)
* Support Android 8.0
#### bug fix
* Modify the module(CLIUpdater.exe) that automatically updates the AppGuard CLI(AppGuard.exe), required update
    * Requires CLI of latest SDK (If you don't want automatic update function, add --noUpdate as CLI option)

### 2017.07.20

#### function upgrade/change
* Fixed an error that Callback function is not called when detecting on Level 1~3
* Add optimization function option for Level 1~3

### 2017.06.22

#### function upgrade/change
* App that use jni for x86_64, arm64-v8a will have an AppGuard module for that architecture.
* Divide path to download SDK for Android, iOS(Beta)
* The iOS(Beta) version is free for all users
* Enhancement of the module detection function of the AppGuard itself
* Extend Unity3D DLL File Encrpyt
    * Unitiy Basic DLL files as well as DLL files separately added are also encrypted. (Level 3)

### 2017.05.25

#### function upgrade/change
* Simplify application Android version
    * before : Protection work after SDK linkage
    * after : You can apply only protection work (If user ID identifier registration is necessary, it is necessary to selectively be linked SDK, but it becomes simpler than before.)
* Restructure App Protection Level
    * Level 1 : Abnormal behavior and pattern based basic security behavior detect about app
    * Level 2 : Level1 + Enhanced security function such as Encrypt source code, Prevent to modify App, etc.
    * Level 3 : Level2 + More Enhanced security function(Because stability check may be required for certain services, it is recommended to use it only if you have received a separate guide)
    * Level ex : Version of must required SDK be linked, Provide security between level1 to level2(it is recommended when conflict other security solution)

### 2017.04.20

#### bug fix
* Fix some app intall issues when applying app modification prevent function
* Enhance compatibility with apps that use external resources when applying app modification prevent function
* Fix app guard build error in version 5.6 of Unity3d

### 2017.04.04

#### bug fix
* Fix multidex bug of app modification prevent function

### 2017.03.23

#### function upgrade/change
* [SDK] Add function of supporting Unity3d il2cpp build

#### bug fix
* Fix an issue where blocking logic was not executed normally when policy update was delayed
* Fix an issue where unnecessary exceptions were output to Android logs

### 2017.01.19

#### function upgrade/change
* [SDK] New AppGuard iOS SDK deploy
* Enhance function of apk modification prevention

#### bug fix
* Fix synchronization error between policy settings and detection logic
* Fix crash issue based on network conditions (Update log transfer library)

### 2016.12.22

#### function upgrade/change
* Add detection pattern of cheating tool
* [Console] Add information of AppGuard engine version in detection logs

### 2016.12.08

#### function upgrade/change
* Add detection pattern of rooting
* [SDK] Add multi-lingual setting API at message when blocking in AppGuard

#### bug fix
* [Console] Fix an error that the protection failed but appears to be successful on the web console

### 2016.11.24

#### function upgrade/change

* [SDK] Update AppGuard SDK(tcag.jar)
* [Console] Add Notice in AppGuard Web Console

### 2016.10.20

#### function upgrade/change

* [API] Change parameter of AppGuard SDK linkage function
* [SDK] Add auto update function of AppGuard CLI(Command Line Build) tool

### 2016.09.29

#### bug fix

* [Console] Fix window of agree terms and link error
* [Console] Fix UI break when protecting app

### 2016.09.08

#### bug fix

* Fix false positives of speed hack detection in Android 7.0

### 2016.08.18

#### function upgrade/change

* Update detection pattern
* Support Android N
* [Console] Add function to searching iOS logs
* [Console] Add function to change the number of logs displayed on a page (fixed 15 -> select 15/30/50)

### 2016.08.04

#### function upgrade/change

* Enhance detection of speed manipulation

#### bug fix

* Fix some errors due to Timer
