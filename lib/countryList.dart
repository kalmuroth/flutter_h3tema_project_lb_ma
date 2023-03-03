import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_h3tema_project_lb_ma/country.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter_h3tema_project_lb_ma/map_page.dart';

class countryList extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Select Country')),
        body: FutureBuilder(
          future: ReadJsonData(),
          builder: (context, data) {
            if (data.hasError) {
              return Center(child: Text("${data.error}"));
            } else if (data.hasData) {
              var items = data.data as List<Country>;
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 400,
                    childAspectRatio: 5 / 2,
                  ),
                  itemCount: items == null ? 0 : items.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => (_navigateToNextScreen(
                          context, items[index].capital.toString())),
                      child: Card(
                        elevation: 5,
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 106,
                                height: 71,
                                child: Image(
                                  image: NetworkImage(
                                      items[index].flags.png.toString()),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                padding: EdgeInsets.only(bottom: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 8, right: 8),
                                      child: Text(
                                        (items[index]
                                            .capital
                                            .toString()
                                            .replaceAll(
                                                new RegExp(r'[^\w\s]+'), '')),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 8, right: 8),
                                      child: Text(
                                          (items[index]
                                                  .name
                                                  .common
                                                  .toString()
                                                  .replaceAll(
                                                      new RegExp(r'[^\w\s]+'),
                                                      '') +
                                              " - " +
                                              items[index]
                                                  .subregion
                                                  .toString()
                                                  .replaceAll(
                                                      new RegExp(r'[^\w\s]+'),
                                                      '')),
                                          style: TextStyle(
                                              color: Colors.grey[400])),
                                    )
                                  ],
                                ),
                              ))
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }

  void _navigateToNextScreen(BuildContext context, countryItem) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MapPage(
            countryName: countryItem.replaceAll(new RegExp(r'[^\w\s]+'), ''))));
  }

  Future<List<Country>> ReadJsonData() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('assets/allCountry.json');
    final list = json.decode(jsondata) as List<dynamic>;

    return countryFromJson(jsondata);
  }
}
