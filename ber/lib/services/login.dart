

import 'package:ber/services/networking.dart';

class LoginModel {

  Future<dynamic> getLoginDetailsOnPost({required var credential}) async {
    /*latitude = location.latitude;
    longitude = location.longitude;*/ //---no more req

    // var urlValue = '$baseURL/login/$url'; //---commented on 30th Sept
    var urlValue = '$baseURL/ValidateLogin'; //--dynamic base urlvalue(added on 30th Sept)
    // print('Url-=>$urlValue');
    // NetworkHelper networkHelper = NetworkHelper('$baseURL/login/$url');
    NetworkHelper networkHelper = NetworkHelper(urlValue);
    var loginData = await networkHelper.getDataOnPostMethod(credential);

    print('Data-=>$loginData');
    return loginData;
  }


}
