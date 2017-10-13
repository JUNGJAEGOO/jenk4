title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Analytics > Log&Crash Search > Logback Developer's Guide

Log & Crash Logback SDKはLog & Crash Search収集サーバーにログを送信する機能を提供します。
Log & Crash Log4back SDKの特徴は次の通りです。

- ログを収集してサーバーに送信します。
- Log & Crash Searchから送られたログの照会/検索ができます。
- マルチスレッディング環境で動作します。

## 動作環境

- Logback 1.X+

## ダウンロード

[Toast Cloud](http://docs.cloud.toast.com/ko/Download/)でLogback SDKをダウンロードできます。

```
[DOCUMENTS] > [Download] > [Analytics > Log & Crash Search] > [Logback SDK]をクリックします。
```

## インストール

### 構成

Logback SDKは、次のように構成されています。

```
docs/       ; Logback SDKドキュメント
lib/        ; Logbackライブラリ
sample/     ; Logbackサンプル
```

### SDKサンプル

一緒に提供されているsample/logback/について説明します。

1.Eclipseを起動し、メニューからFile - Import - Maven - Existing Maven Projectsを実行して、sample/logback/を開きます。  
2.src/test/resources/logback.xmlファイルを開いて、発行されたアプリケーションキーと収集サーバーのアドレスを変更します。  

```
<param name="collectorUrl" value="http://api-logncrash.cloud.toast.com" />
<param name="appKey" value="__app_key__" />
<param name="version" value="1.0.0" />
```

3.Eclipseメニューから 「Project - Properties - Java Build Path - Libraries」を選択して「toast-logncrash-logback-sdk- <version > .jar」を追加します。  
4.Eclipseメニューから「Run - Run As - JUnit Test」を選択して実行します。  

## 使用例

1.Logback SDKライブラリをProjectに追加します。  
例えばEclipseメニュー「Porject - Properties - Java Build Path - Libraies」を選択して「toast-logncrash-logback-sdk- <version > .jar」を追加します。  
2.Mavenを使用している場合は、pom.xmlにdependencyを追加します。  

```
<dependency>
      <groupId>ch.qos.logback</groupId>
      <artifactId>logback-classic</artifactId>
      <version>1.0.9</version>
  </dependency>
  <dependency>
      <groupId>ch.qos.logback</groupId>
      <artifactId>logback-core</artifactId>
      <version>1.0.9</version>
  </dependency>
  <dependency>
      <groupId>org.slf4j</groupId>
      <artifactId>slf4j-api</artifactId>
      <version>1.7.2</version>
  </dependency>
  <dependency>
      <groupId>commons-lang</groupId>
      <artifactId>commons-lang</artifactId>
      <version>2.5</version>
  </dependency>
  <dependency>
      <groupId>org.apache.httpcomponents</groupId>
      <artifactId>httpclient</artifactId>
      <version>4.2.6</version>
  </dependency>
  <dependency>
      <groupId>org.apache.httpcomponents</groupId>
      <artifactId>httpcore</artifactId>
      <version>4.2.4</version>
  </dependency>
  <dependency>
      <groupId>javax.servlet</groupId>
      <artifactId>servlet-api</artifactId>
      <version>2.4</version>
  </dependency>
  <dependency>
      <groupId>org.json</groupId>
      <artifactId>json</artifactId>
      <version>20090211</version>
  </dependency>
```

3.Mavenを使用していない場合は、次のライブラリを別途ダウンロードしてclass pathに追加します。

```
logback-classic, 1.0.9
logback-core, 1.0.9
slf4j-api, 1.7.2
commons-lang, 2.5
httpclient, 4.2.6
httpcore, 4.2.4
servlet-api, 2.4
json, 20090211
```

4.Appender設定と構成のためにlogback.xmlを作成します。  

- 全体の構成は、sample/logback/src/test/resources/logback.xmlをご覧ください。  
- appKey、collectorUrlには必ず発行されたアプリケーションキー、収集サーバーのアドレスを使用する必要があります。  

```
<appender name="logncrash-http" class="com.toast.java.logncrash.logback.LogNCrashHttpAppender">
    <param name="collectorUrl" value="http://api-logncrash.cloud.toast.com" />

	<param name="appKey" value="__app_key__" />
	<param name="version" value="1.0.0" />
	<param name="logSource" value="http-logback" />
	<param name="logType" value="log" />
	<param name="errorCodeType" value="default" />
	<param name="enable" value="true" />
	<param name="debug" value="false" />
</appender>
...
<root level="debug">
    <appender-ref ref="logncrash-http" />
</root>
```

5.Javaで次のように使用します。

```
...
private static Logger logger = LoggerFactory.getLogger(LogNCrashLogbackSample.class);
...
logger.error("LogNCrash Logback Test");
...
```

## API List

### logback.xml設定項目

- collectorUrl：収集サーバーのアドレス。  
	HTTP：http://api-logncrash.cloud.toast.com
- appKey：プロジェクトアプリケーションキー、必須。
- version：プロジェクトのバージョン、デフォルト値「1.0.0」。
- logSource：ログソース、デフォルト値「http-logback」。
- logType：ログタイプ、デフォルト値「log」。
- enable：Appenderの使用可否設定、デフォルト値「true」。
- debug：デバッグを使用するかどうかの設定、デフォルト値「false」。
- errorCodeType：エラーコードのタイプ設定、デフォルト「default」。  
	default：Exception情報を使用する。    
	mdc：MDCのerrorCode項目値を設定して使用する。    

## 制約事項

- エラーデータが一度に大量に発生した場合、logncrash-async appenderのbufferSizeが小さいと、logback自体で処理遅延が発生することがあるので、bufferSizeの調節が必要です。

## FAQ

### batch program(project)でlogncrash clientを使用するには？

Quartzなどを使用して、デーモンとして動くbatch projectには適用されません。 batchプログラムの最後に数秒間待機するコードを追加します。

```
try {
    Thread.sleep(3000L);
} catch (InterruptedException ignore){}
```

logncrash-async appenderは、LogbackではAsync Appenderをサポートしていないため、別の「com.toast.java.logncrash.logback.LogNCrashAsyncAppender」を提供しています。  
LogNCrashAsyncAppenderは、内部にログを記録する別のデーモンスレッドがあり、非同期でログを送信します。 Java batch programでmain threadがすぐに終了するため、LogbackAsyncAppenderのデーモンスレッドが生成され、ログを送信する前にbatchアプリケーションが終了します。  
デーモンスレッドに関係なく生きている一般スレッドがない場合、JVMはすぐに終了します。したがって、上記のようにプログラムの最後に待機するコードを追加して、すべてのログを送信してから終了するようにします。  
他に、以下のようなbatch用のlogback.xmlを別途使用する方法があります。 loggerでappender logncrashをすぐに使用するようにlogback.xmlを修正します。この場合、loggingが同期モードで動作するので、エラー発生時にエラー収集サーバーの呼び出しのためにdelayが発生します。 web projectでは、この方法を使用しないようにします。  

```
<!-- // loggers // -->
<logger name="com" additivity="false">
    <level value="DEBUG"/>
    <appender-ref ref="STDOUT"/>
    <appender-ref ref="logncrash-logback"/>
</logger>
<!-- // Root Logger // -->
<root level-"warn">
    <level value="WARN"/>
    <appender-ref ref="STDOUT"/>
    <appender-ref ref="logncrash-logback"/>
</root>
```

### Java stack traceをlogback(Log & Crash Search含む)にロギングするには？  

logback利用してstack traceを出力するには、log.error(e.getMessage()、e);を使用します。 SLF4J Loggerはメソッドの引数としてThrowableだけを受け取るロギングメソッドはサポートしていません。  

```
String[] aa = null;
try {
    aa[0] = "111";
} catch (NullPointerException e) {
//  log.error(e); //SLF4Jではサポートしていないメソッド
    log.error(e.getMessage(), e); ///stacktrace出力
}
```

### logback(Log & Crash Search含む)loggingによるパフォーマンスの低下を最小限に抑えるには？

logback.xmlのlogger設定でnameとlevelを使用してfilteringを最大化します。  
以下のようにloggerの設定でcomやorgをDEBUG levelに設定すると、loggerから多くのILoggingEvent(logback)が不必要に生成されます。 logback appenderでThresholdがERRORに設定されているので、実際のログ送信はされませんが、一度loggerでILoggingEventが生成がされ、appenderに伝達されます。
[パフォーマンスが低下する設定(開発用にのみ使用)]  

```
<!-- // define loggers // -->
<logger name="com" additivity="false">
    <level value="DEBUG"/>
    <appender-ref ref="STDOUT"/>
    <appender-ref ref="logncrash-async"/>
</logger>

<!-- // define loggers // -->
<logger name="org" additivity="false">
    <level value="DEBUG"/>
    <appender-ref ref="STDOUT"/>
    <appender-ref ref="logncrash-async"/>
</logger>

<!-- // define root // -->
<root>
    <level value="WARN"/>
    <appender-ref ref="STDOUT"/>
    <appender-ref ref="logncrash-async"/>
</root>
```

[パフォーマンスが考慮された設定(運営用に使用)]  

```
<!-- // define loggers // -->
<logger name="com" additivity="false">
    <level value="ERROR"/>
    <appender-ref ref="STDOUT"/>
    <appender-ref ref="logncrash-async"/>
</logger>

<!-- // define root // -->
<root>
    <level value="WARN"/>
    <appender-ref ref="STDOUT"/>
    <appender-ref ref="logncrash-async"/>
</root>
```

### WASで使用時、安全に終了をするには？

エラーログが送信中の状況で、WAS(Tomcatなど)が終了した場合、次のようなExceptionが発生し、WASが正常に終了しないことがあります。  

```
Exception in thread "pool-12-thread-1" java.lang.NullPointerException
at_external.org.apache.mina.common.AbstractPollingIoProcessor$Worker.run(AbstractPollingIoProcessor.java:740)
at_external.org.apache.mina.util.NamePreservingRunnable.run(NamePreservingRunnable.java:51)
at_java.util.concurrent.ThreadPoolExecutor$Worker.runTask(ThreadPoolExecutor.java:886)
at_java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:908)
at_java.lang.Thread.run(Thread.java:619)
```

ログの送信中にWASが終了した場合は、Exceptionが発生します。このような現象を防止するためには、WAS終了時にLogManager.shutdown()メソッドを呼び出して、logncrash appenderをcloseすると安全に終了できます。  
org.springframework.web.util.Log4jConfigListenerを使用している場合は、WAS終了時にLog4jConfigListenerがLogManager.shutdown()メソッドを呼び出すので、追加の設定をしなくても安全に終了できます。  
Log4jConfigListenerを使用しない場合のためにlogncrash-appenderではcom.toast.java.logncrash.logback.LogbackShutdownListenerを提供しています。 web.xmlに次のような設定を追加すると、WAS終了時にエラーログの送信が発生しても、安全に終了できます。  

```
<listener>
    <listener-class>
        com.toast.java.logncrash.logback.LogbackShutdownListener
    </listener-class>
</listener>
```
