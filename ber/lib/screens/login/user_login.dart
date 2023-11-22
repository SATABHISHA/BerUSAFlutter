import 'package:ber/reusable_widgets_constants/constants.dart';
import 'package:ber/services/login.dart';
import 'package:ber/services/xml_to_json_converter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../reusable_widgets_constants/reusable_constants.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../reusable_widgets_constants/rounded_button.dart';
import 'package:xml/xml.dart' as xml;
import 'dart:convert';

class UserLogin extends StatefulWidget {
  // const UserLogin({Key? key}) : super(key: key);
  static String id = 'Login';

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  LoginModel loginModel = LoginModel();

  var corporateId, userId, password;

  // create a TextEditingController
  final _controller_corporate_id = TextEditingController();
  final _controller_user_id = TextEditingController();
  final _controller_pwd = TextEditingController();

  // dispose it when the widget is unmounted
  @override
  void dispose() {
    _controller_corporate_id.dispose();
    _controller_user_id.dispose();
    _controller_pwd.dispose();
    super.dispose();
  }


  //---function to get Login Details, code starts
  Future<void> getLoginDetailsOnPost() async{
    var credential = {
      "CorpID" : corporateId,
      "UserName" : userId,
      "Password" : password,
    };
    var loginDetails = await loginModel.getLoginDetailsOnPost(credential: credential);
    print('responsaData-=>${loginDetails}');

    // Parse the XML string
    var document = xml.XmlDocument.parse(loginDetails);

    // Extract the JSON string from the XML
    var jsonString = document.findAllElements('string').first.text;

    // Parse the JSON string
    var jsonData = jsonDecode(jsonString);

    // Convert the JSON data back to a formatted JSON string
    var formattedJsonString = JsonEncoder.withIndent('  ').convert(jsonData);

    print("JsonData-=>$formattedJsonString");

  }
  //---function to get Login Details, code ends

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color.fromRGBO(101, 156, 187, 1.0),
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light
    ));
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        // backgroundColor: Color.fromRGBO(2, 72, 254, 1.0),
        // appBar: AppBar(backgroundColor: Colors.amber,),

        /*appBar: AppBar(
          // backgroundColor: Color.fromRGBO(71, 71, 71, 1.0),
          backgroundColor: Color.fromRGBO(2, 72, 254, 1.0),
          centerTitle: false,
          automaticallyImplyLeading: false,
          actions: [
            Builder(
                builder: (context) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Text('Hello ${EmployeeLogin.employeeJsonData['employee']['employee_full_name']} (${EmployeeLogin.employeeJsonData['user']['user_name']})', style: TextStyle(fontSize: 14, color: Colors.white),),
                        // MediaQuery.of(context).size.width > 950 ? Text('Hello nnnd nfnnfnnf fnnfnfnfnf', style: TextStyle(fontSize: 14, color: Colors.white),) : SizedBox(),

                        SizedBox(width: 10,),

                      ],
                    ),
                  );
                }
            ),
          ],

        ),*/
        body: Container(
          // color: Colors.lightGreenAccent,
          decoration: BoxDecoration(
            /*gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  // Color.fromRGBO(2, 72, 254, 1.0),
                  Colors.blue,
                  Colors.yellow,
                  Colors.redAccent,

                ],
              )*/
              color: Color.fromRGBO(255, 255, 255, 1.0)
          ),
          child: SafeArea(
            child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: double.infinity,
                        // height: 60,
                        color: Color.fromRGBO(117, 185, 223, 1.0),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                          child: Column(
                            children: [
                              Center(
                                child: Text('Login', style: TextStyle(color: Color.fromRGBO(
                                    255, 255, 255, 1.0), fontSize: 18),),
                              ),
                              Center(
                                child: Text('Business Expense Report', style: TextStyle(color: Color.fromRGBO(
                                    255, 255, 255, 1.0), fontSize: 14),),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Container(
                          width: double.infinity,
                          // height: 60,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.red,),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(15, 30, 15, 30),
                            child: Column(
                              children: [
                                //---CorpID textField, code starts
                                SizedBox(
                                  width: double.infinity,
                                  height: 40,
                                  child: TextField(
                                    controller: _controller_corporate_id,
                                    textAlign: TextAlign.left,
                                    keyboardType: TextInputType.text,
                                    onChanged: (value){
                                      corporateId = value;
                                    },
                                    style: TextStyle(color: Colors.black, fontFamily: 'Gilroy'),
                                    decoration: kTextFieldDecoration.copyWith(fillColor: Colors.white,hintText: 'Enter CorporateId', prefixIcon: Container(
                                      transform: Matrix4.translationValues(-5.0, 0.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(0, 6.7, 6.7, 6.7),
                                        child: CircleAvatar(child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset('images/userid.png'),
                                        ), backgroundColor: GlobalConstants.colorLoginControlBlockBg,radius: 30,),
                                      ),
                                    )
                                    ),
                                  ),
                                ),
                                //---CorpID textField, code ends

                                SizedBox(height: 20,),

                                // ---UserId textField, code starts
                                SizedBox(
                                  width: double.infinity,
                                  height: 40,
                                  child: TextField(
                                    controller: _controller_user_id,
                                    textAlign: TextAlign.left,
                                    keyboardType: TextInputType.text,
                                    onChanged: (value){
                                      userId = value;
                                    },
                                    style: TextStyle(color: Colors.black, fontFamily: 'Gilroy'),
                                    decoration: kTextFieldDecoration.copyWith(fillColor: Colors.white,hintText: 'Enter UserId', prefixIcon: Container(
                                      transform: Matrix4.translationValues(-5.0, 0.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(0, 6.7, 6.7, 6.7),
                                        child: CircleAvatar(child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset('images/userid.png'),
                                        ), backgroundColor: GlobalConstants.colorLoginControlBlockBg,radius: 30,),
                                      ),
                                    )
                                    ),
                                  ),
                                ),
                                //---UserId textField, code ends


                                SizedBox(height: 20,),

                                // ---Password textField, code starts
                                SizedBox(
                                  width: double.infinity,
                                  height: 40,
                                  child: TextField(
                                    controller: _controller_pwd,
                                    textAlign: TextAlign.left,
                                    keyboardType: TextInputType.text,
                                    obscureText: true,
                                    onChanged: (value){
                                      password = value;
                                    },
                                    style: TextStyle(color: Colors.black, fontFamily: 'Gilroy'),
                                    decoration: kTextFieldDecoration.copyWith(fillColor: Colors.white,hintText: 'Enter Password', prefixIcon: Container(
                                      transform: Matrix4.translationValues(-5.0, 0.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(0, 6.7, 6.7, 6.7),
                                        child: CircleAvatar(child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset('images/pwd.png'),
                                        ), backgroundColor: GlobalConstants.colorLoginControlBlockBg,radius: 30,),
                                      ),
                                    )
                                    ),
                                  ),
                                ),
                                //---Password textField, code ends

                                SizedBox(height: 20,),

                                Container(
                                  width: double.infinity,
                                  height: 85,
                                  child: RoundedButton(colour: GlobalConstants.colorSubAppBar, title: 'Login', onPressed:() async {
                                    // EasyLoading.show(status: 'Loading...');
                                    // EasyLoading.show(status: 'Loading...');
                                    if (_controller_user_id.value.text.isNotEmpty &&
                                        _controller_pwd.value.text.isNotEmpty) {
                                      Login();
                                      // getLoginDetailsOnPost();
                                    } else {
                                      // EasyLoading.dismiss();
                                      // _showMessageInScaffold('Field can\'t be left blank');
                                    }
                                  }
                                  ),
                                ),


                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 60,
                        color: Color.fromRGBO(117, 185, 223, 1.0),
                      )
                    ],
                  )
                ]
            ),
          ),
        ),
      ),
    );
  }

  void Login(){
    getLoginDetailsOnPost();
  }
}
