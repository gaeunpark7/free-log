import 'package:flutter/material.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/utils/responsive_utils.dart';
import 'package:free_log/features/profile/domain/model/user_model.dart';
import 'package:free_log/features/profile/presentation/widgets/profile_edit_dialog.dart';

class ProfileCard extends StatelessWidget {
  final UserModel? user;
  const ProfileCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.borderDefault),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: Responsive.cardPadding(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [_buildProfileCircle(), const SizedBox(width: 16), _buildUserInfo(context)],
            ),
            _buildEditButton(context),
          ],
        ),
      ),
    );
  }

  Column _buildUserInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(user?.nickname ?? 'no nickname', style: AppTextStyles.subTitleBold(context)),
        Text(user?.email ?? '', style: AppTextStyles.caption(context)),
      ],
    );
  }

  Widget _buildEditButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (ctx) => ProfileEditDialog(user: user!),
        );
      },
      child: CircleAvatar(
        radius: 20,
        backgroundColor: AppColors.background,
        child: Icon(Icons.edit_outlined, color: AppColors.textTertiary),
      ),
    );
  }

  CircleAvatar _buildProfileCircle() {
    return CircleAvatar(
      radius: 28,
      backgroundColor: AppColors.primarySoft,
      child: Icon(Icons.person, color: AppColors.primary, size: 32),
    );
  }
}
