// import 'dart:async';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:eco_market/core/resources/resources.dart';
// import 'package:flutter/material.dart';

// class NetworkWrapper extends StatefulWidget {
//   final Widget child;
//   final bool? isFirstLaunch;

//   const NetworkWrapper({
//     super.key,
//     required this.child,
//     this.isFirstLaunch = false,
//   });

//   @override
//   State<NetworkWrapper> createState() => _NetworkWrapperState();
// }

// class _NetworkWrapperState extends State<NetworkWrapper> {
//   StreamSubscription<ConnectivityResult>? subscription;
//   bool hasInternetConnection = true;

//   @override
//   void initState() {
//     super.initState();
//     checkInternetConnection();
//   }

//   @override
//   void dispose() {
//     subscription?.cancel();
//     super.dispose();
//   }

//   Future<void> checkInternetConnection() async {
//     subscription = Connectivity()
//         .onConnectivityChanged
//         .listen((ConnectivityResult result) {
//       if (result == ConnectivityResult.none) {
//         setState(() {
//           hasInternetConnection = false;
//         });
//       } else {
//         setState(() {
//           hasInternetConnection = true;
//         });
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return hasInternetConnection ? widget.child : const NoConnecctionPage();
//   }

//   Future<void> _dialogBuilder(BuildContext context) {
//     return showDialog<void>(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Basic dialog title'),
//           content: const Text(
//             'A dialog is a type of modal window that\n'
//             'appears in front of app content to\n'
//             'provide critical information, or prompt\n'
//             'for a decision to be made.',
//           ),
//           actions: <Widget>[
//             TextButton(
//               style: TextButton.styleFrom(
//                 textStyle: Theme.of(context).textTheme.labelLarge,
//               ),
//               child: const Text('Disable'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             TextButton(
//               style: TextButton.styleFrom(
//                 textStyle: Theme.of(context).textTheme.labelLarge,
//               ),
//               child: const Text('Enable'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
