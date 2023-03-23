class TodoDto {
  final int id;
  final String sdate;
  final String stime;
  final String content;
  final String edate;
  final String etime;

  TodoDto({
    this.id = 0,
    required this.sdate,
    required this.stime,
    required this.content,
    this.edate = "",
    this.etime = "",
  });

  // 객체에 저장된 데이터를 Map type 으로 변환시키는 함수
  // insert, update 를 할때 데이터 type 이
  // Map type 이어야 하기때문에 변환하는 함수를 미리 생성해둔다
  Map<String, dynamic> toMap() {
    return {
      'sdate': sdate,
      'stime': stime,
      'content': content,
    };
  }

  @override
  String toString() {
    return "Todo{id : $id, content : $content} $sdate, $stime, $edate, $etime";
  }
}
