title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Security > AppGuard > Getting Started

Appguard is available in Android and iOS verions.

The Android version is applied to the apk file built after the SDK linkage(optional) by applying the appliction protection work(required) through Web Console or CLI.
The iOS version is applied through SDK linkage(required), and there is no additional protection work.

Apply step for using AppGuard are shown in [Figure 1].

![[Figure 1] How to apply AppGuard](http://static.toastoven.net/prod_appguard/figure1.png)
<center>[Figure 1] How to apply AppGuard</center>

## Activate Service

To protect your app with AppGuard, first activate the service. To activate, select [Security] > [AppGuard] and click the [Product using] button in the Console as shown in [Figure 2]

![[Figure 2] Activate AppGuard](http://static.toastoven.net/prod_appguard/figure2.png)
<center>[Figure 2] Activate AppGuard</center>

Please see AppGuard pricing policy ([http://cloud.toast.com/pricing/security](http://cloud.toast.com/pricing/security)) for details.

## Protect App

### Download SDK and Linkage

When you activate AppGuard, you will see the [Dashboard], [App Setting/Protection] menu. Select [App Setting/Protection] menu and click [Download SDK] button to download SDK for each OS.

After download SDK, follow the attached manual.

### Select App Protect Menu

After selecting [App Setting/Protection] menu, click [Protect App] button and the screen of [Figure 3] will appear. (For iOS, it works only with SDK linkage without protection work)

![[Figure 3] Input item for app protection setting](http://static.toastoven.net/prod_appguard/figure4.png)
<center>[Figure 3] Input item for app protection setting</center>

* Select [Certificate] file. It is KeyStore file on Android.
* Enter [Master Password] and Click [Validation] Button to validate the certificate file.
	* This check is to validate KeyStore and to select proper alias before protecting the app.
	* If the validation fails, check whether the certificate file and the master password is OK.
* Select [Alias].
* Enter the [Alias Password].
* Select the App to protect
* Select protection level
	- Level1 : Abnormal behavior and Pattern based basic security behavior detect function about app
	- Level2 : Level1 + Improved security function (Encrypt code, Prevent to modify App, etc)
	- Level3 : Level2 + More improve security function (Because stability check may be required for certain services, it is recommended to use it only if you have received a separate guide)
	- Level ex : Must required SDK linkage and Provide security between level1 to level2(It is recommended when conflict other security solution)

* Click [Ok] button to protect app
	\- Once the app is protected, you can download the protected app by selecting the [App Setting / Protection] tap in [Figure 4]. Now you can deploy protected app to upload each app store.

![[Figure 4] App Setting/Protect window](http://static.toastoven.net/prod_appguard/figure5.png)
<center>[Figure 4] App Setting/Protect window</center>

* App Protect work Method: Console, CLI(Command Line Interface)

## Dashboard

1. App is deployed to the App Store after the app has been protected, and if Abusing user is detected, you can check status on the [Dashboard] tab in [Figure 5].
2. [Dashboard] allows you to search statistic graphs and lists of detected user by AppGuard.
3. You can search by [User ID], [Device ID], [Detection Log Count], [Detection Log Pattern], [Search Period]
	* You can add multiple [User ID] and [Device ID] by separating with comma.
4. The detection statistics graph can check 'distribution by detection pattern' and 'detection pattern coutn' by period
5. The detection list show [User ID], [Device ID], [Detection Log Pattern Information], [Detection Log Count], [App version] and [Detection Time]
6. The search results can be downloaded by clicking [Download Report(CSV)].

![[Figure 5] Dashboard Windows of Abusing User Detection](http://static.toastoven.net/prod_appguard/figure6.png)
<center>[Figure 5] Dashboard Windows of Abusing User Detection</center>
