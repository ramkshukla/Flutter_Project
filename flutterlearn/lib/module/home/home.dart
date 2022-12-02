import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: const Key("Key"),
        automaticallyImplyLeading: true,
        leading: const Icon(
          Icons.account_circle_rounded,
          size: 50,
          color: Colors.deepOrange,
          semanticLabel: "Profile",
          textDirection: TextDirection.ltr,
          shadows: [
            Shadow(
              color: Colors.blue,
              offset: Offset(1.0, 1.0),
              blurRadius: 8.0,
            ),
          ],
        ),
        title: const Text(
          "RAMS HOME",
          style: TextStyle(fontStyle: FontStyle.normal),
        ),
        elevation: 8.0,
        shadowColor: Colors.black,
        // centerTitle: true,
        // titleSpacing: 40.0,
        leadingWidth: 500.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const Text("Click to change photo"),
          Image.asset(
            "assets/images/astro_moon.png",
            width: 400,
            height: 400,
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: const Text("Click"),
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => SnackBarApp()),
      //     );
      //   },
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
} 
// import 'package:flutter/material.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   bool _value = false;
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             IconButton(
//               tooltip: "Favourite",
//               isSelected: _value,
//               selectedIcon: const Icon(
//                 Icons.favorite,
//                 color: Colors.red,
//               ),
//               // focusColor: Colors.red.withOpacity(1),
//               style: const ButtonStyle(
//                   overlayColor: MaterialStatePropertyAll(Colors.redAccent)),
//               hoverColor: Colors.yellow,
//               // splashColor: Colors.black,
//               iconSize: 100,
//               onPressed: () {
//                 setState(() {
//                   _value = !_value;
//                 });
//               },

//               icon: const Icon(
//                 Icons.favorite_border,
//                 color: Colors.redAccent,
//               ),
//             ),
//             // Image.asset(
//             //   "assets/images/astro_moon.png",
//             //   height: 100,
//             //   width: 100,
//             // ),
//           ],
//         ),
//       ),
//       bottomSheet: Container(
//         margin: const EdgeInsets.all(50),
//         padding: const EdgeInsets.all(50),
//         decoration: BoxDecoration(
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.3),
//               blurRadius: 8.0,
//               spreadRadius: 8.0,
//             )
//           ],
//           color: Colors.red,
//           borderRadius: const BorderRadius.vertical(
//             top: Radius.circular(500),
//             bottom: Radius.circular(500),
//           ),
//         ),
//         height: 200,
//         width: double.infinity,
//         child: const Text(
//           "This is container",
//           style: TextStyle(
//             color: Colors.yellow,
//             fontSize: 20,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
