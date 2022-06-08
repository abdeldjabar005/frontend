
const Map<String, String> headers = {"Content-Type": "application/json"};

class AppUrl {

  static const String baseUrl = 'http://192.168.43.171:8000/api/';

  static const String login = baseUrl + '/login';
  static const String registerClient = baseUrl + '/registerclient';
  static const String registerAgency = baseUrl + '/registeragency';
}