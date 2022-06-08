import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:xy2/modules/Post.dart';
import 'package:xy2/modules/User.dart';
import 'package:xy2/modules/shared_preference.dart';

class PostService {
  String baseUrl = 'http://192.168.43.171:8000/api';
  var loadCompleted = false;
  var nexturl;

  Future<List<PostsData>> getPosts(npage) async {
    String? token = await getToken();
    List<PostsData> posts = [];
    var url = Uri.parse(baseUrl + '/posts?page=' + npage.toString());
    print(url);
    // var url = Uri.parse(uri);
    var headers = {
      'Content-Type': 'application/json',
      "Authorization": 'Bearer $token'
    };

    var response = await http.get(url, headers: headers);

    // print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)["data"];
      for (var post in data) {
        posts.add(PostsData.fromJson(post));
      }
      return posts;
    } else {
      throw Exception('Gagal get post');
    }
  }

  static getFavorites() async {
    String? token = await getToken();
    var url = Uri.parse(PostService().baseUrl + '/favorite');
    var headers = {
      'Content-Type': 'application/json',
      "Authorization": 'Bearer $token'
    };

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)["data"];
      List<PostsData> posts = [];
      for (var post in data) {
        posts.add(PostsData.fromJson(post));
        // print(data[2]);
      }
      // print(posts);
      return posts;
    } else if (response.statusCode == 201) {
      return;
    } else {
      throw Exception('Gagal get post');
    }
  }

  static agencyOffers() async {
    String? token = await getToken();
    var url = Uri.parse(PostService().baseUrl + '/userOffers');
    var headers = {
      'Content-Type': 'application/json',
      "Authorization": 'Bearer $token'
    };

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)["data"];
      List<PostsData> posts = [];
      for (var post in data) {
        posts.add(PostsData.fromJson(post));
        // print(data[2]);
      }
      // print(posts);
      return posts;
    } else if (response.statusCode == 201) {
      return;
    } else {
      throw Exception('Gagal get post');
    }
  }

  static like(postId) async {
    String? token = await getToken();
    var url = Uri.parse(PostService().baseUrl + '/like/' + postId.toString());
    var headers = {
      'Content-Type': 'application/json',
      "Authorization": 'Bearer $token'
    };

    var response = await http.post(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      print(response.body);
      return response.body;
    } else {
      throw Exception('Gagal something wrong');
    }
  }

  Future newoffer(
      String title,
      String type,
      String description,
      String location,
      String price,
      String space,
      String bedrooms,
      String bathrooms,
      String garages,
      double longitude,
      double latitude,
      List tags,
      List image) async {
    String? token = await getToken();
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": 'Bearer $token'
    };

    var request =
        http.MultipartRequest('POST', Uri.parse(baseUrl + '/newpost'));
    request.headers.addAll(headers);
    request.fields['title'] = title.toString();
    request.fields['type'] = type.toString();
    request.fields['description'] = description.toString();
    request.fields['location'] = location.toString();
    request.fields['price'] = price.toString();
    request.fields['space'] = space.toString();
    request.fields['bedrooms'] = bedrooms.toString();
    request.fields['bathrooms'] = bathrooms.toString();
    request.fields['garages'] = garages.toString();
    request.fields['longitude'] = longitude.toString();
    request.fields['latitude'] = latitude.toString();
    for (var i = 0; i < tags.length; i++) {
    request.fields['tag[$i]'] = tags[i].toString();  
    }
    for (var image in image) {
      if (image != "") {
        print(image.path);
        request.files
            .add(await http.MultipartFile.fromPath('image[]', image.path));
      }
    }
    var response = await request.send();
    if (response.statusCode == 201) {
      print(response.statusCode);
      return response;
    } else {
      throw Exception('Gagal something wrong');
    }
  }

  Future editoffer(
      int id,
      String title,
      String type,
      String description,
      String location,
      String price,
      String space,
      String bedrooms,
      String bathrooms,
      String garages,
      double longitude,
      double latitude,
      List image) async {
    String? token = await getToken();
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": 'Bearer $token'
    };

    var request = http.MultipartRequest(
        'POST', Uri.parse(baseUrl + '/updatepost/' + id.toString()));
    request.headers.addAll(headers);
    request.fields['title'] = title.toString();
    request.fields['type'] = type.toString();
    request.fields['description'] = description.toString();
    request.fields['location'] = location.toString();
    request.fields['price'] = price.toString();
    request.fields['space'] = space.toString();
    request.fields['bedrooms'] = bedrooms.toString();
    request.fields['bathrooms'] = bathrooms.toString();
    request.fields['garages'] = garages.toString();
    request.fields['longitude'] = longitude.toString();
    request.fields['latitude'] = latitude.toString();
    request.fields['_method'] = 'PUT';
    print(image);
    print(image.first);
    print(image.length);
    for (var image in image) {
      if (image != "") {
        print(image.path);
        request.files
            .add(await http.MultipartFile.fromPath('image[]', image.path));
      }
    }
    // request.files.addAll(newList);
    var response = await request.send();
    // print(title);
    // print(title.toString());
    // final respStr = await response.stream.bytesToString();
    //     print(response);
    // print(response.statusCode);
    // print(respStr);

    // return jsonDecode(respStr);
    print(response.statusCode);

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Gagal something wrong');
    }
  }

  static deleteOffer(int postId) async {
    String? token = await getToken();
    print(token);
    var url =
        Uri.parse(PostService().baseUrl + '/deletepost/' + postId.toString());
    var headers = {
      'Content-Type': 'application/json',
      "Authorization": 'Bearer $token'
    };
    var response = await http.delete(
      url,
      headers: headers,
    );

    print(response.body);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception("SOMETHING IS WRONG ");
    }
  }

  static commentPost(int postId, String comment) async {
    String? token = await getToken();
    print(token);
    var url = Uri.parse(PostService().baseUrl + '/comment');
    var headers = {
      'Content-Type': 'application/json',
      "Authorization": 'Bearer $token'
    };
    var data = {"post_id": postId, "comment": comment};
    var body = json.encode(data);

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);
    return response;
  }

  static getUser() async {
    String? token = await getToken();
    int? id = await getid();
    print(id);
    var url = Uri.parse(PostService().baseUrl + '/auth/user/' + id.toString());
    var headers = {
      'Content-Type': 'application/json',
      "Authorization": 'Bearer $token'
    };

    var response = await http.post(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      print(response.body);
      var data = jsonDecode(response.body);
      UserModel user = UserModel.fromJson(data['data']);
      return user;
    } else {
      throw Exception('Gagal something wrong');
    }
  }

  static getAgency(id) async {
    String? token = await getToken();
    var url = Uri.parse(PostService().baseUrl + '/userposts/' + id.toString());
    var headers = {
      'Content-Type': 'application/json',
      "Authorization": 'Bearer $token'
    };

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
       List data = jsonDecode(response.body)["data"];
      List<PostsData> posts = [];
      for (var post in data) {
        posts.add(PostsData.fromJson(post));
        // print(data[2]);
      }
      // print(posts);
      return posts;
    } else if (response.statusCode == 201) {
      return;
    } else {
      throw Exception('Gagal get post');
    }
 }

  static getPic() async {
    String? token = await getToken();
    int? id = await getid();
    var url = Uri.parse(PostService().baseUrl + '/auth/user/' + id.toString());
    var headers = {
      'Content-Type': 'application/json',
      "Authorization": 'Bearer $token'
    };

    var response = await http.post(url, headers: headers);

    if (response.statusCode == 200) {
      print(response.body);
      var data = jsonDecode(response.body);
      UserModel user = UserModel.fromJson(data['data']);
      return user.picture;
    } else {
      throw Exception('Gagal something wrong');
    }
  }

  Future profilepic(File image) async {
    String? token = await getToken();
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": 'Bearer $token'
    };

    var request =
        http.MultipartRequest('POST', Uri.parse(baseUrl + '/auth/profilepic'));
    request.headers.addAll(headers);
    print(image);
    print(image.length);
    if (image != "") {
      print(image.path);
      request.files.add(await http.MultipartFile.fromPath('image', image.path));
    } else {
      throw Exception('Gagal something wrong');
    }
    var response = await request.send();

    if (response.statusCode == 200) {
      print(response.statusCode);
      return response;
    } else {
      throw Exception('Gagal something wrong');
    }
  }

  static updatebio(String bio) async {
    String? token = await getToken();
    var url = Uri.parse(PostService().baseUrl + '/auth/updatebio');
    var headers = {
      'Content-Type': 'application/json',
      "Authorization": 'Bearer $token'
    };
    var data = {"bio": bio};
    var body = json.encode(data);

    var response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      print(response.body);
      return response;
    } else {
      throw Exception('Gagal something wrong');
    }
  }
 static search(String keyword) async {
    String? token = await getToken();
        List<PostsData> posts = [];
    var url = Uri.parse(PostService().baseUrl + '/search');
    var headers = {
      'Content-Type': 'application/json',
      "Authorization": 'Bearer $token'
    };
    var data = {"data": keyword};
    var body = json.encode(data);

    var response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      print(response.body);
      List data = jsonDecode(response.body)["data"];
      for (var post in data) {
        posts.add(PostsData.fromJson(post));
      }
      return posts;
    } else {
      throw Exception('Gagal something wrong');
    }
  }
 
  
}
