title=About
date=2013-09-24
type=page
status=published
big=TCGame
summary=TCGamebaseErrorcodes
nation=ko
~~~~~~

## Game > Gamebase > Error Code

## Client SDK

<table>
<thead>
<tr>
<th>Category</th>
<th>Platform</th>
<th>Error</th>
<th>Error Code</th>
<th>Notes</th>
</tr>
</thead>
<tbody>
<tr>
<td>Common</td>
<td>AOS, UNITY<br/>IOS</td>
<td>NOT_INITIALIZED<br/>TCGB_ERROR_NOT_INITIALIZED</td>
<td>1</td>
<td>Gamebase 초기화가 되어있지 않습니다.</td>
</tr>
<tr>
<td></td>
<td>AOS, UNITY<br/>IOS</td>
<td>NOT_LOGGED_IN<br/>TCGB_ERROR_NOT_LOGGED_IN</td>
<td>2</td>
<td>로그인이 필요합니다.</td>
</tr>
<tr>
<td></td>
<td>AOS, UNITY<br/>IOS</td>
<td>INVALID_PARAMETER<br/>TCGB_ERROR_INVALID_PARAMETER</td>
<td>3</td>
<td>잘못된 파라미터입니다.</td>
</tr>
<tr>
<td></td>
<td>AOS, UNITY<br/>IOS</td>
<td>INVALID_JSON_FORMAT<br/>TCGB_ERROR_INVALID_JSON_FORMAT</td>
<td>4</td>
<td>JSON 포맷 에러입니다.</td>
</tr>
<tr>
<td></td>
<td>AOS, UNITY<br/>IOS</td>
<td>USER_PERMISSION<br/>TCGB_ERROR_USER_PERMISSION</td>
<td>5</td>
<td>권한이 없습니다.</td>
</tr>
<tr>
<td></td>
<td>AOS, UNITY<br/>IOS</td>
<td>NOT_SUPPORTED<br/>TCGB_ERROR_NOT_SUPPORTED</td>
<td>10</td>
<td>지원하지 않는 기능입니다.</td>
</tr>
<tr>
<td></td>
<td>UNITY<br/>IOS</td>
<td>NOT_SUPPORTED_ANDROID<br/>TCGB_ERROR_NOT_SUPPORTED_ANDROID</td>
<td>11</td>
<td>Android에서 지원하지 않는 기능입니다.</td>
</tr>
<tr>
<td></td>
<td>UNITY<br/>IOS</td>
<td>NOT_SUPPORTED_IOS<br/>TCGB_ERROR_NOT_SUPPORTED_IOS</td>
<td>12</td>
<td>iOS에서 지원하지 않는 기능입니다.</td>
</tr>
<tr>
<td></td>
<td>UNITY</td>
<td>NOT_SUPPORTED_UNITY_EDITOR</td>
<td>13</td>
<td>Editor에서 지원하지 않는 기능입니다.</td>
</tr>
<tr>
<td></td>
<td>UNITY</td>
<td>NOT_SUPPORTED_UNITY_STANDALONE</td>
<td>14</td>
<td>Standalone에서 지원하지 않는 기능입니다.</td>
</tr>
<tr>
<td></td>
<td>UNITY</td>
<td>NOT_SUPPORTED_UNITY_WEBGL</td>
<td>15</td>
<td>WebGL에서 지원하지 않는 기능입니다.</td>
</tr>
<tr>
<td>Network(Socket)</td>
<td>AOS, UNITY<br/>IOS</td>
<td>SOCKET_RESPONSE_TIMEOUT<br/>TCGB_ERROR_SOCKET_RESPONSE_TIMEOUT</td>
<td>101</td>
<td>네트워크 상태가 불안정하여 응답이 없습니다.</td>
</tr>
<tr>
<td></td>
<td>AOS, UNITY<br/>IOS</td>
<td>SOCKET_ERROR<br/>TCGB_ERROR_SOCKET_ERROR</td>
<td>110</td>
<td>소켓 에러</td>
</tr>
<tr>
<td></td>
<td>AOS, UNITY<br/>IOS</td>
<td>UNKNOWN_ERROR<br/>TCGB_ERROR_UNKNOWN_ERROR</td>
<td>999</td>
<td>소켓 알 수 없는 에러</td>
</tr>
<tr>
<td>Launching</td>
<td>AOS, UNITY<br/>IOS</td>
<td>LAUNCHING_SERVER_ERROR<br/>TCGB_ERROR_LAUNCHING_SERVER_ERROR</td>
<td>2001</td>
<td>런칭 서버 에러입니다.</td>
</tr>
<tr>
<td></td>
<td>AOS, UNITY<br/>IOS</td>
<td>LAUNCHING_NOT_EXIST_CLIENT_ID<br/>TCGB_ERROR_LAUNCHING_NOT_EXIST_CLIENT_ID</td>
<td>2002</td>
<td>Client ID가 존재하지 않습니다.</td>
</tr>
<tr>
<td></td>
<td>AOS, UNITY<br/>IOS</td>
<td>LAUNCHING_UNREGISTERED_APP<br/>TCGB_ERROR_LAUNCHING_UNREGISTERED_APP</td>
<td>2003</td>
<td>등록되지 않은 App 입니다.</td>
</tr>
<tr>
<td></td>
<td>AOS, UNITY<br/>IOS</td>
<td>LAUNCHING_UNREGISTERED_CLIENT<br/>TCGB_ERROR_LAUNCHING_UNREGISTERED_CLIENT</td>
<td>2004</td>
<td>등록되지 않은 Client (version) 입니다.</td>
</tr>
<tr>
<td>Auth</td>
<td>AOS, UNITY<br/>IOS</td>
<td>AUTH_USER_CANCELED<br/>TCGB_ERROR_AUTH_USER_CANCELED</td>
<td>3001</td>
<td>로그인이 취소되었습니다.</td>
</tr>
<tr>
<td></td>
<td>AOS, UNITY<br/>IOS</td>
<td>AUTH_NOT_SUPPORTED_PROVIDER<br/>TCGB_ERROR_AUTH_NOT_SUPPORTED_PROVIDER</td>
<td>3002</td>
<td>지원하지 않는 인증 방식입니다.</td>
</tr>
<tr>
<td></td>
<td>AOS, UNITY<br/>IOS</td>
<td>AUTH_NOT_EXIST_MEMBER<br/>TCGB_ERROR_AUTH_NOT_EXIST_MEMBER</td>
<td>3003</td>
<td>존재하지 않거나 탈퇴한 회원입니다.</td>
</tr>
<tr>
<td></td>
<td>AOS, UNITY<br/>IOS</td>
<td>AUTH_INVALID_MEMBER<br/>TCGB_ERROR_AUTH_INVALID_MEMBER</td>
<td>3004</td>
<td>잘못된 회원에 대한 요청입니다.</td>
</tr>
<tr>
<td></td>
<td>AOS, UNITY<br/>IOS</td>
<td>AUTH_INVALID_MEMBER<br/>TCGB_ERROR_AUTH_BANNED_MEMBER</td>
<td>3005</td>
<td>제재된 회원입니다.</td>
</tr>
<tr>
<td></td>
<td>AOS, UNITY<br/>IOS</td>
<td>AUTH_EXTERNAL_LIBRARY_ERROR<br/>TCGB_ERROR_AUTH_EXTERNAL_LIBRARY_ERROR</td>
<td>3009</td>
<td>외부 인증 라이브러리 에러입니다.</td>
</tr>
<tr>
<td>Auth (Login)</td>
<td>AOS, UNITY<br/>IOS</td>
<td>AUTH_TOKEN_LOGIN_FAILED<br/>TCGB_ERROR_AUTH_TOKEN_LOGIN_FAILED</td>
<td>3101</td>
<td>토큰 로그인에 실패하였습니다.</td>
</tr>
<tr>
<td></td>
<td>AOS, UNITY<br/>IOS</td>
<td>AUTH_TOKEN_LOGIN_INVALID_TOKEN_INFO<br/>TCGB_ERROR_AUTH_TOKEN_LOGIN_INVALID_TOKEN_INFO</td>
<td>3102</td>
<td>토큰 정보가 유효하지 않습니다.</td>
</tr>
<tr>
<td></td>
<td>AOS, UNITY<br/>IOS</td>
<td>AUTH_TOKEN_LOGIN_INVALID_LAST_LOGGED_IN_IDP<br/>TCGB_ERROR_AUTH_TOKEN_LOGIN_INVALID_LAST_LOGGED_IN_IDP</td>
<td>3103</td>
<td>최근에 로그인한 IDP 정보가 없습니다.</td>
</tr>
<tr>
<td>IDP Login</td>
<td>AOS, UNITY<br/>IOS</td>
<td>AUTH_IDP_LOGIN_FAILED<br/>TCGB_ERROR_AUTH_IDP_LOGIN_FAILED</td>
<td>3201</td>
<td>IDP 로그인에 실패하였습니다.</td>
</tr>
<tr>
<td></td>
<td>AOS, UNITY<br/>IOS</td>
<td>AUTH_IDP_LOGIN_INVALID_IDP_INFO<br/>TCGB_ERROR_AUTH_IDP_LOGIN_INVALID_IDP_INFO</td>
<td>3202</td>
<td>IDP 정보가 유효하지 않습니다. (Console에 해당 IDP 정보가 없습니다.)</td>
</tr>
<tr>
<td>Add Mapping</td>
<td>AOS, UNITY<br/>IOS</td>
<td>AUTH_ADD_MAPPING_FAILED<br/>TCGB_ERROR_AUTH_ADD_MAPPING_FAILED</td>
<td>3301</td>
<td>맵핑 추가에 실패하였습니다.</td>
</tr>
<tr>
<td></td>
<td>AOS, UNITY<br/>IOS</td>
<td>AUTH_ADD_MAPPING_ALREADY_MAPPED_TO_OTHER_MEMBER<br/>TCGB_ERROR_AUTH_ADD_MAPPING_ALREADY_MAPPED_TO_OTHER_MEMBER</td>
<td>3302</td>
<td>이미 다른 멤버에 맵핑되어있습니다.</td>
</tr>
<tr>
<td></td>
<td>AOS, UNITY<br/>IOS</td>
<td>AUTH_ADD_MAPPING_ALREADY_HAS_SAME_IDP<br/>TCGB_ERROR_AUTH_ADD_MAPPING_ALREADY_HAS_SAME_IDP</td>
<td>3303</td>
<td>이미 같은 IDP에 맵핑되어있습니다.</td>
</tr>
<tr>
<td></td>
<td>AOS, UNITY<br/>IOS</td>
<td>AUTH_ADD_MAPPING_INVALID_IDP_INFO<br/>TCGB_ERROR_AUTH_ADD_MAPPING_INVALID_IDP_INFO</td>
<td>3304</td>
<td>IDP 정보가 유효하지 않습니다. (Console에 해당 IDP 정보가 없습니다.)</td>
</tr>
<tr>
<td>Remove Mapping</td>
<td>AOS, UNITY<br/>IOS</td>
<td>AUTH_REMOVE_MAPPING_FAILED<br/>TCGB_ERROR_AUTH_REMOVE_MAPPING_FAILED</td>
<td>3401</td>
<td>맵핑 삭제에 실패하였습니다.</td>
</tr>
<tr>
<td></td>
<td>AOS, UNITY<br/>IOS</td>
<td>AUTH_REMOVE_MAPPING_LAST_MAPPED_IDP<br/>TCGB_ERROR_AUTH_REMOVE_MAPPING_LAST_MAPPED_IDP</td>
<td>3402</td>
<td>마지막에 맵핑된 IDP는 삭제할 수 없습니다.</td>
</tr>
<tr>
<td></td>
<td>AOS, UNITY<br/>IOS</td>
<td>AUTH_REMOVE_MAPPING_LOGGED_IN_IDP<br/>TCGB_ERROR_AUTH_REMOVE_MAPPING_LOGGED_IN_IDP</td>
<td>3403</td>
<td>현재 로그인되어있는 IDP 입니다.</td>
</tr>
<tr>
<td>Logout</td>
<td>AOS, UNITY<br/>IOS</td>
<td>AUTH_LOGOUT_FAILED<br/>TCGB_ERROR_AUTH_LOGOUT_FAILED</td>
<td>3501</td>
<td>로그아웃에 실패하였습니다.</td>
</tr>
<tr>
<td>Withdrawal</td>
<td>AOS, UNITY<br/>IOS</td>
<td>AUTH_WITHDRAW_FAILED<br/>TCGB_ERROR_AUTH_WITHDRAW_FAILED</td>
<td>3601</td>
<td>탈퇴에 실패하였습니다.</td>
</tr>
<tr>
<td>Not Playable</td>
<td>AOS, UNITY<br/>IOS</td>
<td>AUTH_NOT_PLAYABLE<br/>TCGB_ERROR_AUTH_NOT_PLAYABLE</td>
<td>3701</td>
<td>플레이할 수 없는 상태입니다. (점검 또는 서비스 종료 등)</td>
</tr>
<tr>
<td>Auth(Unknown)</td>
<td>AOS, UNITY<br/>IOS</td>
<td>AUTH_UNKNOWN_ERROR<br/>TCGB_ERROR_AUTH_UNKNOWN_ERROR</td>
<td>3999</td>
<td>알수 없는 에러입니다. (정의 되지 않은 에러입니다.)</td>
</tr>
<tr>
<td>Purchase</td>
<td>AOS, UNITY<br/>IOS</td>
<td>PURCHASE_NOT_INITIALIZED<br/>TCGB_ERROR_PURCHASE_NOT_INITIALIZED</td>
<td>4001</td>
<td>Gamebase PurchaseAdapter가 초기화되지 않았습니다.</td>
</tr>
<tr>
<td></td>
<td>AOS, UNITY<br/>IOS</td>
<td>PURCHASE_USER_CANCELED<br/>TCGB_ERROR_PURCHASE_USER_CANCELED</td>
<td>4002</td>
<td>구매가 취소되었습니다.</td>
</tr>
<tr>
<td></td>
<td>AOS, UNITY<br/>IOS</td>
<td>PURCHASE_NOT_FINISHED_PREVIOUS_PURCHASING<br/>TCGB_ERROR_PURCHASE_NOT_FINISHED_PREVIOUS_PURCHASING</td>
<td>4003</td>
<td>이전 구매가 완료되지 않았습니다.</td>
</tr>
<tr>
<td></td>
<td>AOS, UNITY<br/>IOS</td>
<td>PURCHASE_NOT_ENOUGH_CASH<br/>TCGB_ERROR_PURCHASE_NOT_ENOUGH_CASH</td>
<td>4004</td>
<td>해당 스토어의 캐쉬가 부족하여 결제할 수 없습니다.</td>
</tr>
<tr>
<td></td>
<td>AOS, UNITY<br/>IOS</td>
<td>PURCHASE_NOT_SUPPORTED_MARKET<br/>TCGB_ERROR_PURCHASE_NOT_SUPPORTED_MARKET</td>
<td>4010</td>
<td>지원하지 않는 스토어입니다.</td>
</tr>
<tr>
<td></td>
<td>AOS, UNITY<br/>IOS</td>
<td>PURCHASE_EXTERNAL_LIBRARY_ERROR<br/>TCGB_ERROR_PURCHASE_EXTERNAL_LIBRARY_ERROR</td>
<td>4201</td>
<td>외부 IAP 라이브러리 에러입니다.</td>
</tr>
<tr>
<td></td>
<td>AOS, UNITY<br/>IOS</td>
<td>PURCHASE_UNKNOWN_ERROR<br/>TCGB_ERROR_PURCHASE_UNKNOWN_ERROR</td>
<td>4999</td>
<td>알수없는 구매 에러입니다.</td>
</tr>
<tr>
<td>Push</td>
<td>AOS, UNITY<br/>IOS</td>
<td>PUSH_EXTERNAL_LIBRARY_ERROR<br/>TCGB_ERROR_PUSH_EXTERNAL_LIBRARY_ERROR</td>
<td>5101</td>
<td>외부 라이브러리 에러입니다.</td>
</tr>
<tr>
<td></td>
<td>AOS, UNITY<br/>IOS</td>
<td>PUSH_ALREADY_IN_PROGRESS_ERROR<br/>TCGB_ERROR_PUSH_ALREADY_IN_PROGRESS_ERROR</td>
<td>5102</td>
<td>이전 PUSH API 호출이 완료되지 않았습니다.</td>
</tr>
<tr>
<td></td>
<td>AOS, UNITY<br/>IOS</td>
<td>PUSH_UNKNOWN_ERROR<br/>TCGB_ERROR_PUSH_UNKNOWN_ERROR</td>
<td>5999</td>
<td>알수 없는 푸시 에러입니다. (정의되지 않은 푸시 에러입니다.)</td>
</tr>
<tr>
<td>UI</td>
<td>AOS, UNITY<br/>IOS</td>
<td>UI_UNKNOWN_ERROR<br/>TCGB_ERROR_UI_UNKNOWN_ERROR</td>
<td>6999</td>
<td>알수 없는 에러입니다. (정의되지 않은 에러입니다.)</td>
</tr>
<tr>
<td>Server</td>
<td>AOS, UNITY<br/>IOS</td>
<td>SERVER_INTERNAL_ERROR<br/>TCGB_ERROR_SERVER_INTERNAL_ERROR</td>
<td>8001</td>
<td>서버 내부 에러</td>
</tr>
<tr>
<td></td>
<td>AOS, UNITY<br/>IOS</td>
<td>SERVER_REMOTE_SYSTEM_ERROR<br/>TCGB_ERROR_SERVER_REMOTE_SYSTEM_ERROR</td>
<td>8002</td>
<td>서버에서 외부 연동중 에러 발생</td>
</tr>
<tr>
<td></td>
<td>AOS, UNITY<br/>IOS</td>
<td>SERVER_UNKNOWN_ERROR<br/>TCGB_ERROR_SERVER_UNKNOWN_ERROR</td>
<td>8999</td>
<td>서버에서 알 수 없는 에러</td>
</tr>
</tbody>
</table>
<p><br/>
<br/></p>

