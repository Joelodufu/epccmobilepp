import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultClass {
  String? dataName;

  //List<List<String>> dataSets= new List.generate(n, (i) => []);
  List<List<String>>? dataSets = [];

  ResultClass({this.dataName, this.dataSets});

  ResultClass.fromJson(Map<String, dynamic> json) {
    dataName = json['dataName'];
    dataSets = json['dataSets'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dataName'] = this.dataName;
    data['dataSet'] = this.dataSets;
    return data;
  }
}

class TestDropDown extends StatefulWidget {
  TestDropDown({Key? key}) : super(key: key);

  @override
  State<TestDropDown> createState() => _TestDropDownState();
}

class _TestDropDownState extends State<TestDropDown> {
  ResultClass? _currentResultClass;

  @override
  Widget build(BuildContext context) {
    var data = [
      {
        "name": "Genesis",
        "chapters": [
          [
            "Verse 1 texts",
            "Verse 2 txts",
            "Verse 3 txts",
            "Verse 4 txts",
            "Verse 5 txts",
          ],
          [
            "Verse 1 texts",
            "Verse 2 txts",
            "Verse 3 txts",
            "Verse 4 txts",
            "Verse 5 txts",
          ]
        ]
      },
      {
        "name": "Exodus",
        "chapters":
        [
          [
            "Verse 1 texts",
            "Verse 2 txts",
            "Verse 3 txts",
            "Verse 4 txts",
            "Verse 5 txts",
          ],
          [
            "Verse 1 texts",
            "Verse 2 txts",
            "Verse 3 txts",
            "Verse 4 txts",
            "Verse 5 txts",
          ]
        ]
      },
      {
        "dataName": "data2",
        "dataSets": [
          ["2nd 1", "2nd 2", "2nd 3"],
          ["let 1", "let 2", "let 3", "let 4"]
        ]
      }
    ];

    List<ResultClass> lst = [];
    for (var i = 0; i < data.length; i++) {
      ResultClass model = ResultClass.fromJson(data[i]);
      lst.add(model);
      if (i == 0) {
        _currentResultClass = model;
      }
    }

    var itemsLevel1 = lst
        .map((item) => DropdownMenuItem<ResultClass>(
            child: Text(item.dataName ?? ""), value: item))
        .toList();

    return Scaffold(
        appBar: AppBar(
          title: Text("Dropdown"),
        ),
        body: Column(
          children: [
            DropdownButton<ResultClass>(
              items: itemsLevel1,
              value: this._currentResultClass,
              onChanged: (item) {
                _currentResultClass = item;
              },
            ),
          ],
        ));
  }
}
