title=About
date=2013-09-24
type=page
status=published
big=TCGame
summary=TCGamebaseAosPush
nation=ko
~~~~~~
## Game > Gamebase > Android Developer's Guide > Push

## Push

### Settings

#### TOAST Cloud Console 등록

*   TCPush 가이드를 참고하여 Console 설정을 합니다.
    *   [LINK [Push > Developer's Guide]](http://docs.cloud.toast.com/ko/Notification/Push/ko/Developer%60s%20Guide/)

#### Download

*   Firebase 푸쉬를 사용하는 경우
    *   다운로드 받은 SDK의 **gamebase-adapter-push-fcm** 폴더를 프로젝트에 추가합니다.
*   Tencent 푸쉬를 사용하는 경우
    *   다운로드 받은 SDK의 **gamebase-adapter-push-tencent** 폴더를 프로젝트에 추가합니다.

> <font color="red">[WARNING]</font>  
> 
> 푸쉬 모듈은 하나만 존재하여야 합니다.  
> Firebase 푸쉬와 Tencent 푸쉬를 둘 다 동시에 프로젝트에 추가하지 마십시오.

#### AndroidManifest.xml

*   Gamebase 푸쉬에 필요한 설정을 추가합니다.

> <font color="red">[WARNING]</font>  
> 
> **${applicationId}**을 **패키지 네임**으로 변경하여야 합니다.

```
_Firebase_

    <manifest>
        ...
        <permission
            android:name="${applicationId}.permission.C2D_MESSAGE"
            android:protectionLevel="signature" />
        <uses-permission android:name="${applicationId}.permission.C2D_MESSAGE" />
        ...
        <application>
        ...
            <provider
                android:name="com.google.firebase.provider.FirebaseInitProvider"
                android:authorities="${applicationId}.firebaseinitprovider"
                android:exported="false"
                android:initOrder="100" />
            <receiver
                android:name="com.google.firebase.iid.FirebaseInstanceIdReceiver"
                android:exported="true"
                android:permission="com.google.android.c2dm.permission.SEND">
                <intent-filter>
                    <action android:name="com.google.android.c2dm.intent.RECEIVE" />
                    <action android:name="com.google.android.c2dm.intent.REGISTRATION" />

                    <category android:name="${applicationId}" />
                </intent-filter>
            </receiver>
        ...
        </application>
    </manifest>
```

```
_Tencent_

    <manifest>
        ...
        <application>
        ...
            <provider
                android:name="com.tencent.android.tpush.XGPushProvider"
                android:authorities="${applicationId}.AUTH_XGPUSH"
                android:exported="true" />
            <provider
                android:name="com.tencent.android.tpush.SettingsContentProvider"
                android:authorities="${applicationId}.TPUSH_PROVIDER"
                android:exported="false" />
            <provider
                android:name="com.tencent.mid.api.MidProvider"
                android:authorities="${applicationId}.TENCENT.MID.V3"
                android:exported="true" />
        ...
        </application>
    </manifest>
```

#### Google Services Settings (Firebase only)

*   Gradle 빌드를 사용하는 경우
    *   Firebase 푸쉬를 사용하기 위해서는 google-services.json 설정파일이 필요합니다.
        *   [LINK [https://firebase.google.com/docs/notifications/android/console-audience#add_firebase_to_your_app]](https://firebase.google.com/docs/notifications/android/console-audience#add_firebase_to_your_app)
        *   위 링크를 참조하여 설정파일을 프로젝트에 포함시킵니다.
    *   gradle 설정에 **apply plugin: 'com.google.gms.google-services'** 를 추가합니다.
    *   위 설정으로 Google Services Gradle Plugin이 적용되어 google-services.json 파일을 res/google-services/{build_type}/values/values.xml 라는 이름의 string resource로 변경하여 사용하게 됩니다.
*   Unity 빌드인 경우
    *   Google Services Gradle Plugin을 사용할 수 없으므로 다음 링크의 설명에 따라 직접 string resource를 만들어 프로젝트에 포함하도록 합니다.
    *   [LINK [https://developers.google.com/android/guides/google-services-plugin#processing_the_json_file]](https://developers.google.com/android/guides/google-services-plugin#processing_the_json_file)
    *   다음은 string resource 파일의 예시입니다.

```
    <!-- res/values/google-services-json.xml -->
    <?xml version="1.0" encoding="utf-8"?>
    <resources>
      <string name="default_web_client_id" translatable="false">000000000000-abcdabcdabcdabcdabcdabcdabcd.apps.googleusercontent.com</string>
      <string name="gcm_defaultSenderId" translatable="false">000000000000</string>
      <string name="firebase_database_url" translatable="false">https://tap-development-00000000.firebaseio.com</string>
      <string name="google_app_id" translatable="false">1:000000000000:android:749cbe01c8ada279</string>
      <string name="google_api_key" translatable="false">AbCd_AbCd_AbCd_AbCd_AbCd_AbCd_AbCd</string>
      <string name="google_storage_bucket" translatable="false">tap-development-00000000.appspot.com</string>
    </resources>
```

#### Initialization

*   Gamebase 초기화시 configuration의 **setPushType()**을 호출합니다.
*   Firebase 푸쉬를 사용하는 경우
    *   추가로 **setFCMSenderId()**를 호출합니다.
*   Tencent 푸쉬를 사용하는 경우
    *   추가로 **setTencentAccessId()**를 호출합니다.
    *   추가로 **setTencentAccessKey()**를 호출합니다.

```
    private static final String PUSH_FCM_SENDER_ID = "...";
    private static final String PUSH_TENCENT_ACCESS_ID = "...";
    private static final String PUSH_TENCENT_ACCESS_KEY = "...";

    TAPConfiguration configuration = new TAPConfiguration.Builder()
            .setAppId(APP_ID)
            .setAppVersion(APP_VERSION)
            .setFCMSenderId(PUSH_FCM_SENDER_ID)             // Firebase는 SenderId가 필요합니다.
            .setTencentAccessId(PUSH_TENCENT_ACCESS_ID)     // Tencent AccessId가 필요합니다.
            .setTencentAccessKey(PUSH_TENCENT_ACCESS_KEY)   // Tencent AccessKey가 필요합니다.
            .build();

    Gamebase.initialize(activity, configuration, new GamebaseDataCallback<LaunchingInfo>() {
        @Override
        public void onCallback(final LaunchingInfo data, GamebaseException exception) {
            ...
        }
    });
```

### Register Push

다음 API를 호출하여, ToastCloud Push에 해당 사용자를 등록합니다.  
Push 동의 여부(enablePush), 광고성 Push 동의 여부(enableAdPush), 야간 광고성 Push 동의 여부(enableAdNightPush)값을 사용자로부터 받아온 후, 다음의 API 호출을 통해 등록을 완료합니다.

    boolean enablePush;
    boolean enableAdPush;
    boolean enableAdNightPush;

    PushConfiguration configuration = new PushConfiguration(enablePush, enableAdPush, enableAdNightPush);

    Gamebase.Push.registerPush(activity, configuration, new GamebaseCallback() {
        @Override
        public void onCallback(GamebaseException exception) {
            if (Gamebase.isSuccess(exception)) {
                // Succeeded.
            } else {
                // Failed.
                Log.e(TAG, "Register push failed- "
                        + "errorCode: " + exception.getCode()
                        + "errorMessage: " + exception.getMessage());
            }
        }
    });

### Request Push Settings

사용자의 Push 설정을 조회하기 위해서, 다음의 API를 이용합니다.  
콜백으로 오는 PushConfiguration 값을 바탕으로, 사용자 설정값을 얻을 수 있습니다.

```
    Gamebase.Push.queryPush(activity, new GamebaseDataCallback<PushConfiguration>() {
        @Override
        public void onCallback(PushConfiguration data, GamebaseException exception) {
            if (Gamebase.isSuccess(exception)) {
                // Succeeded.
                boolean enablePush = data.pushEnabled;
                boolean enableAdPush = data.adAgreement;
                boolean enableAdNightPush = data.adAgreementNight;
            } else {
                // Failed.
                Log.e(TAG, "Query push failed- "
                        + "errorCode: " + exception.getCode()
                        + "errorMessage: " + exception.getMessage());
            }
        }
    });
```

### Error Handling

<table>

<thead>

<tr>

<th>Error</th>

<th>Error Code</th>

<th>Notes</th>

</tr>

</thead>

<tbody>

<tr>

<td>PUSH_EXTERNAL_LIBRARY_ERROR</td>

<td>5101</td>

<td>TCPush 라이브러리 에러입니다.  
DetailCode를 확인하세요.</td>

</tr>

<tr>

<td>PUSH_ALREADY_IN_PROGRESS_ERROR</td>

<td>5102</td>

<td>이전 PUSH API 호출이 완료되지 않았습니다.  
이전 PUSH API의 콜백이 실행된 이후에 다시 호출하세요.</td>

</tr>

<tr>

<td>PUSH_UNKNOWN_ERROR</td>

<td>5999</td>

<td>정의되지 않은 푸시 에러입니다.  
전체 로그를 Gamebase 개발팀에 전달하여 에러상황을 문의해 주세요.</td>

</tr>

</tbody>

</table>

*   전체 에러코드 참조 : [LINK [Entire Error Codes]](../error-codes#client-sdk)

**PUSH_EXTERNAL_LIBRARY_ERROR**

*   이 에러는 TOAST Cloud Push 라이브러리에서 발생한 에러입니다.
*   exception.getDetailCode() 를 통해 TCPush 에러 코드를 확인하여야 합니다.
*   TCPush 에러코드는 다음 문서를 참고하시기 바랍니다.
*   [LINK [Push > Client SDK Developer's Guide > Error Code Guide > 오류 처리]](http://docs.cloud.toast.com/ko/Notification/Push/ko/Client%20SDK%20Guide/#_5)