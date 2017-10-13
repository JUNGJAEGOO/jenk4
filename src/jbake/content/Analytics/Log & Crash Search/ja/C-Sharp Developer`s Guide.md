title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Analytics > Log&Crash Search > C# Developer's Guide

Log & Crash C# Windows SDKは、Log & Crash Search収集サーバーにログを送信する機能を提供します。
Log & Crash C# Windows SDKの特徴は次の通りです。

- C# Windows SDKはC++ Windows SDKをベースに作成されました。
- ログを収集してサーバーに送信します。
- アプリで発生したクラッシュログを収集サーバーに送信します。
- Log & Crash Searchから送られたログの照会/検索ができます。
- マルチスレッディング環境で動作します。

## 動作環境

- .NET Framework 4以降
- 32bit/64bit

## ダウンロード

Toast CloudからC# Windows SDKをダウンロードできます。

```
[DOCUMENTS] > [Download] > [Analytics > Log & Crash Search] > [C# SDK]をクリック
```

## インストール

### 構成

C# Windows SDKは、次のように構成されています。

```
docs\                                   ; C# Windows SDKドキュメント
csharp-sdk\lib\liblogncrash_csharp.dll  ; C# Windowsライブラリ
csharp-sdk\lib32\*                      ; C++ Windows 32bit ライブラリ
csharp-sdk\lib64\*                      ; C++ Windows 64bitライブラリ
csharp-sdk-sample\                      ; VS 2010用サンプルプロジェクト
```

### SDKサンプル

一緒に提供されているcsharp-sdk-sample/について説明します。

1. csharp-sdk\lib32\*ファイルをcsharp-sdk-sample\Sample\bin\Debug、csharp-sdk-sample\Sample\bin\Releaseにコピーします。
2. csharp-sdk\lib64\*ファイルをcsharp-sdk-sample\Sample\bin\x64\Debug、csharp-sdk-sample\Sample\bin\x64\Releaseにコピーします。
3. Microsoft Visual Studio 2010を実行して、csharp-sdk-sample\に含まれているSample.slnを読み込みます。
4. Program.csを開いて発行されたアプリケーションキーに修正します。
5. Referencesにliblogncrash_csharpが含まれていることを確認します。なければ、csharp-sdk\lib\liblogncrash_csharp.dllを追加してください。
6. 状況に応じてDebug/Releaseと、x86/x64を調節して実行します。

## 使用例

1. C#プロジェクトにReferencesにcsharp-sdk/lib/logncrash_csharp.dllを追加します。
2. C#プロジェクト32bit/64bitの設定に応じてlib32/lib64の内容を実行ファイルのディレクトリにコピーします。
3. using Toast.LogNCrash;を追加し、次のようにToastLog classを使用します。

```
 ...
 using Toast.LogNCrash;

 ...
     if (ToastLog.LOG_OK != ToastLog.Initialize(APP_KEY, VERSION))
     {
         Console.WriteLine("FAIL TO initialize()");
         return;
     }

     if (!ToastLog.SendInfo("info() test 1 without host and platform field"))
     {
         Console.WriteLine("fail to info() test 1");
     }

     ToastLog.Destroy();
 ...
```

## API List

Toast.LogNCrash.ToastLog classで提供する機能を説明します。

### 初期化/解除

```
public const string VERSION = "1.0.0";
public const string COLLECTOR_ADDR = "api-logncrash.cloud.toast.com";
public const UInt16 COLLECTOR_PORT = 80;
public const string LOGSOURCE = "logncrash-csharp";
public const string LOGTYPE = "logncrash-log";

public const int LOG_OK = 0;
public const int LOG_ERROR = -1;
public const int LOG_ERROR_APPKEY = -2;
public const int LOG_ERROR_VERSION = -3;
public const int LOG_ERROR_ADDRESS = -4;
public const int LOG_ERROR_PORT = -5;

public static int Initialize(string appKey,
    string version = VERSION,
    string collectorAddr = COLLECTOR_ADDR,
    UInt16 collectorPort = COLLECTOR_PORT,
    string logSource = LOGSOURCE,
    string logType = LOGTYPE);

public static void Destroy();
```

- 初期化と解除を行います。
- 初めて使用する時は、必ずToastLog.Initialize()を呼び出し、終了時にToastLog.Destroy()を呼び出す必要があります。
- ToastLog.Initialize()パラメータ
	- appKey：アプリケーションキー
	- version：アプリバージョン。デフォルトでVERSIONが使用されます。
	- collectorAddr：収集サーバーのアドレス。デフォルトでCOLLECTOR_ADDRが使用されます。
	- collectorPort：収集サーバーのポート。デフォルトでCOLLECTOR_PORTが使用されます。
	- logSource：ログソース。デフォルトでLOGSOURCEが使用されます。
	- logType：ログタイプ。デフォルトでLOGTYPEが使用されます。
- ToastLog.Initialize()の戻り値
	- LOG_OK：0、初期化に成功
	- LOG_ERROR：-1、内部エラーコード
	- LOG_ERROR_APPKEY：-2、アプリケーションキーが間違っている場合
	- LOG_ERROR_VERSION：-3、バージョンが間違っている場合
	- LOG_ERROR_ADDRESS：-4、収集サーバーのアドレスが間違っている場合
	- LOG_ERROR_PORT：-5、収集サーバーのポートが間違っている場合

### ログ送信

```
public static bool SendLog(LogLevel logLevel,
    string message,
    string errorCode = null,
    string location = null);
```

- 指定されたlogLevelでログを送信します。
- パラメータ
	- logLevel：送信logLevel.setLogLevel()で指定されたlogLevelよりも大きいlogLevelは送信ができません。
	- message：送信するメッセージ
- errorCode：エラーコード。 nullや ""を使うと送信されません。
	- location：エラーの場所。 NULLまたは ""を使えば送信されません。
- 戻り値
	- 成功時true。
	- logLevelが大きかったり、messageが空の場合はfalse。
- 参照
	- setLogLevel(), getLogLevel();

```
public static bool SendDebug(string message, string errorCode = null, string location = null);

public static bool SendInfo(string message, string errorCode = null, string location = null);

public static bool SendWarn(string message, string errorCode = null, string location = null);

public static bool SendError(string message, string errorCode = null, string location = null);

public static bool SendFatal(string message, string errorCode = null, string location = null);
```

- 決められたDEBUG、INFO、WARN、ERROR、、FATALログを送信します。
- logLevelが固定されているという点以外はsendLog()と同じです。
- 戻り値
	- 成功時true。
	- logLevelが大きかったり、messageが空の場合はfalse。

### ログレベルを指定

```
public enum LogLevel
{
    FATAL = 0,
    ERROR = 3,
    WARN = 4,
    INFO = 5,
    DEBUG = 7,
    TRACE = DEBUG,
};

public static LogLevel GetLogLevel();

public static void SetLogLevel(LogLevel logLevel);
```

- ToastLogのlogLevelを取得するか、指定します。
- ToastLogのデフォルトはINFOです。したがってSendDebug()関数を使用するにはSetLogLevel(DEBUG)に設定する必要があります。

### カスタムキーを指定

```
public static bool AddCustomKey(string key, string value)

public static void RemoveCustomKey(string key)

public static void ClearCustomKeys()
```

- カスタムキーを追加/削除/全て削除機能を提供します。
- カスタムキーの形式は、大文字から小文字で始まり、大文字と小文字、数字、「 - 」、「_」のみを使用できます。 ( [A-Za-z][A-Za-z0-9-_]* )
- カスタムキーの最大文字数は64です。
- カスタムキーは、大文字と小文字に関わらず、次の名前は使用できません。
	- projectname, projectversion, host, body, logsource, logtype
	- logType, sendTime, logLevel, userId, platform
	- dmpdata, dmpreport
- addCustomKey()の戻り値
	- 成功時true。
	- key形式が合わない場合、追加失敗時false。

### クラッシュ処理

```
public enum LangType
{
    LANG_DEFAULT = 0,
    LANG_ENGLISH = 1,
    LANG_KOREAN = 2,
    LANG_JAPANESE = 3,
    LANG_CHINESE = 4,
    LANG_CHINESE_TRADITIONAL = 5,
    LANG_CHINESE_SIMPLIFIED = LANG_CHINESE,
};

public static bool OpenCrashCatcher(bool bBackground, LangType langType)

public static void CloseCrashCatcher()
```

- クラッシュ処理を開始するか、終了します。

### 重複除去モードの設定
重複ログ機能がオンになっている場合、bodyとlogLevelの内容が同じログが発生した場合、送信しません。

```
	public static void setDuplicate(bool enable)
```

true：重複除去ロジックを有効にする。(Default値)

false：重複除去ロジックを無効にする。

### その他の設定

```
public static string GetUserID()

public static void SetUserId(string userID)
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
- .pdbファイルを生成します。 (プロジェクトのビルド時に生成)

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
