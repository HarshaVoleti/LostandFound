import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lostandfound/models.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final titleInput = TextEditingController();
    final descInput = TextEditingController();

    void additem() {
      showModalBottomSheet(
        backgroundColor: grey,
        context: context,
        builder: (context) {
          return Container(
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'title',
                  ),
                  controller: titleInput,
                  // onSubmitted: (_) => submitData(),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "description",
                  ),
                  controller: descInput,
                  // onSubmitted: (_) => submitData(),
                ),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: back,
      appBar: AppBar(
        backgroundColor: back,
        elevation: 0,
        title: const Text(
          'Lost and Found',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () => additem(),
            icon: Icon(
              Icons.add,
              color: Colors.white,
              size: 25,
            ),
          ),
        ],
      ),
      body: Container(
        // height: 200,
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(
              lostandfounditems.length,
              (index) => Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 170,
                  padding: EdgeInsets.all(9),
                  width: size.width - 20,
                  decoration: BoxDecoration(
                    color: grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 120,
                            height: 150,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              image: DecorationImage(
                                image: AssetImage(
                                  lostandfounditems[index].image,
                                ),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: size.width - 170,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      DateFormat('dd/MM/yyyy  hh:mm a').format(
                                          lostandfounditems[index].date),
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                        ),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(
                                        "lost",
                                        style: TextStyle(),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  lostandfounditems[index].title,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  lostandfounditems[index].description,
                                  maxLines: 2,
                                  style: TextStyle(
                                    // fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 15,
                                  child: Icon(
                                    Icons.person,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  lostandfounditems[index].owner,
                                  style: TextStyle(
                                    // fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
