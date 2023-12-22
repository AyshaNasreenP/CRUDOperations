import 'package:credoperations/viewdetails.dart';
import 'package:flutter/material.dart';


import 'package:credoperations/home.dart';
class editDetails extends StatefulWidget {
  final String data;
  const editDetails({Key? key, required this.data}) : super(key: key);

  @override

  State<editDetails> createState() => _editDetailsState();
}


class _editDetailsState extends State<editDetails> {
  //TextEditingController _editedController = TextEditingController();
  late TextEditingController editnameController;
  late TextEditingController editageController;
  late TextEditingController editphoneController;

  @override
  void initState() {
    super.initState();
    List<String> dataList = widget.data.split('\n');
    editnameController = TextEditingController(text: dataList[0]);
    editageController = TextEditingController(text: dataList[1]);
    editphoneController = TextEditingController(text: dataList[2]);
  }

  @override
  void dispose() {
    editnameController.dispose();
    editageController.dispose();
    editphoneController.dispose();
    super.dispose();
  }


  @override

  Widget build(BuildContext context) {

    return Scaffold(

        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: editnameController,
                decoration: InputDecoration(
                  labelText: 'Edit Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: editageController,
                decoration: InputDecoration(
                  labelText: 'Edit age',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: editphoneController,
                decoration: InputDecoration(
                  labelText: 'Edit phone number',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    String editedData =
                        '${editnameController.text}\n${editageController.text}\n${editphoneController.text}';
                    Navigator.push(context,  MaterialPageRoute(
                        builder: (context) => viewdetails(data: editedData, )
                    ),);
                  });

                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
        // Container(
        //   child: Column(
        //     children: [
        //       TextFormField(
        //         controller: _editedController,
        //
        //         decoration: InputDecoration(
        //
        //             border: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(20),
        //             )
        //         ),
        //
        //
        //       ),
        //       SizedBox(height: 10,),
        //       ElevatedButton(
        //         onPressed: () {
        //           // Save the edited value or perform any other action
        //           String editedValue = _editedController.text;
        //
        //           print("Edited Value: $editedValue",);
        //
        //           // You may want to navigate back to the previous screen
        //           Navigator.pop(context);
        //         },
        //         child: Text("Save Changes"),
        //       )
        //     ],
        //   ),
        // )

    );
  }
// void getValues(Number) {
//   setState(() {
//     values.add(Number);
//     _listController.clear();
//   });
// }
}
