// import 'package:flutter/material.dart';
//
// class AppButton extends StatefulWidget {
//   AppButton(
//       {Key? key,
//       required this.title,
//       required this.titleColor,
//       this.titleFontSize = 16.0,
//       this.paddingHorizontal = 28.0,
//       this.paddingVertical = 8.0,
//       required this.buttonBackgroundColor,
//       required this.buttonBorderColor,
//       required this.onPressed})
//       : super(key: key);
//   final String title;
//   final Color titleColor;
//   final double titleFontSize;
//   final double paddingVertical;
//   final double paddingHorizontal;
//   final Color buttonBackgroundColor;
//   final Color buttonBorderColor;
//   void Function() onPressed;
//
//   @override
//   State<AppButton> createState() => _AppButtonState();
// }
//
// class _AppButtonState extends State<AppButton> with TickerProviderStateMixin {
//   late AnimationController _controller;
//   final Duration _animationDuration = const Duration(milliseconds: 300);
//   final Tween<double> _tween = Tween<double>(begin: 1.0, end: 0.8);
//
//   @override
//   void initState() {
//     _controller = AnimationController(
//       vsync: this,
//       duration: _animationDuration,
//     )..addListener(() {
//         setState(() {});
//       });
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       style: TextButton.styleFrom(padding: EdgeInsets.zero),
//       onPressed: () => {
//         _controller.forward().then((value) => _controller.reverse()),
//         widget.onPressed(),
//       },
//       child: Container(
//         // width: 324,
//         padding:  EdgeInsets.symmetric(horizontal: widget.paddingHorizontal, vertical: widget.paddingVertical),
//         height: 45,
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//           border: Border.all(width: 1, color: widget.buttonBorderColor),
//           borderRadius: BorderRadius.circular(10),
//           color: widget.buttonBackgroundColor,
//         ),
//         child: Text(
//           widget.title,
//           style: TextStyle(
//               fontSize: widget.titleFontSize,
//               fontWeight: FontWeight.w700,
//               color: widget.titleColor),
//         ),
//       ),
//     );
//   }
// }
