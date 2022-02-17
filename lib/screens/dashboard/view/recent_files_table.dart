import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_admin_panel/constants.dart';
import 'package:responsive_admin_panel/models/recent_file.dart';
import 'package:responsive_admin_panel/responsive.dart';

class RecentFilesTable extends StatefulWidget {
  const RecentFilesTable({Key? key}) : super(key: key);

  @override
  State<RecentFilesTable> createState() => _RecentFilesTableState();
}

class _RecentFilesTableState extends State<RecentFilesTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Files',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Responsive(
            mobile: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: _buildDataTable(),
            ),
            desktop: SizedBox(
              width: double.infinity,
              child: _buildDataTable(),
            ),
            tablet: SizedBox(
              width: double.infinity,
              child: _buildDataTable(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDataTable() {
    return DataTable(
      horizontalMargin: 0,
      columns: [
        DataColumn(
            label: Text(
          'File name',
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                fontStyle: FontStyle.italic,
              ),
        )),
        DataColumn(
            label: Text(
          'Date',
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                fontStyle: FontStyle.italic,
              ),
        )),
        DataColumn(
            label: Text(
          'Size',
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                fontStyle: FontStyle.italic,
              ),
        )),
      ],
      rows: demoRecentFiles
          .map<DataRow>(((recentFile) => _buildDataRow(recentFile)))
          .toList(),
    );
  }

  DataRow _buildDataRow(RecentFile recentFile) {
    return DataRow(cells: [
      DataCell(Row(
        children: [
          SvgPicture.asset(
            recentFile.icon,
            width: 30,
            height: 30,
          ),
          const SizedBox(width: defaultPadding * 0.5),
          Text(recentFile.title),
        ],
      )),
      DataCell(Text(recentFile.date)),
      DataCell(Text(recentFile.size))
    ]);
  }
}
