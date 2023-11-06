import '../data/models/taxi_model.dart';
import 'api_link.dart';
import 'package:http/http.dart' as http;

// class ResturantService {
//   Future<List<AllTaxiModelResponse>> getTaxi() async {
//     var response = await http.get(Uri.parse('${baseUrl}products'),
//         headers: ApiLinks().requestHeaders);
//     print(response.statusCode);
//     if (response.statusCode == 200) {
//       var jsonData = response.body;
//       return allTaxiModelResponseFromJson(jsonData);
//     } else {
//       return throw Exception("Field to load products");
//     }
//   }
// }
