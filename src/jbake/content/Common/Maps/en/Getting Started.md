title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Common > Maps > Getting Started

### 서비스 활성화

Maps 서비스를 사용하기 위해서는 Console에서 [Common] > [Maps]를 선택한 후 [상품 이용] 버튼을 클릭하여 서비스를 활성화시킵니다.




### URL & AppKey 확인
서비스를 활성화하면 자동으로 생성된 Maps API의 URL과 AppKey를 [URL & Appkey] 항목에서 확인할 수 있습니다. URL과 AppKey 값은 Maps API(지도/검색/탐색)를 호출할 때 URI로 사용합니다.

### API의 사용
제공하는 Maps API의 서비스 URL은 아래와 같으며 더 자세한  API 사용법은 Maps Developer's Guide를 참조 하시기 바랍니다.

#### 1. 지도 API

|API명|	URL|
|:---:|:---|
|지도|https://api-maps.cloud.toast.com/maps/js/v1/map.js|
|Static 지도|https://api-maps.cloud.toast.com/maps/js/v1/staticMap.js|


#### 2. 검색 API

|API명|	URL|
|:---:|:---|
|주소검색(주소 -> 좌표)|https://api-maps.cloud.toast.com/maps/v1.0/appkeys/{appkey}/coordinates|
|좌표검색(좌표 -> 주소)|https://api-maps.cloud.toast.com/maps/v1.0/appkeys/{appkey}/addresses|
|통합검색|https://api-maps.cloud.toast.com/map/v1.0/appkeys/{appkey}/searches|
|추천어검색|https://api-maps.cloud.toast.com/map/v1.0/appkeys/{appkey}/proposers|
|poi 상세검색|https://api-maps.cloud.toast.com/map/v1.0/appkeys/{appkey}/pois|
|poi 하위 시설물 검색|https://api-maps.cloud.toast.com/map/v1.0/appkeys/{appkey}/sub-pois|


#### 3. 탐색 API

|API명|	URL|
|:---:|:---|
|탐색|https://api-maps.cloud.toast.com/maps/v1.0/appkeys/{appkey}/routes|
|탐색(상세 경로)|https://api-maps.cloud.toast.com/maps/v1.0/appkeys/{appkey}/route-details|

###  API 통계 확인
API 호출에 대한 시간별/일별/월별 통계를 Maps API의 세부 API 별로 확인할 수 있습니다.
<br>(10분 단위로 통계 데이터가 업데이트 됩니다.)

![](http://static.toastoven.net/prod_maps/img_02.JPG)


### 종별코드 검색
통합검색 API 사용 시 검색 옵션으로 사용 가능한 종별코드에 대하여 조회할 수 있습니다.

![](http://static.toastoven.net/prod_maps/img_03.JPG)

### 서비스 비활성화
Maps 서비스 사용을 중지하기 위해서는 Console에서 [Common] > [Maps]를 선택한 후 [이용 종료] 버튼을 클릭하여 서비스를 비활성화시킵니다.
