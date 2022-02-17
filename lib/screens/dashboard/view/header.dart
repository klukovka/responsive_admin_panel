import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_admin_panel/constants.dart';
import 'package:responsive_admin_panel/controllers/menu_controller.dart';
import 'package:responsive_admin_panel/responsive.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _buildMobileHeader(context),
      tablet: _buildTableHeader(context),
      desktop: _buildDesktopHeader(context),
    );
  }

  Widget _buildDesktopHeader(BuildContext context) {
    return Row(
      children: [
        Text(
          'Dashboard',
          style: Theme.of(context).textTheme.headline6,
        ),
        const Spacer(flex: 2),
        Expanded(
          child: _buildSearchField(),
        ),
        _buildProfileCard(context),
      ],
    );
  }

  Widget _buildTableHeader(BuildContext context) {
    return Row(
      children: [
        _buildBurger(context),
        Text(
          'Dashboard',
          style: Theme.of(context).textTheme.headline6,
        ),
        const Spacer(),
        Expanded(
          child: _buildSearchField(),
        ),
        _buildProfileCard(context),
      ],
    );
  }

  Widget _buildMobileHeader(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _buildBurger(context),
            Text(
              'Dashboard',
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
        const SizedBox(height: defaultPadding * 0.5),
        _buildSearchField(),
        const SizedBox(height: defaultPadding * 0.5),
        _buildProfileCard(context),
      ],
    );
  }

  Widget _buildBurger(BuildContext context) {
    return IconButton(
      onPressed: context.read<MenuController>().controlMenu,
      icon: const Icon(Icons.menu),
    );
  }

  Widget _buildProfileCard(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: Responsive.isMobile(context) ? 0 : defaultPadding,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding * 0.5,
      ),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/images/profile_pic.png',
            height: 40,
          ),
          const Padding(
            padding: EdgeInsets.all(defaultPadding * 0.5),
            child: Text('Yuliia Koba'),
          ),
          if (Responsive.isMobile(context)) const Spacer(),
          const Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: secondaryColor,
        hintText: 'Search',
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(defaultPadding * 0.75),
            margin: const EdgeInsets.all(defaultPadding * 0.5),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: SvgPicture.asset('assets/icons/Search.svg'),
          ),
        ),
      ),
    );
  }
}
