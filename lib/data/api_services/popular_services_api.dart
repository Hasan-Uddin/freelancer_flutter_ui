import 'dart:convert';
import 'package:freelancer_flutter_ui/data/models/service_dto.dart';
import 'package:http/http.dart' as http;

class PopularServiceApi {
  // base url
  final String _baseUrl =
      'https://xilancer.xgenious.com/api/v1/projects/popular';

  // Fetch projects
  Future<List<PopularServices>> fetchData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        // Parse the response body as a JSON object
        final Map<String, dynamic> data = json.decode(response.body);

        // Check if the response has data
        if (data['success'] == true) {
          List<dynamic> popularServicesList = data['data'];

          // Convert each project into a Project model and return
          return popularServicesList
              .map((e) => PopularServices.fromJson(e))
              .toList();
        } else {
          throw Exception('Failed to load projects');
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error fetching projects: $e');
    }
  }
}
