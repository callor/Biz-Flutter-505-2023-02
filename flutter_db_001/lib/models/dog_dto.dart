/*
Dart(flutter)에서 data class 생성하기
1. 속성(변수)들을 final 로 설정하여 변수 선언
2. final 속성 변수들을 매개변수로 갖는 생성자 선언
3. 필수 요소로 필요한 매개변수에 required 키워드를 부착한다
4. id 변수는 PK 이면서 AUTOINCREMENT 르 사용하기 위하여 기본값 0으로 초기화
*/
class Dog {
  final int id;
  final String name;
  final int age;
  const Dog({this.id = 0, required this.name, required this.age});

  /*
   * DB Table 에 데이터를 insert 할때
   * 객체에 저장된 데이터를 Map type 으로 변환 시키는 함수 
   */
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
    };
  }
}
