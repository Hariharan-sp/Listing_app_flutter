import 'package:flutter/material.dart';
import 'package:lc/screens/edit_data.dart';
import 'package:provider/provider.dart';

import '../view_model/common_view_model.dart';
import 'color_resources.dart';
import 'insert_data_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late TextEditingController searchController;

  @override
  void initState() {
    context.read<HomeViewModel>().getListingData();
    searchController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Consumer<HomeViewModel>(
            builder: (context, products, child) {
              List<dynamic> filteredList = products.productList.isNotEmpty &&
                      products.productList != null
                  ? products.productList[0]["bikes"].where((bike) {
                      String bikeModel =
                          bike["bike_model"].toString().toLowerCase();
                      String condition =
                          bike["condition"].toString().toLowerCase();
                      String kilometers =
                          bike["kilometers"].toString().toLowerCase();
                      String makeYear =
                          bike["make_year"].toString().toLowerCase();
                      String registration =
                          bike["registration"].toString().toLowerCase();
                      String searchText = searchController.text.toLowerCase();

                      return bikeModel.contains(searchText) ||
                          condition.contains(searchText) ||
                          kilometers.contains(searchText) ||
                          makeYear.contains(searchText) ||
                          registration.contains(searchText);
                    }).toList()
                  : [];

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      color: Colors.white30,
                      child: TextField(
                        controller: searchController,
                        decoration: const InputDecoration(
                          labelText: 'Search',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: filteredList.length,
                      itemBuilder: (context, index) {
                        var service = filteredList;
                        return Card(
                          elevation: 2.0,
                          margin: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const EditDataScreen(),
                                ),
                              );
                            },
                            child: ListTile(
                              title: Column(
                                children: [
                                  Text(service[index]["bike_model"]
                                      .toString()
                                      .toUpperCase()),
                                  Text(service[index]["condition"]
                                      .toString()
                                      .toUpperCase()),
                                  Text(service[index]["kilometers"]
                                      .toString()
                                      .toUpperCase()),
                                ],
                              ),
                              subtitle: Text(service[index]["make_year"]
                                  .toString()
                                  .toUpperCase()),
                              trailing: Text(service[index]["registration"]
                                  .toString()
                                  .toUpperCase()),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorResources.color_background_blue,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddDataScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Add to listing",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
