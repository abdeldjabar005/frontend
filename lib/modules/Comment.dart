class Comments {
  Comments({
    required this.data,
    required this.commentCount,
  });

  List<CommentsData> data;
  int commentCount;
  factory Comments.fromJson(Map<String, dynamic> json) => Comments(
        data: List<CommentsData>.from(
            json["data"].map((x) => CommentsData.fromJson(x))),
        commentCount: json["Comment_count"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "Comment_count": commentCount,
      };
}

class CommentsData {
  CommentsData({
    required this.agencyId,
    required this.userName,
    required this.postId,
    required this.picture,
    required this.comment,
    required this.commentedOn,
  });

  int agencyId;
  String userName;
  int postId;
  String picture;
  String comment;
  String commentedOn;

  factory CommentsData.fromJson(Map<String, dynamic> json) => CommentsData(
        agencyId: json["agency_id"],
        userName: json["user_name"],
        postId: json["post_id"],
        picture: json["picture"],
        comment: json["comment"],
        commentedOn: json["commented_On"],
      );

  Map<String, dynamic> toJson() => {
        "agency_id": agencyId,
        "user_name": userName,
        "post_id": postId,
        "picture": picture,
        "comment": comment,
        "commented_On": commentedOn,
      };
}
