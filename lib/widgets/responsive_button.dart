import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/misc/colors.dart';
import 'package:flutter_app/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  ResponsiveButton({
    Key? key,
    this.width=70,
    this.isResponsive=false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var requiredAspectRario = MediaQuery.of(context).size.width/540;

    return Flexible(
      child: Container(
        width: isResponsive==true?double.maxFinite:requiredAspectRario*70,
        height: requiredAspectRario*60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(requiredAspectRario*10),
          color: AppColors.mainColor
        ),
        child: Row(
          mainAxisAlignment: isResponsive==true?MainAxisAlignment.spaceBetween: MainAxisAlignment.center,
          children: [
            isResponsive==true?Container(margin:  EdgeInsets.only(left: requiredAspectRario*20), child: AppText(text: "Get This Message Now", color:Colors.white ,)):Container(),
            Container(margin: isResponsive==true? EdgeInsets.only(right: requiredAspectRario*20):const EdgeInsets.only(right: 0), child: Icon(Icons.next_plan, size:requiredAspectRario* 50, color: Colors.white.withOpacity(0.5),)),
          ],
        ),
      ),
    );
  }
}
