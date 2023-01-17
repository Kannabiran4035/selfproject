import 'dart:convert';

import 'package:advanced_datatable/advanced_datatable_source.dart';
import 'package:advanced_datatable/datatable.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:self_project/components/providerExample.dart';
import 'package:self_project/model/listofContent.dart';
import 'package:self_project/model/memberList.dart';
import 'package:self_project/model/memberModel.dart';
import 'package:self_project/model/productsModel.dart';
import 'package:self_project/views/firstScreen.dart';

import '../model/productList.dart';
import '../views/secondScreen.dart';

class ListOfProducts extends StatefulWidget {
  ListOfProducts({super.key});

  @override
  State<ListOfProducts> createState() => _ListOfProductsState();
}

class _ListOfProductsState extends State<ListOfProducts> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final _formKey = GlobalKey<FormBuilderState>();
  late Future<Welcome> getData;
  Future<Welcome> getproductDetails() async {
    var response = await http.get(Uri.parse("https://dummyjson.com/products"));
    print(response.statusCode);
    var parsed = Welcome.fromJson(jsonDecode(response.body));
    print(parsed.products.length);
    return parsed;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData = context.read<SelectedProduct>().getproductDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 900,
      child: FormBuilder(
        key: _formKey,
        child: Column(children: [
          DragTarget(
            builder: (context, candidateData, rejectedData) {
              return Container();
            },
            onWillAccept: (data) {
              return data == "button";
            },
            onAccept: (data) {},
          ),
          FormBuilderField<String>(
            name: "name",
            builder: (field) => TextFormField(
              decoration: InputDecoration(
                  helperText: "Enter the Mobile Number",
                  errorText: field.errorText != null
                      ? Text(field.errorText!).toString()
                      : null),
              onChanged: (value) {
                setState(() {
                  field.didChange(value);
                  print("$field, $value");
                });
              },
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'This field is required.';
                } else {
                  null;
                }
              },
            ),
          ),
          FormBuilderField<bool>(
            name: "name1",
            builder: (FormFieldState field) {
              return InputDecorator(
                decoration: InputDecoration(
                  labelText: 'Terms',
                  errorText: field.errorText,
                ),
                child: CheckboxListTile(
                  title: const Text('I Accept the terms and conditions'),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: false,
                  onChanged: (value) => field.didChange(value),
                ),
              );
            },
            validator: (value) {
              if (value != true) {
                return 'Accept terms and conditions to continue.';
              } else {
                null;
              }
              return null;
            },
          ),
          Draggable(
            feedback: pressButton(formKey: _formKey),
            data: "button",
            child: pressButton(formKey: _formKey),
            childWhenDragging: Text("please dont Leave me"),
            // axis: Axis.horizontal,
          ),
          AdvancedPaginatedDataTable(columns: [
            DataColumn(label: Text("Brand")),
            DataColumn(label: Text("Title")),
            DataColumn(label: Text("Category")),
            DataColumn(label: Text("Discount")),
            DataColumn(label: Text("Price")),
            DataColumn(label: Text("Ratings")),
            DataColumn(label: Text("InStock"))
          ], source: DataOfProduct()),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondScreen(),
                    ));
              },
              child: Text("next page"))
        ]),
      ),
    );
  }
}

class pressButton extends StatelessWidget {
  const pressButton({
    Key? key,
    required GlobalKey<FormBuilderState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormBuilderState> _formKey;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            print("object");
          }
        },
        child: Text("Press"));
  }
}

class DataOfProduct extends AdvancedDataTableSource<Product> {
  List<String> selectedIds = [];
  String lastSearchTerm = '';
  @override
  Future<RemoteDataSourceDetails<Product>> getNextPage(
      NextPageRequest pageRequest) async {
    // String token =
    //     "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJUZXN0MTIzIiwicm9sZXMiOlt7ImF1dGhvcml0eSI6IkFETUlOIn1dLCJleHAiOjE2NzM1MjY4NTIsImlhdCI6MTY3MzUwODg1Mn0.YeS9G809qjGQACkW_5JBSO8ppYHhJXkocAGq3EyDOS-qHCdGYc-pFup0GrHadksRZvFUzHrRwrTStVvI6ye3FA";
    // var response = await http.get(Uri.parse("http://31.187.75.223:8082/member"),
    //     headers: {"Authorization": "Bearer $token "});
    // var parsed = MemberPage.fromJson(jsonDecode(response.body));
    // print("printing${parsed.result!.member!.content.length}");
    // return RemoteDataSourceDetails(
    //   parsed.result!.member!.content.length,
    //   parsed.result!.member!.content,
    // );

    var response = await http.get(Uri.parse("https://dummyjson.com/products"));
    print(response.statusCode);
    var parsed = Welcome.fromJson(jsonDecode(response.body));
    print(parsed.products.length);
    return RemoteDataSourceDetails(
      parsed.products.length,
      parsed.products,
    );
  }

  void selectedRow(String id, bool newSelectState) {
    if (selectedIds.contains(id)) {
      selectedIds.remove(id);
    } else {
      selectedIds.add(id);
    }
    notifyListeners();
  }

  void filterServerSide(String filterQuery) {
    lastSearchTerm = filterQuery.toLowerCase().trim();
    setNextView();
  }

  @override
  DataRow? getRow(int index) {
    final result = lastDetails!.rows[index];
    return DataRow(cells: [
      DataCell(Text(result.id.toString())),
      DataCell(Text(result.title.toString())),
      DataCell(Text(result.brand.toString())),
      DataCell(Text(result.category.toString())),
      DataCell(Text(result.price.toString())),
      DataCell(Text(result.description.toString())),
      DataCell(Text(result.rating.toString())),
    ]);
  }

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => selectedIds.length;
}
