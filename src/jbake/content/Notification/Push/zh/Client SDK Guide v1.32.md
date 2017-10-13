title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Notification > Push > Client SDK Developer's Guide
이전 버전보기: <select onchange="location.href=this.value">
<option value="/zh/Notification/Push/zh/Client%20SDK%20Guide">v1.4</option>
<option selected value="/zh/Notification/Push/zh/Client%20SDK%20Guide%20v1.32">v1.32</option></select>

TOAST Cloud Push SDK를 적용하면 모바일 어플리케이션과 토스트 클라우드 푸시를 쉽게 연동할 수 있다.

## 푸시 SDK Download

SDK는 [SDK 다운로드 페이지] > [Notification > Push]에서 받을 수 있다.

## 텐센트(TENCENT) 푸시 SDK Download

GCM 사용이 불가능한 중국에서 푸시 메시지 발송이 필요할 경우, 텐센트(TENCENT) 푸시 서비스를 이용할 수 있다.
TENCENT 푸시 SDK와 통합하는 방법에 대해 설명한다.

[Tencent Push SDK 다운로드 페이지](http://xg.qq.com/xg/ctr_index/download)

가이드는 TENCENT(Xg Push) 2.47 버전 기준으로 작성되었다.

## 토큰 등록

기기 식별을 위한 Token을 서버에 등록하는 과정이다. 등록이 성공하면 해당 기기에서 푸시 메시지를 수신할 수 있다.

### iOS, APNS

**YourAppDelegate.m**

```
@implementation YourAppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSDictionary* options = @{
                              kTCPushKeyServerUrl : @"https://api-push.cloud.toast.com",
                              kTCPushKeyPushType : kTCPushTypeAPNS,
                              kTCPushKeyAgreeNotification : @YES,
                              kTCPushKeyCountry : @"KR",
                              kTCPushKeyLanguage : @"ko",
                              kTCPushKeyTimeout : @(30)
                            };
    int errorCode = [TCPushSdk registerWithAppKey:@"your_app_key" userId:@"your_userid" onRegister:^(int error) {
        [self handleError:error];
    } options:options];

    if(errorCode != kTCPushErrorNone)
    {
        [self handleError:errorCode];
    }
    return YES;
}

- (void)handleError:(int)error
{
    // TODO Handle error code.
}
...
@end
```

### Android, GCM

**AndroidManifest.xml**

아래에 'your.package.name'으로 되어있는 모든 부분을 어플리케이션 기본 페키지 네임으로 변경한다.

```
<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="your.package.name">
  <application android:icon="@drawable/app_icon">
        <receiver android:name="com.google.android.gms.gcm.GcmReceiver" android:exported="true"
                android:permission="com.google.android.c2dm.permission.SEND">
            <intent-filter>
                <action android:name="com.google.android.c2dm.intent.RECEIVE" />
                <category android:name="your.package.name" />
            </intent-filter>
        </receiver>
    <service android:name="com.toast.android.pushsdk.PushSdk$GcmListener" android:exported="false">
      <intent-filter>
        <action android:name="com.google.android.c2dm.intent.RECEIVE" />
      </intent-filter>
    </service>
        <service android:name="com.toast.android.pushsdk.PushService$IdListener" android:exported="false">
            <intent-filter>
                <action android:name="com.google.android.gms.iid.InstanceID"/>
            </intent-filter>
        </service>
  </application>
  <permission android:name="your.package.name.permission.C2D_MESSAGE" android:protectionLevel="signature"/>
  <uses-permission android:name="android.permission.INTERNET" />
  <uses-permission android:name="android.permission.WAKE_LOCK" />
  <uses-permission android:name="com.google.android.c2dm.permission.RECEIVE" />
  <uses-permission android:name="your.package.name.permission.C2D_MESSAGE" />
</manifest>
```

**YourActivity.java**  
YOUR_APPKEY, YOUR_UID, YOUR_SENDER_ID에 값을 설정한다.

```
package com.toast.cloud.push.demo.app.your;

public class YourActivity extends Activity {
    private final String YOUR_APPKEY = "YOUR_APPKEY";
    private final String YOUR_UID = "YOUR_UID";

    private final Activity YOUR_ACTIVITY = this;
    private final String YOUR_SENDER_ID = "YOUR_SENDER_ID";
    private final String YOUR_PUSH_TYPE = PushSdk.PUSH_TYPE_GCM;
    private final long YOUR_ACCESS_ID = Long.MIN_VALUE;
    private final String YOUR_ACCESS_KEY = "YOUR_ACCESS_KEY";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        final Map<String, Object> options = new HashMap<String, Object>();
        options.put(PushSdk.KEY_ACTIVITY, YOUR_ACTIVITY); // Required.
         // Only GCM
        if (PushSdk.PUSH_TYPE_GCM.equals(YOUR_PUSH_TYPE)) {
        	options.put(PushSdk.KEY_SENDER_ID, YOUR_SENDER_ID); // Required.
        }
        options.put(PushSdk.KEY_SERVER_URL, "https://api-push.cloud.toast.com");
        // Optional. Default: https://api-push.cloud.toast.com
        options.put(PushSdk.KEY_CHANNEL, "default"); // Optional(v1.3)
        options.put(PushSdk.KEY_PUSH_TYPE, YOUR_PUSH_TYPE);
        // Optional.  PushSdk.PUSH_TYPE_GCM or PushSdk.PUSH_TYPE_TENCENT. Default: PushSdk.PUSH_TYPE_GCM.
        // Only TENCENT
        if (PushSdk.PUSH_TYPE_TENCENT.equals(YOUR_PUSH_TYPE)) {
            options.put(PushSdk.KEY_ACCESS_ID, YOUR_ACCESS_ID); // Required.
            options.put(PushSdk.KEY_ACCESS_KEY, YOUR_ACCESS_KEY); // Required.
        }
        options.put(PushSdk.KEY_AGREE_NOTIFICATION, true); // Optional. Default: false.
        options.put(PushSdk.KEY_AGREE_AD, true); // Optional. Default: false.
        options.put(PushSdk.KEY_AGREE_NIGHT_AD, true); // Optional. Default: false.
        options.put(PushSdk.KEY_COUNTRY, "KR"); // Optional. Default: "US".
        options.put(PushSdk.KEY_LANGUAGE, "ko"); // Optional. Default: "en".
        options.put(PushSdk.KEY_TIMEOUT, 30.0); // Optional. Time Unit: Second. Default: 30.

        final int error = PushSdk.register(YOUR_APPKEY, YOUR_UID, new PushSdk.OnRegister() {
            @Override
            public void fire(int error) {
                // TODO Implement handling error
            }
        }, options);
        // TDDo Implement handling error
    }
}
```
- 위 설명은 Android SDK v1.3 이상만 적용된다. v1.3이하 사용자는 아래와 같이 토큰 등록시 채널을 꼭 등록해주어야 한다.
```java
 options.put(PushSdk.KEY_CHANNEL, "default");
```

**build.gradle**

```
apply plugin: 'com.android.application'

android {
    compileSdkVersion 23
    buildToolsVersion "23.0.1"

    defaultConfig {
        minSdkVersion 11
        targetSdkVersion 19
        versionCode 1
        versionName "10"
        multiDexEnabled true
    }
    sourceSets {
        main {
            jniLibs.srcDirs = ['libs']
        }
    }
    buildTypes {
        release {
            minifyEnabled false
        }
    }
}

dependencies {
    compile fileTree(dir: 'libs', include: ['*.jar'])
    compile 'com.android.support:appcompat-v7:23.1.0'
    compile 'com.android.support:support-v4:23.1.0'
    compile 'com.google.android.gms:play-services-gcm:9.6.0'
}
```

### Android, TENCENT

**AndroidManifest.xml**  
다음 내용을 추가한다.

```
<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="your.package.name">
  <application android:icon="@drawable/app_icon">
    <receiver android:name="com.tencent.android.tpush.XGPushReceiver" android:process=":xg_service_v2" >
      <intent-filter android:priority="0x7fffffff" >
        <action android:name="com.tencent.android.tpush.action.SDK" />
        <action android:name="com.tencent.android.tpush.action.INTERNAL_PUSH_MESSAGE" />
        <action android:name="android.intent.action.USER_PRESENT" />
        <action android:name="android.net.conn.CONNECTIVITY_CHANGE" />
      </intent-filter>
    </receiver>
    <service android:name="com.tencent.android.tpush.service.XGPushService" android:exported="true"
        android:persistent="true" android:process=":xg_service_v2">
    </service>
    <receiver android:name="com.toast.android.pushsdk.PushSdk$XgListener">
      <intent-filter>
        <action android:name="com.tencent.android.tpush.action.PUSH_MESSAGE" />
        <action android:name="com.tencent.android.tpush.action.FEEDBACK" />
      </intent-filter>
    </receiver>
    <service android:name="com.tencent.android.tpush.rpc.XGRemoteService" android:exported="true" >
      <intent-filter>
        <action android:name="your.package.name.PUSH_ACTION" />
      </intent-filter>
    </service>
  </application>
  <uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />
  <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
  <uses-permission android:name="android.permission.BROADCAST_STICKY" />
  <uses-permission android:name="android.permission.KILL_BACKGROUND_PROCESSES" />
  <uses-permission android:name="android.permission.GET_TASKS" />
  <!--permissions requiring user alerts-->
  <uses-permission android:name="android.permission.READ_PHONE_STATE" />
  <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED" />
  <uses-permission android:name="android.permission.RECEIVE_USER_PRESENT" />
  <uses-permission android:name="android.permission.RESTART_PACKAGES" />
  <uses-permission android:name="android.permission.WRITE_SETTINGS" />
  <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
  <uses-permission android:name="android.permission.READ_LOGS" />

  <uses-permission android:name="android.permission.INTERNET" />
  <uses-permission android:name="android.permission.WAKE_LOCK" />
  <uses-permission android:name="android.permission.VIBRATE" />
</manifest>
```

- 현재 Android M (6.0 MarshMallow)에서 정상적인 동작을 하지 않을 수 있다. TENCENT SDK 패치가 필요한 부분이며, 패치될 예정이다.

위와 같이 설정 후, options에 PushSdk.pushType을 PushSdk.PUSH_TYPE_TENCENT로 설정한다.  
그리고, PushSdk.KEY_ACCESS_ID, PushSdk.KEY_ACCESS_KEY에 발급받은 ACCESS ID와 ACCESS KEY를 설정한다.   
ACCESS ID, ACCESS KEY 발급은 [Developer's Guide]를 참고한다.  


### Options

options는 플랫폼에따라 Dictionary 또는 Map, 또는 그에 준하는 Key/Value Collection으로 정의된다. 각의 Key/Value는 다음과 같다.

|Key|	Type|	Values|	Platform|
|---|---|---|---|
|KEY_PUSH_TYPE(pushType)|	string|	PushSdk.PUSH_TYPE_APNS, PushSdk.PUSH_TYPE_APNS_SANDBOX, <br/> PushSdk.PUSH_TYPE_GCM, PushSdk.PUSH_TYPE_TENCENT|	iOS, Android|
|KEY_AGREE_NOTIFICATION <br/> (isNotificationAgreement)|	boolean|	알림 푸시 메시지 수신 여부|	iOS, Android|
|KEY_AGREE_AD <br/> (isAdAgreement)|	boolean|	광고 푸시 메시지 알림 수신 여부|	iOS, Android|
|KEY_AGREE_NIGHT_AD <br/> (isNightAdAgreement)|	boolean|	야간 광고 푸시 메시지 알림 수신 여부|	iOS, Android|
|KEY_COUNTRY(country)|	string|	국가 코드. 형식 제약은 없다. <br/> 하지만, ISO 3166 사용을 권장한다.|	iOS, Android|
|KEY_LANGUAGE(language)|	string|	언어 코드. 형식 제약은 없다. <br/> 하지만, ISO 639 사용을 권장한다.|	iOS, Android|
|KEY_TIMEOUT(timeout)|	double|	토큰 등록 또는 조회시 사용되는 시간이다. 단위는 초다.|	iOS, Android|
|KEY_ACTIVITY(activity)|	object|	android.app.Activity|	Android|
|KEY_SENDER_ID(senderId)|	string|	GCM을 사용하기 위해 필요하다. <br/> [[Google Developer Console](https://console.developers.google.com/project)]에서 확인할 수 있다.|	Android(GCM)|
|KEY_ACCESS_ID(accessId)|	string|	TENCENT를 사용하기 위해 필요하다. <br/> [[Tencent 푸시 서비스 대시보드](http://xg.qq.com/xg/ctr_index/login?go_to_url=http%3A%2F%2Fxg.qq.com%2Fxg%2Fapps%2Fctr_app%2Findex)]에서 확인할 수 있다.|	Android(TENCENT)|
|KEY_ACCESS_KEY <br/> (accessKey)|	string|	TENCENT를 사용하기 위해 필요하다. <br/> [[Tencent 푸시 서비스 대시보드](http://xg.qq.com/xg/ctr_index/login?go_to_url=http%3A%2F%2Fxg.qq.com%2Fxg%2Fapps%2Fctr_app%2Findex)]에서 확인할 수 있다.|	Android(TENCENT)|

## 푸시 메시지 수신

### Android, GCM

SDK를 사용하면 추가적인 구현 없이 기본적으로 푸시 메시지를 수신하고 화면에 표시 된다. 필요에 따라 커스텀한 푸시 메시지를 표시하고 싶다면, 아래 처럼 Custom Receiver를 등록한다.

**YourGcmListener.java**

```
package com.toast.cloud.push.demo.app.your;

public class YourGcmListener extends PushSdk.GcmListener {
    private static final int NOTIFICATION_ID = 1;

    @Override
    public void onMessageReceived(String from, Bundle data) {
        final NotificationManager notificationManager = (NotificationManager)
                this.getSystemService(Context.NOTIFICATION_SERVICE);

        final PendingIntent contentIntent = PendingIntent.getActivity(this, 0, new Intent(this, DemoActivity.class), 0);
        final String text = data.toString();
        NotificationCompat.Builder mBuilder =
                new NotificationCompat.Builder(this)
                        .setSmallIcon(R.drawable.ic_stat_gcm)
                        .setContentTitle("GCM Notification")
                        .setStyle(new NotificationCompat.BigTextStyle().bigText(text))
                        .setContentText(text);

        mBuilder.setContentIntent(contentIntent);
        notificationManager.notify(NOTIFICATION_ID, mBuilder.build());
    }
}
```

**AndroidManifest.xml**   
PushSdk$GcmListener를 YourGcmListener로 수정한다.

```
    ...
    <service android:name="your.package.name.YourGcmListener" android:exported="false">
     <intent-filter>
       <action android:name="com.google.android.c2dm.intent.RECEIVE" />
      </intent-filter>
    </service>
    ...
```

### Android, TENCENT

SDK를 사용하면 추가적인 구현 없이 기본적으로 푸시 메시지를 수신하고 화면에 표시 된다. 필요에 따라 커스텀한 푸시 메시지를 표시하고 싶다면, 아래 처럼 Custom Receiver를 등록한다.

**YourXgListener.java**  

```
package your.package.name;

public class YourXgListener extends PushSdk.XgListener {
    private static final int NOTIFICATION_ID = 2;

    @Override
    public void onTextMessage(Context context, XGPushTextMessage message) {
        final NotificationManager notificationManager = (NotificationManager)
                context.getSystemService(Context.NOTIFICATION_SERVICE);

        final PendingIntent contentIntent = PendingIntent.getActivity
        (context, 0, new Intent(context, DemoActivity.class), 0);
        final String text = "title: " + message.getTitle() + ", content: " + message.getContent() + ", customContent: "
         + message.getCustomContent();
        NotificationCompat.Builder mBuilder =
                new NotificationCompat.Builder(context)
                        .setSmallIcon(R.drawable.ic_stat_gcm)
                        .setContentTitle("TENCENT Notification")
                        .setStyle(new NotificationCompat.BigTextStyle().bigText(text))
                        .setContentText(text);

        mBuilder.setContentIntent(contentIntent);
        notificationManager.notify(XgListener.NOTIFICATION_ID, mBuilder.build());
    }
}
```

**AndroidManifest.xml**  

PushSdk$XgListener 부분을 위에서 작성한 커스텀 클래스로 변경한다.

```
	...
	<receiver android:name="com.toast.cloud.push.demo.app.XgListener">
		<intent-filter>
			<action android:name="com.tencent.android.tpush.action.PUSH_MESSAGE" />
			<action android:name="com.tencent.android.tpush.action.FEEDBACK" />
		</intent-filter>
	</receiver>
	...
```

## 토큰 조회

APPKEY, UID, options로 등록된 Token을 조회할 수 있다.
요청의 결과로 아래 { 키 : 값 } 이 반환된다.

```
{
    "channel": "default",
    "pushType" : "GCM",
    "isNotificationAgreement": true,
    "isAdAgreement": true,
    "isNightAdAgreement": true,
    "timezoneId" : "Asia/Seoul",
    "country": "KR",
    "language": "ko",
    "uid" : "User ID",
    "token" : "Token"
}
```

### iOS, APNS

**pushsdk.m**

```
void HandleQuery(int error, NSDictionary* options);
......
NSDictionary* options = @{kTCPushKeyServerUrl : @"https://api-push.cloud.toast.com", // Optional, Default : https://api-push.cloud.toast.com
                            kTCPushKeyPushType : kTCPushTypeAPNS, // Optional, Default : kTCPushTypeAPNS
                            kTCPushKeyTimeout : @(30)}; // Optional, Default : 30
[TCPushSdk queryForAppKey:appKey userId:userId onQuery:^(int error, NSDictionary* options) { // options 매개변수는 nil이면 안됨
	if(!options)
    {
        NSString* token = options[@"token"];
        // TODO Handle a token
    }
	} options:options];
......
```

### Android, GCM, TENCENT

**YourActivity.java**

```
    private void getRegisteredToken(final Map<string, object=""> options) {
        HashMap<String, Object> options = new HashMap<String, Object>() {
            {
                put(PushSdk.KEY_ACTIVITY, MainActivity.this); // Required.
                put(PushSdk.KEY_PUSH_TYPE, pushType); // Optional, Default : PUSH_TYPE_GCM
                put(PushSdk.KEY_TIMEOUT, 30.0); // Optional. Time Unit: Second. Default: 30.
            }
        };
        PushSdk.query(YOUR_APPKEY, YOUR_UID, new PushSdk.OnQuery() {
            @Override
            public void fire(int i, Map<string, object=""> map) {
                String token = (String)map.get("token");
                // TODO Handle a token
            }
        }, options);
    }
```

## 오류 처리

각각의 오류에 대해 다음과 같은 처리를 권장한다.

|에러 코드|	요약|	처리 방법|
|---|---|---|
|ERROR_NONE(0)|	오류 없음|	요청 성공이므로 따로 에러 처리할 필요 없다.|
|ERROR_SYSTEM_FAIL(1)|	푸쉬 알림 시스템 서비스 요청 실패|	기반이 되는 OS나 외부 플랫폼의 서비스 요청(토큰 요청 등)이 실패한 것이다. OS와 플랫폼 라이브러리 버전, 네트워크 상태 등을 체크한 후 재시도해야 한다.|
|ERROR_NETWORK_FAIL(2)|	네트워크 송수신 실패|	토스트 클라우드 서버에 연결하거나, 데이터 송수신 시 에러가 발생한 것으로, 서버와 기기의 네트워크 상태를 체크한 후 재시도할 것.|
|ERROR_SERVER_FAIL(3)|	서버 응답 실패|	서버에서 정상적으로 응답 데이터를 보내줬으나 응답의 결과값이 실패인 경우로서, 요청 시의 데이터나 외부 플랫폼 설정 키 값이 정확한지 체크한 후 수정하여 재시도할 것.|
|ERROR_ALREADY_IN_PROGRESS(4)|	이전 요청 처리 중|	이미 요청한 내용을 실행 중인 상태로, 응답 콜백이 불린 후 재시도할 것.|
|ERROR_INVALID_PARAMETERS(5)|	인자 오류|	요청 인자에 잘못된 값이 있는 경우로, 인자에 누락된 키나 틀린 값이 없는지 체크한 후 수정하여 재시도할 것.|
|ERROR_PERMISSION_REQUIRED(6)|	인자 오류|	요청 인자에 잘못된 값이 있는 경우로, 인자에 누락된 키나 틀린 값이 없는지 체크한 후 수정하여 재시도할 것.|

<br/>
<br/>
<br/>

* *문서 수정 내역*
    * *(2017.02.23) 텐센트 SDK 버전 업데이트 (2.39 -> 2.47)*
    * *(2017.02.23) 텐센트 AndroidManifest.xml 일부 권한 추가*
