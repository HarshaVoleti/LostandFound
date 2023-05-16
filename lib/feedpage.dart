
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:lostandfound/addproduct.dart';
import 'package:lostandfound/models.dart';
import 'package:lostandfound/saleitems.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> with WidgetsBindingObserver {
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

  final List<SellItems> saleItems = [];
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // Future<void> _pickImageFromGallery() async {
    //   try {
    //     final PickedFile? pickedFile = await _picker.getImage(
    //       source: ImageSource.gallery,
    //     );
    //     setState(
    //       () => this.image = File(pickedFile!.path),
    //     );
    //     print(image);
    //   } catch (e) {
    //     showsnackbar(context, Colors.red, e.toString());
    //     print(e.toString());
    //   }
    // }

    // void additem() {
    //   showModalBottomSheet(
    //     backgroundColor: back,
    //     isScrollControlled: true,
    //     context: context,
    //     builder: (context) {
    //       return SafeArea(
    //         child: Container(
    //           height: size.height * 0.7,
    //           padding: EdgeInsets.all(10),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               SizedBox(
    //                 height: 15,
    //               ),
    //               Text(
    //                 " Sell an Item",
    //                 style: TextStyle(
    //                   fontSize: 30,
    //                   color: Colors.white,
    //                   fontWeight: FontWeight.bold,
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: 15,
    //               ),
    //               Container(
    //                 decoration: BoxDecoration(
    //                   color: grey,
    //                   borderRadius: BorderRadius.circular(10),
    //                 ),
    //                 child: TextField(
    //                   decoration: InputDecoration(
    //                       fillColor: Colors.white,
    //                       labelText: '  Name',
    //                       labelStyle: TextStyle(
    //                         color: Colors.white,
    //                       )),
    //                   controller: namecontroller,
    //                   // onSubmitted: (_) => submitData(),
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: 10,
    //               ),
    //               Container(
    //                 decoration: BoxDecoration(
    //                   color: grey,
    //                   borderRadius: BorderRadius.circular(10),
    //                 ),
    //                 child: TextField(
    //                   decoration: InputDecoration(
    //                       fillColor: Colors.white,
    //                       labelText: '  title',
    //                       labelStyle: TextStyle(
    //                         color: Colors.white,
    //                       )),
    //                   controller: titleInput,
    //                   // onSubmitted: (_) => submitData(),
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: 10,
    //               ),
    //               Container(
    //                 decoration: BoxDecoration(
    //                   color: grey,
    //                   borderRadius: BorderRadius.circular(10),
    //                 ),
    //                 child: TextField(
    //                   decoration: InputDecoration(
    //                       fillColor: Colors.white,
    //                       labelText: '  description',
    //                       labelStyle: TextStyle(
    //                         color: Colors.white,
    //                       )),
    //                   controller: descInput,
    //                   // onSubmitted: (_) => submitData(),
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: 10,
    //               ),
    //               Container(
    //                 decoration: BoxDecoration(
    //                   color: grey,
    //                   borderRadius: BorderRadius.circular(10),
    //                 ),
    //                 child: TextField(
    //                   decoration: InputDecoration(
    //                       fillColor: Colors.white,
    //                       labelText: '  Location',
    //                       labelStyle: TextStyle(
    //                         color: Colors.white,
    //                       )),
    //                   controller: locationcontroller,
    //                   // onSubmitted: (_) => submitData(),
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: 10,
    //               ),
    //               Container(
    //                 decoration: BoxDecoration(
    //                   color: grey,
    //                   borderRadius: BorderRadius.circular(10),
    //                 ),
    //                 child: TextField(
    //                   keyboardType: TextInputType.number,
    //                   decoration: InputDecoration(
    //                       fillColor: Colors.white,
    //                       labelText: '  Phone Number',
    //                       labelStyle: TextStyle(
    //                         color: Colors.white,
    //                       )),
    //                   controller: numbercontroller,
    //                   // onSubmitted: (_) => submitData(),
    //                 ),
    //               ),
    //               TextField(
    //                 style: TextStyle(
    //                   color: Colors.white,
    //                 ),
    //                 controller: dateController,
    //                 decoration: const InputDecoration(
    //                   enabledBorder: UnderlineInputBorder(
    //                     borderSide: BorderSide(color: Colors.white),
    //                   ),
    //                   focusedBorder: UnderlineInputBorder(
    //                     borderSide: BorderSide(color: Colors.white),
    //                   ),
    //                   fillColor: Colors.white,
    //                   icon: Icon(Icons.calendar_today),
    //                   focusColor: Colors.white,
    //                   iconColor: Colors.white,
    //                   hoverColor: Colors.white,
    //                   prefixIconColor: Colors.white,
    //                   labelText: "Pick Date",
    //                   labelStyle: TextStyle(
    //                     color: Colors.white,
    //                   ),
    //                 ),
    //                 readOnly: true,
    //                 onTap: () async {
    //                   DateTime? pickedDate = await showDatePicker(
    //                     context: context,
    //                     initialDate: DateTime.now(),
    //                     firstDate: DateTime(2000),
    //                     lastDate: DateTime(2101),
    //                   );
    //                   if (pickedDate != null) {
    //                     print(pickedDate);
    //                     String formattedDate =
    //                         DateFormat('yyyy-MM-dd').format(pickedDate);
    //                     print(formattedDate);

    //                     setState(() {
    //                       dateController.text = formattedDate;
    //                       datetimeof = pickedDate;
    //                     });
    //                   } else {
    //                     print("Date is not selected");
    //                   }
    //                 },
    //               ),
    //               TextField(
    //                 style: TextStyle(
    //                   color: Colors.white,
    //                 ),
    //                 controller: imagecontroller,
    //                 decoration: const InputDecoration(
    //                   enabledBorder: UnderlineInputBorder(
    //                     borderSide: BorderSide(color: Colors.white),
    //                   ),
    //                   focusedBorder: UnderlineInputBorder(
    //                     borderSide: BorderSide(color: Colors.white),
    //                   ),
    //                   fillColor: Colors.white,
    //                   icon: Icon(Icons.image),
    //                   focusColor: Colors.white,
    //                   iconColor: Colors.white,
    //                   hoverColor: Colors.white,
    //                   prefixIconColor: Colors.white,
    //                   labelText: "Pick Image",
    //                   labelStyle: TextStyle(
    //                     color: Colors.white,
    //                   ),
    //                 ),
    //                 readOnly: true,
    //                 onTap: () async {
    //                   try {
    //                     final PickedFile? pickedFile = await _picker.getImage(
    //                       source: ImageSource.gallery,
    //                     );
    //                     setState(
    //                       () => this.image = File(pickedFile!.path),
    //                     );
    //                     print(image);
    //                   } catch (e) {
    //                     showsnackbar(context, Colors.red, e.toString());
    //                     print(e.toString());
    //                   }
    //                   if (image != null) {
    //                     print(image);

    //                     setState(() {
    //                       imagecontroller.text = image!.path;
    //                     });
    //                   } else {
    //                     print("Image is not selected");
    //                   }
    //                 },
    //               ),
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   SizedBox(
    //                     width: 100,
    //                     child: ElevatedButton(
    //                       onPressed: () {
    //                         final newsale = SellItems(
    //                           id: DateTime.now().toString(),
    //                           title: titleInput.text,
    //                           image: File(image!.path),
    //                           date: datetimeof,
    //                           location: locationcontroller.text,
    //                           owner: namecontroller.text,
    //                           description: descInput.text,
    //                           number: int.parse(numbercontroller.text),
    //                           // number:  numbercontroller.
    //                         );
    //                         saleitems.add(newsale);
    //                         Navigator.pop(context);
    //                       },
    //                       style: ButtonStyle(
    //                         backgroundColor: MaterialStatePropertyAll(grey),
    //                       ),
    //                       child: Text("Add"),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ],
    //           ),
    //         ),
    //       );
    //     },
    //   );
    // }

    return Scaffold(
      backgroundColor: back,
      appBar: AppBar(
        backgroundColor: back,
        elevation: 0,
        title: const Text(
          'Feed',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddProduct(),
                ),
              );
            },
            icon: Icon(
              Icons.add,
              color: Colors.white,
              size: 25,
            ),
          ),
        ],
      ),
      body: SaleItems(
        saleitems: saleItems,
      ),
    );
  }

  // Widget body() {
  //   return Container(
  //     padding: EdgeInsets.all(15),
  //     child: GridView.builder(
  //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //         crossAxisCount: 2,
  //         crossAxisSpacing: 20,
  //         mainAxisSpacing: 20,
  //         childAspectRatio: 2 / 2.8,
  //       ),
  //       physics: ScrollPhysics(),
  //       shrinkWrap: true,
  //       itemCount: saleitems.length,
  //       itemBuilder: (context, index) => Container(
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             // Image.asset(
  //             //   saleitems[index].image,
  //             //   fit: BoxFit.fitWidth,
  //             // ),
  //             Container(
  //               width: double.infinity,
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(10),
  //                 image: DecorationImage(
  //                   image: FileImage(
  //                     saleitems[index].image,
  //                   ),
  //                   fit: BoxFit.fitWidth,
  //                 ),
  //               ),
  //             ),
  //             Text(
  //               saleitems[index].title,
  //               style: TextStyle(
  //                 fontSize: 18,
  //                 fontWeight: FontWeight.w600,
  //                 color: Colors.white,
  //               ),
  //             ),
  //             SizedBox(
  //               height: 10,
  //             ),
  //             Row(
  //               children: [
  //                 Icon(
  //                   Icons.location_on,
  //                   size: 18,
  //                   color: Colors.white,
  //                 ),
  //                 Text(
  //                   saleitems[index].location,
  //                   style: TextStyle(
  //                     fontSize: 13,
  //                     fontWeight: FontWeight.w600,
  //                     color: Colors.grey,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             SizedBox(
  //               height: 10,
  //             ),
  //             Row(
  //               children: [
  //                 Icon(
  //                   Icons.call,
  //                   size: 18,
  //                   color: Colors.white,
  //                 ),
  //                 Text(
  //                   "+91 " + saleitems[index].number.toString(),
  //                   style: TextStyle(
  //                     fontSize: 13,
  //                     fontWeight: FontWeight.w600,
  //                     color: Colors.grey,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  final appbar = AppBar(
    backgroundColor: back,
    elevation: 0,
    title: const Text(
      'Feed',
      style: TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    centerTitle: false,
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.add,
          color: Colors.white,
          size: 25,
        ),
      ),
    ],
  );
}
