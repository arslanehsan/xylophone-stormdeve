// import 'dart:io';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// // import 'package:launch_review/launch_review.dart';
// import 'package:share/share.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:xylophone/Utils/Global.dart';
//
// class OptionsView extends StatefulWidget {
//   @override
//   _OptionsViewState createState() => _OptionsViewState();
// }
//
// class _OptionsViewState extends State<OptionsView> {
//   double rating = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Settings'),
//       ),
//       body: _bodyView(),
//     );
//   }
//
//   Widget _bodyView() {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       child: Column(
//         children: [
//           // GestureDetector(
//           //   onTap: () => {
//           //     Navigator.of(context).push(
//           //       MaterialPageRoute(
//           //         builder: (context) => HistoryView(),
//           //       ),
//           //     ),
//           //   },
//           //   child: _singleMenuItem(
//           //     titleImage: 'images/history.png',
//           //     label: 'History',
//           //   ),
//           // ),
//           GestureDetector(
//             onTap: () => showRateDialog(context),
//             child: _singleMenuItem(
//               titleImage: 'images/rate_us.png',
//               label: 'Rate Us',
//             ),
//           ),
//           GestureDetector(
//             onTap: () => {
//               if (Platform.isAndroid)
//                 {
//                   Share.share(
//                       'I recommended you this App  https://play.google.com/store/apps/details?id=$androidAppPackage',
//                       subject: 'BMI CALCULATOR!'),
//                 }
//               else if (Platform.isIOS)
//                 {
//                   Share.share(
//                       'I recommended you this App  https://apps.apple.com/us/app/my-age-birthday-counter/id$appleAppId',
//                       subject: 'BMI CALCULATOR!'),
//                 }
//             },
//             child: _singleMenuItem(
//               titleImage: 'images/share.png',
//               label: 'Share',
//             ),
//           ),
//           GestureDetector(
//             onTap: () => launch(Uri(
//               scheme: 'mailto',
//               path: supportEmail,
//               queryParameters: {'subject': 'Feed Back About Age Calculator'},
//             ).toString()),
//             child: _singleMenuItem(
//               titleImage: 'images/feedback.png',
//               label: 'Feedback',
//             ),
//           ),
//           // GestureDetector(
//           //   onTap: () => showNormalToast('About'),
//           //   child: _singleMenuItem(
//           //     titleImage: 'images/about.png',
//           //     label: 'About',
//           //   ),
//           // ),
//           // GestureDetector(
//           //   onTap: () => {launchURL(appleDeveloperID)},
//           //   child: _singleMenuItem(
//           //     titleImage: 'images/more_apps.png',
//           //     label: 'More Apps',
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
//
//   Widget _singleMenuItem({required String titleImage, required String label}) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 10),
//       child: Row(
//         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Container(
//             padding: const EdgeInsets.symmetric(vertical: 15),
//             decoration: const BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(15),
//                 bottomLeft: Radius.circular(15),
//               ),
//               color: Colors.white,
//             ),
//             child: Image.asset(
//               titleImage,
//               height: 26,
//             ),
//           ),
//           const SizedBox(
//             width: 10,
//           ),
//           Container(
//             padding: const EdgeInsets.symmetric(vertical: 18),
//             decoration: const BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(15),
//                 bottomRight: Radius.circular(15),
//               ),
//               color: Colors.white,
//             ),
//             child: Center(
//               child: Text(
//                 label,
//                 style: TextStyle(fontSize: 18),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   showRateDialog(BuildContext context) {
//     // set up the buttons
// //    Widget cancelButton = FlatButton(
// //      child: Text("Cancel"),
// //      onPressed: () {
// //        Navigator.pop(context);
// //      },
// //    );
// //    Widget continueButton = FlatButton(
// //      child: Text("Continue"),
// //      onPressed: () {
// //        Navigator.pop(context);
// //      },
// //    );
//
//     // set up the AlertDialog
//     AlertDialog alert = AlertDialog(
//       title: Text("Rate My App"),
//       backgroundColor: Colors.white,
//       content: StarRating(
//         rating: rating,
//         onRatingChanged: (rating) => {
//           setState(() => rating = rating),
//           if (rating > 3)
//             {
//               print('3'),
//               // LaunchReview.launch(
//               //   androidAppId: androidAppPackage,
//               //   iOSAppId: appleAppId,
//               // ),
//               Navigator.pop(context),
//             }
//           else
//             {
//               launch(Uri(
//                 scheme: 'mailto',
//                 path: supportEmail,
//                 queryParameters: {'subject': 'Rate Your Qr Scan Application'},
//               ).toString()),
//               Navigator.pop(context),
//             },
//         },
//       ),
// //      actions: [
// //        cancelButton,
// //        continueButton,
// //      ],
//     );
//
//     // show the dialog
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       },
//     );
//   }
// }
//
// typedef void RatingChangeCallback(double rating);
//
// class StarRating extends StatelessWidget {
//   final int starCount;
//   final double rating;
//   final RatingChangeCallback onRatingChanged;
//
//   StarRating({
//     this.starCount = 5,
//     this.rating = .0,
//     required this.onRatingChanged,
//   });
//
//   Widget buildStar(BuildContext context, int index) {
//     Icon icon;
//     if (index >= rating) {
//       icon = Icon(
//         Icons.star_border,
//         size: 35,
//         color: Theme.of(context).buttonColor,
//       );
//     } else if (index > rating - 1 && index < rating) {
//       icon = Icon(
//         Icons.star_half,
//         size: 35,
//         color: Theme.of(context).primaryColor,
//       );
//     } else {
//       icon = Icon(
//         Icons.star,
//         size: 35,
//         color: Theme.of(context).primaryColor,
//       );
//     }
//     return InkResponse(
//       onTap:
//           onRatingChanged == null ? null : () => onRatingChanged(index + 1.0),
//       child: icon,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children:
//             List.generate(starCount, (index) => buildStar(context, index)));
//   }
// }
