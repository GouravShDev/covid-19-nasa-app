import 'package:http/http.dart' as http;

class RemoteDataSources {
  final http.Client client;
  RemoteDataSources(this.client);

  // Future<> getCovidData() async {
  //   final response = await client.get(
  //       'https://api.covid19api.com/summary');
  //   if (response.statusCode == 200) {
  //     return CovidData.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }
}
