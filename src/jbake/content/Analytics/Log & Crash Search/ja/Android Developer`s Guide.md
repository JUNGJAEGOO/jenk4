title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Analytics > Log&Crash Search > Android Developer's Guide

Log & Crash Android SDKはLog & Crash Search収集サーバーにログを送信する機能を提供します。  
Log & Crash Android SDKの特徴は次の通りです。  

- ログを収集してサーバーに送信します。
- アプリで発生したクラッシュログを収集サーバーに送信します。
- Log & Crash Searchから送られたログの照会/検索ができます。
- マルチスレッディング環境で動作します。

## 動作環境

- Android 2.3.3、API Level 10以上

## ダウンロード

[Toast Cloud](http://docs.cloud.toast.com/ko/Download/)からAndroid SDKをダウンロードできます。

```
[DOCUMENTS] > [Download] > [Analytics > Log & Crash Search] > [Android SDK]をクリック
```

## インストール

### 構成

Android SDKは次のように構成されています。

```
docs/       ; Android SDKドキュメント
libs/       ; Android SDKライブラリ
sample/     ; Android SDKサンプル
```

### SDKサンプル

一緒に提供されるsample/について説明します。

1. libs/をsample/libs/にコピーします。
2. Eclipseを開いて「File - New - Android - Android Project from Existing Code」でsample/を開きます。
   - AndroidStudioでは「File - New - Import Project...」を使用します。
3. ToastLogSample.javaを開いてonCreate()でアプリケーションキー、収集サーバーのアドレスを修正します。バージョン、ログソース、ログタイプなどを修正すると、検索に役立ちます。
4. 実行します。
5. Initializeボタンを押して開始します。
6. debug、info、warn、error、fatalボタンをクリックしてログを送信します。
7. send crash、crashボタンを押して、クラッシュログを送信します。 send crashボタンはクラッシュログのみ送信する機能です。 crashボタンは、強制的にcrashを発生させアプリ終了と同時にクラッシュログを送信します。

### 使用例

1. Android SDKのlibs/を、プロジェクトlibs/にコピーします。
2. AndroidManifest.xmlファイルに権限を追加します。

- ネットワークの状態、デバイス情報、キャリア、Logcatなどの情報を取得するために権限が必要です。

```
<!-- ログ送信のためのインターネットアクセス権限(必須) -->
<uses-permission android:name="android.permission.INTERNET" />

<!-- プラットフォーム、キャリアなど携帯電話の情報にアクセスするための権限(必須) -->
<uses-permission android:name="android.permission.READ_PHONE_STATE" />

<!-- ネットワーク状態にアクセスするための権限(必須) -->
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />

<!-- ネットワーク接続がない場合、ファイルにログを保存するための権限(オプション) -->
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />

<!-- Logcatにアクセスするための権限(オプション) -->
<uses-permission android:name="android.permission.READ_LOGS" />

<application
      ......
```

3. 提供されているToastLog classを使用してログを送信します。

- ToastLog.initialize()を実行して初期化します。
- debug()/info()/warn()/error()/fatal()関数を使用して、該当logLevelログを収集サーバーに送信します。
- アプリのクラッシュが発生した場合、クラッシュログが収集サーバーに送信されます。

```
.....
public class MainActivity extends Activity {
  .....
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    .....
  if (ToastLog.initialize(getApplication(), "__収集サーバー_アドレス__",0,"__アプリケーションキー__","__バージョン__") {
   // 初期化成功
      ToastLog.info("Init Success")
    } else {
   // 初期化失敗
    }
    .....
  }
}
.....
```

## API List

com.toast.android.logncrash.ToastLog classで提供される機能を説明します。

### 初期化

```
public static final String DEFAULT_APP_KEY = "__app_key__";
public static final String DEFAULT_VERSION = "1.0.0";
public static final String DEFAULT_COLLECTOR_ADDR = "http://api-logncrash.cloud.toast.com";
public static final int DEFAULT_COLLECTOR_PORT = 0;
public static final String DEFAULT_LOG_SOURCE = "logncrash-logSource";
public static final String DEFAULT_LOG_TYPE = "logncrash-logType";

