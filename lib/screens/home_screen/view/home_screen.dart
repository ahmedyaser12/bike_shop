import 'package:e_commerce/core/utils/colors.dart';
import 'package:e_commerce/core/utils/common_functions.dart';
import 'package:e_commerce/screens/home_screen/widget/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../services/services_locator.dart';
import '../view_model/home_screen_view_model.dart';
import '../widget/appBar.dart';
import '../widget/categories.dart';
import '../widget/top_card_categotries.dart';
import '../widget/view_product.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => locator<HomeScreenViewModel>(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<HomeScreenViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: AppColors.background,
            body: Stack(children: [
              Align(
                alignment: Alignment.bottomRight,
                child: Image.asset('assets/images/Rectangle 474.png'),
              ),
              Categories(viewModel: viewModel,),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const HomeAppBar(),
                      heightSpace(24),
                      const TopCard(),
                      heightSpace(95),
                      Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 0,
                            childAspectRatio: .7,
                            crossAxisCount:
                                2, // Adjust the aspect ratio as needed
                          ),
                          itemCount: 20,
                          itemBuilder: (context, index) {
                            // Offset every second item (first column)
                            bool isOffset = index % 2 == 0;
                            return Column(
                              children: [
                                if (isOffset) const SizedBox(height: 35),
                                const ProductView(),
                              ],
                            );
                          },
                        ),
                      ),
                    ]),
              ),
            ]),
            bottomNavigationBar: BottomNavBar(viewModel: viewModel),
          );
        },
      ),
    );
  }
}
