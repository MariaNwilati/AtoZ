import 'package:atoz/app/data/models/taxi_detail_model.dart';

import '../data/models/taxi_model.dart';
import 'api_link.dart';
import 'package:http/http.dart' as http;

class TaxiService {
  Future<List<AllTaxiDetailsModelResponse>> getTaxi() async {
    var response = await http.get(Uri.parse('${baseUrl}api/taxiallshow'),
        headers: ApiLinks().requestHeaders);
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return allTaxiDetailsModelResponseFromJson(jsonData);
    } else {
      return throw Exception("Field to load products");
    }
  }

   Future<TaxiDetailsModelResponse> getTaxiCountry(int id) async {
    var response = await http.get(Uri.parse('${baseUrl}api/showcc/$id'),
        );
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return taxiDetailsModelResponseFromJson(jsonData);
    } else {
      return throw Exception("Field to load products");
    }
  }
}
