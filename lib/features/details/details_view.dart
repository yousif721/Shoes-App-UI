import 'package:flutter/material.dart';
import 'package:shop_app_ui/features/details/presentation/views/widgets/details_view_body.dart';
import '../data/models/shoes_model.dart';

class DetailsView extends StatelessWidget {
  ShoeModel model;
  bool isComeFromMoreSection;
  DetailsView({required this.model,required this.isComeFromMoreSection});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: DetailsViewBody(
            model: model,
            isComeFromMoreSection: isComeFromMoreSection,
          )),
    );
  }
}
