import 'package:flutter/material.dart';
import 'package:wesal/core/utliz/app_image.dart';
import 'package:wesal/features/search/data/models/popular_cusine_model.dart';
import 'package:wesal/l10n/app_localizations.dart';

List<PopularCusineModel> popularCuisines(BuildContext context) {
  List<PopularCusineModel> popularCuisinesList = [
    PopularCusineModel(
      titel: AppLocalizations.of(context)!.burger,
      image: AppImages.burger,
    ),
    PopularCusineModel(
      titel: AppLocalizations.of(context)!.pizza,
      image: AppImages.pizza,
    ),
    PopularCusineModel(
      titel: AppLocalizations.of(context)!.chicken,
      image: AppImages.chicken,
    ),
    PopularCusineModel(
      titel: AppLocalizations.of(context)!.meals,
      image: AppImages.meals,
    ),
  ];
  return popularCuisinesList;
}
