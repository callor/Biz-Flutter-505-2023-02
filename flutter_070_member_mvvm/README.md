# flutter_070_member

- google 을 통한 login 구현
- firebase authentication 을 사용하여 join 과 login 구현

## google login mvvm 패턴으로 변경(2023-03-20)

- `flutter pub add provider`

## google loin 을 구현

- `flutter pub add google_sign_in`,
- `flutter pub add http`
- `flutter pub add change_app_package_name`

## google firebase 프로젝트 구성

- firebase 에서 프로젝트 생성
- 안드로이드 App 을 추가
- SHA 지문등록하기

## SHA 지문등록하기

- `Android Studio` 가 설치되어 있어야 한다
- `C:\Program Files\Java\jdk-15.0.2\bin` 폴더로 이동
- `bash shell` 실행하기
- 아래 명령을 실행하여 SHA 지문확인하기

```bash
./keytool -list -v -alias androiddebugkey -keystore ~/.android/debug.keystore
```

- 비밀번호 : `android` 입력
- bash 창에 출력된 내용중에서 SHA1 의 코드값을 복사
- firebase 프로젝트의 SHA 지문에 추가해 주기

## firebase 연동 실행

- `firebase SDK` 안내서에 따라 `Android` 아래의 `build.gradle` 파일에 설정하기
- dependencies 설정하기

```bash
flutter pub add firebase_core
flutter pub add firebase_auth
flutter pub add firebase_database

```

## google login exception

- `PlatformException(sign_in_failed, ApiException: 12500:`
- `GCP(Google Cloud Platform)` 에 접속하여 콘솔 들어가기
- 상단에 현재 프로젝트 이름 확인
- 왼쪽 햄버거 버튼 `API 및 서비스` > `OAuth 동의화면` 접속하기
- `사용자 email 정보`, `개발자 email 정보` 확인하여 등록하기

- `PlatformException(sign_in_failed, ApiException: 10:`
- `SHA 키 오류`
- 여러곳에서 사용할 경우 각 컴퓨터마다 keytool 을 실행하여 SHA1 키를 등록해주어야 한다

- `keytool` 이 실행되는지 확인한 후 실행되지 않으면 `Program files/java/..jdk/bin` 폴더에서 `bash shell` 실행
- `./keytool -list -v -alias androiddebugkey -keystore ~/.android/debug.keystore`
