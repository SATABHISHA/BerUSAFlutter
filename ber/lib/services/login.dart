

class LoginModel {
  Future<dynamic> getLoginDetails({var url}) async {
    /*latitude = location.latitude;
    longitude = location.longitude;*/ //---no more req

    // var urlValue = '$baseURL/login/$url'; //---commented on 30th Sept
    var urlValue = '$baseURLV1/login/$url'; //--dynamic base urlvalue(added on 30th Sept)
    // print('Url-=>$urlValue');
    // NetworkHelper networkHelper = NetworkHelper('$baseURL/login/$url');
    NetworkHelper networkHelper = NetworkHelper(urlValue);
    var loginData = await networkHelper.getData();

    // print('Data-=>$loginData');
    return loginData;
  }


  Future<dynamic> getLoginDetailsOnPost({required var record}) async {
    /*latitude = location.latitude;
    longitude = location.longitude;*/ //---no more req

    // var urlValue = '$baseURL/login/$url'; //---commented on 30th Sept
    var urlValue = '$baseURLV1/login'; //--dynamic base urlvalue(added on 30th Sept)
    // print('Url-=>$urlValue');
    // NetworkHelper networkHelper = NetworkHelper('$baseURL/login/$url');
    NetworkHelper networkHelper = NetworkHelper(urlValue);
    var loginData = await networkHelper.getDataOnPostMethod(record);

    // print('Data-=>$loginData');
    return loginData;
  }

  //---following function is to get Login details with validating otp, code starts(added on 28th Oct)

  Future<dynamic> getLoginDetailsOnOtpValidationPost({required var record}) async {
    /*latitude = location.latitude;
    longitude = location.longitude;*/ //---no more req

    // var urlValue = '$baseURL/login/$url'; //---commented on 30th Sept
    var urlValue = '$baseURLV1/login/mfa'; //--dynamic base urlvalue(added on 30th Sept)
    // print('Url-=>$urlValue');
    // NetworkHelper networkHelper = NetworkHelper('$baseURL/login/$url');
    NetworkHelper networkHelper = NetworkHelper(urlValue);
    var loginData = await networkHelper.getDataOnPostMethod(record);

    // print('Data-=>$loginData');
    return loginData;
  }
  //---following function is to get Login details with validating otp, code ends(added on 28th Oct)

  //---following function is to get otp during login, code starts (added on 28th Oct)
  Future<dynamic> getLoginOtpOnPost({required var record}) async {
    /*latitude = location.latitude;
    longitude = location.longitude;*/ //---no more req

    // var urlValue = '$baseURL/login/$url'; //---commented on 30th Sept
    var urlValue = '$baseURLV1/login/mfa/email-otp'; //--dynamic base urlvalue(added on 30th Sept)
    // print('Url-=>$urlValue');
    // NetworkHelper networkHelper = NetworkHelper('$baseURL/login/$url');
    NetworkHelper networkHelper = NetworkHelper(urlValue);
    var loginOtpData = await networkHelper.getDataOnPostMethod(record);

    // print('loginOtpData-=>$loginOtpData');
    return loginOtpData;
  }
  //---following function is to get otp during login, code ends (added on 28th Oct)
}
