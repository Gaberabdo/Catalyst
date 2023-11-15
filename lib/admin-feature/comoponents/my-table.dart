import 'package:admin_task/admin-feature/Controller/Models/catalog_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/list-user-catalog-screen.dart';

class MyTable extends StatelessWidget {
  MyTable({required this.model});
  List<Catalogs> model;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          color: Colors.white,
          elevation: 12,
          borderRadius: BorderRadiusDirectional.circular(20.0),
          child: DataTable(
              headingRowHeight: 50,
              border: TableBorder.all(
                style: BorderStyle.solid,
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                width: 2
              ),
              dataRowHeight: 80,
              dividerThickness: 0.0,
              columns: const [
                DataColumn(
                  label: Text(
                    'Name',
                    textAlign: TextAlign.center,
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Image',
                    textAlign: TextAlign.center,
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Weight',
                    textAlign: TextAlign.center,
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Platinum',
                    textAlign: TextAlign.center,
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Palladium',
                    textAlign: TextAlign.center,
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Rhodium',
                    textAlign: TextAlign.center,
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Brand',
                    textAlign: TextAlign.center,
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Product',
                    textAlign: TextAlign.center,
                  ),
                ),
                DataColumn(
                  label: Text(
                    'CatMenu',
                    textAlign: TextAlign.center,
                  ),
                ),
                DataColumn(
                  label: Padding(
                    padding: EdgeInsetsDirectional.only(start: 50),
                    child: Text(
                      'Action',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
              rows: model.map((model) {
                return DataRow(cells: [
                  DataCell(Text(model.name.toString())),
                  DataCell(
                    _buildCircleAvatar(
                      model.image == null
                          ? "https://tse2.mm.bing.net/th?id=OIP.z-bE3VGJQux72dFc4n6BhQHaFU&pid=Api&P=0&h=220"
                          : model.image is String
                              ? model.imageString.toString()
                              : model.image!.url.toString(),
                    ),
                  ),
                  DataCell(Text(model.weight.toString())),
                  DataCell(Text(model.pt.toString())),
                  DataCell(Text(model.pd.toString())),
                  DataCell(Text(model.rh.toString())),
                  DataCell(Text(model.brand.toString())),
                  DataCell(Text(model.product.toString())),
                  DataCell(Text(model.manufacturer.toString())),
                  DataCell(buildAction(context: context, model: model)),
                ]);
              }).toList()),
        ),
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
            ),
          )
          .toList(),
    );
  }

  Widget buildList(BuildContext context) {
    return ListView.builder(
      itemCount: 3, // Adjust the itemCount as needed
      itemBuilder: (BuildContext context, int index) {
        // Replace this with your data or use a data model
        List<dynamic> rowData = ['Item $index', 'Widget $index', 'Text $index'];

        // Use the _buildDataRow function to create a DataRow
        DataRow dataRow = _buildDataRow(rowData);

        // Wrap the DataRow in a DataTable to get the desired appearance
        return DataTable(
          columns: const [],
          rows: [dataRow],
        );
      },
    );
  }

  Widget _buildCircleAvatar(String image) {
    return CircleAvatar(
      backgroundColor: Colors.grey,
      radius: 20,
      backgroundImage: NetworkImage(image),
    );
  }
}
