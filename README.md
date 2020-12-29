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

### UIAlertController
```
UIAlertController(title: String, message: String, preferredStyle: UIAlertController.Style)
```

AlertStyle
1. Alert View
  - 화면 중간에 나오는 거
  - 간단한 정보나 두개중 하나 고를때 정도
2. Action Sheet
  - 화면 하단에서 나오는거
  - 세개 이상 옵션중 하나 선택할 때 사용

### UIAlertAction
```
UIAlertAction(title: String, style:UIAlertAction.Style, handler: ((UIAlertAction) -> Void)?)
```

- 버튼 생성하는 코드, title, style, handler입력 가능
- UIAlertController에 추가해주어야 함
  - `{UIAlertController}.addAction({UIAlertAction})`

### present
```
present(alert, animated, completion)
```
- 생성한 UIAlertController를 화면에 나타내는 메서드
- completion은 완료되었을때 수행할 콜백함수인듯하다.

### table view reload
```
tableView.reloadData()
```

### #function
```
print(#function)
```
- 함수이름 출력, 디버깅할때 쓰기 편할듯하다.

### window
```
var window: UIWindow?
```
- 이게 뭘까?

### Notification
Notification선언하고, 필요한 시점에 noti (broadcast)
- noti를 받기 원하는 곳에 observer 작성

### 스레드
ios에서는 스레드를 직접 처리하지 않고, dispatch queue나 operation queue에서 처리한다.

### observer 해제
viewDidLoad()에서 추가한 옵저버는 View가 화면에서 사라지기 전에 해제하거나, 소멸자에서 해제한다.


