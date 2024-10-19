import 'dart:convert';
import 'package:gofly/ui/views/search_flight_view/search_flight_controller.dart';
import 'package:http/http.dart' as http;

class ApiService {

  SearchFlightController controller = SearchFlightController();

  final String baseUrl = 'https://api.travelpayouts.com/aviasales/v3/prices_for_dates';

  Future<List<dynamic>> fetchFlightData(String token) async {
    final response = await http.get(Uri.parse('$baseUrl?origin=${controller.fromController.text}&destination=${controller.toController.text}&cy=usd&token=$token'));

    if (response.statusCode == 200) {
      return json.decode(response.body)['data']; // Adjust based on actual response structure
    } else {
      throw Exception('Failed to load flight data');
    }
  }
}