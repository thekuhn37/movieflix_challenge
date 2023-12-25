import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String type, thumb;
  final int id;

  const DetailScreen({
    super.key,
    required this.type,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Set the color to transparent
        elevation: 0,
        // backgroundColor: Colors.white.withOpacity(0),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            thumb,
            fit: BoxFit.cover,
          ),
          const Column(
            children: [
              SizedBox(height: kToolbarHeight),
              Expanded(
                child: Center(
                  child: Text('Hello'),
                ),
              ),
            ],
          ), // Your other content goes here
        ],
      ),

      // Container(
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(15),
      //   ),
      //   clipBehavior: Clip.hardEdge,
      //   child: Image.network(
      //     thumb,
      //   ),
      // ),
    );
  }
}

// import 'package:flutter/material.dart';

// class DetailScreen extends StatelessWidget {
//   final String type, thumb;
//   final int id;

//   const DetailScreen({
//     super.key,
//     required this.type,
//     required this.thumb,
//     required this.id,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           // Background Image
//           Image.network(
//             thumb,
//             fit: BoxFit.cover,
//           ),
//           // Content
//           const SafeArea(
//             child: Column(
//               children: [
//                 // Your other content goes here
//                 Expanded(
//                   child: Center(
//                     child: Text(
//                       'Hello',
//                       style: TextStyle(fontSize: 24, color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
