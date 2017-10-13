title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Analytics > App Analytics > Marketing Guide

# Overview
 마케팅 담당자는 마케팅 실행 후 유입된 이용자를 모니터링하고 성과를 측정할 도구가 필요합니다.

 TOAST Analytics에서는

- 간편하게 트래킹 URL을 발급하여 채널별 유입되는 이용자를 실시간으로 모니터링할 수 있습니다.
- Post-Install 성과측정을 위한 다양한 분석지표와 LTV 예측지표를 제공합니다.
- 채널별 비교분석을 통해서 효율이 높은 채널을 믹스하여 운영할 수 있습니다.

<br>** * 본 마케팅 운영 가이드는 상황에 맞춰 필요한 부분을 Quick하게 이용할 수 있습니다.**

|상황|가이드|
|:---|:---|
|1) 마케팅 트랙킹 기능을 처음 사용해보거나, 개념 이해가 필요한 경우|[마케팅 트래킹 소개] [트래킹 URL 발급] [채널 추가]|
|2) MAT, Appsflyer 를 통해 광고를 집행한 경우|	[트래킹 URL 발급] [3rd Party Tracker 추가] [3rd Party Tracker Postback 설정]|
|3) 구글 애드워즈에 광고를 집행한 경우|[트래킹 URL 발급] [구글애드워즈 광고트래킹]|
|4) 페이스북에 광고를 집행한 경우|	[트래킹 URL 발급] [페이스북 광고 트래킹]|
|5) TOAST Analytics에서 수집된 이벤트(install)를 전달받고자 하는 경우|[파트너사 Postback 데이터 전송]|

## 마케팅 트래킹 소개
 TOAST Analytics 마케팅 트래킹 기능으로 광고로 유입되는 이용자를 분석할 수 있습니다.

##### <Span style="color:#4B96E6">1) 마케팅 담당자가 직접 매체에 광고를 집행하는 경우</span>

**(1) Android인 경우**

- TOAST Analytics에서 트래킹 URL을 발급받아 광고에 등록합니다.
- 이용자가 광고를 클릭하면 클릭 로그가 전송됩니다.
- 스토어로 이동 후 설치를 완료하면 광고 매체를 식별할 수 있는 로그가 전송됩니다.

