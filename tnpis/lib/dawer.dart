// // import 'main.dart';
// // import 'package:flutter/material.dart';
// //
// // class Dawer_app extends StatelessWidget {
// //   const Dawer_app({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('PIC'),
// //         flexibleSpace: Container(
// //           decoration: BoxDecoration(
// //             gradient: LinearGradient(
// //               begin: Alignment.topCenter,
// //               end: Alignment.bottomCenter,
// //               stops: [0.0, 1.0],
// //               colors: [Color(0xffB7F3F7), Color(0xff0820F7)],
// //             ),
// //           ),
// //         ),
// //         // leading: Padding(
// //         //   padding: const EdgeInsets.all(1.0),
// //         //   child: Image.asset('assets/images/emblem-light.jpg'),
// //         // ),
// //         // actions: <Widget>[
// //         //   Padding(
// //         //     padding: const EdgeInsets.all(1.0),
// //         //     child: Image.asset('assets/images/Digital_India_logo.svg.png'),
// //         //   )
// //         // ],
// //       ),
// //       drawer: Drawer(
// //         elevation: 16.0,
// //         child: SafeArea(
// //           child: Column(
// //             children: <Widget>[
// //               Container(
// //                 padding: EdgeInsets.all(16.0),
// //                 width: double.infinity,
// //                 decoration: BoxDecoration(
// //                     gradient: LinearGradient(
// //                   begin: Alignment.topCenter,
// //                   end: Alignment.bottomCenter,
// //                   stops: [0.0, 1.0],
// //                   colors: [Color(0xffB7F3F7), Color(0xff0820F7)],
// //                 )),
// //                 child: Text(
// //                   'Info',
// //                   style: TextStyle(
// //                     color: Colors.white,
// //                     fontWeight: FontWeight.bold,
// //                   ),
// //                 ),
// //               ),
// //               ListTile(
// //                 title: Text('xxxx'),
// //               ),
// //               Divider(height: 0.1),
// //               ListTile(
// //                 title: Text('xxxx'),
// //               ),
// //               Divider(height: 0.1),
// //               ListTile(
// //                 title: Text('xxxx'),
// //               ),
// //               Divider(height: 0.1),
// //               ListTile(
// //                 title: Text('xxxx'),
// //               ),
// //               Divider(height: 0.1),
// //               ListTile(
// //                 title: Text('xxxx'),
// //               ),
// //               Divider(height: 0.1),
// //             ],
// //           ),
// //         ),
// //       ),
// //       body: SafeArea(
// //         // child: ListView(
// //         //   children: [
// //         //     Row(
// //         //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         //       children: [
// //         //         Padding(padding: EdgeInsets.symmetric(horizontal: edge),
// //         //           child: Row(
// //         //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         //             children: [
// //         //               SubjectItem(
// //         //                 name: ''
// //         //               )
// //         //             ],
// //         //           ),
// //         //         )
// //         //       ],
// //         //     )
// //         //   ],
// //         // ),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             ElevatedButton.icon(
// //               style: ElevatedButton.styleFrom(
// //                 foregroundColor: Colors.white,
// //                 backgroundColor: Colors.blue,
// //                 padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
// //               ),
// //               onPressed: () {},
// //               icon: Icon(Icons.info_outline_rounded),
// //               label: Text("Details of the case"),
// //             ),
// //             SizedBox(height: 16),
// //             ElevatedButton.icon(
// //               style: ElevatedButton.styleFrom(
// //                 foregroundColor: Colors.white,
// //                 backgroundColor: Colors.blue,
// //                 padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
// //               ),
// //               onPressed: () {},
// //               icon: Icon(Icons.account_balance_outlined),
// //               label: Text('Status of the case'),
// //             ),
// //             SizedBox(height: 16),
// //             ElevatedButton.icon(
// //               style: ElevatedButton.styleFrom(
// //                 foregroundColor: Colors.white,
// //                 backgroundColor: Colors.blue,
// //                 padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
// //               ),
// //               onPressed: () {},
// //               icon: Icon(Icons.info_outline),
// //               label: Text('Family pensioners details'),
// //             ),
// //             SizedBox(height: 16),
// //             ElevatedButton.icon(
// //               style: ElevatedButton.styleFrom(
// //                 foregroundColor: Colors.white,
// //                 backgroundColor: Colors.blue,
// //                 padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
// //               ),
// //               onPressed: () {},
// //               icon: Icon(Icons.account_box),
// //               label: Text('Nomination details'),
// //             ),
// //             SizedBox(height: 16),
// //             ElevatedButton.icon(
// //               style: ElevatedButton.styleFrom(
// //                 foregroundColor: Colors.white,
// //                 backgroundColor: Colors.blue,
// //                 padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
// //               ),
// //               onPressed: () {},
// //               icon: Icon(Icons.feedback_outlined),
// //               label: Text('Send feedback'),
// //             ),
// //             SizedBox(height: 16),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }*************************************************************************************************************************
// import 'main.dart';
// import 'package:flutter/material.dart';
//
// class Dawer_app extends StatelessWidget {
//   const Dawer_app({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('PIC'),
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               stops: [0.0, 1.0],
//               colors: [Color(0xffB7F3F7), Color(0xff0820F7)],
//             ),
//           ),
//         ),
//       ),
//       drawer: Drawer(
//         elevation: 16.0,
//         child: SafeArea(
//           child: Column(
//             children: <Widget>[
//               Container(
//                 padding: EdgeInsets.all(16.0),
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   stops: [0.0, 1.0],
//                   colors: [Color(0xffB7F3F7), Color(0xff0820F7)],
//                 )),
//                 child: Text(
//                   'Info',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               ListTile(
//                 title: Text('xxxx'),
//               ),
//               Divider(height: 0.1),
//               ListTile(
//                 title: Text('xxxx'),
//               ),
//               Divider(height: 0.1),
//               ListTile(
//                 title: Text('xxxx'),
//               ),
//               Divider(height: 0.1),
//               ListTile(
//                 title: Text('xxxx'),
//               ),
//               Divider(height: 0.1),
//               ListTile(
//                 title: Text('xxxx'),
//               ),
//               Divider(height: 0.1),
//             ],
//           ),
//         ),
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: TextField(
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Enter your name',
//                 ),
//               ),
//             ),
//             Expanded(
//               child: GridView.count(
//                 padding: EdgeInsets.all(16),
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 16,
//                 mainAxisSpacing: 16,
//                 children: [
//                   buildBoxItem('Details of the case',
//                       Icons.info_outline_rounded, Colors.blue, () {}),
//                   buildBoxItem('Status of the case',
//                       Icons.account_balance_outlined, Colors.blue, () {}),
//                   buildBoxItem('Family pensioners details', Icons.info_outline,
//                       Colors.blue, () {}),
//                   buildBoxItem('Nomination details', Icons.account_box,
//                       Colors.blue, () {}),
//                   buildBoxItem('Send feedback', Icons.feedback_outlined,
//                       Colors.blue, () {}),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildBoxItem(
//       String title, IconData icon, Color color, VoidCallback onTap) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           color: color,
//           borderRadius: BorderRadius.circular(8),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black12,
//               blurRadius: 4,
//               offset: Offset(2, 2),
//             ),
//           ],
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, color: Colors.white, size: 40),
//             SizedBox(height: 8),
//             Text(
//               title,
//               style:
//                   TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// **************************************
import 'package:flutter/material.dart';

