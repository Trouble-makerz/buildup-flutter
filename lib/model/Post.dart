
import 'Comment.dart';

class Post {
  int id;           // 게시물 식별자
  String want;      // 구인, 구직
  String title;     // 제목
  String content;   // 내용
  String author;    // 작성자
  DateTime createdAt; // 작성 시간
  int viewsCount;         // 조회수
  int likesCount;         // 좋아요 수
  int commentsCount;      // 댓글수
  List<Comment> comments; // 댓글

  Post({
    required this.id,
    required this.want,
    required this.title,
    required this.content,
    required this.author,
    required this.createdAt,
    this.comments = const [],
    this.viewsCount = 0,
    this.likesCount = 0,
    this.commentsCount = 0,
  });
}
