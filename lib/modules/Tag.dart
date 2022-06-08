class Tags {
    Tags({
        required this.data,
        required this.tagsCount,
    });

    List<TagsData> data;
    int tagsCount;

    factory Tags.fromJson(Map<String, dynamic> json) => Tags(
        data: List<TagsData>.from(json["data"].map((x) => TagsData.fromJson(x))),
        tagsCount: json["Tags_count"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "Tags_count": tagsCount,
    };
}

class TagsData {
    TagsData({
        required this.name,
    });

    String name;

    factory TagsData.fromJson(Map<String, dynamic> json) => TagsData(
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
    };
}
