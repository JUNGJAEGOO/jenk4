title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Analytics > Log&Crash Search > iOS Developer's Guide

Log & Crash iOS/Mac SDKはLog & Crash Search収集サーバーにログを送信する機能を提供します。  
Log & Crash iOS/Mac SDK特徴は次の通りです。  

- ログを収集してサーバーに送信します。
- アプリで発生したクラッシュログを収集サーバーに送信します。
- Log & Crash Searchから送られたログの照会/検索ができます。
- マルチスレッディング環境で動作します。

## 動作環境

- iPhone 3GS, 4, 4S, 5, 5S, 6, 6 Plus (armv7, armv7s, arm64)
- iOS 5.1以上(arm64は7.0.3以上)
- Mac OS X 10.5以降(Intel 64ビット)

## ダウンロード

[Toast Cloud](http://docs.cloud.toast.com/ko/Download/)でiOS-Unity-Mac SDKをダウンロードできます。

```
[DOCUMENTS] > [Download] > [Analytics > Log & Crash Search] > [iOS/Mac SDK]をクリック
```

## インストール

### 構成

iOS/Mac SDKは次のように構成されています。

```
docs/                       ; iOS/Mac SDKドキュメント
libs/iOS                    ; iOS SDKライブラリ
libs/Mac OS X               ; Mac SDKライブラリ
sample/LogNCrashiOSSample   ; iOS SDKサンプル
sample/LogNCrashMacSample   ; Mac SDKサンプル
```

### libs

- iOS
	- iOS用のlogncrash framework
- Mac OS X
	- Mac OS X用のlogncrash framework
- Unity
	- Unity用のlogncrash framework
	- Unity packageを含む

### サンプル説明

一緒に提供されるsample/について説明します。
- iOS

1. sample/LogNCrashiOSSample/LogNCrashiOSSample.xcodeprojをXCodeで開きます。
2. ViewController.mを開いてアプリケーションキー、収集サーバーのアドレスを修正します。バージョン、ログソース、ログタイプなどを変更すると、検索に役立ちます。
3. 実行します。
4. TLCLog Initボタンを押して開始します。
5. Send Info、Send Debug、Send Warn、Send Fatal、Send Errorボタンをクリックしてログを送信します。
6. Send crashボタンを押して、クラッシュログを送信します。

- Mac OS X

1. sample/LogNCrashMacSample/LogNCrashMacSample.xcodeprojをXCodeで開きます。
2. AppDelegate.mdを開いてアプリケーションキー、収集サーバーのアドレスを修正します。
3. 実行します。
4. initログが送信されたことを確認します。

## 使用例

- iOS

1. 「Frameworks」にLogNCrashSDK.frameworkとCrashReporter.frameworkを追加します。
2. 「Build Phases」の「Link Binary With Libraries」の項目に、以下のシステムのフレームワークを追加します。
	- UIKit.framework
	- SystemConfiguration.framework
	- CoreTelephony.framework
	- Foundation.framework

- Mac OS X

1. 「Frameworks」にLogNCrashSDK.frameworkとCrashReporter.frameworkを追加します。
2. 「Build Phases」の「Link Binary With Libraries」の項目に、以下のシステムのフレームワークを追加します。
	- Cocoa.framework
	- SystemConfiguration.framework
3. /Library/FrameworksにLogNCrashSDK.frameworkとCrashReporter.frameworkをコピーします。

- 提供されるTLCLog classを使用してログを送信します。
	 - init:ofAppKey:withVersion:forUserId: を実行して、初期化します。
	 - info:withMessage:, -debug:withMessage: などを使用して、logLevelログを収集サーバーに送信します。
	- アプリのクラッシュが発生した場合、クラッシュログが収集サーバーに送信されます。

```
NSString* appKey = @"5b10bc2ba2b80d99ff00a5c8bff3b5050d48dd797fe7ed1c1a857066c1bdb8e4"; // Project AppKey
NSString* appVer= @"1.0";
NSString* serverAddr = @"http://api-logncrash.cloud.toast.com"; //Log & Crash収集サーバーのアドレス
NSString* userID = @"tester"; //ユーザーID

//initの呼び出し時にcrash report自動送信
[TLCLog init:serverAddr ofAppKey:appKey withVersion:appVer forUserId:userID];

[TLCLog setCustomField:@"Test" forKey:@"DevelopmentStage" ];
[TLCLog info:self.errorCode.text withMessage:self.msg.text];
[TLCLog debug:self.errorCode.text withMessage:self.msg.text atLocation:@"test loc"];
```

## 詳細API List

TLCLog classで提供する機能を説明します。

### ヘッダファイルを追加

TLCLog.hファイルを追加します。

### 初期化

```
(bool) init:(NSString *)server ofAppKey:(NSString*)appName withVersion:(NSString*)appVersion;
(bool) init:(NSString *)server ofAppKey:(NSString*)appName withVersion:(NSString*)appVersion forUserId:(NSString*)userId;
(bool) init:(NSString *)server ofAppKey:(NSString*)appName withVersion:(NSString*)appVersion forUserId:(NSString*)userId enableSyncStart:(bool)flag;
```

- TLCLogを初期化します。
- TLCLog機能が正常に動作するためには、必ず呼び出す必要があります。
- ユーザーごとの統計をご希望の場合、userIdは必ず入力する必要があります。
- パラメータ
	- server: 収集サーバーのアドレス
	- appKey: アプリケーションキー
	- version: アプリのバージョン
	- userId: ユーザー ID
	- enableSyncStart : trueの場合に発生したログは、startSendThreadが呼び出されるまでサーバーに送信せずに、キューに格納します。ただしCrashが発生した場合、ThreadLockを解除してログを送信します。
- 戻り値
	- userId: ユーザー ID
	- 失敗時 false

### SendThreadロック解除

```
		(void) startSendThread;
```

### ログ送信

```
(void) debug:(NSString*)errorCode withMessage:(NSString*)message;
(void) error:(NSString*)errorCode withMessage:(NSString*)message;
(void) fatal:(NSString*)errorCode withMessage:(NSString*)message;
(void) info:(NSString*)errorCode withMessage:(NSString*)message;
(void) warn:(NSString*)errorCode withMessage:(NSString*)message;



(void) debug:(NSString*)errorCode withMessage:(NSString*)message atLocation:(NSString*)location;
(void) error:(NSString*)errorCode withMessage:(NSString*)message atLocation:(NSString*)location;
(void) fatal:(NSString*)errorCode withMessage:(NSString*)message atLocation:(NSString*)location;
(void) info:(NSString*)errorCode withMessage:(NSString*)message atLocation:(NSString*)location;
(void) warn:(NSString*)errorCode withMessage:(NSString*)message atLocation:(NSString*)location;
```

- 指定したログレベルで収集サーバーにログを送信します。
- パラメータ
	- errorCode: エラーコード
	- message: ログメッセージ
	- location: エラー位置

### カスタムキーを指定する

```
(void) setCustomField:(NSString*)value forKey:(NSString*)key;
(void) removeAllCustomFields;
(void) removeCustomFieldForKey:(NSString*)key;
```

- カスタムキーを追加/削除/全て削除機能を提供します。
- カスタムキーに 「nil」を設定すると、設定値を無視し、値に「nil」を設定すると「 - 」に設定します。
- カスタムキーは、大文字か小文字で始まり、大文字、小文字、数字、「 - 」、「 \_ 」のみを使用できます。 (^[a-zA-Z][a-zA-Z0-9-_]\*$)
- カスタムキーは、大文字/小文字に関わらず、次の名前は使用できません。
	- projectName, projectVersion, host, logType, logSource, sendTime, logTime, logLevel, UserID
	- Platform, DeviceModel, NetworkType, Carrier, CountryCode, DmpData, errorCode, Location, body, SessionID

### 重複除去モードの設定

2. 4.0以上のSDKから一般ログに重複除去ロジックが適用されました。

重複ログ機能がオンになっている場合、bodyとlogLevelの内容が同じログが発生した場合、送信しません。

```
public static void setLogDeduplicate(bool enable)
```

true : (Default値)重複除去ロジックを有効に<br>
false : 重複除去ロジックを無効に

### 基本設定管理

```
(void) setUserId:(NSString*)userId;
```

- ユーザーIDを設定します。

```
(void) setLogType:(NSString*)logType;
```

- ログタイプを設定します。

```
(void) setLogSource:(NSString*) logSource;
```

- ログソースを設定します。

## 自動収集される情報

以下の情報は、Log & Crash SDKによって自動的に収集され、Log & Crash Searchで確認できます。ログ送信時に情報収集ができない場合は、値を表示できない場合があります。  

- iOS
	\- Platform: iOSバージョン情報
	\- DeviceModel:  iPhoneのモデル情報
	\ - Carrier: ユーザーの通信サービスプロバイダー
	\ - CountryCode: ユーザーの通信サービスプロバイダーのISO国名コード
	\ - NetworkType: Wi-FiまたはCellular(ログ送信イベントの発生時に、ネットワークが使用できない場合は、「No Connection」)
- Mac OS X
	\- Platform: Mac OS Xバージョン情報
	\ - NetworkType: Wi-FiまたはCellular(ログ送信イベントの発生時に、ネットワークが使用できない場合は、「No Connection」)

## iOS Crashを解析
- iOSで発生したCrashの場合、Crash情報がアドレス値に収集されるため、これを解析するためのSymbolファイルが必要です。

- Xcodeを実行して、Windows > Organizerをクリックします。

- 作成した結果をクリックした後、右クリックして、Show in Finderをクリックします。
![](http://static.toastoven.net/prod_logncrash/13.png)

- 結果をクリックして、右クリックして、「パッケージの内容を表示」をクリックします。
![](http://static.toastoven.net/prod_logncrash/14.png)
