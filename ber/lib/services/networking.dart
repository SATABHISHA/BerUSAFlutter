import 'package:http/http.dart' as http;
import 'dart:convert';

// const baseURL = 'http://192.168.14.175:9007/api';
// const baseURL = 'http://14.99.211.60:9007/api/v1';
const baseURL = 'http://14.99.211.60:9012/Service.asmx';
// const baseURLV1 = 'http://14.99.211.60:9007/api/v1'; //---Arb Live IP
const baseURLV1 = 'http://14.99.211.60:9030/0webapi/api/v1'; //---Aws(modeified 29th Oct) Live IP
// const baseURLV1 = 'http://172.31.26.202:80/0webapi/api/v1'; //---Aws Live IP //--added aws Ip on 14th Oct 2022
// const baseURLV1 = 'http://43.204.106.197/0webapi/api/v1'; //---New Aws Live Public IP //--added aws Ip on 31st Oct 2022
// const baseURLV1 = 'http://10.8.72.117:83/api/v1'; //---L&T IIS Server IP
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