title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Analytics > Log&Crash Search > Windows Developer's Guide

Log & Crash C++ Windows SDKは、Log & Crash Search収集サーバーにログを送信する機能を提供します。  
Log & Crash C++ Windows SDKの特徴は次の通りです。

- ログを収集してサーバーに送信します。
- アプリで発生したクラッシュログを収集サーバーに送信します。
- Log & Crash Searchから送られたログの照会/検索ができます。
- マルチスレッディング環境で動作します。

## 動作環境

- Windows 2000、Windows Vista、Windows XP、Windows 2003、Windows 2008、Windows 7、Windows 8
- 32bit/64bit

## ダウンロード

Toast CloudからC++ Windows SDKをダウンローできます。

```
[DOCUMENTS] > [Download] > [Analytics > Log & Crash Search] > [Windows SDK]をクリックします。
```

## インストール

### 構成

C++ Windows SDKには、次のように構成されています。

```
docs/						; C++ Windows SDKドキュメント
include/					; C++ Windows SDK使用例
include/toast/logncrash.h	; C++ヘッダファイル
windows-sdk/lib32/			; C++ Windows 32bitライブラリ
windows-sdk/lib64/			; C++ Windows 64bitライブラリ
windows-sdk-sample/			; VS 2010用サンプルプロジェクト
```

### SDKサンプル

一緒に提供されているwindows-sdk-sample/について説明します。

1. Microsoft Visual Studio 2010を起動して、windows-sdk-sample/Sample.slnを開きます。
2. sample.cppを開いて発行されたアプリケーションキーに修正します。
3. 32bit/64bitとDebug/Releaseに応じてアプリを起動するために必要な\*.dllを実行ファイルのディレクトリにコピーします。
4. 実行します。

## 使用例


1. include/toast/をインクルードパスに入れます。
2. 32bit/64bitとDebug/Releaseに応じて、次のようにImportライブラリを指定します。
	- 32bit, Debug   ; lib32/liblogncrashD.lib
	- 32bit, Release ; lib32/liblogncrash.lib
	- 64bit, Debug   ; lib64/liblogncrashD.lib
	- 64bit, Release ; lib64/liblogncrash.lib
3. アプリ実行のために\*.dllを実行ファイルのディレクトリにコピーします。
4. toast/logncrash.hをインクルードして、ToastLog classを使用します。

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
	- appKey：アプリケーションキー。
	- version：アプリバージョン。
	- collectorAddr：収集サーバーのアドレス。
		- Log & Crash収集サーバー：api-logncrash.cloud.toast.com
	- collectorPort：収集サーバーポート。
	- logSource：ログソース。
	- logType：ログタイプ。
- initialize()の戻り値
	- LOGNCRASH_LOG_OK：0、初期化に成功。
	- LOGNCRASH_LOG_ERROR：-1、内部エラーコード。
	- LOGNCRASH_LOG_ERROR_APPKEY：-2、アプリケーションキーが間違っている場合。
	- LOGNCRASH_LOG_ERROR_VERSION：-3、バージョンが間違っている場合。
	- LOGNCRASH_LOG_ERROR_ADDRESS：-4、収集サーバーのアドレスが間違っている場合。
	- LOGNCRASH_LOG_ERROR_PORT：-5、収集サーバーのポートが間違っている場合。

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
- カスタムキーは、大文字か小文字で始まり、大文字と小文字、数字、「 - 」、「_」のみを使用できます。 ( [A-Za-z][A-Za-z0-9-_]* )
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

bool openCrashCatcher();
void closeCrashCatcher();

void setCrashCallback(const LogNCrashCallbackType cb, void* cbData = NULL);
```

- クラッシュ処理を開始するか、終了します。

### 重複除去モードの設定

- 重複ログ機能がオンになっている場合、bodyとLogLevelの内容が同じログが発生しても送信しません。

```
public static void setDuplicate(bool enable)
```
- true：重複除去ロジックを有効にする。(Default値)
- false：重複除去ロジックを無効にする。

### その他の設定

```
const char* getUserId();

void setUserId(const char* userId);
```

- ユーザーIDを取得するか、指定します。

## シンボルファイルの作成ガイド

### 概要
- Log & Crash Windows SDKで発生したCrashを解析するためには、シンボルファイルを作成して、Webコンソールにアップロードする必要があります。

### 必要なツール
- VSに合わせてdump_symsを使用します( VC_1500 = 2008, VC_1600 = 2010 )
- [VS 2008以下のダウンロード](https://github.com/zpao/v8monkey/blob/master/toolkit/crashreporter/tools/win32/dump_syms_vc1500.exe)
- [VS 2010以上のダウンロード](http://hg.mozilla.org/mozilla-central/file/tip/toolkit/crashreporter/tools/win32)
- [minidump_stackwalk.exe](http://hg.mozilla.org/build/tools/raw-file/755e58ebc9d4/breakpad/win32/minidump_stackwalk.exe)

### シンボルファイルの作成
- windows crash dumpsは.pdbファイルを.symシンボルに変換させてデバッグ情報を得ることができます。
- .pdbファイルを.symファイルに変換させる。
- .pdbファイルを生成します。(プロジェクトのビルド時に生成)

- dump_syms.exeをダウンロードします。

- 次の例のようにdump_symsを実行して、シンボルファイルを生成します。
(エラーが発生していない場合はシンボルファイルの生成に成功しています)
        - CoCreateInstance CLSID_DiaSource failed (msdia*.dll unregistered?)エラーが発生した場合、c:\Program Files\Common Files\Microsoft Shared\VC\に該当dllをコピーします。
    - regsvr32コマンドを使用してdllを登録します。
        ```
        regsvr32 c:\Program Files\Common Files\Microsoft Shared\VC\msdia80.dll.
        ```

    - 0x80004005が発生した場合、管理者権限で再試行します。
        ```
    'dump_syms {.pdbファイル} > {出力ファイル}'
        'dump_syms Sample.pdb > Sample.sym'
        ```

- 作成したシンボルファイルをWebコンソールにアップロードします。
