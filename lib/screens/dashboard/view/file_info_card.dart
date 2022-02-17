import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_admin_panel/constants.dart';
import 'package:responsive_admin_panel/models/my_files.dart';

class FileInfoCard extends StatelessWidget {
  final CloudStorageInfo cloudStorageInfo;
  const FileInfoCard({
    Key? key,
    required this.cloudStorageInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildIconAndMore(),
          const SizedBox(height: defaultPadding * 0.5),
          Text(
            cloudStorageInfo.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: defaultPadding * 0.5),
          _buildIndicator(),
          const SizedBox(height: defaultPadding * 0.5),
          _buildMemoryInfo(context)
        ],
      ),
    );
  }

  Widget _buildMemoryInfo(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${cloudStorageInfo.numOfFiels} Files',
          style: Theme.of(context).textTheme.caption?.copyWith(
                color: Colors.white70,
              ),
          maxLines: 2,
        ),
        Text(
          cloudStorageInfo.totalStorage,
          maxLines: 2,
        ),
      ],
    );
  }

  Widget _buildIndicator() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 4,
          decoration: BoxDecoration(
            color: cloudStorageInfo.color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        LayoutBuilder(
          builder: ((context, constraints) {
            return Container(
              width: constraints.maxWidth * cloudStorageInfo.percentage / 100,
              height: 4,
              decoration: BoxDecoration(
                color: cloudStorageInfo.color,
                borderRadius: BorderRadius.circular(12),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildIconAndMore() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 40,
          height: 40,
          padding: const EdgeInsets.all(defaultPadding * 0.5),
          decoration: BoxDecoration(
            color: cloudStorageInfo.color.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: SvgPicture.asset(cloudStorageInfo.svgSrc),
        ),
        const Icon(
          Icons.more_vert,
          color: Colors.white54,
        )
      ],
    );
  }
}