class Dawer_app extends StatelessWidget {
  const Dawer_app({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PIC'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 1.0],
              colors: [Color(0xffFFC107), Color(0xffE65100)],
            ),
          ),
        ),
      ),
      drawer: Drawer(
        elevation: 16.0,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.0, 1.0],
                    colors: [Color(0xffFFC107), Color(0xffE65100)],
                  ),
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16),
              ListTile(
                title: Text('Details of the case',
                    style: TextStyle(color: Colors.deepPurple)),
              ),
              Divider(height: 0),
              ListTile(
                title: Text('Status of the case',
                    style: TextStyle(color: Colors.deepPurple)),
              ),
              Divider(height: 0),
              ListTile(
                title: Text('Family pensioners details',
                    style: TextStyle(color: Colors.deepPurple)),
              ),
              Divider(height: 0),
              ListTile(
                title: Text('Nomination details',
                    style: TextStyle(color: Colors.deepPurple)),
              ),
              Divider(height: 0),
              ListTile(
                title: Text('Send feedback',
                    style: TextStyle(color: Colors.deepPurple)),
              ),
              Divider(height: 0),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your name',
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                padding: EdgeInsets.all(16),
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  buildBoxItem('Details of the case',
                      Icons.info_outline_rounded, Colors.teal, () {}),
                  buildBoxItem('Status of the case',
                      Icons.account_balance_outlined, Colors.indigo, () {}),
                  buildBoxItem('Family pensioners details', Icons.info_outline,
                      Colors.deepOrange, () {}),
                  buildBoxItem('Nomination details', Icons.account_box,
                      Colors.pink, () {}),
                  buildBoxItem('Send feedback', Icons.feedback_outlined,
                      Colors.green, () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoxItem(
      String title, IconData icon, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 40),
            SizedBox(height: 8),
            Text(
              title,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
