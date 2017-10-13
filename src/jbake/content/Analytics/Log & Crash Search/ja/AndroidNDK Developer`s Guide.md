title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Analytics > Log&Crash Search > AndroidNDK Developer's Guide

Log & Crash AndroidNDK SDKはLog & Crash Search収集サーバーにログを送信する機能を提供します。  
Log & Crash AndroidNDK SDKの特徴は次の通りです。  

- ログを収集してサーバーに送信します。
- アプリで発生したクラッシュログを収集サーバーに送信します。
- Log & Crash Searchから送られたログの照会/検索ができます。
- マルチスレッディング環境で動作します。

## 動作環境

- Android 2.3.3、API Level 10以上
- AndroidNDK最新バージョン推奨
- サポート ABI : armeabi、armeabi-v7a、x86

## ダウンロード

[Toast Cloud](http://docs.cloud.toast.com/ko/Download/)からAndroid SDKをダウンロードできます。

```
[DOCUMENTS] > [Download] > [Analytics > Log & Crash Search] > [AndroidNDK SDK]をクリック
```

## インストール

### 構成

AndroidNDK SDKは、次のように構成されています。

```
docs/                       ; AndroidNDK SDKドキュメント
include/toast/logncrash.h   ; C++ ヘッダファイル
androidndk-sdk/
    obj/                    ; AndroidNDK SDK Staticライブラリ
    PrebuiltStaticLib.mk    ; Staticライブラリmkファイル
    libs/                   ; AndroidNDK SDK Sharedライブラリ
    PrebuiltSharedLib.mk    ; Sharedライブラリmkファイル
androidndk-sdk-sample/      ; Android JNIサンプル
```

### SDKサンプル

一緒に提供されるandroidndk-sdk-sample/について説明します。

1. androidndk-sdk-sample/に移動します。
2. 「<ndk_path >/ndk-build」でNDK部分をビルドします。
3. EclipseでAndroid projectを開きます。
4. AndroidNDKSample.javaを開いて発行されたアプリケーションキーに修正します。
5. 実行します。

クラッシュログをLog & Crash Searchで表示するにはシンボルファイルを追加する必要があります。

1. 「obj/local/<abi >/liblogncrashjni_sample.so」をzipに圧縮します。
2. Toast Cloud Consoleで「Analytics - Log & Crash Search - Settings - シンボルファイル」に移動して、zipファイルを追加します。この時、androidndk-sdk-sampleと同じプロジェクトのバージョンで追加します。
3. androidndk-sdk-sampleを実行して、クラッシュログを発生させます。
	- クラッシュを発生させるために、「Initialize」ボタンを押して、「Test 2」ボタンを押します。
	- Toast Cloud ConsoleでAnalytics - Log & Crash Search - Log Searchのクラッシュログが到着したことを確認して、「DmpData」フィールドにある「表示」をクリックして確認します。
4. 「DmpData」フィールドの「表示」が動作しない場合は、次の事項をチェックする必要があります。
	- クラッシュログとシンボル間でプロジェクトのバージョンが合っているか
	- シンボルファイルを間違えていないか

## 使用例

1.jni/Application.mkに次の内容を追加します。

```
 ...
 APP_ABI := armeabi armeabi-v7a x86
 APP_PLATFORM := android-9
 APP_STL := gnustl_static
 ...
```

2.jni/Android.mkに次の内容を追加します。

```
 ...
 LOCAL_STATIC_LIBRARIES := logncrash_androidndk_static
 ...
 include $(LOCAL_PATH)/<androidndk_sdk_path>/androidndk-sdk/PrebuiltStaticLib.mk
```

- Sharedライブラリを使用するには次のように宣言します。

```
  ...
  LOCAL_SHARED_LIBRARIES := logncrash_androidndk
  ...
  include $(LOCAL_PATH)/<androidndk_sdk_path>/androidndk-sdk/PrebuiltSharedLib.mk
```

3.toast/logncrash.hをインクルードして、ToastLog classを使用します。

```
 ...
 #include "toast/logncrash.h"
 ...

     ToastLog* log = GetToastLog();

     if (LOGNCRASH_LOG_OK != log->initialize(APP_KEY, VERSION, COLLECTOR_ADDR, COLLECTOR_PORT)) {
         fprintf(stderr, "ERROR in initialize()\n");
         return -1;
     }

     if (!log->info("info() TEST 1")) {
         fprintf(stderr, "ERROR in info()\n");
     }
     ...

     DestroyToastLog();
```

4.「<ndk_path >/ndk-build」でNDK部分をビルドします。

5.AndroidNDK SDKが正常に動作するためにAndroidManifest.xmlに以下のパーミッションを与える必要があります。

```
 ...
 <uses-permission android:name="android.permission.INTERNET"/>
 <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
 <uses-permission android:name="android.permission.MOUNT_UNMOUNT_FILESYSTEMS"/>
 ...
