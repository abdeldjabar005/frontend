
class Likes {
    Likes({
        required this.data,
        required this.likesCount,
    });

    List<LikesData> data;
    int likesCount;

    factory Likes.fromJson(Map<String, dynamic> json) => Likes(
        data: List<LikesData>.from(json["data"].map((x) => LikesData.fromJson(x))),
        likesCount: json["Likes_count"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "Likes_count": likesCount,
    };
}

class LikesData {
    LikesData({
        required this.likeUserId,
        required this.likePostId,
    });

    int likeUserId;
    int likePostId;
    factory LikesData.fromJson(Map<String, dynamic> json) => LikesData(
        likeUserId: json["like_user_id"],
        likePostId: json["like_post_id"],
    );

    Map<String, dynamic> toJson() => {
        "like_user_id": likeUserId,
        "like_post_id": likePostId,
    };
}

