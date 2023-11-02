# Graduation-Project

## 영양제 디스펜서 어플리케이션

## 📄 서비스 개요

졸업작품으로 만들게 될 프로젝트이다. 사물인터넷학과(Internet of the Things)이기에 라즈베리파이를 기반으로한 하드웨어, 서버에 어플리케이션을 추가하여 프로젝트를 진행하게 되었다. 주제는 영양제를 편하고 쉽게 관리하여 공급하는 디스펜서를 하드웨어로 구성하고 어플리케이션과 연동하여 구분, 알람 그리고 테서렉터를 이용한 머신러닝 툴을 이용하여 사용자가 섭취하는 영양소를 기반으로 다량의 건강 데이터와 비교하여 부족하거나 과다한 영양성분을 찾아내어 제품을 추천 혹은 조언을 줄 수 있는 추천이라는 핵심 기능으로 구성되어있다.

## 📌  Topic

- **순천향대학교 사물인터넷학과 4학년 졸업작품 과제**
- **꾸준한 영양제 섭취와 효율적인 루트를 찾아주는 사용자 친화적 어플리케이션**
- “알람관리" 기능으로 편하게 알람을 관리기능 제공
- “영양제관리" 기능으로 사용자가 섭취 중인 영양제 편하게 추가 가능, 자동검색 기능을 통해 제품명만 입력해도 성분, 일일섭취량 정보 가져오기 기능 제공
- "AI추천" 기능으로 사용자가 섭취 중인 영양제를 종합하여 부족하거나 과다한 영양성분을 집중적으로 분석하여 시중에 판매중인 영양제 정보 제공

# 🛠 Tech Stack

`Swift`, `UIKit`, `AnyFormatKit`, `CocoaMQTT`, `SnapKit` , `Alamofire`, `KDCircularProgress`, `MqttCocoaAsyncSocket`

# ⚙️ Architecture

- `MVC`

# 🧑🏻‍💻 Team

- [iOS 1명](https://github.com/grgnjhyxxk)
- [백엔드 1명](https://github.com/nzkim1234)
- [기기제작 1명](https://github.com/yc424k)
- [DB 1명](https://github.com/hyeonggeun0209)

# ✋🏻 Part

- iOS 어플리케이션 제작

# 📝 Learned

- **비밀번호 보안 처리와 가시성 토글**: 로그인 화면의 비밀번호 입력란에서 **`isSecureTextEntry`** 속성을 활용하여 사용자의 비밀번호를 보안하게 입력할 수 있도록 했습니다. 또한, 사용자 편의를 위해 비밀번호 가시성을 토글하는 버튼을 추가하여 비밀번호 표시 여부를 조절할 수 있게 구현했습니다.
- **재사용 가능한 셀과 초기화 관리**: 테이블뷰 셀의 재사용을 위해 **`override init`**와 **`prepareForReuse`** 메서드를 사용했습니다. 이를 통해 셀을 초기화하고 재사용할 때마다 데이터가 올바르게 표시되도록 관리했습니다.
- **데이터 모델 관리**: 데이터 모델을 구성하는 구조체(**`Struct`**)를 활용하여 배열을 초기화하고 관리하는 방법을 익혔습니다. 이를 통해 데이터를 효과적으로 다룰 수 있었습니다.
- **테이블뷰 델리게이트 활용**: 테이블뷰의 외형과 동작을 설정하기 위해 **`UITableViewDelegate`**와 **`UITableViewDataSource`** 프로토콜을 활용하여 데이터 소스를 관리하고 셀을 커스터마이징하는 방법을 배웠습니다.
- **모달 뷰에서 데이터 갱신**: 모달 뷰에서 데이터를 변경하고 해제한 후에 데이터를 새로고침하기 위해 **`NotificationCenter`**를 활용했습니다. 이를 통해 데이터 갱신을 관련된 뷰 컨트롤러들에게 알릴 수 있었습니다.
- **DatePicker 활용**: **`UIDatePicker`**를 사용하여 사용자가 편리하게 날짜와 시간을 선택할 수 있는 UI를 구현하는 법을 습득했습니다.
- **모듈화된 파일 구조**: 뷰, 컨트롤러, 셀, 데이터 모델 등의 역할에 따라 파일을 모듈화하고, 확장(Extension)을 통해 코드를 정리하고 재사용성을 높일 수 있었습니다.
- **코드의 재사용과 함수화**: 자주 사용되는 코드를 함수로 묶어서 관리하며, 코드의 재사용성을 향상시켰습니다.
- **다층 뷰 레이아웃**: 다양한 UI 요소를 겹쳐서 배치하여 복잡한 화면 레이아웃을 구성하는 방법을 익혔습니다.
- **그라디언트 배경 효과**: **`CAGradientLayer`**를 활용하여 뷰의 배경에 그라디언트 효과를 적용해 UI에 깊이와 풍성함을 더했습니다.
- **UIView 확장과 공통 뷰**: 자주 사용하는 **`UIView`** 속성을 확장하여 코드를 간소화하고, 공통적으로 사용되는 뷰를 별도의 파일에 정리하여 재사용성을 높였습니다.
- **텍스트필드 및 키보드 제어**: 텍스트필드 델리게이트를 이용해 키보드 동작을 커스터마이징하고, 텍스트 입력 후 키보드를 내리는 동작을 구현했습니다.
- **다양한 UI 요소 활용**: **`UISegmentedControl`**을 통한 선택 기능, **`UIToolbar`**와 **`UIDatePicker`**를 사용해 생년월일 입력 등 다양한 UI 요소를 활용하는 방법을 익혔습니다.
- **서버 통신과 데이터 처리**: **`Alamofire`**를 사용하여 서버와의 통신을 구현하고, **`Codable`**을 활용하여 데이터를 효율적으로 처리하는 방법을 습득했습니다.
- **자동 로그인 및 데이터 포맷팅**: 자동 로그인 기능을 구현하며, **`AnyFormatKit`** 등의 라이브러리를 사용하여 텍스트 필드에 형식화된 규칙을 추가하는 방법을 배웠습니다.

# 🧾 Reference

- [Graduation-Project.pdf](https://github.com/grgnjhyxxk/Graduation-Project/files/12000643/Graduation-Project.pdf)
본 졸업작품은 제 개인적인 창작물로써, 모든 저작권은 저에게 있으며, 무단 복제 및 도용은 금지됩니다.
