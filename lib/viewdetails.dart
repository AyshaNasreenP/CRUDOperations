import 'package:flutter/material.dart';
import 'package:credoperations/home.dart';
import 'package:credoperations/Edit.dart';
import 'package:credoperations/models.dart';
import 'package:credoperations/viewdetails.dart';
import 'Edit.dart';
class viewdetails extends StatefulWidget {
  final String data;
  //int selectedIndex;


   viewdetails({ Key? key,required this.data}) : super(key: key);
  // task2_1({
  //   Key? key,
  //   required this.data,
  // }) : super(key: key);

  @override
  State<viewdetails> createState() => _viewdetailsState();
}

class _viewdetailsState extends State<viewdetails> {



  @override
  Widget build(BuildContext context) {
    List<String> dataList = widget.data.split('\n');
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),

      ),
      body:Container(
        child: Card(
          child:Container(
            width: double.infinity,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Name: ${dataList[0]}"),
                    Text("Age: ${dataList[1]}"),
                    Text("Phone: ${dataList[2]}"),
                  ],
                ),
                IconButton(onPressed: (){
                  Navigator.push(
                    context, MaterialPageRoute(
                      builder: (context) => editDetails( data:widget.data)
                  ),
                  );

                }, icon:Icon(Icons.edit)) ,

              ],
            ),
          )

        ),
      )
    );
  }
}
