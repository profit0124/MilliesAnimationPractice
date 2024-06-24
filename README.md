# MilliesAnimationPractice
[SwiftUI] 밀리의 서재 책장 책정보 Sheet 애니메이션 아이디어

### 1. 사용 언어 : Swift ###
### 2. Framework : SwiftUI ###
### 참고 영상 ###
https://github.com/profit0124/MilliesAnimationPractice/assets/31499563/6bc785d4-8b9d-4eb6-96f7-30bc45a8e4e1

### 3. 고민한 Point ###
```
1. Namespace 를 사용하기엔 기존 View 가 사라지지 않음
1. PreferenceKey 는 하위 View에서 상위 View에 값을 전달할 때 사용하는 것이지만 FullScreenCover 는 상위View가 아님
1. present 와 dismiss 애니메이션이 다름
```

### 4. 해결 Point ###
```
1. item 선택시 해당 Item 위치 위에 똑같은 View를 생성한 후 Namespace를 사용하여 애니메이션 적용
1. 상위View는 하위 View에서 setting 한 preferenceValue 를 onPreferenceChange 를 통해 받아와서 State 값으로 가지고 있는다. 그 후 아이템 선택시 필요한 CGRect 값을 FullScreenCover 에 넘겨 선택한 아이템의 위치와 똑같은 위치에 item cell view를 만든다.
1. transaction 을 통해 present 할 때와 dismiss 할 때의 disablesAnimation 을 값을 조절하여 적용한다. 그 후 present 애니메이션은 view 가 생성이 되면 그 때 내부에서 애니메이션 처리를 해준다.
```


### 결과물 ###

https://github.com/profit0124/MilliesAnimationPractice/assets/31499563/6e44b197-a7e4-4e3d-9e0d-cbcb1a735099