![](https://raw.githubusercontent.com/ToastAnalytics/ToastAnalytics/master/docs/Developer/images/ko1.png)

**(2) Android 이외 스토어인 경우**

- 이용자를 트래킹 할 수 있는 레퍼러와 같은 고유 식별자를 제공하지 않습니다.
- 광고 클릭 시 발생하는 클릭 로그 정보로 고유 식별정보를 생성합니다.
- 생성된 고유 식별정보로 동일 이용자를 식별할 수 있습니다.
- 예로 앱스토어의 경우 레퍼러를 포함하지 않기 때문에 광고 클릭 시 고유식별정보와 스토어 설치 시 생성된 고유식별정보를 매칭하여 광고로 유입된 이용자를 트래킹합니다.


![](https://raw.githubusercontent.com/ToastAnalytics/ToastAnalytics/master/docs/Developer/images/ko2.png)

##### <Span style="color:#4B96E6">2) 3rd Party를 통해 광고를 집행하는 경우 </span>

- 3rd Party를 통해 광고를 집행한 경우 Postback을 통해 설치를 확인할 수 있습니다.
- Postback 기능을 제공하는 3rd Party에 TOAST Analytics 수집 서버 URL과 이벤트를 등록합니다.
- TOAST Analytics에 3rd Party에서 발급한 앱 정보(앱/전환 ID)를 입력합니다.
- 광고가 집행되면 Postback을 통해 수집된 정보로 이용자를 트래킹 할 수 있습니다.

![](https://raw.githubusercontent.com/ToastAnalytics/ToastAnalytics/master/docs/Developer/images/ko3.png)


## 트래킹URL 발급
 TOAST Analytics에서 발급한 트래킹 URL을 집행하는 광고에 등록하면 이용자가 어떤 매체를 통해 설치했는지 트래킹 할 수 있습니다.

|용어|가이드|
|:---|:---|
|트래킹 URL|이용자의 설치 경로를 트래킹 하기 위해 TOAST Analytics에서 발급한 트래킹 URL|
|유입 채널|마케팅 광고를 통해 앱을 설치한 경우 각 광고 매체를 의미하며 스토어로 직접 설치한 경우 자연유입입니다.|
|유입 경로|유입 채널별 실행단위 경로, 예로 페이스북 뉴스레터 상단 배너에 광고를 집행할 경우 유입채널은 페이스북, 유입경로는 뉴스레터 상단 배너로 등록할 수 있습니다.|
|3rd party|	광고 및 성과측정을 대행해주는 매체로 MAT, AppsFlyer 등이 있습니다.|
|이벤트|앱 내에서 발생하는 행동으로 게임의 예로 레벨업, 재화/무기 획득, 던전 참여 등이 있습니다.|

#### <Span style="color:#4B96E6">1) 발급방법 </span>
"앱 설정 → 마케팅 → 트래킹 URL발급" 메뉴에서 손쉽게 발급받을 수 있습니다.

![](https://raw.githubusercontent.com/ToastAnalytics/ToastAnalytics/master/docs/Developer/images/ko4.png)

![](https://raw.githubusercontent.com/ToastAnalytics/ToastAnalytics/master/docs/Developer/images/ko5.png)

![](https://raw.githubusercontent.com/ToastAnalytics/ToastAnalytics/master/docs/Developer/images/ko6.png)



① 채널을 선택합니다. 리스트에 채널이 없을 경우 채널을 신규로 등록합니다.<br>
② 유입 경로명을 입력합니다. <br>
경로의 특징을 잘 표현해 주는 명칭으로 자유롭게 작성합니다. (예로 우측상단배너1 등)<br>
③ Target URL을 입력합니다.

- 스토어를 선택한 경우 셀렉박스 내에서 랜딩할 스토어를 선택합니다. 선택 후 다운로드 URL이 정확한지 확인합니다.
- 랜딩URL을 선택한 경우 랜딩할 URL 주소를 입력합니다. 주소는 http 또는 https 방식으로 등록해야 합니다.

④ 마케팅 집행 기간을 입력합니다.<br>
⑤ 과금 방식과 비용을 입력합니다. (※ 옵션항목)<br>
⑥ 트래킹 URL 확인 버튼을 통해 발급받은 트래킹 URL을 확인할 수 있습니다.

※ 다수의 트래킹 URL을 발급해야 하는 경우

- 마케팅 광고 채널이 많을 경우 추가할 채널을 엑셀로 작성하여 일괄 발급이 가능합니다.
- 자세한 기능 설명은 트래킹 URL등록 페이지 내 팝업 헬프에서 확인할 수 있습니다.

##### <Span style="color:#4B96E6">2) 경로구분 유형 </span>
|유형|설명|
|:---|:---|
|자체 등록|TOAST Analytics에서 직접 등록하여 트래킹 URL을 발급받은 경우|
|3rd Party|3rd Party에서 Postback을 통해 자동으로 동록된 경우|

<Span style="color:#FF0000">※ 주) 정확한 유입경로별 분석을 위해 등록정보 수정은 지양해 주시기 바랍니다.</span>



## 채널 등록

##### <Span style="color:#4B96E6">1) 등록 방법 </span>
"앱 설정 → 마케팅 → 채널등록" 메뉴에서 손쉽게 발급 받을 수 있습니다.


![](https://raw.githubusercontent.com/ToastAnalytics/ToastAnalytics/master/docs/Developer/images/ko7.png)
![](https://raw.githubusercontent.com/ToastAnalytics/ToastAnalytics/master/docs/Developer/images/ko8.png)


① 추가 버튼을 누른 후 추가할 채널명을 입력합니다.

- 기존에 등록된 채널명이 있는 경우 중복으로 등록할 수 없습니다.

② 채널 등록 페이지 내에서 수정 및 삭제할 수 있습니다.

- 해당 경로를 통해 트래킹 URL이 발급된 경우 삭제할 수 없습니다.
- 해당 채널로 등록한 유입 경로를 모두 삭제한 후 삭제할 수 있습니다.

##### <Span style="color:#4B96E6">2) 채널 유형 </span>
|유형|설명|
|:---|:---|
|자체 등록|채널 추가를 통해 직접 등록한 경우|
|시스템 등록|시스템에서 디폴트로 등록한 경우|
|3rd Party|Postback으로 유입된 로그를 통해 자동으로 등록된 경우|

※ 시스템 등록과 3rd Party로 자동 등록된 채널은 수정 및 삭제할 수 없습니다.

## 3rd Party Tracker 추가
3rd Party Tracker를 통해 광고를 집행한 경우 Postback 기능을 이용하여 이용자를 트래킹 할 수 있습니다.<br>
먼저 3rd Party Tracker 정보를 TOAST Analytics에 등록 후 각 사이트에서 Postback을 설정합니다.<br>

※ Postback 설정방법은 "3rd Party Tracker Postback 설정" 파트에서 확인할 수 있습니다.



##### <Span style="color:#4B96E6">1) 등록방법 </span>
"앱 설정 → 마케팅 → 트래킹URL 발급" 메뉴에서 손쉽게 발급 받을 수 있습니다.
![](https://raw.githubusercontent.com/ToastAnalytics/ToastAnalytics/master/docs/Developer/images/ko9.png)

① 추가 버튼을 누르면 하단에 입력창이 활성화됩니다.<br>
② 3rd Party Tracker와 OS, 앱/전환 ID, 라벨 정보를 입력합니다. <br>
※ 앱/전환 ID와 라벨정보는 각 3rd Party Tracker사 별로 확인 방법이 다르게 구성되어 있습니다.

##### <Span style="color:#4B96E6">2) 앱/ 전환 ID, 라벨 확인방법 </span>
3rd Party Tracker 별로 앱/전환 ID, 라벨 정보를 다르게 제공합니다.<br>
TOAST Analytics에서는 현재 MAT, AppsFlyer, Google Adwords와의 연동이 가능합니다.

(1) MAT 앱 ID 확인
- "APPLICATIONS > Mobile Apps > Details"에서 앱 ID를 확인할 수 있습니다.

![](https://raw.githubusercontent.com/ToastAnalytics/ToastAnalytics/master/docs/Developer/images/ko10.png)


(2) AppsFlyer 앱 ID 확인
- "AppsFlyer > Dashboard > App" 에서 마우스 오버 시 앱ID를 확인할 수 있습니다.

![](https://raw.githubusercontent.com/ToastAnalytics/ToastAnalytics/master/docs/Developer/images/ko11.png)


(3) Google Adwords 전환 ID, 라벨 확인
- "전환설정 > 추적방식설정"에서 전환 ID와 라벨을 확인할 수 있습니다.

![](https://raw.githubusercontent.com/ToastAnalytics/ToastAnalytics/master/docs/Developer/images/ko12.png)


## 3rd Party Tracker Postback 설정
3rd Party Tracker에서 Postback으로 로그를 전송받기 위해 TOAST Analytics의 URL과 전송받을 파라미터를 설정합니다.<br>
전송받을 파라미터 설정 방법은 각 3rd Party 별로 다르게 구성되어 있습니다.<br>

※ Google Adwords의 경우 Google Adwords 광고트래킹 파트에서 확인할 수 있습니다.


##### <Span style="color:#4B96E6"> 1) MAT Postback 설정 </span>
(1) Internal Partner 추가

"PARTNERS > Partners > Add Internal Partner"에 Postback 전송받을 파트너를 입력합니다.<br>
Company Name은 Postback을 전송받을 3rd Party인 TOAST Analytics를 입력합니다.<br>
Partner Type은 Technology Partner를 선택합니다.

![](https://raw.githubusercontent.com/ToastAnalytics/ToastAnalytics/master/docs/Developer/images/ko13.png)


(2) Postback URL 추가

① 등록한 파트너를 클릭 후 "Postbacks" 메뉴로 이동하여 Add Postback URL을 통해 Postback URL을 입력합니다.

![](https://raw.githubusercontent.com/ToastAnalytics/ToastAnalytics/master/docs/Developer/images/ko14.png)


각 상세 설정 정보는 아래와 같이 입력합니다.<br>
② Postback Name과 Partner Type을 입력합니다. <br>Name은 자유롭게 작성하고 Partner Type은 Technology Partner로 선택합니다.

![](https://raw.githubusercontent.com/ToastAnalytics/ToastAnalytics/master/docs/Developer/images/ko15.png)


③ Template에서 유형, 파트너, Postback URL을 입력합니다.

- 유형은 Postback URL을 선택하고 Partner는 사전 등록한 TOAST Analytics를 선택합니다.
- Postback URL은 사전에 필요한 파라미터를 확인하여 미리 작성해 놓았습니다. (아래 URL 참조)

![](https://raw.githubusercontent.com/ToastAnalytics/ToastAnalytics/master/docs/Developer/images/ko16.png)


<Span style="color:#FF0000">
주) OS별로 입력해야 할 Postback URL이 다르므로 Postback 설정 시에는 OS별로 등록하시기 바랍니다.<br>
주) 아래 URL에서 aid= 값에 postback 받을 앱 ID를 반드시 입력해야 합니다. </span>

\- Android인 경우

```
http://redirect-analytics.toast.com/postback/mat?aid=99716&package_nm={package_name}&advertising_id={google_aid}&uid={user_id}&timestamp={timestamp}&chnl_id={publisher_id}&chnl_nm={publisher_name}&path_id={campaign_id}&path_nm={campaign_name}&is_ad_tracking={google_ad_tracking}&is_attributted={is_attributed}&ip={device_ip}&osv={os_version}&dnm={device_model}&cc={country_code}&lc={language}&cr={device_carrier}&av={package_app_version}
```

\- iOS인 경우

```
http://redirect-analytics.toast.com/postback/mat?aid=99716&package_nm={package_name}&advertising_id={google_aid}&uid={user_id}&timestamp={timestamp}&chnl_id={publisher_id}&chnl_nm={publisher_name}&path_id={campaign_id}&path_nm={campaign_name}&is_ad_tracking={google_ad_tracking}&is_attributted={is_attributed}&ip={device_ip}&osv={os_version}&dnm={device_model}&cc={country_code}&lc={language}&cr={device_carrier}&av={package_app_version}
```

④ Postback Requirements에 Partner와 앱, 이벤트를 선택합니다.

- Partner는 TOAST Analytics를 선택합니다.

<Span style="color:#FF0000"> 주) Partner 옆에 Only send data attributed to selected partner는 체크하지 않습니다.</span>

- Mobile App은 Postback으로 로그를 전송할 앱을 선택합니다.
- Event Name은 Install을 선택합니다.

<Span style="color:#FF0000">  주) 현재 TOAST Analytics에서는 Install 정보만 처리하고 있습니다. 다른 유형의 이벤트는 수집되지 않습니다.</span>

![](https://raw.githubusercontent.com/ToastAnalytics/ToastAnalytics/master/docs/Developer/images/ko17.png)



## 구글애드워즈 광고트래킹
구글애드워즈에서는 자사 광고로 유입된 이용자에 대해 Postback으로 로그를 전송하고 있습니다.<br>
3rd Party Tracker Postback 설정으로 구글애드워즈 광고 유입이용자를 트래킹 할 수 있습니다.

##### <Span style="color:#4B96E6">1) 구글애드워즈 설정 </span>
|설정 내용|설명|
|:---|:---|
|자동태그 추가|스토어 등 랜딩되는 URL에 자동으로 태그를 추가할 수 있도록 설정|
|전환설정|앱 설치를 추적할 기준을 설정 - 처음 열 때로 설정|
|Postback URL|기 정의된 Postback URL 입력|
|추적방식설정|애드워즈에서 3rd Party에 서버 간 전환피드 설정 값(ID, 라벨) 확인|

① 자동태그 추가

- **"환경설정 > 계정설정 > 자동태그 추가"**에서 도착 URL 자동태그 추가를 체크합니다.

![](https://raw.githubusercontent.com/ToastAnalytics/ToastAnalytics/master/docs/Developer/images/ko18.png)

② 전환설정

- "도구 > 전환 > 전환 소스" 에서 앱을 선택한 후 전환을 "앱 설치(처음 열 때)" 로 선택합니다.

<span style="color:#FF0000">주) 전환이 앱 설치(처음 열 때)인 경우에만 구글애드워즈에서 Postback을 전송합니다. </span>

![](https://raw.githubusercontent.com/ToastAnalytics/ToastAnalytics/master/docs/Developer/images/ko19.png)

③ Postback URL 설정

- 전환 소스 입력 후 다음 설정 탭에서 전환에 대한 설정값을 입력합니다.
- 이름은 자유롭게 입력합니다.
- 가치는 향후 ROI를 분석하기 위한 값입니다. 광고 최적화가 필요한 경우 입력합니다.
- 전환 추적할 앱을 선택합니다.
- 전환수 포함은 예로 선택합니다.
- postback URL은 사전 정의된 URL(아래 참조)을 OS 유형에 맞게 입력합니다.

<span style="color:#FF0000">주) OS 별로 제공되는 파라미터가 다르므로 반드시 OS 유형에 맞는 URL을 입력합니다. </span>

\- Android인 경우

```
http://redirect-analytics.toast.com/postback/google?advertising_id={adid}&lat={lat}&click_url={click_url}&click_timestamp={click_ts}&trv_campaign_id={campaign_id}&video_id={video_id}
```

\- iOS인 경우

```
http://redirect-analytics.toast.com/postback/google?idfa={md5_advertising_id}&lat={lat}&click_url={click_url}&click_timestamp={click_ts}&trv_campaign_id={campaign_id}&video_id={video_id}&os=ios
```

![](https://raw.githubusercontent.com/ToastAnalytics/ToastAnalytics/master/docs/Developer/images/ko20.png)

④ 추적방식 설정

- 추적방식 설정에서 구글애드워즈에서 서버 간 피드 설정을 선택합니다.
- Postback으로 서버 간 전환 로그를 전송받을 때 설정된 전환 ID와 라벨을 확인할 수 있습니다.

<span style="color:#FF0000">주) 해당 값은 TOAST Analytics에 입력 정보로 필요한 값입니다. </span>

![](https://raw.githubusercontent.com/ToastAnalytics/ToastAnalytics/master/docs/Developer/images/ko21.png)
<br>

##### <Span style="color:#4B96E6">2) TOAST Analytics 설정 </span>
TOAST Analytics에서는 3rd Party Tracker 연동 설정이 완료되면 실시간으로 이용자를 트래킹할 수 있습니다.<br>
구글에서는 캠페인명을 전달하지 않고 캠페인 ID만 로그로 전달하기 때문에 캠페인명을 수동으로 입력합니다.<br>

① 3rd Party Tracker 연동

- 추가 버튼을 누른 후 3rd Party Tracker, OS, 전환ID, 라벨 정보를 입력합니다.
- 전환ID와 라벨은 추적방식 설정에서 서버간 전환 피드 설정 시 확인된 값입니다.

![](https://raw.githubusercontent.com/ToastAnalytics/ToastAnalytics/master/docs/Developer/images/ko22.png)
<br>
※ 등록이 완료되면 광고로 유입된 로그를 실시간으로 확인할 수 있습니다.


② 유입경로명 변경

- 유입경로는 구글애드워즈에서 로그가 유입되면 자동으로 등록됩니다.
- 유입로그에서 캠페인명을 제공하지 않기 때문에 캠페인ID로 지표에 노출됩니다.
(예 Google_Adwords@123456789)

- 트래킹URL 발급 페이지에서 유입경로명과 캠페인 유형을 변경할 수 있습니다.

<span style="color:#FF0000">주) 구글캠페인ID는 수정되지 않습니다.</span>

![](https://raw.githubusercontent.com/ToastAnalytics/ToastAnalytics/master/docs/Developer/images/ko23.png)

## 페이스북 광고트래킹
페이스북 광고 설정 시 딥링크에 레퍼러를 추가하여 이용자를 트래킹 할 수 있습니다.<br>
3rd Party Tracker를 통해 광고트래킹을 집행할 경우 Postback과 중복되지 않게 한 가지 방법만 등록합니다.


|설정 내용|설명|
|:---|:---|
|딥링크 발급|TOAST Analytics에서 딥링크 발급|
|딥링크 테스트|페이스북 개발자 사이트에서 딥링크 작동 테스트|
|광고 만들기|페이스북 광고 만들기|
|딥링크 등록|페이스북 광고 설정에서 딥링크 등록|

##### <Span style="color:#4B96E6">1) 딥링크 발급 </span>
- 트래킹URL 발급에서 채널을 디폴트로 등록된 Facebook으로 선택하면 딥링크가 발급됩니다.
- 이후 작성할 내용은 기존 트래킹URL 발급과 동일하게 작성하면 됩니다.

![](https://raw.githubusercontent.com/ToastAnalytics/ToastAnalytics/master/docs/Developer/images/ko24.png)

##### <Span style="color:#4B96E6">2) 딥링크 테스트 </span>
딥링크 테스트 전 페이스북 SDK 버전과 페이스북 설정 내용을 반드시 확인 후 진행하시기 바랍니다.

<span style="color:#FF0000">주) 딥링크 기능을 사용하기 위해서는 2016년 배포된 페이스북 SDK 버전 설치를 권장해 드립니다.<br>
주) 딥링크가 호출 후 Callback에 정상적으로 Deeplink URL이 포함되어 있는지 확인해야 합니다.</span><br>
※ 페이스북 딥링크 설정 : https://developers.facebook.com/docs/app-ads/deep-linking?locale=ko_KR

① "facebook for developers > Tools & Support > Ad Helpers" 페이지로 이동합니다.<br>
② "App Ads Helpers"에서 테스트할 앱을 선택합니다.

![](https://raw.githubusercontent.com/ToastAnalytics/ToastAnalytics/master/docs/Developer/images/ko25.png)

③ 페이지 하단 "Developer Tools > DEEP LINK TESTER"에서 Test Deep Link를 선택합니다.

![](https://raw.githubusercontent.com/ToastAnalytics/ToastAnalytics/master/docs/Developer/images/ko26.png)

④ "Test Deep Link"에서 SEND DEEP LINK에 발급받은 Deep Link를 입력합니다.

- 딥링크 입력 포맷은 아래와 같이 tafb= 뒤에 발급받은 딥링크를 추가합니다.
ex) appscheme://action?param1=val1&param2=val2&tafb=channel_216,path_1075,charge_NON
<br>
<span style="color:#FF0000"> 주) 로그에 Deferred 값을 전송받기 위해 Send Deferred를 반드시 체크합니다. </span>

- OS별로 Send to iOS, Send to Android를 선택하면 딥링크가 전송됩니다.

![](https://raw.githubusercontent.com/ToastAnalytics/ToastAnalytics/master/docs/Developer/images/ko27.png)

⑤ 테스트 앱에 페이스북 알림 클릭 후 앱 설치, 앱 실행을 순서대로 진행합니다.

- 페이스북 알림에서 딥링크 푸쉬를 클릭합니다.

![](https://raw.githubusercontent.com/ToastAnalytics/ToastAnalytics/master/docs/Developer/images/ko28.png)

- 테스트할 앱을 설치합니다.
- 설치 후 앱을 실행하면 Deeplink 정보가 TA에 전송됩니다.
- Callback에 정상적으로 Deeplink URL이 포함되어 있는지 확인
- 마케팅 > SUMMARY > 실시간에서 등록한 딥링크가 추적되었는지 확인합니다.

<span style="color:#FF0000">주) 테스트 전 앱이 설치된 디바이스에서는 테스트 되지 않습니다. 기존 앱 삭제 후 테스트를 진행하시기 바랍니다.</span><br>

##### <Span style="color:#4B96E6">3) 페이스북 광고 만들기 </span>
페이스북 광고에서 "앱 설치 늘리기"인 경우에만 딥링크로 트래킹할 수 있습니다.

① 마케팅 목표 설정
- 앱 설치 늘리기 목표에 대해서만 트래킹이 가능합니다.

![](https://raw.githubusercontent.com/ToastAnalytics/ToastAnalytics/master/docs/Developer/images/ko29.png)

② 딥링크 등록

- 광고 설정 후 "광고 > 페이지 및 텍스트"에서 딥링크 영역에 발급받은 딥링크를 아래 포맷으로 입력합니다.

ex) appscheme://action?param1=val1&param2=val2&tafb=channel_216,path_1075,charge_NON

![](https://raw.githubusercontent.com/ToastAnalytics/ToastAnalytics/master/docs/Developer/images/ko30.png)


## 포스트백 데이터 전송
TOAST Analytics에서 수집된 이벤트 로그를 전송받을 수 있습니다.<br>
현재 설치 로그에 대해서만 지원하고 있습니다.


##### <Span style="color:#4B96E6">1)Postback 추가 방법 </span>

**"마케팅 > Postback 등록"**에서 Postback 추가 버튼으로 신규 등록할 수 있습니다.

① 파트너사인 경우

- 파트너사의 경우 사전 협의된 포맷으로 전송하고 있습니다.
- 등록방법은 Postback 이름과 Partner 선택 후 추가하면 등록됩니다.
- 등록 후 이벤트 발생 후 실시간으로 유입 로그를 확인할 수 있습니다.
- 파트너사 협의는 고객센터를 통해 개별 요청해 주시면 협의 후 등록할 수 있습니다.

![](https://raw.githubusercontent.com/ToastAnalytics/ToastAnalytics/master/docs/Developer/images/ko31.png)

② 파트너사가 아닌 경우

- 파트너사가 아닌 경우 직접 파라미터를 선택해야 합니다.
- Postback 등록에서 직접등록을 선택 후 전송받을 채널, OS를 선택합니다.
- Postback URL에 전송받을 서버의 URL을 입력합니다.
- 하단 Parameter Data 추가에서 전송받을 파라미터값을 선택 후 추가합니다.
- 추가 후 실시간으로 유입된 로그가 전송됩니다.

![](https://raw.githubusercontent.com/ToastAnalytics/ToastAnalytics/master/docs/Developer/images/ko32.png)

##### <Span style="color:#4B96E6">2) 제공 데이터 포맷</span>

| 파라미터값 | 파라미터명 | Data Type | 비고 |
| :----- | :----- | :--------- | :--- |
| app_id | 앱 ID | String | TOAST Analytics의 App Key |
| uid | 이용자ID | String | 이용자 ID |
| event_type | 이벤트 Type | String | 1차 Open시에는 install만 지원 |
| event_time | 로그 일시 | String | “event_type=install”, 그 외의 경우, event 발생 시간 |
| channel_name | 채널명 | String | Tracking URL의 channel명 |
| campaign_id | 캠페인 ID | String | Tracking URL의 path값 |
| campaign_name | 캠페인명 | String | Tracking URL의 path명 |
| organic | 오가닉 | String | “organic인 경우, yes”, 유입 채널이 존재하는 경우, null |
| app_ver | 앱버전 | String | 앱 버전 |
| os_cd | Device OS | String | 클릭한 기기의 OS (ex. iOS/ Android) |
| os_ver | Device OS Version | String | 클릭한 기기의 운영체제 버전 |
| dev_locale | Device locale | String | 클릭한 기기의 지역 |
| dev\_nat\_cd | Device 국가코드 | String | 클릭한 기기의 국가코드 |
| time_zone | 타임존 | String | 클릭한 기기의 타임존 |
| sdk_ver | TOAST Analytics SDK Version | String | TOAST Analytics SDK버전 |
| Refr | 레퍼러 | String | Conversion이 이루어지기 위한 레퍼러 URL. |
| tracking_url | 트래킹 URL | String | Tracking URL |
| context | context | String | Tracking URL을 통해 전달한 파트너사의 Parameter |

※ LTV, Retention - Partner사에만 API로 제공됩니다



| 파라미터값 | 파라미터명 | Data Type | 비고 |
| ----- | ----- | --------- | --- |
| app_id | 앱 ID | string | TOAST Analytics의 App Key |
| log_dt | 생성일시 | string | LTV,Retention 생성 일시 |
| channel_name | 채널명 | string | Tracking URL의 channel명 |
| campaign_id | 캠페인 ID | string | Tracking URL의 path값 |
| campaign_name | 캠페인 명 | string | Tracking URL의 path명 |
| ltv | LTV | number | Life Time Value |
| rt_day 1 | 재방문율 D1 | number | 1일 차 재방문율 |
| rt_day 2 | 재방문율 D2 | number | 2일 차 재방문율 |
| rt_day 3 | 재방문율 D3 | number | 3일 차 재방문율 |
| rt_day 4 | 재방문율 D4 | number | 4일 차 재방문율 |
| rt_day 5 | 재방문율 D5 | number | 5일 차 재방문율 |
| rt_day 6 | 재방문율 D6 | number | 6일 차 재방문율 |
| rt_day 7 | 재방문율 D7 | number | 7일 차 재방문율 |
| rt_day 14 | 재방문율 D14 | number | 14일 차 재방문율 |
| rt_day 30 | 재방문율 D30 | number | 30일 차 재방문율 |
| rt_day 60 | 재방문율 D60 | number | 60일 차 재방문율 |

## 트래킹 이벤트 설정
마케팅으로 유입된 이용자를 대상으로 커스텀 이벤트 현황을 확인할 수 있습니다.
커스텀 이벤트 로그는 등록 후 다음날 부터 이벤트 로그를 집계하기 때문에 마케팅 집행 전에 미리 등록하시기 바랍니다.
<span style="color:#FF0000">주) 커스텀 이벤트에 등록된 이벤트만 등록할 수 있습니다.</span>



##### <Span style="color:#4B96E6">1)등록방법 </span>
- "앱 설정 > 마케팅 > 트래킹 이벤트 설정" 페이지에서 추가 버튼으로 등록할 수 있습니다.
- 이벤트 명은 화면에 보이는 이름으로 이벤트 특성을 확인할 수 있도록 자유롭게 기재합니다.
- 이벤트와 파라미터1, 2를 선택 후 저장을 누르면 등록됩니다.
- 등록된 이벤트는 "마케팅 > 이벤트" 페이지에서 확인할 수 있습니다.

![](https://raw.githubusercontent.com/ToastAnalytics/ToastAnalytics/master/docs/Developer/images/ko33.png)

##### <Span style="color:#4B96E6">2)등록 시 확인사항 </span>
- 최대 10개까지 등록할 수 있습니다.
- 등록한 다음 날부터 데이터를 확인할 수 있습니다.
- 등록한 이벤트는 등록일이 지난 후에는 수정할 수 없습니다.
- 이벤트 수정이 필요한 경우 삭제 후 신규 등록해 주시기 바랍니다.
