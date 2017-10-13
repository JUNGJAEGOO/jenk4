title=About
date=2013-09-24
type=page
status=published
big=TCAnalytics
summary=Developer`s GuideErrorcode
~~~~~~
## Analytics > App Analytics > Error Code

|Error Code|	Error Value|	Error Description|
|---|---|---|
|S_SUCCESS|	0x0000 (0)|	API 호출이 성공하였습니다.|
|W_ALREADY_INITIALIZED|	0x1000 (4096)|	SDK가 이미 초기화된 이후 다시 초기화 함수(initializeSDK)를 호출하면 발생합니다.|
|E_GOOGLE_PLAY_SERVICE_ERROR|	0x2000 (8192)|	(Android Only) Google Play Service 관련 에러입니다. <br/> GoogleApiAvailability의 isGooglePlayServicesAvailable함수의 결과가 실패하는 경우 발생합니다. <br/> 자세한 내용은 Google 문서(https://goo.gl/x1kYig)를 참고하세요.|
|E_UNSUPPORTED_ANDROID_VERSION|	0x2001 (8193)|	(Android Only) Android API Level 9 이하인 경우 발생합니다. Toast Analytics SDK는 API Level 10 이상을 지원합니다.|
|E_NOT_INITIALIZED|	0x8000 (32768)|	SDK가 초기화 되지 않은 상태에서 API를 호출하면 발생합니다. initializeSDK를 먼저 호출해야 합니다.|
|E_INVALID_PARAMS|	0x8002 (32770)|	유효하지 않은 Parameter를 호출하면 발생합니다. Parameter를 확인하세요.|
|E_ALREADY_EXISTS|	0x8003 (32771)|	동일한 screenCode 값으로 traceStartSpeed가 2회이상 호출하는 경우 발생합니다.|
|E_INTERNAL_ERROR|	0x8004 (32772)|	SDK 내부에서 발생한 에러입니다.|
|E_INSUFFICIENT_OPERATION|	0x8005 (32773)|	traceStartSpeed가 호출되지 않은 screenCode값으로 traceEndSpeed를 호출하는 경우 발생합니다.|
|E_APP_ID_IS_EMPTY|	0x8006 (32774)|	SDK 초기화시 필수 입력값인 앱 ID 값이 NULL입니다. initializeSDK 함수를 확인하세요.|
|E_ENTERPRISE_ID_IS_EMPTY|	0x8007 (32775)|	SDK 초기화시 필수 입력값인 Enterprise ID 값이 NULL입니다. initializeSDK 함수를 확인하세요.|
|E_APP_VERSION_IS_EMPTY|	0x8008 (32776)|	SDK 초기화시 필수 입력값인 앱 버전값이 NULL입니다. initializeSDK 함수를 확인하세요.|
|E_LOGGING_USER_ID_EMPTY|	0x800B (32779)|	User ID 값이 없습니다. initializeSDK에서 useLoggingUserId flag가 true인 경우 setUserId를 호출하지 않은 경우 발생합니다.|
|E_MANIFEST_APPSTORE_MISSING|	0x800C (32780)|	(Android Only) AndroidManifest.xml 메타 데이터중 com.toast.android.analytics.appstore 값이 없습니다. <br/> "Android Developer Guide"를 참고하여 앱을 배포할 스토어에 맞는 코드를 입력해야 합니다.|
|E_CAMPAIGN_SHOW_EXPIRED|	0x7000 (28672)|	캠페인 기간이 만료되었습니다.|
|E_CAMPAIGN_SHOW_ALREADY|	0x7001 (28673)|	이미 노출된 캠페인 뷰를 show 요청하거나, 노출 안된 캠페인 뷰를 hide 요청하는 경우 발생합니다.|
|E_CAMPAIGN_SHOW_PENDING|	0x7002 (28674)|	이미 다른 캠페인 뷰가 노출된 상태에서 캠페인 뷰 show 요청을 호출하는 경우 발생합니다.|
|E_CAMPAIGN_SHOW_FAIL|	0x7003 (28675)|	캠페인 뷰의 리소스중 일부를 로드할수 없습니다.|
|E_CAMPAIGN_SHOW_BLOCKED|	0x7004 (28676)|	캠페인 노출이 사용자에 의해 블록되었거나, 이미 실행이 완료된 캠페인을 사용하는 경우 발생합니다.|
|E_CAMPAIGN_NOTEXIST|	0x7005 (28677)|	캠페인이 존재하지 않습니다.|
|E_CAMPAIGN_DISABLED|	0x7006 (28678)|	디바이스 설정에 IDFA/ADID 사용 설정이 Disable인 경우 발생합니다.|
|E_CAMPAIGN_USER_ID_IS_EMPTY|	0x7007 (28679)|	캠페인 실행용 유저ID값이 설정되지 않았습니다. setUserId를 호출하여 캠페인 사용자 ID를 전달해야 합니다.|
|E_UNKNOWN|	0x8FFF (36863)|	알수 없는 오류가 발생하였습니다. Analytics 고객센터에 문의하세요.|
