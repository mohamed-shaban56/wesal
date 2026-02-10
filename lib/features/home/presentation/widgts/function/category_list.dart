import 'package:flutter/material.dart';
import 'package:wesal/core/utliz/app_image.dart';
import 'package:wesal/features/home/data/models/category_model.dart';
import 'package:wesal/l10n/app_localizations.dart';

List<CategoryModel> categoryList(BuildContext context) {
  List<CategoryModel> category = [
    CategoryModel(
      image: AppImages.burger,
      title: AppLocalizations.of(context)!.burger,
    ),
    CategoryModel(
      image: AppImages.pizza,
      title: AppLocalizations.of(context)!.pizza,
    ),
    CategoryModel(
      image: AppImages.chicken,
      title: AppLocalizations.of(context)!.chicken,
    ),
    CategoryModel(
      image: AppImages.meals,
      title: AppLocalizations.of(context)!.meals,
    ),
    CategoryModel(
      image: AppImages.more,
      title: AppLocalizations.of(context)!.more,
    ),
  ];
  return category;
}
