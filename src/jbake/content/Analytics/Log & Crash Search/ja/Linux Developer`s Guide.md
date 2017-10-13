title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Analytics > Log&Crash Search > Linux Developer's Guide

Log & Crash C++ Linux SDKはLog & Crash Search収集サーバーにログを送信する機能を提供します。
Log & Crash C++ Linux SDKの特徴は次の通りです。

- ログを収集してサーバーに送信します。
- C++ Linux SDKはクラッシュログを収集しません。
- Log & Crash Searchから送られたログの照会/検索ができます。
- マルチスレッディング環境で動作します。

## 動作環境

- Linux, glibc >= 2.0.0
- 32bit/64bit
- openssl >= 1.0.1e
- libcurl >= 7.19.7

## ダウンロード

Toast CloudからC++ Linux SDKをダウンロードできます。

```
[DOCUMENTS] > [Download] > [Analytics > Log & Crash Search] > [Linux SDK]をクリック
```

## インストール

### 構成

C++ Linux SDKは、次のように構成されています。

```
...
docs/					; C++ Linux SDKドキュメント
include/toast/logncrash.h	; C++ヘッダファイル
linux-sdk/lib32/			; C++ Linux 32bitライブラリ
linux-sdk/lib64/			; C++ Linux 64bitライブラリ
linux-sdk-sample/			; C++ Linux SDKサンプル
...
```

### SDKサンプル

一緒に提供されているlinux-sdk-sample/について説明します。

1. linux-sdk-sample/ディレクトリに移動します。
2. sample.cppを開いて発行されたアプリケーションキーに修正します。
3. makeを実行して、sample-x86、sample-x86_64実行ファイルを生成します。
	- 個別にビルドするためには、make sample-x86、make sample-x86_64コマンドを使用してください。
	- x86、x86_64ビルド環境については、ご利用のLinuxディストリビューションのドキュメントを参照してください。
4. ビルドされた実行ファイルを実行します。

## 使用例

1. include/toast/をインクルードパスに入れます。
2. ターゲットに応じてlib32/liblogncrash_linux.aまたはlib64/liblogncrash_linux.aをリンクします。
	- liblogncrash_linux.aは内部的にpthreadを使用しています。したがって-lpthread link optionが必要です。
3. toast/logncrash.hをインクルードして、ToastLog classを使用します。

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
#define LOGNCRASH_COLLECTOR_ADDR  "http://api-logncrash.cloud.toast.com"
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
		- Log & Crash収集サーバー：http://api-logncrash.cloud.toast.com
	- collectorPort：収集サーバーポート
	- logSource：ログソース
	- logType：ログタイプ
- initialize()の戻り値
	- LOGNCRASH_LOG_OK：0、初期化に成功
	- LOGNCRASH_LOG_ERROR：-1、内部エラーコード
	- LOGNCRASH_LOG_ERROR_APPKEY：-2、アプリケーションキーが間違っている場合
	- LOGNCRASH_LOG_ERROR_VERSION：-3、バージョンが間違っている場合
	- LOGNCRASH_LOG_ERROR_ADDRESS：-4、収集サーバーのアドレスが間違っている場合
	- LOGNCRASH_LOG_ERROR_PORT：-5、収集サーバーのポートが間違っている場合

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
	- logLevel：送信logLevel.setLogLevel()で指定されたlogLevelよりも大きいlogLevelは送信できません。
	- message：送信するメッセージ。
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

- ToastLog instanceのlogLevelを入手するか、指定します。
- ToastLogのデフォルトはLOGNCRASH_INFOです。したがってdebug()関数を使用するにはsetLogLevel(LOGNCRASH_DEBUG)に設定する必要があります。

### カスタムキーを指定

```
bool addCustomKey(const char* key, const char* value);

void removeCustomKey(const char* key);

void clearCustomKeys();
```

- カスタムキーを追加/削除/全て削除機能を提供します。
- カスタムキーは、大文字か小文字で始まり、大文字と小文字、数字、「 - 」、「\ _」のみを使用できます。 ( [A-Za-z][A-Za-z0-9-_]* )
- カスタムキーは、最大64文字です。
- カスタムキーは、大文字と小文字に関わらず、次の名前は使用できません。
	- projectname, projectversion, host, body, logsource, logtype
	- logType, sendTime, logLevel, userId, platform
	- dmpdata, dmpreport
- addCustomKey()の戻り値
	- 成功時true。
	- key形式が合わない場合、追加失敗時false。

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

- Linux SDKは、クラッシュログの収集をしません。
- openCrashCatcher戻り値
	- 常にfalse。

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
