import 'package:credoperations/Edit.dart';
import 'package:credoperations/models.dart';
import 'package:credoperations/viewdetails.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
class home extends StatefulWidget {
  const home({Key? key}) : super(key:key);
  //const task2({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  void _navigateToEditDetails(String data, int index) async {
    final editedData = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => editDetails(data: data),
      ),
    );

    if (editedData != null) {
      setState(() {
        values[index] = editedData;
      });
    }
  }

  //int Count = 0;
  String Number = "";
  List values = [];
  //String initialValue='';
  //TextEditingController _countController=TextEditingController();
  TextEditingController _nameController=TextEditingController();
  TextEditingController _ageController=TextEditingController();
  TextEditingController _phoneController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10,),
            // TextFormField(
            //   controller: _countController,
            //   decoration: InputDecoration(
            //       labelText: "Enter the Count",
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(20),
            //       )
            //   ),
            //
            //
            // ),
            SizedBox(height: 10,),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                  labelText: "Enter the Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )
              ),


            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: _ageController,
              decoration: InputDecoration(
                  labelText: "Enter the Age",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )
              ),


            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(
                  labelText: "Enter the Phone number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )
              ),


            ),
            SizedBox(height: 10,),
            ElevatedButton(

                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(40),
                  primary: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                ), onPressed: () {
                getValues();


            }, child: Text("Add",
              style: TextStyle(
                  color: Colors.white70
              ),
            )
            ),
            Container(
              height: 400,
              child: ListView.builder(

                  itemCount:values.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                      child: Container(
                       // height: 500,
                        color: Colors.grey,
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => viewdetails( data:'${values[index]}', )
                              ),
                            );
                          },

                          child: ListTile(
                            title: Column(
                              children: [

                                Text(values[index]),

                           // Text(details.values.toString()),
                              ],
                            ),
                            trailing:Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [

                              IconButton(onPressed: (){
                                _navigateToEditDetails(values[index], index);
                                // Navigator.push(
                                //   context, MaterialPageRoute(
                                //       builder: (context) => editDetails( data:'${values[index]}',)
                                //   ),
                                // );

                              }, icon:Icon(Icons.edit)) ,
                              IconButton(onPressed: (){

                                  setState(() {
                                    values.removeAt(index);
                                  });
                              }, icon:Icon(Icons.delete)) ,

                              // GestureDetector(
                              //     onTap: ()
                              //     {
                              //       Navigator.push(context,
                              //           MaterialPageRoute(builder: (context) => editDetails(
                              //             initialValue: values[index],
                              //           )));
                              //
                              //     },
                              //
                              //     child: Icon(Icons.edit)),
                              // GestureDetector(
                              //     onTap: ()
                              //     {
                              //       setState(() {
                              //         values.removeAt(index);
                              //       });
                              //
                              //     },
                              //
                              //     child: Icon(Icons.delete)),
                            ],)
                            // GestureDetector(
                            //     onTap: ()
                            //     {
                            //       Navigator.push(context,
                            //           MaterialPageRoute(builder: (context) => editDetails(
                            //             initialValue: values[index],
                            //           )));
                            //
                            //     },
                            //
                            //     child: Icon(Icons.edit)),

                            //Text(values[index]),
                            //style: ListTileStyle.drawer,
                            //iconColor: Colors.grey,

                          ),
                        ),
                      ),
                    );
                  }
              ),
            ),


            //Text("$less50")

          ],
        ),

      ),
    );
  }
  void getValues() {
    if(_phoneController.text.isNotEmpty && _ageController.text.isNotEmpty && _nameController.text.isNotEmpty){
      setState(() {
        String name=_nameController.text;
        String age=_ageController.text;
        String Phone=_phoneController.text;
        values.add("$name\n$age\n$Phone");
        _nameController.clear();
        _phoneController.clear();
        _ageController.clear();
      });
    }

  }

}
