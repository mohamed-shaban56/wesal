import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wesal/core/utliz/app_color.dart';
import 'package:wesal/core/utliz/app_image.dart';

import 'package:wesal/core/utliz/app_text_style.dart';
import 'package:wesal/l10n/app_localizations.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({super.key});

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  final ImagePicker picker = ImagePicker();
  XFile? pickedImage;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 55.r,
                backgroundColor: Colors.white,
                child: ClipOval(
                  child: Container(
                    width: 110.r,

                    child: pickedImage != null
                        ? Image.file(fit: BoxFit.cover, File(pickedImage!.path))
                        : Image.asset(AppImages.defualtUserImage, scale: 8),
                  ),
                ),
              ),
            ),

            GestureDetector(
              onTap: () async {
                final XFile? image = await picker.pickImage(
                  source: ImageSource.gallery,
                );
                if (image != null) {
                  pickedImage = image;
                  setState(() {});
                } else {
                  pickedImage = null;
                }
              },
              child: Container(
                padding: EdgeInsets.all(6.r),
                decoration: BoxDecoration(
                  color: AppColor.lightBlue,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColor.white, width: 2),
                ),
                child: Icon(
                  Icons.camera_alt,
                  color: AppColor.white,
                  size: 18.r,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Text(
          AppLocalizations.of(context)!.defaultUserName,
          style: AppTextStyle.cairo18Bold(context),
        ),
        SizedBox(height: 4.h),
        Text(
          AppLocalizations.of(context)!.defaultUserEmail,
          style: AppTextStyle.cairo14BoldPrimary(
            context,
          ).copyWith(color: Colors.grey, fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
}
