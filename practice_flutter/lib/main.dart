// // void main() {
// //   // runApp(statelessapp());
// //   runApp(statefulapp());
// // }
//
// // class statelessapp extends StatelessWidget {
// //   const statelessapp({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Text('this is called statelss widget'),
// //     );
// //   }
// // }
// //
// // class statefulapp extends StatefulWidget {
// //   const statefulapp({super.key});
// //
// //   @override
// //   State<statefulapp> createState() => _statefulappState();
// // }
// //
// // class _statefulappState extends State<statefulapp> {
// //   String value = ' na tha da state';
// //
// //   void OnChange() {
// //     setState(() {
// //       value = 'ethu epadi irruku';
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Column(
// //         children: <Widget>[
// //           SafeArea(child: Text('$value')),
// //           FloatingActionButton(child: Icon(Icons.add), onPressed: OnChange)
// //         ],
// //       ),
// //     );
// //   }
// // }
//
// import 'package:flutter/material.dart';
// import 'splash.dart'; // Import the splash screen
//
// void main() => runApp(MaterialApp(
//       home: SplashScreen(), // Set SplashScreen as the home
//     ));
//
// class FirstApp extends StatefulWidget {
//   @override
//   State<FirstApp> createState() => FirstAppState();
// }
//
// class FirstAppState extends State<FirstApp> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // leading: IconButton(
//         //   icon: Icon(Icons.menu),
//         //   onPressed: () {
//         //     print('icon is done');
//         //   },
//         // ),
//         title: Text(
//           'hello',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.black,
//         actions: <Widget>[
//           IconButton(onPressed: () {}, icon: Icon(Icons.search)),
//           IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
//         ],
//       ),
//       drawer: Drawer(
//         elevation: 16.0,
//         child: SafeArea(
//           child: Column(
//             children: <Widget>[
//               Container(
//                 padding: EdgeInsets.all(16.0),
//                 width: double.infinity,
//                 color: Colors.black,
//                 child: Text(
//                   'menu',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               ListTile(
//                 title: Text("about"),
//               ),
//               Divider(
//                 height: 0.1,
//               ),
//               ListTile(
//                 title: Text("resume"),
//               ),
//               Divider(
//                 height: 0.1,
//               ),
//               ListTile(
//                 title: Text("projects"),
//               ),
//               Divider(
//                 height: 0.1,
//               ),
//               ListTile(
//                 title: Text("contact details"),
//               ),
//               Divider(
//                 height: 0.1,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

void main() => runApp(DrawerApp());

class DrawerApp extends StatelessWidget {
  const DrawerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('PIC'),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 1.0],
                colors: [Color(0xffB7F3F7), Color(0xff0820F7)],
              ),
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context)
                  .openDrawer(); // Open drawer when menu icon is clicked
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Handle search action
              },
            ),
          ],
        ),
        drawer: Drawer(
          elevation: 16.0,
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(16.0),
                  width: double.infinity,
                  color: Colors.black,
                  child: Text(
                    'Menu',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                ListTile(
                  title: Text("About"),
                  onTap: () {
                    // Handle 'About' menu item tap
                    Navigator.pop(context); // Close the drawer
                  },
                ),
                Divider(
                  height: 0.1,
                ),
                ListTile(
                  title: Text("Resume"),
                  onTap: () {
                    // Handle 'Resume' menu item tap
                    Navigator.pop(context); // Close the drawer
                  },
                ),
                Divider(
                  height: 0.1,
                ),
                ListTile(
                  title: Text("Projects"),
                  onTap: () {
                    // Handle 'Projects' menu item tap
                    Navigator.pop(context); // Close the drawer
                  },
                ),
                Divider(
                  height: 0.1,
                ),
                ListTile(
                  title: Text("Contact Details"),
                  onTap: () {
                    // Handle 'Contact Details' menu item tap
                    Navigator.pop(context); // Close the drawer
                  },
                ),
                Divider(
                  height: 0.1,
                ),
              ],
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                ),
                onPressed: () {
                  // Navigate or perform action for 'Details of the case'
                },
                icon: Icon(Icons.account_circle),
                label: Text('Details of the case'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                ),
                onPressed: () {
                  // Navigate or perform action for 'Status of the case'
                },
                child: Text('Status of the case'),
              ),
              SizedBox(height: 16),
              // Add more buttons as needed
            ],
          ),
        ),
      ),
    );
  }
}
