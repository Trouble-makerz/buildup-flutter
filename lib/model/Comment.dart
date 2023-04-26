
class Comment {
  int id;           // 댓글 식별자
  String author;    // 작성자
  String comment;   // 댓글
  DateTime createdAt; // 작성 시간

  Comment({
    required this.id,
    required this.author,
    required this.comment,
    required this.createdAt,
  });
}
