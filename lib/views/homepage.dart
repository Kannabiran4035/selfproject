import 'package:drag_and_drop_lists/drag_and_drop_item.dart';
import 'package:drag_and_drop_lists/drag_and_drop_list.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:self_project/components/carosel1.dart';
import 'package:self_project/components/carosel2.dart';
import 'package:self_project/components/grid3.dart';
import 'package:self_project/components/productList.dart';
import 'package:self_project/components/providerExample.dart';
import 'package:self_project/views/firstScreen.dart';

import '../utils/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DragAndDropList>? _contents;

  List body = [Carousel0ne(), CarouselTwo(), GridComponent(), ListOfProducts()];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _contents = List.generate(
        body.length,
        (index) =>
            DragAndDropList(children: [DragAndDropItem(child: body[index])]));
  }

  @override
  Widget build(BuildContext context) {
    List image = [
      "assets/assassins_creed_3_2012_game-1920x1080 (2).jpg",
      "assets/assassins_creed_3_2012_game-1920x1080.jpg",
      "assets/assassins_creed_arno_dorian-3840x2160.jpg",
      "assets/assassins_creed_ii_hq-1920x1200.jpg",
      "assets/assassins_creed_iv_black_flag-1920x1080 (2).jpg",
      "assets/assassins_creed_iv_black_flag-1920x1080.jpg",
      "assets/assassins_creed_origins_4k_8k_game-7680x4320.jpg"
    ];

    return Scaffold(
        // floatingActionButton: FloatingActionButton(
        //     onPressed: () {
        //       context.read<SelectedProduct>().increment();
        //     },
        //     child: Icon(Icons.add)),
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          actions: [
            Text(
                context.watch<SelectedProduct>().productList.length.toString()),
            IconButton(onPressed: () {}, icon: Icon(Icons.card_travel_outlined))
          ],
          backgroundColor: Colors.teal,
          title: Text("Welcome..${context.watch<SelectedProduct>().count} "),
          bottomOpacity: 0.5,
        ),
        drawer: const AppDrawer(),
        // bottomNavigationBar: BottomNavigationBar(items: const []),
        body: DragAndDropLists(
          children: _contents!,
          onItemReorder: onReorderListItem,
          onListReorder: onReorderList,
          listDragHandle: buildDragHandle(isList: true),
          // itemDragHandle: buildDragHandle(),
        ));
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return FirstScreen();
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const curve = Curves.easeInCirc;

        const begin = Offset(10.0, 10);
        const end = Offset(0.0, 0.0);
        final tweens =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        final offSetAnimation = animation.drive(tweens);
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
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

  void onReorderList(
    int oldListIndex,
    int newListIndex,
  ) {
    setState(() {
      final movedList = _contents!.removeAt(oldListIndex);
      _contents!.insert(newListIndex, movedList);
    });
  }

  void onReorderListItem(
    int oldItemIndex,
    int oldListIndex,
    int newItemIndex,
    int newListIndex,
  ) {
    setState(() {
      final oldListItems = _contents![oldListIndex].children;
      final newListItems = _contents![newListIndex].children;

      final movedItem = oldListItems.removeAt(oldItemIndex);
      newListItems.insert(newItemIndex, movedItem);
    });
  }
}

// ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).push(_createRoute());
//               },
//               child: Text("Next Page")),
