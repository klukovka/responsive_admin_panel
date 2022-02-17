import 'package:flutter/material.dart';
import 'package:responsive_admin_panel/constants.dart';
import 'package:responsive_admin_panel/models/my_files.dart';
import 'package:responsive_admin_panel/screens/dashboard/view/file_info_card.dart';

class FilesGridView extends StatelessWidget {
  final int crossAxisCount;
  final double childAspectRatio;
  const FilesGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: demoMyFiels.length,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding * 0.5,
        childAspectRatio: childAspectRatio,
        mainAxisSpacing: defaultPadding * 0.5,
      ),
      itemBuilder: (context, index) {
        return FileInfoCard(cloudStorageInfo: demoMyFiels[index]);
      },
    );
  }
}
