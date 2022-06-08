import 'dart:convert';
import 'Comment.dart';
import 'Image.dart';
import 'Like.dart';
import 'Tag.dart';
// To parse this JSON data, do
//
//     final posts = postsFromJson(jsonString);

Posts postsFromJson(String str) => Posts.fromJson(json.decode(str));

String postsToJson(Posts data) => json.encode(data.toJson());

class Posts {
  Posts({
    required this.data,
    required this.links,
    required this.meta,
  });

  List<PostsData> data;
  Links links;
  Meta meta;
  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
        data: List<PostsData>.from(
            json["data"].map((x) => PostsData.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "links": links.toJson(),
        "meta": meta.toJson(),
      };
}

class PostsData {
  PostsData({
    required this.id,
    required this.userId,
    required this.agencyName,
    required this.phone,
    required this.bio,
    required this.title,
    required this.type,
    required this.description,
    required this.location,
    required this.price,
    required this.space,
    required this.bedrooms,
    required this.bathrooms,
    required this.garages,
    required this.picture,
    required this.longitude,
    required this.latitude,
    required this.comments,
    required this.images,
    required this.likes,
    required this.tags,
    required this.createdAt,
  });

  int id;
  int userId;
  String agencyName;
  String phone;
  String bio;
  String title;
  String type;
  String description;
  String location;
  int price;
  String space;
  int bedrooms;
  int bathrooms;
  int garages;
  String picture;
  double longitude;
  double latitude;
  Comments comments;
  Images images;
  Likes likes;
  Tags tags;
  DateTime createdAt;

  factory PostsData.fromJson(Map<String, dynamic> json) => PostsData(
        id: json["id"],
        userId: json["user_id"],
        agencyName: json["agency_name"],
        phone: json["phone"],
        bio: json["bio"] ?? '',
        title: json["title"],
        type: json["type"],
        description: json["description"],
        location: json["location"],
        price: json["price"],
        space: json["space"],
        bedrooms: json["bedrooms"],
        bathrooms: json["bathrooms"],
        garages: json["garages"],
        picture: json["picture"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        comments: Comments.fromJson(json["comments"]),
        images: Images.fromJson(json["images"]),
        likes: Likes.fromJson(json["Likes"]),
        tags: Tags.fromJson(json["Tags"]),
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "agency_name": agencyName,
        "type": type,
        "title": title,
        "description": description,
        "location": location,
        "price": price,
        "space": space,
        "bedrooms": bedrooms,
        "bathrooms": bathrooms,
        "garages": garages,
        "picture": picture,
        "logitude": longitude,
        "latitude": latitude,
        "comments": comments.toJson(),
        "images": images.toJson(),
        "Likes": likes.toJson(),
        "Tags": tags.toJson(),
        "createdAt": createdAt.toIso8601String(),
      };
}

class Links {
  Links({
    required this.first,
    required this.last,
    required this.prev,
    required this.next,
  });

  String first;
  String last;
  dynamic prev;
  dynamic next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
      };
}

class Meta {
  Meta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  int currentPage;
  int from;
  int lastPage;
  String path;
  int perPage;
  int to;
  int total;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
      };
}