```

6.JNIライブラリを読み込みます。

```
static {
     System.loadLibrary("logncrashjni_sample");
 }
```

- Sharedライブラリを使用の際は、あらかじめliblogncrash_androidndk.soをロードする必要があります。

```
static {
      System.loadLibrary("logncrash_androidndk");
      System.loadLibrary("logncrashjni_sample");
  }
```

AndroidNDK SDKはJava Exceptionを処理することができません。 AndroidNDK SDKは、C++ Native codeのために作られているためです。  
androidndk-sdk-sample/jni/Android.mkファイルとAndroidNDKに含まれている文書( 「<ndk_path >/docs/」)を参照してください。

## API List

toast::logncrash::ToastLog classで提供している機能を説明します。

### ToastLogインスタンスの割り当て/解除

```
toast::logncrash::ToastLog* GetToastLog();

void DestroyToastLog();
```

- ToastLog instanceを割り当てて解除します。
- シングルトーン方式で1つのインスタンスのみが返されます。
- 返されたToastLog instanceに対してdeleteをしないでください。削除するには、必ずDestroyToastLog()を呼び出してください。

### 初期化/解除

```
#define LOGNCRASH_VERSION         "1.0.0"
#define LOGNCRASH_COLLECTOR_ADDR  "api-logncrash.cloud.toast.com"
#define LOGNCRASH_COLLECTOR_PORT  80
#ifdef WIN32
#define LOGNCRASH_LOGSOURCE       "logncrash-windows"
#else   //#ifdef WIN32
#define LOGNCRASH_LOGSOURCE       "logncrash-linux"
#endif  //#ifdef WIN32
#define LOGNCRASH_LOGTYPE         "logncrash-log"

#define LOGNCRASH_LOG_OK            0
#define LOGNCRASH_LOG_ERROR         -1
#define LOGNCRASH_LOG_ERROR_APPKEY  -2
#define LOGNCRASH_LOG_ERROR_VERSION -3
#define LOGNCRASH_LOG_ERROR_ADDRESS -4
#define LOGNCRASH_LOG_ERROR_PORT    -5

int32_t initialize(
  const char* appKey,
  const char* version = LOGNCRASH_VERSION,
  const char* collectorAddr = LOGNCRASH_COLLECTOR_ADDR,
  const uint16_t collectorPort = LOGNCRASH_COLLECTOR_PORT,
  const char* logSource = LOGNCRASH_LOGSOURCE,
  const char* logType = LOGNCRASH_LOGTYPE);

void destroy();
```

- ToastLogを初期化して解除します。
- ToastLog機能が正常に動作するためには、必ずinitialize()を呼び出す必要があります。
- パラメータ
	- appKey：アプリケーションキー
	- version：アプリバージョン
	- collectorAddr：収集サーバーのアドレス
		- Log & Crash収集サーバー：api-logncrash.cloud.toast.com
	- collectorPort：収集サーバーポート
	- logSource：ログソース
	- logType：ログタイプ
- clientHost：Hostを取得する方式
		- true：ioctl方式を使用してclientからhostを取得
		- false：serverから渡された値でhostを取得
	- asyncStart：SendThreadをLockさせた状態で開始します。Lock状態でログが発生した場合、サーバーに送信せずにキューに格納して待機。Crashが発生したり、StartSendThread関数を実行した場合はLock解除。
- initialize()の戻り値
	- LOGNCRASH_LOG_OK：0、初期化に成功
	- LOGNCRASH_LOG_ERROR：-1、内部エラーコード
	- LOGNCRASH_LOG_ERROR_APPKEY：-2、アプリケーションキーが間違っている場合
	- LOGNCRASH_LOG_ERROR_VERSION：-3、バージョンが間違っている場合
	- LOGNCRASH_LOG_ERROR_ADDRESS：-4、収集サーバーのアドレスが間違っている場合
	- LOGNCRASH_LOG_ERROR_PORT：-5、収集サーバーのポートが間違っている場合

### SendThread Lock状態解除

```
  	void StartSendThread();
```

 - SendThreadを送信可能な状態に変更

### ログ送信

```
bool sendLog(
    const LogNCrashLogLevel logLevel,
    const char* message,
    const char* errorCode = NULL,
    const char* location = NULL);
```

- 指定されたlogLevelでログを送信します。
- パラメータ
	- logLevel：送信logLevel.setLogLevel()で指定されたlogLevelよりも大きいlogLevelは送信ができません。
	- message：送信するメッセージ
	- errorCode：エラーコード。 NULLまたは ""を使えば送信されません。
	- location：エラーの場所。 NULLまたは ""を使えば送信されません。
- 戻り値
	- 成功時true。
	- logLevelが大きかったり、messageが空の場合はfalse。
- 参照
	- setLogLevel(), getLogLevel();

```
bool debug(const char* message, const char* errorCode = NULL, const char* location = NULL);

