title=About
date=2013-09-24
type=page
status=published
big=TCUpcoming
summary=ROLERelease
~~~~~~
## Upcoming Products > ROLE > Release Notes

### 2017.08.24
#### 기능 추가
* [RESTFUL API] 각 구성요소의 리스트를 조회할 수 있는 API 가 추가되었습니다.
	* GET /role/v1.0/appkeys/{appKey}/roles : role 리스트 조회
		* 자세한 사항은 매뉴얼 참고: [링크](http://docs.cloud.toast.com/ko/Upcoming%20Products/ROLE/ko/RESTFUL%20API%20Guide/#3-role)
	* GET /role/v1.0/appkeys/{appKey}/resources : resource 리스트 조회
		* 자세한 사항은 매뉴얼 참고: [링크](http://docs.cloud.toast.com/ko/Upcoming%20Products/ROLE/ko/RESTFUL%20API%20Guide/#4-resources)
	* GET /role/v1.0/appkeys/{appKey}/scopes : scope 리스트 조회
		* 자세한 사항은 매뉴얼 참고: [링크](http://docs.cloud.toast.com/ko/Upcoming%20Products/ROLE/ko/RESTFUL%20API%20Guide/#2-scope)
	* GET /role/v1.0/appkeys/{appKey}/operations : operation 리스트 조회
		* 자세한 사항은 매뉴얼 참고: [링크](http://docs.cloud.toast.com/ko/Upcoming%20Products/ROLE/ko/RESTFUL%20API%20Guide/#5-operation)

#### 기능 개선/변경
* [Console] Resource name에 한글을 입력 할 수 있습니다. '/'문자를 제외하고 모든 문자 입력이 가능합니다.
* [Console] Resource, Role, User, Scope 입력, 수정시 필드 유효성 검사 실패시 보여주는 메시지가 수정되었습니다.
	* Resource의 priority, description 의 유효성 검사시 4XX, 5XX 에러가 아닌 문구를 보여주도록 개선되었습니다.
		* priority 유효성 검사 실패 문구 : 'Priority 는 숫자(-32768 ~ 32767)만 입력가능합니다.'
		* description 유효성 검사 실패 문구 : '잘못된 형식의 description 입니다.'
	* Scope, Role, User 의 description 이 128자 넘어갈 경우 4XX, 5XX 에러가 아닌 문구를 보여주도록 개선되었습니다.
		* description 유효성 검사 실패 문구 : '잘못된 형식의 description 입니다.'
	* User 수정 화면에서 없는 Role이나 Scope을 입력한 경우 11001, 13001 에러가 아닌 문구를 보여주도록 개선되었습니다.
		* 없는 Scope 입력시 문구 : 'Scope ID 를 찾을 수 없습니다.'
		* 없는 Role 입력시 문구 : 'Role ID 를 찾을 수 없습니다.'
* [Console] Resource 검색 화면에서 Operation 필드에 자동 완성 기능이 추가되었습니다.
* [Console] Migration 기능의 오용을 방지 하기 위해서 화면에 주의 문구가 추가되었습니다.
	* 주의 문구 : '※ 주의 : 현재 프로젝트의 Resource, Role, Operation 을 선택한 프로젝트로 복사를 진행합니다. 선택한 프로젝트의 기존 Resource, Role, Operation 은 삭제합니다.'
* [RESTFUL API] API 제약 사항이 변경되었습니다.
	* GET /role/v1.0/appkeys/{appKey}/resources/hierarchy API 가 user나 role 을 인자로 주지 않아도 전체 결과를 주도록 변경되었습니다.
		* 자세한 사항은 매뉴얼 참고: [링크](http://docs.cloud.toast.com/ko/Upcoming%20Products/ROLE/ko/RESTFUL%20API%20Guide/#4-resources)

#### 버그 수정
* [Console] Resource 수정 화면에서 하위 리소스를 가진 리소스의 name 변경시 5XX 에러가 발생하는 오류가 수정되었습니다. 
	* 정상적으로 변경된 Ui Path 가 하위 Resource에도 반영됩니다. 
* [Console] Resource 검색 화면에서 없는 user로 검색시 모든 리소스가 검색되는 오류가 수정되었습니다. 
	* Resource Tree 에 나오는 Resource가 없습니다.
* [Console] Resource 수정 시 중복된 name 으로 수정 요청 후 취소 시 적용된 값으로 보이는 오류가 수정되었습니다. 
	* 이전 상태로 보여집니다.
* [Console] Role 검색 화면에서 description 을 키워드로 검색시 Total 값이 정상적으로 변경이 되지 않는 오류가 수정되었습니다.
	* Total 값이 검색된 건수 값으로 반영이 됩니다.
* [Console] User 화면에서 검색된 상태에서 Role 추가나 삭제시 바로 검색된 리스트 화면에 반영되지 않는 오류가 수정되었습니다.
	* User 리스트 화면에 바로 반영되어 보여집니다.
* [Console] User 수정 화면에서 Title 이 'User 추가' 에서 "User 수정' 으로 나오도록 수정되었습니다.
 

### 2017.07.20
#### 버그 수정  
* [Console] 이미 사용중인 Resource, Role, Scope 이름으로 등록/수정시 반영을 하지 않고 실패 경고창을 화면에 보여줍니다.  
	
### 2017.05.25
#### 버그 수정
* [Console] Resource 탭의 [Excel 업로드] 기능이 동작하지 않는 문제 수정 

### 2017.04.20
#### 버그 수정
* userId(key)의 value 값에 '.', '@' 포함될 경우 오류가 반환되는 버그 수정

### 2016.12.22
#### 기능 개선/변경
* 벌크 User 리스트 조회 API 추가
* Scope과 연관된 연관 관계 조회 API 추가

#### 버그 수정
* Role 연관 관계가 제대로 동작하지 않던 문제 수정
* User 검색 시, ScopeID ALL 이 검색되지 않는 문제 수정
* invalid 한 resource tree 가 있을 시, hierarchy tree 가 비정상적으로 반환되는 버그 수정

### 2016.11.24
#### 기능 개선/변경
* Client SDK 및 서버의 Cache 제거하는 기능 추가

#### 버그 수정
* Resource Path 수정 시 '/' 로 시작하지 않는 잘못된 Path 로 수정 할 수 없도록 수정
	* 잘못된 Path 가 있을 시 Excel 을 이용한 데이터 입력이 안될 수 있음

### 2016.10.20
#### 기능 개선/변경
* User 목록 조회시, 연관 관계에 있는 Role 을 가진 사용자도 반환 하는 옵션 추가
	* 자세한 사항은 메뉴얼 참고: [링크](http://docs.cloud.toast.com/ko/Upcoming%20Products/ROLE/ko/RESTFUL%20API%20Guide/#1-user)

### 2016.09.29
#### 기능 개선/변경
* User 에 신규 Role 부여시, 기존에 등록된 Role 중 Scope 이 같은 Role 을 삭제하는 API 추가
* Role 에 User 추가 API 에서 User 가 없으면 User 를 생성 해주는 옵션 추가
	* 자세한 사항은 메뉴얼 참고: [링크](http://docs.cloud.toast.com/ko/Upcoming%20Products/ROLE/ko/RESTFUL%20API%20Guide/#3-role)

### 2016.08.18
#### 기능 개선/변경
* 떨어지는 사용성으로 인하여, Polling API 지원 deprecate 됨
* Role 상품을 이용하는 Project 간 데이터를 Migration 하는 기능 추가
    * 자세한 사항은 메뉴얼 참고: [링크](http://docs.cloud.toast.com/ko/Upcoming%20Products/ROLE/ko/Getting%20Started/#_3)

#### 버그 수정
* Role을 삭제했는데 다른 Role의 연관 정보가 삭제되는 버그 수정
* 권한체크가 간헐적으로 실패하는 버그 수정
