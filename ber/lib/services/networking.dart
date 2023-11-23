import 'package:http/http.dart' as http;
import 'dart:convert';


const baseURL = 'http://14.99.211.60:9012/Service.asmx';
const baseURLBer = 'http://14.99.211.60:9012/BERService.asmx';

const baseURLV1 = 'http://14.99.211.60:9030/0webapi/api/v1'; //---Aws(modeified 29th Oct) Live IP

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;
  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    // print(response.body);
    if (response.statusCode == 200) {
      String data = response.body;
      // print(data);
      /*var longitude = jsonDecode(data)['coord']['lon'];
      print(longitude);

      var decodedData = jsonDecode(data);
      // var weatherDescription = jsonDecode(data)['weather'][0]['description'];
      var weatherDescription = decodedData['weather'][0]['description'];
*/
      return jsonDecode(data);
    } else {
      // print(response.statusCode);
    }
  }


  Future getDataOnPostMethod(var record) async {
    http.Response response = await http.post(Uri.parse(url), headers: {"Content-Type": "application/x-www-form-urlencoded"},
      body: record,);
    print(response.body);

    if (response.statusCode == 200) {
      String data = response.body;
      // print(data);
      /*var longitude = jsonDecode(data)['coord']['lon'];
      print(longitude);

      var decodedData = jsonDecode(data);
      // var weatherDescription = jsonDecode(data)['weather'][0]['description'];
      var weatherDescription = decodedData['weather'][0]['description'];
*/
      // return jsonDecode(data);
      return data;
    } else {
      print(response.statusCode);
    }
  }
}