bool info(const char* message, const char* errorCode = NULL, const char* location = NULL);

bool warn(const char* message, const char* errorCode = NULL, const char* location = NULL);

bool error(const char* message, const char* errorCode = NULL, const char* location = NULL);

bool fatal(const char* message, const char* errorCode = NULL, const char* location = NULL);
```

- 決められたDEBUG、INFO、WARN、ERROR、FATALログを送信します。
- logLevelが固定されているという点以外はsendLog()と同じです。
- 戻り値
	- 成功時true。
	- logLevelが大きかったり、messageが空の場合はfalse。

### ログレベルを指定

```
typedef enum {
    LOGNCRASH_FATAL   = 0,
    LOGNCRASH_ERROR   = 3,
    LOGNCRASH_WARN    = 4,
    LOGNCRASH_INFO    = 5,
    LOGNCRASH_DEBUG   = 7,
    LOGNCRASH_TRACE   = LOGNCRASH_DEBUG,
} LogNCrashLogLevel;

LogNCrashLogLevel getLogLevel();

void setLogLevel(const LogNCrashLogLevel logLevel);
```

- ToastLog instanceのlogLevelを取得するか、指定します。
- ToastLogのデフォルトはLOGNCRASH_INFOです。したがってdebug()関数を使用するにはsetLogLevel(LOGNCRASH_DEBUG)に設定する必要があります。

### カスタムキーを指定

```
bool addCustomKey(const char* key, const char* value);

void removeCustomKey(const char* key);

void clearCustomKeys();
```

- カスタムキーを追加/削除/全て削除機能を提供します。
- カスタムキーは、大文字か小文字で始まり、大文字と小文字、数字、「 - 」、「_」のみを使用できます。 ( [A-Za-z][A-Za-z0-9-_]* )
- カスタムキーは、最大64文字です。
- カスタムキーは、大文字と小文字に関わらず、次の名前は使用できません。
	- projectname, projectversion, host, body, logsource, logtype
	- logType, sendTime, logLevel, userId, platform
	- dmpdata, dmpreport
- addCustomKey()の戻り値
	- 成功時true。
	- key形式が合わない場合、追加失敗時false。

### ホストタイプを指定

```
bool setHostMode(int mode);
```

- modeが0の場合 : Private IPを取得しhostフィールドを入力します。 Private IPを取得するのに失敗した場合、Public IPにhostフィールドを入力します。
- modeが1の場合 : Public IPにhostフィールドに入力します。

### クラッシュ処理

```
typedef enum {
    LOGNCRASH_LANG_DEFAULT     = 0,
    LOGNCRASH_LANG_ENGLISH     = 1,
    LOGNCRASH_LANG_KOREAN      = 2,
    LOGNCRASH_LANG_JAPANESE    = 3,
    LOGNCRASH_LANG_CHINESE     = 4,
    LOGNCRASH_LANG_CHINESE_TRADITIONAL = 5,
    LOGNCRASH_LANG_CHINESE_SIMPLIFIED  = LOGNCRASH_LANG_CHINESE,
} LogNCrashLangType;

#ifdef WIN32
typedef void (__cdecl *LogNCrashCallbackType)(void *data);
#else   //#ifdef WIN32
typedef void (*LogNCrashCallbackType)(void *data);
#endif  //#ifdef WIN32

bool openCrashCatcher(const bool bBackground = false, const LogNCrashLangType langType = LOGNCRASH_LANG_DEFAULT);
void closeCrashCatcher();

void setCrashCallback(const LogNCrashCallbackType cb, void* cbData = NULL);
```

- クラッシュ処理を開始するか、終了します。
- openCrashCatcherパラメータ
	- bBackground : クラッシュレポーター動作方式を設定します。
	- langType : クラッシュレポーターGUI言語を設定します。
- openCrashCatcher戻り値
	- 設定成功時true。
	- 設定失敗時false。
	- AndroidNDK SDKは端末の/sdcardディレクトリを使用します。端末に上記ディレクトリが存在しない場合、正しく動作しない場合があります。

### 重複除去モードの設定
 - 2.4.0以上SDKから一般ログに重複除去ロジックが適用されました
 - 重複ログ機能がオンになっている場合、bodyとlogLevelの内容が同じログが発生した場合、送信しません。

```
public static void setDuplicate(bool enable)
```
 - true：(Default値)重複除去ロジックを有効にする。

 - false：重複除去ロジックを無効にする。

### その他の設定

```
const char* getUserId();

void setUserId(const char* userId);
```

- ユーザーIDを取得するか、指定します。

```
void enableHostField();

void disableHostField();
```

- Hostフィールドを有効または無効にします。

```
void enablePlatformField();

void disablePlatformField();
```

- Platformフィールドを有効または無効にします。
