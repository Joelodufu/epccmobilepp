import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/know_your_pastors.dart';

import '../misc/colors.dart';
import '../widgets/app_large_text.dart';
import '../widgets/app_text.dart';
import '../widgets/profile.dart';

class SundaySchool extends StatelessWidget {
  const SundaySchool({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KnowYourPastors();
     }
}
