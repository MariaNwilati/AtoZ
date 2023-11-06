import 'package:get_storage/get_storage.dart';

const String baseUrl = 'http://192.168.3.118:8000/';

class ApiLinks {
  final GetStorage authBox = GetStorage();

  Map<String, String> get requestHeaders => {
        'Authorization': 'Bearer ${authBox.read('token')}',
        "Accept": "application/json"
      };
}
