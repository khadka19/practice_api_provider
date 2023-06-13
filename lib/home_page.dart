import 'package:api_and_provider/add_to_cart.dart';

import 'package:api_and_provider/provider/get_data_provider.dart';
import 'package:api_and_provider/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    final dataProvider = Provider.of<GetDataProvider>(context, listen: false);
    dataProvider.getMyData();
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<GetDataProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Shimmer Effect"),
      ),
      body: dataProvider.isLoading
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 15,
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        loadingShimmer(),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    );
                  }),
            )
          : ListView.builder(
              shrinkWrap: true,
              itemCount: dataProvider.responseData.data!.length,
              itemBuilder: (ctx, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.network(
                            dataProvider.responseData.data![index].avatar!,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(dataProvider
                                    .responseData.data![index].firstName!),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(dataProvider
                                    .responseData.data![index].email!),
                              ],
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Added To Cart")));
                        },
                        child: Container(
                          color: Colors.red,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "AddToCart",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
                );
              }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddToCart()));
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
