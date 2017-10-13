title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Analytics > Log&Crash Search > Unity iOS Developer's Guide

Log & Crash Unity SDKはLog & Crash Search収集サーバーにログを送信する機能を提供します。  
Log & Crash Unity SDKは次のような特徴があります。

- ログを収集してサーバーに送信します。
- アプリで発生したクラッシュログを収集サーバーに送信します。
- Log & Crash Searchから送られたログの照会/検索ができます。

## 動作環境

- 共通
	\- Unity3D v4.0 以上
- iOS
	\- An Intel-based Mac
	\- Xcode 6.0 or later

## ダウンロード

[Toast Cloud](http://docs.cloud.toast.com/ko/Download/)でiOS-Unity-Mac SDKをダウンロードできます。

```
[DOCUMENTS] > [Download] > [Analytics > Log & Crash Search] > [iOS-Unity-Mac]
```

## インストール

- ダウンロードしたLog & Crash Unity3D SDK.unitypackageをダブルクリックして、プロジェクトにImportします。


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

## iOS build

1.File->Build Settingsをクリックします。

![](http://static.toastoven.net/prod_logncrash/image023.png)

![](http://static.toastoven.net/prod_logncrash/image024.png)

- iOS Platformを選択した後、Player Settingsをクリックします。

![](http://static.toastoven.net/prod_logncrash/image025.png)

- Target iOS Versionを設定してSimulatorを使用している場合はSDK VersionでSimulator SDKを選択、deviceを使用している場合はDevice SDKを選択し、Build settingsのBuildボタンをクリックします。

2.Buildされたプロジェクトを保存するパスを選択して、[Save]を選択すると、UnityでXcode projectを作成します。

![](http://static.toastoven.net/prod_logncrash/image026.png)

![](http://static.toastoven.net/prod_logncrash/image027.png)

3.生成されたXcode projectをXcodeで開きます。


## iOSのATS(App transport Security)を追加
- ATSはiOS9、OS X 10.11で導入されたアプリとネットワーク間での安全な通信を保障するための機能で、安全に暗号化されたhttps通信のみを許可し、安全ではないhttps/http通信を遮断する機能で、Log & Crash Searchはhttpプロトコルを使用して通信をする際はinfo.plistに以下のような設定を追加する必要があります。

詳細設定は、以下のリンクをご覧ください
- https://developer.apple.com/library/ios/releasenotes/General/WhatsNewIniOS/Articles/iOS9.html


1.全てのhttpを許可する方法

```
<key> NSAppTransportSecurity </key>
<dict>
    <key> NSAllowsArbitraryLoads </key>
   <true />
</dict>
```

2.特定のドメインを許可する方法

```
<key> NSAppTransportSecurity </key>
<dict>
    <key> NSExceptionDomains </key>
    <dict>
           <key> api-logncrash.cloud.toast.com </key>
            <dict>
		 <key>NSTemporaryExceptionAllowsInsecureHttpLoads </key>
		 <true />
	    </dict>

	   <key> setting-logncrash.cloud.toast.com </key>
            <dict>
		 <key>NSTemporaryExceptionAllowsInsecureHttpLoads </key>
		 <true />
	    </dict>

    </dict>
</dict>
```

3.ATS自動設定機能

- Assets > Toast > LogNCrash > Editor > post_process.pyファイルには、iOSビルドする時、info.plistにapi-logncrash.cloud.toast.comとsetting-logncrash.cloud.toast.comを自動的に追加するコードが挿入されています。

## iOS Native Crashを解析
- Unity iOSのCrashはUnity Engineで発生するCrashとiOS Naitveで発生するCrashに区分されます。
- Unityで発生したCrashの場合、Crash情報がStringに収集されるため、Symbolファイルは必要ありません。
- iOSで発生したCrashの場合、Crash情報がアドレス値に収集されるため、これを解析するためのSymbolファイルが必要です。
- Xcodeを実行して、Windows > Organizerをクリックします。
![](http://static.toastoven.net/prod_logncrash/ios_12.png)
- 作成した結果をクリックした後、右クリックして、Show in Finderをクリックします。
![](http://static.toastoven.net/prod_logncrash/ios_13.png)
- 結果をクリックして、右クリックして、「パッケージの内容を表示」をクリックします。
![](http://static.toastoven.net/prod_logncrash/ios_14.png)
- .dSYMを.zipに圧縮して、Webコンソール > Analytic > Log & Crash Search > Settings >シンボルファイルタブに登録します。
![](http://static.toastoven.net/prod_logncrash/ios_15.png)

## iOS Unity Crash注意事項

- シンボルがない未解析のCrashログは、通常のログとして扱われます。
