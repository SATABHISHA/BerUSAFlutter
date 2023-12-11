


import 'package:ber/reusable_widgets_constants/constants.dart';
import 'package:ber/reusable_widgets_constants/reusable_text_widget.dart';
import 'package:flutter/material.dart';

class ReusablePopUpWithYesNoCustomDialog extends StatefulWidget {

  VoidCallback onPressedYes, onPressedNo;
  var alertTitle, messageBody;
  Color colorMessageBody;
  ReusablePopUpWithYesNoCustomDialog({required this.colorMessageBody, required this.onPressedYes, required this.onPressedNo, required this.alertTitle, required this.messageBody});
  @override
  State<ReusablePopUpWithYesNoCustomDialog> createState() => _ReusablePopUpWithYesNoCustomDialog();
}

class _ReusablePopUpWithYesNoCustomDialog extends State<ReusablePopUpWithYesNoCustomDialog> {

  @override
  initState(){
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    // myList = context.watch<EmployeeProjectActivityDataSet>().projectSearchAndActivityModelList;
    return Dialog(
      shape: RoundedRectangleBorder(
        /*borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
          side: BorderSide(width: 2, color: GlobalConstants.colorAppBar)*/
        // borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)), //---commented on 26th Oct 2022
        borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5), bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5) ),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      child: contentBox(context),
    );
  }

  contentBox(context){

    return Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                // height: (MediaQuery.of(context).size.height-75),
                width: 350,
                height: 250,
                // decoration: BoxDecoration(color: GlobalConstants.colorGridHeaderBackground,borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5))), //---commented on 26th Oct 2022
                decoration: BoxDecoration(color: Color.fromRGBO(124, 128, 234, 1.0),borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5), bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5) )),
                child: Stack(
                  children: [
                    Container(
                      // decoration: BoxDecoration(color: GlobalConstants.colorGridHeaderBackground,borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5))), //---commented on 26th Oct 2022
                      decoration: BoxDecoration(color: Color.fromRGBO(124, 128, 234, 1.0),borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5), bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5) )),
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Align(alignment: Alignment.centerLeft,child: Text('${widget.alertTitle}', style: TextStyle(color: Colors.white, fontSize: 17),)),
                      ),
                    ),
                    // Align(alignment: Alignment.topCenter,child: Container(width: MediaQuery.of(context).size.width, height: 60,color: GlobalConstants.colorSubAppBar,)),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 40, 10, 57),
                      child: Container(width: MediaQuery.of(context).size.width,color: Color.fromRGBO(60, 66, 86, 1.0), child: Align(alignment: Alignment.center,child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        // child: ReusableTextWidget(textname: '${widget.messageBody}', colorname: widget.colorMessageBody, fontweight: FontWeight.normal, size: 16), //---commented on 26th Oct 2022
                        child: ReusableTextWidget(textname: '${widget.messageBody}', colorname: Colors.white, fontweight: FontWeight.normal, size: 16),
                      ))),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: Align(alignment: Alignment.bottomCenter,
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            height:45,
                            // decoration: BoxDecoration(border: Border(top: BorderSide(width: 1, color: Colors.black54)), color: Color.fromRGBO(242, 242, 242, 1.0)),
                            decoration: BoxDecoration(border: Border(top: BorderSide(width: 0, color: GlobalConstants.colorGridHeaderBackground)), color: Colors.transparent),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(child: Container(color: Color.fromRGBO(154, 191, 114, 1), child: MaterialButton(onPressed: widget.onPressedYes ,child: Center(child: Text('Yes', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),)),))),
                                Container(width: 2,),
                                Expanded(child: Container(color: Color.fromRGBO(160, 160, 160, 1), child: MaterialButton(onPressed: widget.onPressedNo ,child: Center(child: Text('No', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),)),))),
                              ],
                            )),),
                    )
                  ],

                ),
              )
            ],
          ),]
    );
  }
}
class Constants{
  Constants._();
  static const double padding =20;
  static const double avatarRadius =45;
}