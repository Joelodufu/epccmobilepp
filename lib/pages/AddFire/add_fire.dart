import 'package:flutter/material.dart';
import 'package:flutter_app/misc/colors.dart';

import '../../widgets/app_text.dart';

class AddFire extends StatelessWidget {
  const AddFire({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            leading: Image.asset(
              "img/logo.png",
            ),
            backgroundColor: AppColors.mainColor,
            title: Text("The EPCC Inc."),
            centerTitle: true,
          ),

          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                      width: double.maxFinite,
                      height:  70,
                      
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30), 
                        bottomRight: Radius.circular(30))
                      ),
                      child: Center(
                        child: AppText(
                          text: "Data",
                          size:  25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text("Read  Dara from Cloud Firestore", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                    Container(
                      height: 250,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ListView.builder(
                          itemCount: 2,
                          itemBuilder: ((context, index) {
                          return Text("My Name Is Joellee");
                        })),
                      ),
                    ),
                    Text("Write Data to CLoud Firstore", style: TextStyle(fontWeight: FontWeight.w600),),

              ],
            )
          ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({ Key? key }) : super(key: key);

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  
  
  final _formKey = GlobalKey<FormState>();

  @override

  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [],
      ),
    );
  }
}