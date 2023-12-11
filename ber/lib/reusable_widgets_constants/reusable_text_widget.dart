
import 'package:flutter/cupertino.dart';

class ReusableTextWidget extends StatelessWidget {

  final textname;
  final Color colorname;
  FontWeight fontweight;
  double size;

  ReusableTextWidget({required this.textname, required this.colorname, required this.fontweight, required this.size});
  /*const ReusableTextWidget({
    Key? key,
  }) : super(key: key);*/
  // Color.fromRGBO(125, 129, 133, 1.0)

  @override
  Widget build(BuildContext context) {
    return Text(textname, style: TextStyle(color: colorname, fontWeight: fontweight, fontSize: size),);
  }
}