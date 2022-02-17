import 'package:flutter/material.dart';
import 'package:responsive_admin_panel/constants.dart';
import 'package:responsive_admin_panel/responsive.dart';
import 'package:responsive_admin_panel/screens/dashboard/view/files_view.dart';
import 'package:responsive_admin_panel/screens/dashboard/view/header.dart';
import 'package:responsive_admin_panel/screens/dashboard/view/storage_details.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          const Header(),
          const SizedBox(height: defaultPadding),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                flex: 7,
                child: FilesView(),
              ),
              if (!Responsive.isMobile(context)) ...[
                const SizedBox(width: defaultPadding),
                const Expanded(
                  flex: 3,
                  child: StorageDetails(),
                ),
              ]
            ],
          ),
        ],
      ),
    );
  }
}
