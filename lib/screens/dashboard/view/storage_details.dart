import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_admin_panel/constants.dart';
import 'package:responsive_admin_panel/models/storage_detail.dart';

class StorageDetails extends StatefulWidget {
  const StorageDetails({
    Key? key,
  }) : super(key: key);

  @override
  State<StorageDetails> createState() => _StorageDetailsState();
}

class _StorageDetailsState extends State<StorageDetails> {
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
        children: [
          const Text(
            'Storage Details',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: defaultPadding),
          _buildChart(),
          const SizedBox(height: defaultPadding),
          ...storageDetails.map(_buildStorageDetail),
        ],
      ),
    );
  }

  Widget _buildStorageDetail(StorageDetail storageDetail) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      margin: const EdgeInsets.symmetric(vertical: defaultPadding * 0.5),
      decoration: BoxDecoration(
        border: Border.all(
          color: primaryColor.withOpacity(0.4),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 20,
            width: 20,
            child: SvgPicture.asset(storageDetail.svgSrc),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    storageDetail.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '${storageDetail.files} Files',
                    style: Theme.of(context).textTheme.caption?.copyWith(
                          color: Colors.white70,
                        ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Text('${storageDetail.memory}GB'),
        ],
      ),
    );
  }

  SizedBox _buildChart() {
    return SizedBox(
      height: 200,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PieChart(
            PieChartData(
              startDegreeOffset: -90,
              centerSpaceRadius: 70,
              sections: [
                PieChartSectionData(
                  color: primaryColor,
                  value: 25,
                  showTitle: false,
                  radius: 28,
                ),
                PieChartSectionData(
                  color: const Color(0xFF26E5FF),
                  value: 25,
                  showTitle: false,
                  radius: 25,
                ),
                PieChartSectionData(
                  color: const Color(0xFFFFA113),
                  value: 15,
                  showTitle: false,
                  radius: 23,
                ),
                PieChartSectionData(
                  color: Colors.red,
                  value: 15,
                  showTitle: false,
                  radius: 19,
                ),
                PieChartSectionData(
                  color: primaryColor.withOpacity(0.1),
                  value: 20,
                  showTitle: false,
                  radius: 15,
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: defaultPadding),
              Text(
                '29.1',
                style: Theme.of(context).textTheme.headline4?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      height: 0.5,
                    ),
              ),
              const Text('Of 128GB')
            ],
          )
        ],
      ),
    );
  }
}
