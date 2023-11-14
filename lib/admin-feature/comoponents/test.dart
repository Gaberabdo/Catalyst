// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('ListView with Pinned Column'),
//         ),
//         body: MyListView(),
//       ),
//     );
//   }
// }
//
// class MyListView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return CustomScrollView(
//       slivers: [
//         SliverToBoxAdapter(
//           child: Container(
//             margin: const EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12),
//               border: Border.all(
//                 color: Colors.white,
//                 width: 1,
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   offset: Offset(0, 0),
//                   blurRadius: 10,
//                   spreadRadius: 0,
//                   color: Colors.grey.shade100,
//                 ),
//               ],
//             ),
//             child: DataTable(
//               headingRowHeight: 50,
//               dataRowHeight: 101,
//               dividerThickness: 0,
//               columns: [
//                 DataColumn(
//                   label: Container(
//                     width: 96,
//                     child: Center(
//                       child: Text('Name'), // Pinned Column
//                     ),
//                   ),
//                 ),
//                 DataColumn(
//                   label: Container(
//                     width: 96,
//                     child: Center(
//                       child: Text('Image'),
//                     ),
//                   ),
//                 ),
//                 // Add other DataColumn widgets for each column
//                 // ...
//                 DataColumn(
//                   label: Container(
//                     width: 96,
//                     child: Center(
//                       child: Text('Action'),
//                     ),
//                   ),
//                 ),
//               ],
//               rows: [
//                 _buildDataRow([
//                   'Name 1',
//                   'Image 1',
//                   'Other Data 1',
//                   buildAction(),
//                 ]),
//                 _buildDataRow([
//                   'Name 2',
//                   'Image 2',
//                   'Other Data 2',
//                   buildAction(),
//                 ]),
//                 // Add more rows as needed
//               ],
//             ),
//           ),
//         ),
//         SliverList(
//           delegate: SliverChildBuilderDelegate(
//             (BuildContext context, int index) {
//               // Replace this with your data or use a data model
//               List<dynamic> rowData = [
//                 'Item $index',
//                 'Widget $index',
//                 'Text $index'
//               ];
//
//               // Use the _buildDataRow function to create a DataRow
//               DataRow dataRow = _buildDataRow(rowData);
//
//               // Return the DataRow
//               return Container(
//                 margin: const EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   border: Border.all(
//                     color: Colors.white,
//                     width: 1,
//                   ),
//                   boxShadow: [
//                     BoxShadow(
//                       offset: Offset(0, 0),
//                       blurRadius: 10,
//                       spreadRadius: 0,
//                       color: Colors.grey.shade100,
//                     ),
//                   ],
//                 ),
//                 child: dataRow,
//               );
//             },
//             childCount: 10, // Adjust the itemCount as needed
//           ),
//         ),
//       ],
//     );
//   }
//
//   DataRow _buildDataRow(List<dynamic> data) {
//     return DataRow(
//       cells: data
//           .map(
//             (cellData) => DataCell(
//               Container(
//                 width: 96,
//                 child: Center(
//                   child:
//                       cellData is Widget ? cellData : Text(cellData.toString()),
//                 ),
//               ),
//               onTap: () {
//                 // Handle cell tap
//                 print('Cell tapped: $cellData');
//               },
//             ),
//           )
//           .toList(),
//     );
//   }
//
//   // Replace this with your actual implementation for building the action widget
//   Widget buildAction() {
//     return IconButton(
//       icon: Icon(Icons.edit),
//       onPressed: () {
//         // Handle action tap
//         print('Action tapped');
//       },
//     );
//   }
// }