public static boolean initialize(Application application, String collectorAddr, int collectorPort, String appKey, String version, String userId);

public static boolean initialize(Application application, String collectorAddr, int collectorPort, String appKey, String version);

public static boolean initialize(Application application, String collectorAddr, int collectorPort, String appKey, String version, boolean syncStart);
```

- ToastLogを初期化します。
- ToastLog機能が正常に動作するためには、必ず呼び出す必要があります。
- パラメータ
	- application : Android Application情報。 getApplication()の戻り値を入れます。
	- collectorAddr : 収集サーバーのアドレス
		- HTTP収集サーバー : http://api-logncrash.cloud.toast.com
	- collectorPort : 収集サーバーのポート情報、0に設定すると、各protocolデフォルトのポートが使用されます。
		- HTTP : 80
	- appKey : アプリケーションキー
	- version : アプリバージョン
	- userId : ユーザーID
 - syncStart : trueの場合に発生したログは、startSendThreadが呼び出されるまでサーバーに送信せず、キューに格納します。ただしCrashが発生した場合、ThreadLockを解除にして、ログを送信します。
- 戻り値
	- 初期化成功時 true
	- 失敗時 false

### SendThreadロック解除
```
  	(void) startSendThread;
```
 - SendThreadのロック状態を解除します。

### 初期化の注意事項
 - Application onCreateで初期化する場合
 	- Application onCreateはレシーバー、サービス、アクティビティが生成される時に呼び出されるので、意図しない呼び出しが発生する可能性があります。

```
public static boolean isInitialized()
```

- ToastLogが初期化されたかどうかを返します。
- 戻り値
	- 初期化されていれば true
	- 初期化されていなければ false

### ログ送信

```
public static void fatal(String message, Throwable t)
public static void error(String message, Throwable t)
public static void warn(String message, Throwable t)
public static void info(String message, Throwable t)
public static void debug(String message, Throwable t)

public static void fatal(String message)
public static void error(String message)
public static void warn(String message)
public static void info(String message)
public static void debug(String message)
```

- 指定したログレベルで収集サーバーにログを送信します。
- パラメータ
	- message : ログメッセージ。 nullや ""の場合は、基本メッセージが送信されます。
	- Throwable t : 収集されたエラーを一緒に送信します。 nullを使用できます。
		- エラーを一緒に送信するとHandledログに分類されます。

```
public static void crash(String message, Throwable t)
```

- 実行時に発生したExceptionを収集サーバーに送信します。
- パラメータ
	- message : ログメッセージ。 nullや ""の場合は、基本メッセージが送信されます。
	- Throwable t : 収集されたエラーを一緒に送信します。
		- エラーを一緒に送信すると、クラッシュログに分類されます。

errorCode、locationなどの情報をThrowableで調査するようにアップグレードされ、次のMethodが非推奨になりました。

```
public static void fatal(String errorCode, String message, String location)
public static void error(String errorCode, String message, String location)
public static void warn(String errorCode, String message, String location)
public static void info(String errorCode, String message, String location)
public static void debug(String errorCode, String message, String location)

public static void fatal(String errorCode, String message)
public static void error(String errorCode, String message)
public static void warn(String errorCode, String message)
public static void info(String errorCode, String message)
public static void debug(String errorCode, String message)

public static void crash(Throwable throwable, String errorCode, String message, String location)
public static void crash(Throwable throwable, String errorCode, String message)
```

### カスタムキーを指定する

```
public static void addCustomField(String key, String value)

public static void removeCustomField(String key)

