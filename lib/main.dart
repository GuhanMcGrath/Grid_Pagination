import 'package:flutter/material.dart';
import 'package:grid_pagination/animatedGrid.dart';
import 'package:grid_pagination/draggablegrid.dart';
import 'package:grid_pagination/normalgrid.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ListButtons());
  }
}

class ListButtons extends StatefulWidget {
  const ListButtons({Key? key}) : super(key: key);

  @override
  _ListButtonsState createState() => _ListButtonsState();
}

class _ListButtonsState extends State<ListButtons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridButtons"),
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                title: "Normal Grid",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NormalGrid()));
                }),
            SizedBox(
              height: 20,
            ),
            Container(
                title: "Reordorable Grid",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DraggableGrid()));
                }),
            SizedBox(
              height: 20,
            ),
            Container(
                title: "Animated Grid",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AnimatedGrid()));
                }),
          ],
        ),
      )),
    );
  }
}

class Container extends StatelessWidget {
  String? title;
  Function? onTap;
  Container({@required this.title, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 250,
        height: 80,
        child: ElevatedButton(
            onPressed: () {
              onTap!();
            },
            child: Text(
              title!,
              style: TextStyle(fontSize: 25),
            )));
  }
}
