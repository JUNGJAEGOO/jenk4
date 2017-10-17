title=About
date=2013-09-24
type=page
status=published
big=TCUpcoming
summary=SpellGetting
~~~~~~
## Upcoming Products > Spell Checker > Getting Started

> ※ 본 문서는 alpha 개발 단계의 문서입니다.
> 사용에 관심이 있으신 분은 **support@cloud.toast.com**으로 문의해 주시기 바랍니다.

Spell Checker API를 사용하기 위한 절차는 다음과 같습니다.


### 서비스 활성화

Spell Checker 서비스를 사용하기 위해서는 Console에서 [Upcoming Products] > [Spell Checker] 을 선택한 후 [상품 이용] 버튼을 클릭하여 서비스를 활성화시킵니다.


### URL & AppKey 확인

서비스를 활성화하면 자동으로 생성된 Spell Checker API의 URL과 AppKey를 [URL & Appkey] 항목에서 확인할 수 있습니다. URL과 AppKey 값은 Spell Checker API를 호출할 때 URI로 사용합니다.

### API의 사용

위에서 확인한 URL과 AppKey를 이용하여 API를 호출합니다.

```
POST http://api-spell-checker.cloud.toast.com/spell-checker/v1.0/appkeys/{appkey}/corrections
```

이 때 맞춤법 검사를 위해 전달할 데이터를 POST 데이터로 함께 전송합니다. Spell Checker API는 JSON 포맷의 데이터를 지원합니다. 데이터 작성 규칙을 포함해 자세한 API 사용 방법은 개발자 가이드를 참조하세요.


### 서비스 비활성화

Spell Checker 서비스 사용을 중지하기 위해서는 Console에서 [Upcoming Products] > [Spell Checker] 을 선택한 후 [이용 종료] 버튼을 클릭하여 서비스를 비활성화시킵니다.
