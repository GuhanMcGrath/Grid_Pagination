import 'package:flutter/material.dart';
import 'package:grid_pagination/card.dart';
import 'package:grid_pagination/data/data.dart';
import 'package:grid_pagination/data/datamodel.dart';

class NormalGrid extends StatefulWidget {
  NormalGrid();

  @override
  _NormalGridState createState() => _NormalGridState();
}

class _NormalGridState extends State<NormalGrid> {
  final ScrollController _scrollController = ScrollController();
  bool loading = false;
  bool loaded = false;
  List<DataModel> items = [];
  getData(total, start) async {
    var data = await GetData().getDetails(total, start);
    if (data == null) {
      loaded = true;
      setState(() {
        loading = false;
      });
      return;
    }
    items.addAll(data);
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getData(3, 0);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent &&
          !loading) {
        if (!loaded) {
          setState(() {
            loading = true;
          });
          getData(items.length + 3, items.length);
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Normal Grid"),
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (items.length == 0) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Stack(
                children: [
                  GridView.builder(
                      controller: _scrollController,
                      physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 2,
                        mainAxisExtent: 601,
                      ),
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card1(datas: items[index]);
                      }),
                  if (loading) ...[
                    Positioned(
                        left: MediaQuery.of(context).size.width / 2,
                        bottom: 0,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ))
                  ]
                ],
              );
            }
          },
        ));
  }
}
