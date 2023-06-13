import 'package:api_and_provider/provider/get_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    // final dataProvider = Provider.of<GetDataProvider>(context);
    // var selectedItem = context.watch<GetDataProvider>().itemList;
    return Scaffold(
      appBar: AppBar(
        title: Text("Item List"),
      ),
      body: Consumer<GetDataProvider>(
        builder: (context, itemProvider, _) {
          // print("data ayoooo");
          return ListView.builder(
            itemBuilder: (context, index) {
              return ListTile();
            },
          );
        },
      ),
    );
  }
}
