import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:lostandfound/models.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final titleInput = TextEditingController();
  final descInput = TextEditingController();
  final dateController = TextEditingController();
  final imagecontroller = TextEditingController();
  final namecontroller = TextEditingController();
  final numbercontroller = TextEditingController();
  final locationcontroller = TextEditingController();
  File? image;
  DateTime datetimeof = DateTime.now();
  final _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: back,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: back,
        leadingWidth: 30,
        centerTitle: false,
        title: const Text(
          " Sell an Item",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Container(
              decoration: BoxDecoration(
                color: grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    labelText: '  Name',
                    labelStyle: TextStyle(
                      color: Colors.white,
                    )),
                controller: namecontroller,
                // onSubmitted: (_) => submitData(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                color: grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    labelText: '  title',
                    labelStyle: TextStyle(
                      color: Colors.white,
                    )),
                controller: titleInput,
                // onSubmitted: (_) => submitData(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                color: grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    labelText: '  description',
                    labelStyle: TextStyle(
                      color: Colors.white,
                    )),
                controller: descInput,
                // onSubmitted: (_) => submitData(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                color: grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    labelText: '  Location',
                    labelStyle: TextStyle(
                      color: Colors.white,
                    )),
                controller: locationcontroller,
                // onSubmitted: (_) => submitData(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                color: grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    labelText: '  Phone Number',
                    labelStyle: TextStyle(
                      color: Colors.white,
                    )),
                controller: numbercontroller,
                // onSubmitted: (_) => submitData(),
              ),
            ),
            // SizedBox(
            //   height: 20,
            // ),
            // TextField(
            //   style: TextStyle(
            //     color: Colors.white,
            //   ),
            //   controller: dateController,
            //   decoration: const InputDecoration(
            //     enabledBorder: UnderlineInputBorder(
            //       borderSide: BorderSide(color: Colors.white),
            //     ),
            //     focusedBorder: UnderlineInputBorder(
            //       borderSide: BorderSide(color: Colors.white),
            //     ),
            //     fillColor: Colors.white,
            //     icon: Icon(Icons.calendar_today),
            //     focusColor: Colors.white,
            //     iconColor: Colors.white,
            //     hoverColor: Colors.white,
            //     prefixIconColor: Colors.white,
            //     labelText: "Pick Date",
            //     labelStyle: TextStyle(
            //       color: Colors.white,
            //     ),
            //   ),
            //   readOnly: true,
            //   onTap: () async {
            //     DateTime? pickedDate = await showDatePicker(
            //       context: context,
            //       initialDate: DateTime.now(),
            //       firstDate: DateTime(2000),
            //       lastDate: DateTime(2101),
            //     );
            //     if (pickedDate != null) {
            //       print(pickedDate);
            //       String formattedDate =
            //           DateFormat('yyyy-MM-dd').format(pickedDate);
            //       print(formattedDate);

            //       setState(() {
            //         dateController.text = formattedDate;
            //         datetimeof = pickedDate;
            //       });
            //     } else {
            //       print("Date is not selected");
            //     }
            //   },
            // ),
            SizedBox(
              height: 20,
            ),
            TextField(
              style: TextStyle(
                color: Colors.white,
              ),
              controller: imagecontroller,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                fillColor: Colors.white,
                icon: Icon(Icons.image),
                focusColor: Colors.white,
                iconColor: Colors.white,
                hoverColor: Colors.white,
                prefixIconColor: Colors.white,
                labelText: "Pick Image",
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
              readOnly: true,
              onTap: () async {
                try {
                  final PickedFile? pickedFile = await _picker.getImage(
                    source: ImageSource.gallery,
                  );
                  setState(
                    () => this.image = File(pickedFile!.path),
                  );
                  print(image);
                } catch (e) {
                  showsnackbar(context, Colors.red, e.toString());
                  print(e.toString());
                }
                if (image != null) {
                  print(image);

                  setState(() {
                    imagecontroller.text = image!.path;
                  });
                } else {
                  print("Image is not selected");
                }
              },
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      final newsale = SellItems(
                        id: DateTime.now().toString(),
                        title: titleInput.text,
                        image: File(image!.path),
                        date: datetimeof,
                        location: locationcontroller.text,
                        owner: namecontroller.text,
                        description: descInput.text,
                        number: int.parse(numbercontroller.text),
                        // number:  numbercontroller.
                      );
                      saleItems.add(newsale);
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(grey),
                    ),
                    child: Text("Add"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
