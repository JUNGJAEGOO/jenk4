title=About
date=2013-09-24
type=page
status=published
big=TCGame
summary=TCGamebaseGetting
nation=ko
~~~~~~
## Game > Gamebase > Getting Started

## Getting Started

Gamebase 서비스 사용을 위한 아주 간단하지만 꼭 필요한 기본적인 절차에 대해 설명합니다.

1.  서비스 활성화 [Console]
2.  프로젝트 ID 및 Secret Key 확인[Console]
3.  게임 및 클라이언트 정보 등록[Console]
4.  Gamebase SDK 다운로드

### Enable Gamebase [Console]

[TOAST Cloud Console]에서 **[Game] > [Gamebase]** 상품을 선택한 후 **[상품 이용]** 버튼을 클릭하여 서비스를 활성화 합니다.

![상품활성화](http://static.toastoven.net/prod_gamebase/GettingStarted/img_console_active_1.0.png)

<center>[그림1] Gamebase 상품 활성화</center>

### Check {Project ID} and {Secret Key} [Console]

#### AppId

appId는 TOAST Cloud의 프로젝트ID로 Console의 Project list 화면에서 확인 가능합니다.
해당 값은 Server API 호출시나 SDK 설정시에 꼭 필요한 값입니다.

![image alt](http://static.toastoven.net/prod_gamebase/Server_Developers_Guide/pre_appId_v1.1.png)

<center>[그림2] Gamebase AppId</center>

#### SecretKey

secretKey는 API에 대한 접근 제어 방안으로 Gamebase Console에서 확인 가능합니다.
해당 값은 Server API 호출시 HTTP Header에 필수적으로 설정되어야 합니다.

![image alt](http://static.toastoven.net/prod_gamebase/Server_Developers_Guide/pre_secret_key_v1.1.png)

<center>[그림3] Gamebase SecretKey</center>

### Register App and Client [Console]

Gamebase Console의 [앱] 메뉴를 이용하여 게임 및 클라이언트의 기본 정보를 등록합니다.
각 항목의 자세한 설명은 아래 링크를 참고하시기 바랍니다.

*   [LINK [Operator Guide > App]](../app/#app) : App 설정정보
*   [LINK [Operator Guide > Client]](../app/#client) : Client 설정정보

![게임 정보 등록 화면](http://static.toastoven.net/prod_gamebase/Operators_Guide/Console_App_App1_1.1.png)

<center>[그림4] 게임 정보 등록 화면</center>

![클라이언트 정보 등록 화면](http://static.toastoven.net/prod_gamebase/Operators_Guide/Console_App_Client4_1.1.png)

<center>[그림5] 클라이언트 정보 등록 화면</center>

> [INFO]
> SDK 설정시에 Client 버전 정보가 필요하므로 해당 화면에서 꼭 확인하세요!

### Download Gamebase SDK

Gamebase SDK는 아래 다운로드 페이지에서 내려받을 수 있습니다.
[LINK [Download Gamebase SDK]](http://docs.cloud.toast.com/ko/Download/)

SDK 다운로드 후 플랫폼별 자세한 설정 방법은 각 플랫폼별 [Developers Guide]를 참고하시기 바랍니다.

*   [LINK [iOS 개발프로젝트 설정하기]](../ios-started/)
*   [LINK [Android 개발프로젝트 설정하기]](../aos-started/)
*   [LINK [Unity Plug-in 개발프로젝트 설정하기]](../unity-started)

    > 드디어 Gamebase 서비스를 사용할 준비가 끝났습니다. :-)
    > 보다 자세한 가이드는 아래를 참고해 주세요.

## Platform Guide

### Client Developer's Guide

*   [LINK [iOS Developer's Guide]](../ios-started/)
*   [LINK [Android Developer's Guide]](../aos-started/)
*   [LINK [Unity Developer's Guide]](../unity-started/)

### Server Developer's Guide

*   [LINK [Server Developer's Guide]](../Server%20Developer%60s%20Guide/)

### Operator's Guide

*   [LINK [Operator's Guide]](../operating-indicator/)

## Funtional Guide

<table>
<thead>
<tr>
<th>Feature</th>
<th>Description</th>
<th>client</th>
<th>server</th>
<th>console</th>
</tr>
</thead>
<tbody>
<tr>
<td>Login</td>
<td>Guest , 3rd Party 인증지원  <br> - 지원되는 IDP : facebook, google+, iosgamecenter, payco</td>
<td>[<a href="../ios-authentication/#login">iOS</a>] [<a href="../aos-authentication/#login">Android</a>] [<a href="../unity-authentication/#login">Unity</a>]</td>
<td>[<a href="../Server%20Developer%60s%20Guide/#token-authentication">토큰검증</a>] <br> [<a href="../Server%20Developer%60s%20Guide/#get-member">회원조회</a>]</td>
<td><a href="../app/#authentication-information">[App] &gt; 인증정보설정</a> <br> <a href="../member/#member">[Member] &gt; 회원조회</a> <br> - 기본정보, 로그인이력, 플레이타임, 결제이력 등</td>
</tr>
<tr>
<td>Logout</td>
<td>Logout</td>
<td>[<a href="../ios-authentication/#logout">iOS</a>] [<a href="../aos-authentication/#logout">Android</a>] [<a href="../unity-authentication/#logout">Unity</a>]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Withdraw</td>
<td>게임 탈퇴 <br> - User의 User Id, 매핑정보 등 모든 정보 삭제</td>
<td>[<a href="../ios-authentication/#withdraw">iOS</a>] [<a href="../aos-authentication/#withdraw">Android</a>] [<a href="../unity-authentication/#withdraw">Unity</a>]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Mapping</td>
<td>하나의 User ID에 여러개의 IDP를 연동하는 기능</td>
<td>[<a href="../ios-authentication/#mapping">iOS</a>] [<a href="../aos-authentication/#mapping">Android</a>] [<a href="../unity-authentication/#mapping">Unity</a>]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Purchase(IAP)</td>
<td>(TOAST Cloud 상품연동) <br> 인앱결제 <br> - 지원되는 스토어 : google, app store</td>
<td>[<a href="../ios-purchase/#purchase">iOS</a>] [<a href="../aos-purchase/#purchase">Android</a>] [<a href="../unity-purchase/#purchase">Unity</a>]</td>
<td>[<a href="../Server%20Developer%60s%20Guide/#purchaseiap">Wrappping API</a>]</td>
<td><a href="../purchase/#app">[Purchase]</a><br> <a href="../purchase/#item">- 아이템 등록</a> <br> <a href="../purchase/#transactions">- 결제정보 조회</a></td>
</tr>
<tr>
<td>Push</td>
<td>(TOAST Cloud 상품연동) <br> Push 메시지 전송 및 결과 확인</td>
<td>[<a href="../ios-push/#push">iOS</a>] [<a href="../aos-push/#push">Android</a>] [<a href="../unity-push/#push">Unity</a>]</td>
<td></td>
<td><a href="../push/#push">[Push]</a> <br/>- 실시간, 예약 Push 발송</td>
</tr>
<tr>
<td>Leaderboard</td>
<td>(TOAST Cloud 상품연동) <br> 실시간 대용량 랭킹 조회 및 등록</td>
<td></td>
<td>[<a href="../Server%20Developer%60s%20Guide/#leaderboard">Wrappping API</a>]</td>
<td></td>
</tr>
<tr>
<td>Webview</td>
<td>SDK에서 기본적인 Webview UI를 제공<br/>alert, toast ui 제공</td>
<td>[<a href="../ios-ui/#webview">iOS</a>] [<a href="../aos-ui/#webview">Android</a>] [<a href="../unity-ui/#webview">Unity</a>]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>[Operator]Maintenance</td>
<td>(운영) 점검기능</td>
<td></td>
<td>[<a href="../Server%20Developer%60s%20Guide/#maintenance">점검여부확인</a>]</td>
<td><a href="../operation/#maintenance">[Maintenance]</a><br>- 점검등록, 점검해제</td>
</tr>
<tr>
<td>[Operator]Notice</td>
<td>(운영) 긴급 공지 기능 <br> - 게임 유저가 앱 실행시 팝업형태로 공지 확인이 가능</td>
<td></td>
<td></td>
<td><a href="../operation/#notice">[Notice]</a> <br/>-공지 등록</td>
</tr>
<tr>
<td>[Operator]Ban</td>
<td>(운영) 게임유저의 이용정지 등록 및 해제 <br> - 이용정지된 유저는 로그인이 불가능함</td>
<td>[<a href="../ios-authentication/#get-banned-user-information">iOS</a>] [<a href="../aos-authentication/#get-banned-user-information">Android</a>] [<a href="../unity-authentication/#get-banned-user-infomation">Unity</a>] <br/> -이용정지 유저 정보 확인</td>
<td></td>
<td><a href="../ban/#ban">[Ban]</a> <br/>-이용정지 등록 및 해제</td>
</tr>
</tbody>
</table>