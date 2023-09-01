import 'package:flutter/material.dart';
import 'package:flutter_google_sheet_example/monument_model.dart';
import 'package:flutter_google_sheet_example/widgets/mycontainer.dart';
import 'package:flutter_google_sheet_example/widgets/mytextfield.dart';

import 'widgets/colors_utils.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MonumentModel> userData = [];
  List<MonumentModel> foundItem = [];
  final _searchController = TextEditingController();
  bool isSearching = false;
  bool isRefresh = false;

  @override
  void initState() {
    getAllListFirst();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: bottomContainer(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Center(
            child: foundItem.isNotEmpty || userData.isNotEmpty
                ? userDataList()
                : Center(
                    child: CircularProgressIndicator(
                    //backgroundColor: primaryColor,
                    color: primaryColor,
                  ))));
  }

  Widget bottomContainer() {
    return MyContainer(
      height: MediaQuery.of(context).size.height / 10,
      width: MediaQuery.of(context).size.width,
      color: primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: IconButton(
              onPressed: () {
                setState(() {
                  userData.clear();
                  foundItem.clear();
                  _searchController.clear();
                  getAllListFirst();
                });
              },
              icon: Icon(
                Icons.refresh,
                size: 32,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
            flex: 4,
            child: MyTextField(
              hintText: 'Search',
              hintColor: primaryColor,
              controller: _searchController,
              sufficicon: GestureDetector(
                onTap: () {
                  setState(() {
                    _searchController.clear();
                    foundItem.clear();
                    foundItem = userData;
                  });
                },
                child: Icon(
                  Icons.cancel,
                  color: primaryColor,
                  size: 24,
                ),
              ),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    isRefresh = true;
                  });
                }
                runFilter(value);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget userDataList() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: ListView.separated(
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 10,
            );
          },
          itemCount: foundItem.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customRow(
                          text: foundItem[index].number.toString(),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        customRow(
                          text: foundItem[index].name.toString(),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        customRow(
                          text: foundItem[index].company.toString(),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        customRow(
                          text: foundItem[index].category.toString(),
                        ),
                      ],
                    ),
                  )),
            );
          }),
    );
  }

  void runFilter(String enteredKeyword) {
    List<MonumentModel> results = [];
    if (enteredKeyword.isEmpty) {
      results = userData;
    } else {
      results = userData
          .where((user) =>
              user.name!.toLowerCase().contains(enteredKeyword.toLowerCase()) ||
              user.company!
                  .toLowerCase()
                  .contains(enteredKeyword.toLowerCase()) ||
              user.category!
                  .toLowerCase()
                  .contains(enteredKeyword.toLowerCase()) ||
              user.number!.toString().contains(enteredKeyword))
          .toList();
    }

    // Refresh the UI
    setState(() {
      foundItem = results;
    });
  }

  getAllListFirst() async {
    userData = await MonumentModel.fetchMonument();
    getItemList();
  }

  getItemList() async {
    setState(() {
      if (userData != null) {
        print('userData is not null');
        foundItem = userData;
      } else {
        print('userData is null');
      }
      print("values client:: :::: ${userData.length}:::::${foundItem.length}");
    });
  }

  Widget customRow({String? text}) {
    return Text(
      text.toString(),
      maxLines: 3,
      textAlign: TextAlign.start,
      style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
    );
  }
}
