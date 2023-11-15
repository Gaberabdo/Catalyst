import 'package:admin_task/admin-feature/Controller/Models/catalog_model.dart';
import 'package:flutter/material.dart';

class MyListCatlog extends StatelessWidget {
  MyListCatlog({required this.model});
  Catalogs model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView with DataTable'),
      ),
      body: MyListView(model: model),
    );
  }
}

class MyListView extends StatelessWidget {
  Catalogs model;
  MyListView({required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 10,
            spreadRadius: 0,
            color: Colors.grey.shade100,
          ),
        ],
      ),
      child: DataTable(
        headingRowHeight: 50,
        dataRowHeight: 101,
        dividerThickness: 0,
        columns: [
          DataColumn(
            label: Container(
              width: 96,
              child: Center(
                child: Text('Name'),
              ),
            ),
          ),
          DataColumn(
            label: Container(
              width: 96,
              child: Center(
                child: Text('Image'),
              ),
            ),
          ),
          // Add other DataColumn widgets for each column
          // ...
          DataColumn(
            label: Container(
              width: 96,
              child: Center(
                child: Text('Action'),
              ),
            ),
          ),
        ],
        rows: [
          _buildDataRow([
            model!.name,
            _buildCircleAvatar(model.image.toString()),
            model.name,
            model.weight,
            model.pt,
            model.pd,
            model.brand,
            model.product,
            'cat menu',
            buildAction(),
          ]),
        ],
      ),
    );
  }

  DataRow _buildDataRow(List<dynamic> data) {
    return DataRow(
      cells: data
          .map(
            (cellData) => DataCell(
              Container(
                width: 96,
                child: Center(
                  child:
                      cellData is Widget ? cellData : Text(cellData.toString()),
                ),
              ),
              onTap: () {
                // Handle cell tap
                print('Cell tapped: $cellData');
              },
            ),
          )
          .toList(),
    );
  }

  // Replace this with your actual implementation for building a circle avatar
  Widget _buildCircleAvatar(String imageUrl) {
    return CircleAvatar(
      backgroundImage: NetworkImage(imageUrl),
    );
  }

  // Replace this with your actual implementation for building the action widget
  Widget buildAction() {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        // Handle action tap
        print('Action tapped');
      },
    );
  }
}
