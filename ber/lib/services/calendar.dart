

import 'package:ber/services/networking.dart';

class CalendarModel {
  Future<dynamic> getWeekDateListYearwiseOnPost({required var data}) async {
    /*latitude = location.latitude;
    longitude = location.longitude;*/ //---no more req

    // var urlValue = '$baseURL/login/$url'; //---commented on 30th Sept
    var urlValue = '$baseURLBer/WeekDateListYearwise'; //--dynamic base urlvalue(added on 30th Sept)
    // print('Url-=>$urlValue');
    // NetworkHelper networkHelper = NetworkHelper('$baseURL/login/$url');
    NetworkHelper networkHelper = NetworkHelper(urlValue);
    var WeekDateListYearwiseData = await networkHelper.getDataOnPostMethod(data);

    print('Data-=>$WeekDateListYearwiseData');
    return WeekDateListYearwiseData;
  }
}