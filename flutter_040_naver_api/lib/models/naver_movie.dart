class Movie {
  Movie({
    required this.title,
    required this.link,
    required this.image,
    required this.subtitle,
    required this.pubDate,
    required this.director,
    required this.actor,
    required this.userRating,
  });

  final String title; //	String	영화 제목. 제목에서 검색어와 일치하는 부분은 <b> 태그로 감싸져 있습니다.
  final String link; //	String	네이버 영화 정보 URL
  final String image; //	String	섬네일 이미지의 URL
  final String subtitle; //	String	영어 제목 또는 원제
  final String pubDate; //	Date	제작 연도(yyyy 형식)
  final String director; //	String	감독
  final String actor; //	String	출연 배우
  final String userRating; //	Integer	평점

  // openAPI 를 통해서 가져온 데이터를
  // Movie 객체 type 으로 변환하는 함수
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'],
      link: json['link'],
      image: json['image'],
      subtitle: json['subtitle'],
      pubDate: json['pubDate'],
      director: json['director'],
      actor: json['actor'],
      userRating: json['userRating'],
    );
  }
}