public static void clearCustomFields()
```

- カスタムキーを追加/削除/全て削除機能を提供します。
- カスタムキーは、大文字か小文字で始まり、大文字と小文字、数字、「 - 」、「_」のみ使用できます。 ( [A-Za-z][A-Za-z0-9_-]* )
- カスタムキーは、大文字/小文字に関わらず、次の名前は使用できません。
	- "projectName", "projectVersion", "body"
	- "logSource", "logType", "host", "sendTime", "logLevel"
	- "DmpData", "Platform", "NeloSDK", "Exception", "Location", "Cause"
	- "SessionID", "UserID"
	- "Carrier", "CountyCode", "DeviceModel", "Locale", "NetworkType", "Rooted"
	- "LogcatMain", "LogcatRadio", "LogcatEvents"

### 基本設定管理

```
public static String getAppKey()
public static String getVersion()
public static String getCollectorAddr()
public static int getCollectorPort()
```

- 初期化に使用されたアプリケーションキー、バージョン、収集サーバーのアドレス、収集サーバーポートを取得します。

```
public static String getLogSource()
public static void setLogSource(String logSource)
```

- ログソースを取得したり、新たに指定したりします。

```
public static String getLogType()
public static void setLogType(String logType)
```

- ログタイプを取得したり、新たに指定したりします。

### Android専用の機能

```
public static boolean getEnableLogcatMain()
public static void setEnableLogcatMain(boolean enable)

public static boolean getEnableLogcatRadio()
public static void setEnableLogcatRadio(boolean enable)

public static boolean getEnableLogcatEvents()
public static void setEnableLogcatEvents(boolean enable)
```

- Logcat Main/Radio/Events内容を一緒に送信するかを取得したり、設定したりします。
- 基本値はfalseです。

```
public static void clearLogcat()
```

- Android端末のLogcat内容をすべてクリアします。

### 重複除去モードの設定

2. 4.0以上のSDKから一般ログに重複除去ロジックが適用されました。

重複ログ機能がオンになっている場合、bodyとlogLevelの内容が同じログが発生した場合、送信しません。

```
public static void setDuplicate(bool enable)
```

true:(Default値)重複除去ロジックを有効にする
false: 重複除去ロジックを無効にする

## SDKサンプルを利用したProguardテスト

Androidで提供されるProguardを通じてコード難読化をテストする方法を説明します。  
Proguardを適用するためには、Releaseでプロジェクトを作成する必要があります。これに必要なキーストア、Proguard設定などがsample/に含まれています。  


### Eclipseを使用してProguardテスト

1. libs/をsample/libs/にコピーします。
2. Eclipseを起動して、プロジェクトを選択し、メニューから「エクスポート」を選択します。
3. エクスポートウィンドウが表示されたら「Android - Export Android Application」を選択します。
4. プロジェクト名を確認し、「Next」をクリックして、Keystore選択で 「mykey.keystore」を選択します。 Keystoreパスワード「abcdefg」、Alias名「mykey」、Aliasパスワード「abcdefg」に設定されています。詳細については、[こちら](http://developer.android.com/tools/publishing/app-signing.html)をご覧ください。
5. 保存先のパスを指定します。
6. 保存された.apkファイルを「adb install <ファイル名>」で、デバイスにインストールします。
7. 実行してInitializeボタンを押した後、crashボタンを押して、クラッシュログを発生させます。 sampleはToastLogSample.clickCrash()メンバーファンクションが難読化されており、正常にログが発生しません。

正常にProguardが動いている状態では「proguard/mapping.txt」が生成されます。

1. Console - Analytics - Log & Crash - Settings - シンボルファイルでmapping.txtを追加します。この時、プロジェクトのバージョンを必ず同じにする必要があります。
2. アプリからクラッシュログを送信します。 Proguardが解除されたログは「DmpData」フィールドの「表示」をクリックすると確認できます。
3. ToastLogSample.clickCrash()の名前が正しく表示されるかを確認します。

### Antビルドを使用してProguardテスト

1. libs/をsample/libs/にコピーします。
2. build.xmlがない場合、「android update project -p . -n AndroidSDKSample」コマンドで生成します。
3. 「ant clean release」でビルドします。結果はbin/の中に「AndroidSDKSampe-release.apk」という名前で保存されます。

Antを使用して、Releaseビルドをする場合、Eclipse Releaseビルドとは異なり、mapping.txt位置が 「bin/proguard/mapping.txt」です。

### AndroidStudioを使用してProguardテスト

1. libs/をsample/libs/にコピーします。
2. AndroidStudioを起動し、メニューから 「File - New - Import Project 」を実行して、新しい位置にAndroidStudioプロジェクトを作成します。
3. 既存のソースから、新たに作成されたプロジェクトに「mykey.keystore」をコピーします。
4. 「Build - Generate Signed APK 」を実行します。最初のページでModuleを確認し、[Next]をクリックします。次のページのKey store pathを「mykey.keystore」に指定し、Keystoreパスワード「abcdefg」、Alias名「mykey」、Aliasパスワード「abcdefg」と指定した後、[Next]をクリックします。3番目のページでAPK Destination Folderを確認し、[Finish]をクリックします。
5. 生成された.apkをインストールします。

AndroidStudioを利用してReleaseビルドをするとmapping.txtの位置は「app/build/outputs/mapping/release/mapping.txt」です。

## JNI適用ガイド

[Android NDK](http://developer.android.com/tools/sdk/ndk/index.html)を利用して、[JNI](http://en.wikipedia.org/wiki/Java_Native_Interface)を使用する際、Android SDKを活用する方法について説明します。
Log & Crash Android SDKは、Java上でExceptionをCatchすることができる状況でのみ正常に動作します。そのため、作成されたNative Codeでエラー発生時、エラーを伝達するクラスを作成する必要があります。
例えば以下のようにgetString関数が実行される過程でエラーが発生した場合、try/catch構文を使用して、ErrorをCatchした後、Javaコードで例外を生成してThrowすれば、Javaからエラーを取得してログに送信します。  

**JNI code**

```
.....
// Native Code
void throwArithmeticError(JNIEnv *env, char *message) {
  jclass exClass;
  char *className = "java/lang/ArithmeticException: / by zero";
  exClass = (*env)->FindClass(env, className);
  if (exClass == NULL) {
    return throwNoClassDefError(env, className);
  }
  (*env)->ThrowNew(env, exClass, message);
}

