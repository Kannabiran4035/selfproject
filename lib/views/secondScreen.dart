import 'dart:convert';

import 'package:drag_and_drop_lists/drag_and_drop_item.dart';
import 'package:drag_and_drop_lists/drag_and_drop_list.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/src/widgets/framework.dart';

import '../model/data.dart';
import '../model/modaldata.dart';
import '../model/productsModel.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  late List<DragAndDropList> lists;

  @override
  void initState() {
    super.initState();

    lists = allLists.map(buildList).toList();
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Color.fromARGB(255, 243, 242, 248);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: DragAndDropLists(
        // lastItemTargetHeight: 50,
        // addLastItemTargetHeightToTop: true,
        // lastListTargetSize: 30,
        listPadding: EdgeInsets.all(16),
        listInnerDecoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.circular(10),
        ),
        children: lists,
        itemDivider: Divider(thickness: 2, height: 2, color: backgroundColor),
        itemDecorationWhileDragging: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        listDragHandle: buildDragHandle(isList: true),
        itemDragHandle: buildDragHandle(),
        onItemReorder: onReorderListItem,
        onListReorder: onReorderList,
      ),
    );
  }

  DragHandle buildDragHandle({bool isList = false}) {
    final verticalAlignment = isList
        ? DragHandleVerticalAlignment.top
        : DragHandleVerticalAlignment.center;
    final color = isList ? Colors.blueGrey : Colors.black26;

    return DragHandle(
      verticalAlignment: verticalAlignment,
      child: Container(
        padding: EdgeInsets.only(right: 10),
        child: Icon(Icons.menu, color: color),
      ),
    );
  }

  DragAndDropList buildList(DraggableList list) => DragAndDropList(
        header: Container(
          color: Colors.red,
          padding: EdgeInsets.all(8),
          child: Text(
            list.header,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        children: list.items
            .map((item) => DragAndDropItem(
                  child: ListTile(
                    leading: Image.network(
                      item.urlImage,
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                    title: Text(item.title),
                  ),
                ))
            .toList(),
      );

  void onReorderListItem(
    int oldItemIndex,
    int oldListIndex,
    int newItemIndex,
    int newListIndex,
  ) {
    setState(() {
      final oldListItems = lists[oldListIndex].children;
      final newListItems = lists[newListIndex].children;

      final movedItem = oldListItems.removeAt(oldItemIndex);
      newListItems.insert(newItemIndex, movedItem);
    });
  }

  void onReorderList(
    int oldListIndex,
    int newListIndex,
  ) {
    setState(() {
      final movedList = lists.removeAt(oldListIndex);
      lists.insert(newListIndex, movedList);
    });
  }
}
