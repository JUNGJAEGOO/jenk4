title=About
date=2013-09-24
type=page
status=published
big=TCCommon
summary=LaunchingGetting
~~~~~~
## Common > Launching > Getting Started

Launching 서비스를 사용하기 위한 절차는 다음과 같습니다.

### 서비스 활성화

Launching 서비스를 사용하기 위해서는 Console에서 [Common] > [Launching] 을 선택한 후 [상품이용] 버튼을 클릭하여 서비스를 활성화시킵니다.

![[그림 1 Launching 서비스 활성화]](http://static.toastoven.net/toastcloud/static/common/img/cms_img/launching/img_1.jpg)
<center>[그림 1 Launching 서비스 활성화]</center>

### URL & AppKey 확인

서비스를 활성화 화면 자동으로 생성한 Launching URL & AppKey 값을 확인할 수 있습니다. URL & AppKey 값은 Launching 서비스 요청 시 파라미터로 사용합니다.

![[그림 2 Launching URL & AppKey 확인]](http://static.toastoven.net/toastcloud/static/common/img/cms_img/launching/img_2.png)
<center>[그림 2 Launching URL & AppKey 확인]</center>

## Launching 데이터 관리

모바일 앱에서 사용할 Launching 데이터 설정 방법은 다음과 같습니다.

### 데이터 조회

Console에서 [Common] > [Lauching] 을 선택하면, 현재 설정된 Launching정보를 조회 할 수 있습니다.

![[그림 3 Launching 템플릿 데이터]](http://static.toastoven.net/toastcloud/static/common/img/cms_img/launching/img_3.png)
<center>[그림 3 Launching 템플릿 데이터]</center>

> [참고]  
> Launching 서비스를 사용하면 [그림 3] 과 같이 기본으로 템플릿 데이터를 제공합니다.   
> (실제 템플릿 데이터는 [그림 3] 과는 다를 수 있습니다.)

### 폴더 선택 및 변경

런칭 정보의 좌측 탐색창에서 [폴더] 를 선택하면 우측에 해당 폴더의 정보가 출력이 되고, 선택된 폴더의 이름 및 설명을 변경 한 후, [적용] 을 누르면 해당 정보가 변경 됩니다.

![[그림 4 폴더 선택 및 정보 변경]](http://static.toastoven.net/toastcloud/static/common/img/cms_img/launching/img_4.png)
<center>[그림 4 폴더 선택 및 정보 변경]</center>

> [참고]  
> [적용] 은 Console 내부적으로 변경 사항을 반영한 것으로, 수정된 사항을 서버에 반영 하려면 [배포] 탭에서 [배포] 를 하셔야 합니다.  

### 폴더 추가

런칭 정보의 좌측 탐색창에서 루트(launching) 또는 기존에 생성한 폴더를 선택한 후 마우스 우클릭을 하면 컨텍스트 메뉴창이 나타나며, 해당 메뉴에서 [폴더 추가] 를 선택하면 폴더를 추가 할 수 있습니다.

![[그림 5 폴더 추가]](http://static.toastoven.net/toastcloud/static/common/img/cms_img/launching/img_5.png)
<center>[그림 5 폴더 추가]</center>

### 키 선택 및 정보 변경

런칭 정보의 좌측 탐색창에서 키를 선택하면 우측에 해당 키 정보가 출력 되고, 선택한 키의 이름 및 값 등을 변경 한 후, [저장] 을 누르면 해당 정보가 변경 됩니다.

![[그림 6 KEY 정보 조회 및 값 변경]](http://static.toastoven.net/toastcloud/static/common/img/cms_img/launching/img_6.png)
<center>[그림 6 KEY 정보 조회 및 값 변경]</center>

> [주의]  
> [적용] 은 Console 내부적으로 변경 사항을 반영한 것으로, 수정된 사항을 서버에 반영 하려면 [배포] 탭에서 [배포] 를 하셔야 합니다.  

<br/>
> [참고]  
> 서로 다른 폴더에 속하는 키는 동일한 키 이름을 가질 수 있지만, 하나의 폴더에 속하는 키들은 동일한 이름을 가질 수 없습니다. 즉, server 폴더 하단에 'ip'라는 키는 하나만 존재 가능하지만, client 라는 또 다른 폴더에 'ip'라는 키는 가질 수 있습니다.

### 키 추가

런칭 정보의 좌측 탐색창에서 [폴더] 또는 [키] 를 선택 한 후 마우스 우클릭을 하면 컨텍스트 메뉴창이 나타나며, 해당 메뉴에서 [키 추가] 를 선택하면 키를 추가 할 수 있습니다.

![[그림 7 KEY 추가]](http://static.toastoven.net/toastcloud/static/common/img/cms_img/launching/img_7.png)
<center>[그림 7 KEY 추가]</center>

### 폴더 및 키 삭제

런칭 정보의 좌측 탐색창에서 [폴더] 또는 [키] 를 선택한 후 마우스 우클릭을 하면 컨텍스트 메뉴창이 나타나며, [삭제] 를 선택하면 [폴더] 또는 [키] 를 삭제 할 수 있습니다.

![[그림 8 폴더 및 KEY 삭제]](http://static.toastoven.net/toastcloud/static/common/img/cms_img/launching/img_8.png)
<center>[그림 8 폴더 및 KEY 삭제]</center>

> [참고]  
> 폴더를 삭제하면 해당 폴더에 속한 모든 하위 폴더 및 키를 삭제 합니다.

### 로직 조회

상단의 [로직] 탭을 누르면, 등록된 런칭 정보를 변경하기 위한 서버 로직 정보를 확인할 수 있습니다. 로직은 고정된 런칭 정보를 동적으로 변경하기 위한 비즈니스 로직을 의미하며, 서버에서 구동되기 때문에 모바일 앱의 업데이트 없이 변경된 런칭 정보를 얻을 수 있게 합니다.

![[그림 9 런칭 정보 조회]](http://static.toastoven.net/toastcloud/static/common/img/cms_img/launching/img_9.png)
<center>[그림 9 런칭 정보 조회]</center>

### 로직 추가

서버 로직을 추가하기 위해서는 로직이 동작하는 시각 시각 및 종료 시각, 로직이 적용되는 조건 및 결과를 입력해야 합니다. 조건에는 javascript 의 비교 연산자 및 괄호를 사용할 수 있으며 런칭 정보 및 런칭 조회 API 로부터 전달 받은 GET 파라미터 값을 변수로 사용 할 수 있습니다. 런칭 정보는 [launching.{folder}.{key}] 형식으로 사용할 수 있으며, 그외에는 전부 API 의 파라미터로 인식합니다. 사용자의 오타를 방지 하기 위해 콘솔에서 제공하는 자동완성 기능을 사용하는 것이 좋습니다. 결과는 로직의 조건이 맞을 경우 런칭 정보를 바꾸는 설정이고, 조건과 동일하게 [launching.{folder}.{key}] 형식으로 사용 할 수 있습니다.

![[그림 10 로직 추가]](http://static.toastoven.net/toastcloud/static/common/img/cms_img/launching/img_14.png)
<center>[그림 10 로직 추가]</center>


> [참고]  
> 결과로 지정한 런칭키가 존재 하지 않으면 새롭게 추가하고, 아니면 기존 정보를 덮어 쓰게 됩니다. 예를 들어, [그림2] 의 런칭정보를 기준으로 런칭키를 [launching.server.test] 결과값을 [127.0.0.1] 로 설정했다면, 런칭정보의 launching.server [폴더] 에 [test] 라는 키가 추가되고 그 값이 [127.0.0.1] 로 설정됩니다.  

<br/>
> [주의]  
> 로직의 조건은 최대 1KB 를 넘길 수 없습니다. 또한 로직의 결과는 최대 10개까지 등록 가능하며, 런칭키와 결과값은 최대 255 Bytes 를 넘길 수 없습니다.  

### 로직 수정

등록된 로직의 설명을 클릭하면 해당 로직을 수정 할 수 있습니다.

![[그림 11 로직 수정]](http://static.toastoven.net/toastcloud/static/common/img/cms_img/launching/img_15.png)
<center>[그림 11 로직 수정]</center>

> [주의]  
> 로직의 모든 변경 사항은 최대 1분의 반영시간이 걸릴 수 있습니다.

### 1로직 실행 / 정지

로직 목록에서 정지 시키거나 실행할 로직의 체크박스를 클릭하여 선택한 후, 상단의 실행 / 정지 버튼을 눌러 로직의 상태를 변경할 수 있습니다. 정지 상태의 로직은 런칭정보를 수정하지 않습니다.

![[그림 12 로직 실행 / 정지]](http://static.toastoven.net/toastcloud/static/common/img/cms_img/launching/img_16.png)
<center>[그림 12 로직 실행 / 정지]</center>

> [주의]  
> 로직의 모든 변경 사항은 최대 1분의 반영시간이 걸릴 수 있습니다.

### 로직 삭제

로직 목록에서 삭제할 로직의 체크박스를 클릭하여 선택한 후, 상단의 삭제 버튼을 눌러 로직을 삭제할 수 있습니다.

![[그림 13 로직 삭제]](http://static.toastoven.net/toastcloud/static/common/img/cms_img/launching/img_17.png)
<center>[그림 13 로직 삭제]</center>

> [주의]
> 로직의 모든 변경 사항은 최대 1분의 반영시간이 걸릴 수 있습니다.

### 로직 테스트

런칭 정보를 서버에 배포하기 전에 로직을 테스트 할 수 있습니다. 런칭 정보를 호출 할 때 넘겨줄 파라미터와 로직의 적용 시각을 설정 후 [실행] 버튼을 누르면 하단에 로직이 적용된 런칭 정보를 미리 확인 할 수 있습니다. 여러개의 파라미터를 넘겨주는 것을 테스트 하려면 파라미터 가장 좌측의 [+]를 누르면 새로운 파라미터를 등록할 수 있습니다.

![[그림 14 로직 테스트]](http://static.toastoven.net/toastcloud/static/common/img/cms_img/launching/img_18.png)
<center>[그림 14 로직 테스트]</center>

예를 들어, [그림 14] 의 테스트를 실행한 경우 [그림 15-3] 의 테스트 결과를 확인 할 수 있습니다.

![[그림 15-1 예제 런칭 정보]](http://static.toastoven.net/toastcloud/static/common/img/cms_img/launching/img_19.png)
<center>[그림 15-1 예제 런칭 정보]</center>

예제 런칭 정보를 보면 [launching.server.ip] 의 값이 '127.0.0.1' 이고 [launching.state] 의 값은 'real' 입니다.

![[그림 15-2 예제 로직 정보]](http://static.toastoven.net/toastcloud/static/common/img/cms_img/launching/img_22.png)
<center>[그림 15-2 예제 로직 정보]</center>

로직의 조건으로 [launching.state == 'real'] 를 설정하였고, 그 결과로 [launching.server.ip] 의 값에 '0.0.0.0'을 설정하도록 하였습니다.

![[그림 15-3 예제 테스트 결과]](http://static.toastoven.net/toastcloud/static/common/img/cms_img/launching/img_23.png)
<center>[그림 15-3 예제 테스트 결과]</center>

최종 테스트 결과를 보면 [lauching.server.ip] 의 값에 '0.0.0.0'이 들어간 것을 확인 할 수 있습니다.

### 배포하기

[런칭정보] 탭에서 수정한 사항을 서버에 반영하려면, 반드시 [배포]탭에서 배포를 하셔야 합니다. 배포를 하게 되면 배포 된 [런칭정보] 뿐만 아니라 배포하는 시점에 존재하는 [로직] 정보도 같이 저장이 됩니다. 배포에 걸리는 시간은 최대 1분이 소요되게 됩니다. 따라서 최대 1분 동안은 모바일 앱에서 이전 런칭 정보를 가져갈 수 있습니다.

![[그림 16 배포 하기]](http://static.toastoven.net/toastcloud/static/common/img/cms_img/launching/img_24.png)
<center>[그림 16 배포 하기]</center>

### 설정공유

[런칭정보] 및 [로직] 설정을 공유하기 위해 2가지 방법을 제공하고 있습니다. 하나는 클립보드를 이용하는 방법입니다. [배포] 탭의 [클립보드 복사] 를 누르면 현재 [런칭정보] 및 [로직] 설정을 json형태로 클립보드에 복사하게 됩니다. 복사된 json을 설정을 공유하고자 하는 프로젝트에서 [불러오기] 를 눌러 붙여넣으면 간편하게 정보를 공유 할 수 있습니다.

![[그림 17 클립보드를 이용한 설정 공유]](http://static.toastoven.net/toastcloud/static/common/img/cms_img/launching/img_25.png)
<center>[그림 17 클립보드를 이용한 설정 공유]</center>

또 하나의 방법은 [공유] 버튼을 사용하는 것입니다. 배포 목록에서 공유하고자 하는 히스토리의 [공유] 버튼을 누르면, 공유 가능한 프로젝트 목록이 나오게 되고, 특정 프로젝트를 선택하면 해당 프로젝트로 설정이 공유 됩니다.

![[그림 17 클립보드를 이용한 설정 공유]](http://static.toastoven.net/toastcloud/static/common/img/cms_img/launching/img_26.png)
<center>[그림 17 클립보드를 이용한 설정 공유]</center>

> [주의]  
> 클립보드를 이용하던지, [공유] 버튼을 이용하던지에 상관없이, 설정을 공유하거나 불러오게 되면 현재 설정 정보를 잃어버리게 되니 주의하여야 합니다.

### 설정복원

배포 후 문제가 발생하거나, 이전 설정으로 돌아가고 싶으면 배포 목록에서 복원하고자 하는 히스토리의 [복원] 버튼을 누르면 됩니다.

![[그림 17 클립보드를 이용한 설정 공유]](http://static.toastoven.net/toastcloud/static/common/img/cms_img/launching/img_27.png)
<center>[그림 17 클립보드를 이용한 설정 공유]</center>
