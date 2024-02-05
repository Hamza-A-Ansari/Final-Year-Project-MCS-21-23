import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

// import this to be able to call json.decode()
import 'dart:convert';

// import this to easily send HTTP request
import 'package:http/http.dart' as http;
import 'package:p1/utils/framedisplay2.dart';


class SunGlasses extends StatelessWidget {
  const SunGlasses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // this function is called when the app launches
  Future<List> _loadData() async {
    List posts = [];
    try {
      // This is an open REST API endpoint for testing purposes
      const apiUrl = 'http://127.0.0.1:5000/sun';

      final http.Response response = await http.get(Uri.parse(apiUrl));
      posts = json.decode(response.body);
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }

    return posts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sun Glasses'),
        ),
        // implement FutureBuilder
        body:
        
         FutureBuilder(
            future: _loadData(),
            builder: (BuildContext ctx, AsyncSnapshot<List> snapshot) =>
                snapshot.hasData
                    ? GridView.builder(
  scrollDirection: Axis.vertical,
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 6, // number of columns
    crossAxisSpacing: 20, // spacing between columns
    mainAxisSpacing: 20,
    childAspectRatio: 2/3
     // spacing between rows
  ),
  itemCount: snapshot.data!.length,
  itemBuilder: (BuildContext context, index) {
    return ProductDisplay2(
      abc: Uri.parse(snapshot.data![index]['url']), 
      imgAddress: snapshot.data![index]['address'], 
      price: snapshot.data![index]['price'].toString(), 
      title: snapshot.data![index]['name'], 
      color: Colors.blue, 
      color1: Colors.white, 
      color2: Colors.blue, availableColors: snapshot.data![index]['color'],
      );
    
    
    //  GridTile(
    //   child: Card(
    //     margin: const EdgeInsets.all(10),
    //     child: ListTile(
    //       contentPadding: const EdgeInsets.all(10),
    //       title: Text(snapshot.data![index]['address']),
    //       subtitle: Text(snapshot.data![index]['color']),
    //     ),
    //   ),
    // );
  },
)

                    : const Center(
                      // render the loading indicator
                        child: CircularProgressIndicator(),
                      )));
  }
}