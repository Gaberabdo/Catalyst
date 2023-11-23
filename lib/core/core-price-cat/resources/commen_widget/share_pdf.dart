import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import 'package:http/http.dart' as http;
import '../../models/my_list_model.dart';

// Future<Uint8List> loadImageFromUrl(String imageUrl) async {
//   final http.Response response = await http.get(Uri.parse(imageUrl));
//   if (response.statusCode == 200) {
//     return response.bodyBytes;
//   } else {
//     throw Exception('Failed to load image from $imageUrl');
//   }
// }
// List<Uint8List>allImage=[];
// Future<void> downloadImage({required Lists model})async {
//   allImage=[];
//   model.listOfItems?.forEach((element) async {
//     final Uint8List imageData = await loadImageFromUrl(element.iId?.image?.url??'https://www.nfet.net/nfet.jpg');
//     print(imageData);
//     allImage.add(imageData);
//   });
//   print(7777777);
// }
Future<void> generatePdf(
  context, {
  required Lists model,
}) async {
  //print(allImage.length);
  final pdf = Document();
  final font =
      Font.ttf(await (rootBundle.load('assets/font/Hacen Tunisia.ttf')));
  pdf.addPage(
    MultiPage(
      pageFormat: PdfPageFormat.a4,
      theme: ThemeData.withFont(
        base: font,
      ),
      build: (context) {
        return [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(model.listName.toString(),
                  style: const TextStyle(
                    color: PdfColors.black,
                    fontSize: 22,
                  )),
              SizedBox(height: 20),
              Text(model.createdAt.toString(),
                  style: const TextStyle(
                    color: PdfColors.amber,
                    fontSize: 18,
                  )),
              SizedBox(height: 20),
              ListView.separated(
                itemBuilder: (context, index) {
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Link(
                            child: Text(
                                model.listOfItems?[index].iId?.image?.url ??
                                    'https://www.nfet.net/nfet.jpg',
                                style: const TextStyle(
                                  color: PdfColors.blue,
                                  fontSize: 16,
                                )),
                            destination:
                                model.listOfItems?[index].iId?.image?.url ??
                                    'https://www.nfet.net/nfet.jpg'),
                        SizedBox(height: 20),
                        Column(children: [
                          Text('Name:  ${model.listOfItems?[index].iId?.name}',
                              style: const TextStyle(
                                color: PdfColors.amber,
                                fontSize: 16,
                              )),
                          SizedBox(height: 20),
                          Text(
                              'Price:  ${model.listOfItems?[index].iId?.price}',
                              style: const TextStyle(
                                color: PdfColors.black,
                                fontSize: 16,
                              )),
                          SizedBox(height: 20),
                          Text(
                              'quantity:  ${model.listOfItems?[index].quantity}',
                              style: const TextStyle(
                                color: PdfColors.black,
                                fontSize: 16,
                              )),
                        ])
                      ]);
                },
                separatorBuilder: (context, index) => SizedBox(height: 20),
                itemCount: model.listOfItems!.length,
              ),
            ],
          )
        ];
      },
    ),
  );

  await Printing.sharePdf(bytes: await pdf.save(), filename: 'my-document.pdf');
  // await Printing.layoutPdf(
  //     onLayout: (PdfPageFormat format) async => pdf.save());
}