JNIEXPORT JNICALL jstring Java_com_example_jnitest_HelloJNI_getString(JNIEnv *env, jobject object) {
  if (...) {
    return str;
  } else {
    //On Error
    throwArithmeticError(env, "THIS IS JNI EXCEPTION");
  }
}
.....

**Java Code**

.....
// Java Code
try{
  mTextView.setText( new HelloJNI().getString() );
} catch(Throwable e){
  ToastLog.crash(e, "JNI ERROR", "JNI ERROR MESSAGE - Throw Error");
}
.....
```

Segment falutのようなSystem CrashをキャッチするにはNative CodeでSignalをキャッチする構文を追加してください。
以下の例は、[こちら](http://stackoverflow.com/questions/1083154/how-can-i-catch-sigsegv-segmentation-fault-and-get-a-stack-trace-under-jni-on)を参考に作成されてます。

**Native Code**

```
.....
//Native Code
JNIEXPORT jint android_sigaction(int signal, siginfo_t *info, void *reserved) {
  old_sa[signal].sa_handler(signal);
  return throwNoClassDefError(env, "THIS android_sigaction ACTION");
}

JNIEXPORT jint JNICALL JNI_OnLoad(JavaVM *jvm, void *reserved) {
  jclass cls, vcls;
  if ((*jvm)->GetEnv(jvm, (void **) &env, JNI_VERSION_1_2))
    return JNI_ERR;

  // Try to catch crashes...
  struct sigaction handler;
  memset(&handler, 0, sizeof(sigaction));
  handler.sa_sigaction = android_sigaction;
  handler.sa_flags = SA_RESETHAND;

  #define CATCHSIG(X) sigaction(X, &handler, &old_sa[X])
  CATCHSIG(SIGILL);
  CATCHSIG(SIGABRT);
  CATCHSIG(SIGBUS);
  CATCHSIG(SIGFPE);
  CATCHSIG(SIGSEGV);
  CATCHSIG(SIGSTKFLT);
  CATCHSIG(SIGPIPE);

  return JNI_VERSION_1_2;
}

jint throwNoClassDefError(JNIEnv *env, char *message) {
  jclass exClass;
  char *className = "java/lang/NoClassDefFoundError";

  exClass = (*env)->FindClass(env, className);
  if (exClass == NULL) {
    return throwNoClassDefError(env, className);
  }
  (*env)->ThrowNew(env, exClass, message);
}
.....
```
