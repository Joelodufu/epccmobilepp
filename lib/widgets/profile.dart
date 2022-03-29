import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    var requiredAspect = MediaQuery.of(context).size.width/540;
    return Container(

      margin: const EdgeInsets.only(right: 20),
      width:requiredAspect* 60,
      height:requiredAspect* 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(requiredAspect*50),
          color: Colors.grey.withOpacity(0.5),
          image: DecorationImage(
              image: AssetImage('img/profile.png')
          )
      ),
    );
  }
}
