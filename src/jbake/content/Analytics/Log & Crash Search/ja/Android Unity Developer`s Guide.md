title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Analytics > Log&Crash Search > Unity Android Developer's Guide

Log & Crash Unity SDKはLog & Crash Search収集サーバーにログを送信する機能を提供します。  
Log & Crash Unity SDKは次のような特徴があります。

- ログを収集してサーバーに送信します。
- アプリで発生したクラッシュログを収集サーバーに送信します。
- Log & Crash Searchから送られたログの照会/検索ができます。

## 動作環境

- 共通
	\- Unity3D v4.0 以上
- Android
	\- Android API 2.3.3

## ダウンロード

	[Toast Cloud](http://docs.cloud.toast.com/ko/Download/)からAndroid SDKをダウンロードできます。

	```
	[DOCUMENTS] > [Download] > [Analytics > Log & Crash Search] > [Unity SDK]
	```

## インストール

ダウンロードしたtoast-logncrash-android-unity-sdk.unitypackageをダブルクリックして、プロジェクトにImportします。

### サンプル説明

サンプルは、Assets > LogNCrash > Sample > SampleSceneをダブルクリックして実行します。  
サンプルには、初期化、ログの送信、エラー発生の例が記述されています。

### ヘッダファイルを追加

iOS Unity環境で使用するためには、「TLCLogUnity.h」ファイルを追加します。

## 使用例

1. LogNCrashSettingsで初期化

UnityのメニューバーからLogNCrash > Edit Settingsを選択してLogNCrashSettingsを生成します。 LogNCrashSettingsはAssetDatabaseにユーザーアプリケーションキーおよびSDKの動作を定義します。

- Appkey：ユーザーアプリケーションキー
- URL：コレクタアドレス、http://api-logncrash.cloud.toast.com を使用します。
- Version：ログのバージョン
- Send Warning：Unityで発生したWarningログの収集可否
- Send Error：Unityで発生したErrorログの収集可否
- Send Debug Warning：UnityでユーザがDebugオブジェクトを利用して発生させたWarningログの収集可否
- Send Debug Error：UnityでユーザがDebugオブジェクトを利用して発生させたErrorログの収集可否
- PLCrashreporter Enable：PLCrashrepoterはNative領域で発生したCrashを検出するために追加されたライブラリです。 Native Crash検出が必要な場合にのみ使用します。

LogNCrashSettingsに情報を入力して、LogNCrashオブジェクトのパラメータがないInitialize関数を呼び出すと、LogNCrashSettingsから情報を読み取り、初期化を試みます。

```
using Toast.LogNCrash;
namespace Toast.LogNCrash
{
	public class SampleScript : MonoBehaviour
	{
		void Start ()
		{
			LogNCrash.Initialize ();
		}
	}
}
```

2. Scriptを使用した初期化

LogNCrash.Initializeにパラメータを入力して、初期化を試みます。パラメータはサーバーのアドレス、アプリケーションキー、バージョン、ポート、PLCrashreporter Enable、Send Thread Lockの実行可否についての情報を渡します。

```
using Toast.LogNCrash;
namespace Toast.LogNCrash
{
	public class SampleScript : MonoBehaviour
	{
		void Start ()
		{
			LogNCrash.Initialize ("http://api-logncrash.cloud.toast.com", "appkey", "1.0.0", 80, true, true);
			LogNCrash.StartSendThread ();
		}
	}
}
```

- Appkey：ユーザーアプリケーションキー
- URL：コレクタアドレス、http、httpsのコレクタ情報を設定
- Version：ログのバージョン
- Port：プロトコルに基づいて80、443を設定
- PLCrashreporter Enable：PLCrashrepoterを使用するかどうかを決定します。
- SendThreadLock：trueの場合に発生したログは、StartSendThreadが呼び出されるまでサーバーに送信せずに、キューに格納します。ただしNative Crashが発生した場合はThreadLockを解除して、ログを送信します。

## 詳細API

### カスタムフィールドを指定する

```
public static void AddCustomField(string key, string val)
public static void RemoveCustomField(string key)
public static void RemoveAllCustomFields()
```

- Parameters
	- key: string
		- [in] custom fieldのkey、c​​ustom keyは「A~Z、a~z、0~9、 - \_」の文字を含み、必ずアルファベットか数字で始まる必要があります。
	- value: string
		- [in] custom fieldの値
- Note
	- 次のkeywordはSDKで使用しているため、使用することはできません。
		- projectName
        - projectVersion
        - host
        - body
        - logLevel
        - userID
        - Platform
        - DmpData
        - Unity3D
        - Locale
        - CountryCode
        - SessionID
        - ExceptionType
        - NeloSDK
        - NetworkType
        - DeviceModel
        - @logType
	- custom filedの値がNULLまたは空の場合、SDKsは、そのフィールドをserverに送信しません。

### 基本設定管理

```
public static void SetLogSource(string value)
public static string GetLogSource()
```

- ログソースを取得したり、新たに指定したりします。

```
public static void SetLogType(string value)
public static string GetLogType()
```

- ログタイプを取得したり、新たに指定したりします。

### LEVELフィルタ

- Unity SDKはDefault設定でFATALレベルのログのみを送信します。 Error、Warningレベルのログには、変数の値(時間、パス、進行度など)の挿入により、多くのログが発生することがあります。
	- Send Error：システムで発生したERRORレベルのログを送信します。
	- Send Warning：システムで発生したWARNレベルのログを送信します。
	- Send Debug Error：ユーザーが生成したERRORレベルのログを送信します。
	- Send Debug Warning：ユーザーが生成したWARNレベルのログを送信します。

### APIの使用例
	- html > index.htmlをご覧ください。

### IP Address

```
public static void SetEnableHost:(bool flag)
```
 - true : ip addressを求めhostフィールドに格納します
 - false : hostフィールドに「 - 」を保存します。

 ### ログ送信

 ```
 //send info log message
 public static void Info(string strMsg)

 //send debug log message
 public static void Debug(string strMsg)

 //send warn log message
 public static void Warn(string strMsg)

 //send fatal log message
 public static void Fatal(string strMsg)

 //send error log message
 public static void Error(string strMsg)
 ```

 - Parameters
 	- strMsg: string
 		- [in]転送するlogメッセージ

 ### Handled Exception

 ```
 //send Handled info log message
 public static void Info(string strMsg, Exception e)

 //send Handled debug log message
 public static void Debug(string strMsg, Exception e)

 //send Handled warn log message
 public static void Warn(string strMsg, Exception e)

 //send Handled fatal log message
 public static void Fatal(string strMsg, Exception e)

 //send Handled error log message
 public static void Error(string strMsg, Exception e)
 ```

 ```
 try{
 	// Exception code
 }catch(Exception e){
 	LogNCrash.Info("handled exception message", e)
 }
 ```

 - try & catchで発生したExceptionを送信します。

 ### クラッシュコールバック

 ```
 public void Crash_Send_Complete_Callback(string message) {
 	Debug.Log("Crash_Send_Complete_Callback : " + message);
 }

 void Start() {
 	LogNCrashCallBack.ExceptionDelegate += Crash_Send_Complete_Callback;
 }
 ```
 - ExceptionDelegateはUnity CSharpで発生したCrashをサーバーに送信した後に呼び出されるコールバックです。<br>
 ネイティブCrashの場合は呼び出されません。

 ### ユーザーIDの設定

 ```
 public static void SetUserId(string userID)
 public static string GetUserID()
 ```
 - ユーザーごとの統計を取得するには、必ず設定する必要があります。
 - Parameter
 	- userID：string
 		- [in]各ユーザを区別するuser id

 ### 重複除去モードの設定

 2.4.0以上のSDKから一般ログに重複除去ロジックが適用されました。初期化時に重複除去ロジックが有効になります。

 一般的ログの場合、bodyとlogLevelが同じログで発生した場合は送信しません。

 クラッシュログの場合、stackTraceとconditionの値が同じログが発生した場合は送信しません。

 不要な場合、初期化後に、次の関数を使用して機能を無効にできます。

 ```
 public static void SetDeduplicate(bool flag)
 ```

 true：(Default値)重複除去ロジックを有効にする。  
 false：重複除去ロジックを無効にする。

 ## Android Build方法

 1. File->Build Settingsをクリックします。

 ![](http://static.toastoven.net/prod_logncrash/image023.png)

 ![](http://static.toastoven.net/prod_logncrash/image028.png)

 - Android Platformを選択した後、Player Settingsをクリックします。

 ![](http://static.toastoven.net/prod_logncrash/image029.png)

 - Internet AccessはRequire、Write AccessはExternal(SDCard)に設定します。

 2. Build settingsでBuild And Runをクリックします。

 ## Android Unity Crashを解析する

 - UnityのCrashはUnity Engineで発生するCrashとAndroid Naitveで発生するCrashに区分されます。

 - Proguardが適用されていない場合は、別途のSymbol登録は必要ありません。

 - Proguardが適用された場合、NativeレベルのCrashを解析するためにmapping.txtファイルをWebコンソール > Analytic > Log & Crash Search > Settings >シンボルファイルタブに登録する必要があります。

 - mapping.txtファイルはproguardフォルダの中に作成されます。

 ![](http://static.toastoven.net/prod_logncrash/12.png)

 ## Android Unity Crash注意事項

 - シンボルがない未解析のCrashログは、通常のログとして扱われます。
