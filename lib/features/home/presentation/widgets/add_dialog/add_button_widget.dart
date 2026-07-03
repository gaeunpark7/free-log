// import 'package:flutter/material.dart';
// import 'package:free_log/core/theme/app_colors.dart';
// import 'package:free_log/core/utils/responsive_utils.dart';

// class AddButtonWidget extends StatelessWidget {
//   final VoidCallback? onPressed;
//   const AddButtonWidget({super.key, required this.onPressed});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       height: 48,
//       child: FilledButton(
//         style: FilledButton.styleFrom(
//           backgroundColor: AppColors.primary,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadiusGeometry.circular(7),
//           ),
//         ),
//         onPressed: onPressed,
//         child: Text(
//           '저장',
//           style: TextStyle(fontSize: Responsive.fontSize(context, 16)),
//         ),
//       ),
//     );
//   }
// }
