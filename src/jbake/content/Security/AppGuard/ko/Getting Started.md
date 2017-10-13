title=About
date=2013-09-24
type=page
status=published
big=TCSecurity
summary=AppGuardGetting
~~~~~~
## Security > AppGuard > Getting Started

AppGuard는 Android 버전과 iOS 버전(Beta)이 있습니다.

Android 버전은 SDK 연동(선택 사항) 후 빌드된 apk 파일을 Web Console 또는 CLI를 통해 앱 보호 작업(필수 사항)을 하면 적용됩니다.
iOS 버전의 경우 SDK 연동(필수 사항)을 통해 적용되며, 별도의 보호 작업은 없습니다.

AppGuard의 사용을 위한 적용 단계는 [그림 1]과 같습니다. 

![[그림 1] AppGuard 적용 방법](http://static.toastoven.net/prod_appguard/figure1.png)
<center>[그림 1] AppGuard 적용 방법</center>

## 서비스 활성화

AppGuard 상품 활성화는 [그림 2]와 같이 Toast Cloud [Console] 페이지에서 [Security] > [AppGuard]를 선택한 후 [Product using] 버튼을 클릭합니다.

![[그림 2] AppGuard 활성화](http://static.toastoven.net/prod_appguard/figure2.png)
<center>[그림 2] AppGuard 활성화</center>

[Product using] 버튼으로 AppGuard 상품을 활성화 하신 후 Web Console 상단에 [상품 사용법]을 참고하셔서 AppGuard를 이용하시면 됩니다.

AppGuard는 어뷰징에 대한 로그 정보를 제공하기 위해 단말 정보, IP등 최소한으로 필요한 내용를 수집 및 저장하게 됩니다.

AppGuard 상품을 이용하는 고객께서는 [상품 사용법]에 공개된 '개인정보보호 가이드'를 참고해 주시기 바랍니다.

이용요금은 AppGuard 요금정책([http://cloud.toast.com/pricing/security](http://cloud.toast.com/pricing/security))을 참고 바랍니다.

## 앱 보호

### SDK 다운로드 및 연동

AppGuard를 활성화하면 [대쉬보드], [앱 설정/보호] 메뉴가 보입니다. [앱 설정/보호] 메뉴를 선택하고 [SDK 다운로드] 버튼을 누르면 OS별 SDK를 다운로드 받을 수 있습니다.

SDK를 다운로드 받은 후 첨부 되어 있는 매뉴얼에 따라 연동합니다.

### 앱 보호 메뉴 선택

[앱 설정/보호] 메뉴 선택 후 [앱 보호] 버튼을 클릭하면 [그림 3]의 화면이 나옵니다. (iOS의 경우 보호 단계 없이 SDK 연동만으로 동작합니다.)

![[그림 3] 앱 보호 설정을 위한 입력 항목](http://static.toastoven.net/prod_appguard/figure4.png)
<center>[그림 3] 앱 보호 설정을 위한 입력 항목</center>

* [인증서] 파일을 선택합니다. 안드로이드는 KeyStore파일입니다.
* [마스터 비밀번호]를 입력하고 [유효성 검사] 버튼을 클릭하여 인증서 파일의 유효성을 검사합니다.
	* 이 검사 작업은 앱 보호 작업 전 KeyStore의 유효성과 적절한 앨리어스를 선택하기 위함입니다.
	* 유효성 검사 실패시, 인증서 파일 정상 여부와 마스터 비밀번호를 확인 합니다.
* [앨리어스]명을 선택합니다.
* [앨리어스 비밀번호]를 입력합니다.
* [보호할 앱]을 선택합니다.
* 보호 레벨을 선택합니다.
	- Level1 : 앱에 대한 비정상 행위 및 패턴 기반의 기본 보안 탐지 기능
	- Level2 : Level1 + 코드 암호화, 앱 변조 방지 등 향상된 보안 기능
	- Level3 : Level2 + 강화된 보안 기능 (특정 서비스에서는 안정성 검증이 필요할 수 있어, 별도 적용 가이드를 받은 경우에만 사용 권장)
	- Level ex : SDK 연동이 필수로 필요한 버전, Level1과 2  사이의 보안성 제공 (타 보안솔루션과 충돌시에만 사용 권장)

* [확인] 버튼을 클릭하여 앱 보호를 합니다.
	\- 앱 보호가 끝나면 [그림 4]의 [앱 설정/보호]탭을 선택하여 보호가 된 앱을 다운로드 받을 수 있습니다. 이제 보호가 된 배포 파일을 각 앱스토어에 올려서 배포하면 됩니다.

![[그림 4] 앱 설정/보호 화면](http://static.toastoven.net/prod_appguard/figure5.png)
<center>[그림 4] 앱 설정/보호 화면</center>

* 앱 보호 작업 수단: Console, CLI(Command Line Interface)

## 대쉬보드

1. 앱 보호 작업이 완료된 앱을 앱 스토어에 배포 후 어뷰징 유저가 탐지되면 [그림 6]의 [대쉬보드] 탭에서 현황을 확인 할 수 있습니다.
2. [대쉬보드]는 AppGuard가 탐지한 어뷰징 사용자의 통계 그래프와 리스트를 검색할 수 있습니다.
3. [유저 ID], [디바이스 ID], [로그 탐지 횟수], [로그 탐지 패턴], [조회기간]으로 [검색] 할 수 있습니다.  
	* [유저 ID]와 [디바이스 ID]는 콤마로 구분하여 여러 개의 조건을 추가할 수 있습니다.
4. 탐지 통계 그래프는 '탐지 패턴별 분포'와 기간별 '탐지 패턴량'을 확인 할 수 있습니다.
5. 탐지 목록은 [유저 ID]와 [디바이스 ID], [로그 탐지 패턴 정보], [로그 탐지 횟수], [앱 버전], [시각]이 나타납니다.
6. 검색 결과는 [보고서 다운로드(CSV)]를 클릭하여 다운로드가 가능합니다. 

![[그림 5] 어뷰징 유저 탐지 대시보드 화면](http://static.toastoven.net/prod_appguard/figure6.png)
<center>[그림 5] 어뷰징 유저 탐지 대시보드 화면</center>
