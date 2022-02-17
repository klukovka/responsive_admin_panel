import 'package:flutter/material.dart';
import 'package:responsive_admin_panel/screens/main/view/drawer_menu_item.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset('assets/images/logo.png'),
            ),
            DrawerMenuItem(
              title: 'Dashboard',
              asset: 'assets/icons/menu_dashbord.svg',
              onTap: () {},
            ),
            DrawerMenuItem(
              title: 'Transaction',
              asset: 'assets/icons/menu_tran.svg',
              onTap: () {},
            ),
            DrawerMenuItem(
              title: 'Task',
              asset: 'assets/icons/menu_task.svg',
              onTap: () {},
            ),
            DrawerMenuItem(
              title: 'Documents',
              asset: 'assets/icons/menu_doc.svg',
              onTap: () {},
            ),
            DrawerMenuItem(
              title: 'Store',
              asset: 'assets/icons/menu_store.svg',
              onTap: () {},
            ),
            DrawerMenuItem(
              title: 'Notification',
              asset: 'assets/icons/menu_notification.svg',
              onTap: () {},
            ),
            DrawerMenuItem(
              title: 'Profile',
              asset: 'assets/icons/menu_profile.svg',
              onTap: () {},
            ),
            DrawerMenuItem(
              title: 'Settings',
              asset: 'assets/icons/menu_setting.svg',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