## Server

<table>
<thead>
<tr>
<th>Module</th>
<th>Error Code</th>
<th>Notes</th>
</tr>
</thead>
<tbody>
<tr>
<td>Common</td>
<td>-4000001<br/>-4000006</td>
<td>잘못된 파라미터 타입으로 API 호출 <br/>EX) parameter 는 int 형으로 선언되어 있는데, String 형 데이터로 API가 호출됨</td>
</tr>
<tr>
<td></td>
<td>-4000002<br/>-4000004</td>
<td>필수 파라미터가 생략 되었거나 값이 없을때</td>
</tr>
<tr>
<td></td>
<td>-4000003</td>
<td>Request body에 정의되지 않은 값이 전달된 경우</td>
</tr>
<tr>
<td></td>
<td>-4000005</td>
<td>필수 파라미터가 생략되었거나, 부적절한 값으로 호출될 때</td>
</tr>
<tr>
<td></td>
<td>-4010001</td>
<td>잘못된 AppId가 호출 됨</td>
</tr>
<tr>
<td></td>
<td>-4010002</td>
<td>잘못된 AppKey가 호출 됨</td>
</tr>
<tr>
<td></td>
<td>-4010003</td>
<td>인증되지 않은 클라이언트에서 인증이 필요한 API 를 호출 한 경우</td>
</tr>
<tr>
<td></td>
<td>-4010004</td>
<td>잘못된 SecretKey가 호출 됨</td>
</tr>
<tr>
<td></td>
<td>-4060001</td>
<td>HTTP Header에 Content-Type을 잘못 설정</td>
</tr>
<tr>
<td></td>
<td>-4090001 ~ 4</td>
<td>내부 DB 관련 오류</td>
</tr>
<tr>
<td></td>
<td>-4150001</td>
<td>잘못된 형식의 JSON 데이터 전달</td>
</tr>
<tr>
<td></td>
<td>-5000001 ~ 15</td>
<td>내부 시스템 오류</td>
</tr>
<tr>
<td>Gateway</td>
<td>-4010202</td>
<td>잘못된 AppId가 호출 됨</td>
</tr>
<tr>
<td></td>
<td>-4010203</td>
<td>유효하지 않은 Access Token</td>
</tr>
<tr>
<td></td>
<td>-4010204</td>
<td>이용정지/탈퇴/계정 유실 등 유효하지 않은 사용자</td>
</tr>
<tr>
<td></td>
<td>-4040201</td>
<td>호출한 API에 대한 TC 상품이 활성화 되어 있지 않을 때 <br/>EX) Leaderboard 상품을 사용 안 하는 상태에서 Gamebase 를 통해 Leaderboard API를 호출할 때 <br/>혹은 Gamebase 자체가 활성화 되어 있지 않을 때</td>
</tr>
<tr>
<td></td>
<td>-4040202</td>
<td>정의되어 있지 않은 API를 호출 한 경우</td>
</tr>
<tr>
<td></td>
<td>-5000201 ~ 7</td>
<td>Gateway 내부 시스템 오류</td>
</tr>
<tr>
<td>Member</td>
<td>-4000402</td>
<td>UserId를 잘못 입력 했을 때</td>
</tr>
<tr>
<td></td>
<td>-4000403</td>
<td>잘못된 회원에 대한 요청일 때</td>
</tr>
<tr>
<td></td>
<td>-4000404</td>
<td>잘못된 Auth 에 대한 요청일 때</td>
</tr>
<tr>
<td></td>
<td>-4040401</td>
<td>존재하지 않거나 탈퇴된 회원에 대한 요청일 때</td>
</tr>
<tr>
<td></td>
<td>-4100401</td>
<td>이미 탈퇴된 회원에 대한 요청일 때</td>
</tr>
<tr>
<td></td>
<td>-4220401</td>
<td>사용자 Auth 데이터가 정상적이지 않을 때</td>
</tr>
</tbody>
</table>