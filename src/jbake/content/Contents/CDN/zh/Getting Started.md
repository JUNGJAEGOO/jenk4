title=About
date=2013-09-24
type=page
status=published
big=TCcontents
summary=CDNGetting
~~~~~~
## Contents > CDN > Getting Started

본 문서에서는 웹콘솔을 이용하여 CDN Service를 구성하고 이용하는 방법을 설명합니다.

## CDN Service 생성 순서

1.[Contents] > [CDN] > [CDN Service] > [CDN 생성] 버튼을 클릭하면 CDN 서비스를 생성할 수 있는 [그림 1]의 Create Service 화면으로 이동합니다.  
CDN Service에 이용될 도메인 명은 자동으로 생성됩니다. 소유하고 있는 도메인이 있는 경우, Domain Alias 기능을 이용해서 서비스할 수 있습니다.

![[그림 1] Create Service 화면](http://static.toastoven.net/prod_cdn/img_001.png)
<center>[그림 1] Create Service 화면</center>


2.'서비스 지역'을 선택합니다.  
서비스 제공 형태에 따라 KOREA/GLOBAL region을 선택할 수 있습니다. 각국에 존재하는 캐쉬 서버를 이용하여 전세계를 대상으로 서비스 하기를 원하시면 GLOBAL을 선택하고, 한국 내에서만 서비스하는 경우에는 KOREA를 선택하십시오. KOREA를 선택하는 경우 좀 더 낮은 가격에 서비스 이용이 가능합니다.

3.'설명'을 입력합니다.  
CDN Service에 추가적인 설명을 입력합니다.

4.'원본 서버 이름'을 입력합니다.  
TOAST Cloud의 Infrastructure에서 생성한 Instance나 기존에 보유하고 있는 서버를 이용하여 서비스할 수 있습니다.  
원본 서버는 IP 또는 도메인 형태로 입력이 가능하며, Port를 지정할 수 있습니다.  
URL path 형태의 하위 경로는 원본 경로에 입력해주세요.


5.Domain Alias을 설정합니다.  
CDN Service 생성이 완료 되면 \*.cdn.toastcloud.com 형태의 Service 도메인이 자동으로 발급되며, 발급된 도메인을 그대로 서비스에 이용하실 수 있습니다.  
하지만 개인 혹은 회사가 소유한 도메인을 이용하여 CDN Service를 제공해야 할 경우, 'Domain Alias' 설정을 이용하실 수 있습니다.  
Domain Alias 란 TOAST Cloud에서 제공하는 도메인 외에 개인 혹은 회사가 소유한 도메인으로도 CDN 서비스가 가능하도록 하는 서비스입니다.  
Domain Alias 항목에 소유한 도메인 주소를 설정하고, 해당 도메인의 네임서버 설정을 변경해 주세요.  
TOAST Cloud에서 발급받은 CDN Service 주소를 CNAME 레코드로 추가 해주시면 소유한 도메인으로도 서비스가 가능합니다.  ·[Domain Alias 사용예 보기]

6.캐시를 설정합니다.

- Cache 만료 설정
- Cache 만료 설정을 이용하여 cache 만료 시간을 사용자화 가능합니다. “원본 설정사용" 옵션이 기본 값입니다. Cache 만료 시간을 지정하고 싶은 경우 “Cache 만료 시간”을 변경합니다.

> 주의  
> 만일 원본 서버 설정에 Cache 만료 시간이 지정되어 있다면 "Cache 만료 시간" 값은 무시됩니다. CDN service 를 이용해 만료시간을 지정하고 싶은 경우 원본 서버의 Cache 만료 설정을 제거합니다.

- Referrers 접근 관리  
특정 referrer의 경우 사용자 contents에 접근을 제한할 수 있습니다.  
Blacklist 타입을 이용할 경우 Referrer에 입력된 Referrer 리스트는 접근이 제한되며, Whitelist 타입을 이용할 경우 접근이 허용됩니다.  
Regular expression 형태의 입력을 지원하며 여러개의 referrer를 제어하고 싶은 경우 다음 라인에 연속하여 입력합니다.  

7.[CDN 생성] 버튼을 클릭하면 CDN 서비스 생성 요청이 완료됩니다.  
생성 요청 이후 서비스 배포가 완료까지 수 분 정도(최대 한시간) 소요됩니다. 배포가 완료된 후 서비스 이용이 가능합니다.

## CDN Service 설정 변경

설정 변경을 통해 추가 설명 및 원본 서버 정보를 변경할 수 있습니다.  
하지만 서비스 이름과 지역은 변경할 수 없으므로 변경을 원하실 경우 기존 서비스를 삭제한 후 새로운 서비스로 생성해야 합니다.  

1.변경을 원하는 서비스를 CDN Service 테이블에서 선택합니다.  
2.화면 하단의 [기본 정보] 탭의 [수정] 버튼을 클릭합니다.  

[그림 2]와 같이 변경 가능한 항목들이 활성화 됩니다.

![[그림 2] 변경 가능한 Service 기본 정보](http://static.toastoven.net/prod_cdn/img_002.png)
<center>[그림 2] 변경 가능한 Service 기본 정보</center>

3.변경 가능한 항목은 설명, 원본 서버 정보, Domain Alias 설정입니다.  
4.[확인] 버튼을 클릭해 변경을 완료합니다.  
**원본 서버가 변경되면 기존 캐시되어있던 모든 내용은 재배포되며 컨텐츠 양에 따라 재배포 시간은 달라집니다.**

## CDN Cache 설정 변경

1.변경을 원하는 서비스를 CDN Service 목록에서 선택합니다.   
2.[그림 3] [Cache 설정] 탭의 [수정] 버튼을 클릭합니다.   

![[그림 3] Cache 설정 정보](http://static.toastoven.net/prod_cdn/img_03.png)
<center>[그림 3] Cache 설정 정보</center>

3.Cache 만료 설정에서 만료 설정 방식을 선택합니다.  
 - 원본 설정 사용  
원본 서버의 Cache 만료설정을 이용하도록 설정합니다.
 - 사용자 설정 사용  
Cache 만료 시간 값을 이용하여 원하는 시간으로 Cache 만료 설정이 가능합니다.

> 주의  
> 만일 원본 서버 설정에 Cache 만료 시간이 지정되어 있다면 [그림3]에서 입력한 Cache 만료 시간 값은 무시됩니다. CDN service 를 이용해 만료시간을 지정하고 싶으면 원본 서버의 Cache 만료 설정을 제거합니다.

4.원하는 경우 Referrer를 이용해 접근 관리를 할 수 있습니다.  
특정 referrer의 경우 사용자 컨텐츠에 접근 가능 여부를 관리할 수 있습니다. Regular expression 형태로 입력하고 여러개의 referrer를 제어할 경우 입력창에 라인을 추가하여 입력합니다.    
5.[확인] 버튼을 클릭해 Cache 설정을 변경합니다.  

## Cache 재배포

원본 컨텐츠의 내용이 변경된 경우 기존에 지정된 Cache 만료 시간 이후에는 새로운 컨텐츠로 Cache가 업데이트가 됩니다. 하지만 빠르게 Cache 내용을 재배포 하고 싶은 경우 "Cache 재배포" 기능을 이용해 기존 Cache를 새로운 컨텐츠로 업데이트 합니다.

1.변경을 원하는 서비스를 CDN Service 목록에서 선택합니다.  
2.[그림 4] [Cache 재배포] 탭을 클릭합니다.  

![[그림 4] Cache 재배포](http://static.toastoven.net/prod_cdn/img_04.png)
<center>[그림 4] Cache 재배포</center>

3.Cache 재배포 타입을 선택합니다. 3가지 타입의 Cache 재배포 방식을 제공합니다.  
- Item  
정확한 파일명과 경로 설정을 통해 원하는 파일만 재배포 가능합니다.  
예) /path/to/file1.jpg
- Wildcard  
파일명과 경로명에 와일드카드 문자를 이용가능합니다.  
* : 임의의 문자열  
? : 1개의 문자  
＼ : Escape 문자
예) /images/games/\*.jpg  
/\*/sports/\*.jpg  
/images/sports/ac?e/\*.jpg  
- All  
모든 캐시를 한꺼번에 재배포 합니다.  
4.선택한 Cache 재배포 타입에 맞게 재배포할 파일을 지정합니다.  
5.[Cache 재배포] 버튼을 클릭해 재배포 요청을 합니다.  
재배포 까지는 수 분의 시간이 소요됩니다. (용량에 따라 소요 시간은 달라질 수 있습니다.)

## 감시설정

예상치 못한 Traffic 이 발생 할 경우를 대비하여, 감시 설정을 등록할 수 있습니다. 지정된 값 이상의 Traffic 이 발생할 경우 이메일을 발송하며, 강제 정지 옵션을 설정하면 이메일 발송 후 CDN 서비스를 정지합니다.  

1.변경을 원하는 서비스를 CDN Service 목록에서 선택합니다.  
2.[그림 5] [감시 설정] 탭의 [수정] 버튼을 클릭합니다.  

![[그림 5] 감시 설정](http://static.toastoven.net/prod_cdn/img_07.png)
<center>[그림 5] 감시 설정</center>

3.누적/순간 Traffic 타입 설정 후 제한 할 Traffic양을 지정합니다. 단위는 Byte입니다.  
4.+/- 버튼을 이용해 여러개의 감시설정을 추가 및 삭제합니다.  
5.지정한 Traffic 이상의 Traffic이 감지 되었을 경우 서비스 강제 정지를 원하면 강제 정지 설정을 [예]로 활성화합니다.  
6.[확인] 버튼을 눌러 변경된 내용을 적용합니다.  

## 통계 확인하기

네트워크 전송량, Status 코드별 통계 및 Top 컨텐츠에 대한 통계를 확인 가능합니다.  

1.[Contents] > [CDN] > [CDN Service] > [통계] 탭을 클릭합니다.  

![[그림 6] CDN 통계 조회](http://static.toastoven.net/prod_cdn/img_006.png)
<center>[그림 6] CDN 통계 조회</center>

2.통계를 확인하기 원하는 CDN Service를 선택합니다.  
3.검색 기간을 입력합니다.  
4.검색 기간내 데이터 주기는 선택한 기간에 따라 자동으로 선택됩니다.  
5.[검색] 버튼을 클릭합니다.  

## Domain Alias 사용 예

CDN Service 생성 후 random-exam.cdn.toastcloud.com이라는 도메인이 발급되고, 기존 고객이 소유하던 alias.nhnentcustomer.com을 이용하여 서비스 하기 위한 설정 방법입니다.

1.Toast Cloud CDN 생성 이후 자동으로 발급된 random-exam.cdn.toastcloud.com 확인합니다.  
2.기본정보 설정 탭의 Domain Alias 항목에 서비스에 사용할 고객 도메인 alias.nhnentcustomer.com 입력합니다.  
3.nhnentcustomer.com 네임서버 관리 항목에서 random-exam.cdn.toastcloud.com을 이용해 CNAME 레코드를 추가합니다. (도메인 제공 업체에 따라 설정 방법은 다를 수 있습니다. 자세한 사항은 도메인 제공 업체에게 문의해주십시오.)  
4.alias.nhnentcustomer.com 으로 서비스 시작합니다.  
