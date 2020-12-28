# Simple Memo

간단한 메모앱 만들어 보기

## 간단하게 정리하는 내용

### Navigation bar
navigation bar는 수동으로 만들 수 있지만 보통 navigation controller에 임베드 하는 방식을 사용한다.
- view controller선택
- canvas메뉴 5번째꺼 클릭하고 navigation controller 클릭
- 이렇게 하면 새로운 navigation controller가 생성되고 view controller와 연결 된다.

### Modal
ios13부터는 모달은 화면이 순서대로 쌓여있는거 처럼 쌓인다.
쌓이는 뷰 하나하나는 sheet라고 한다

### Segue
- 씬을 연결하는 라인
- 씬 사이의 전환을 처리
- 가운데 아이콘이 있는데 연결방식에 따라 달라진다
  - present modally는 사각형

### 모달 방식 변경
- segue -> attribute inspect에서 presentation=Full Screnn으로 하면 꽉채우는 모달 방식


### Text
- 한줄 텍스트
  - text field
- 여러줄 텍스트
  - text view


### dismiss()
```
dismiss(animated: bool, completion: (() -> Void)?)
```
- model을 닫을때 사용하는 메서드
- animated에 true를 주면 화면을 닫을 때 전환 애니메이션을 사용
- 화면을 닫은 다음에 실행하고 싶은 코드를 두번째 파라미터에 클로저로 전달
