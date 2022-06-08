class Images {
  Images({
    required this.data,
    required this.imagesCount,
  });

  List<ImagesData> data;
  int imagesCount;
  factory Images.fromJson(Map<String, dynamic> json) => Images(
        data: List<ImagesData>.from(
            json["data"].map((x) => ImagesData.fromJson(x))),
        imagesCount: json["Images_count"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "Images_count": imagesCount,
      };
}

class ImagesData {
  ImagesData({
    required this.imagePostId,
    required this.imageUrl,
  });

  int imagePostId;
  String imageUrl;
  factory ImagesData.fromJson(Map<String, dynamic> json) => ImagesData(
        imagePostId: json["image_post_id"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "image_post_id": imagePostId,
        "imageUrl": imageUrl,
      };
}
