import 'package:flutter/material.dart';
import 'package:responsive_admin_panel/constants.dart';
import 'package:responsive_admin_panel/responsive.dart';
import 'package:responsive_admin_panel/screens/dashboard/view/files_grid_view.dart';
import 'package:responsive_admin_panel/screens/dashboard/view/recent_files_table.dart';
import 'package:responsive_admin_panel/screens/dashboard/view/storage_details.dart';

class FilesView extends StatefulWidget {
  const FilesView({Key? key}) : super(key: key);

  @override
  State<FilesView> createState() => _FilesViewState();
}

class _FilesViewState extends State<FilesView> {
  Size get _size => MediaQuery.of(context).size;

  double get _desktopChildAspectRatio {
    if (_size.width < 1230) return 0.9;
    if (_size.width < 1530) return 1.1;
    return 1.4;
  }

  double get _tabletChildAspectRatio {
    if (_size.width < 940) return 0.9;
    return 1;
  }

  double get _mobileChildAspectRatio {
    if (_size.width < 360) return 0.8;
    if (_size.width < 500) return 1;
    if (_size.width < 650) return 1.5;
    if (_size.width < 790) return 2;
    return 2.5;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          _buildAddFiles(),
          const SizedBox(height: defaultPadding),
          Responsive(
            mobile: FilesGridView(
              crossAxisCount: _size.width < 330 ? 1 : 2,
              childAspectRatio: _mobileChildAspectRatio,
            ),
            desktop: FilesGridView(
              childAspectRatio: _desktopChildAspectRatio,
            ),
            tablet: FilesGridView(
              childAspectRatio: _tabletChildAspectRatio,
            ),
          ),
          const SizedBox(height: defaultPadding),
          const RecentFilesTable(),
          if (Responsive.isMobile(context)) ...[
            const SizedBox(height: defaultPadding),
            const StorageDetails(),
          ]
        ],
      ),
    );
  }

  Widget _buildAddFiles() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'My Files',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        ElevatedButton.icon(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding * 1.5,
              vertical: defaultPadding,
            ),
          ),
          icon: const Icon(Icons.add),
          label: const Text('Add New'),
          onPressed: () {},
        ),
      ],
    );
  }
}
