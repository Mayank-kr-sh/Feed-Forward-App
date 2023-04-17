import 'package:flutter/material.dart';
import 'package:food_donation/resourses/cloudfirestore.dart';
import 'package:food_donation/screen/components/banner.dart';
import 'package:food_donation/screen/components/category.dart';
import 'package:food_donation/screen/components/loading.dart';
import 'package:food_donation/screen/components/product.dart';
import 'package:food_donation/screen/components/searchbar.dart';
import 'package:food_donation/screen/components/user_detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController controller = ScrollController();
  double offset = 0;
  List<Widget>? discount70;
  List<Widget>? discount60;
  List<Widget>? discount50;
  List<Widget>? discount0;

  @override
  void initState() {
    super.initState();
    getData();
    controller.addListener(() {
      //print(controller.position.pixels);
      setState(() {
        offset = controller.position.pixels;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  Widget detailSection() {
    return Column(
      children: [
        const SizedBox(
          height: 80 / 2,
        ),
        const CategoriesHorizontalListViewBar(),
        const AdBannerWidget(),
        ProductsShowcaseListView(title: "Upto 70% Off", children: discount70!),
        ProductsShowcaseListView(title: "Upto 60% Off", children: discount60!),
        ProductsShowcaseListView(title: "Upto 50% Off", children: discount50!),
        ProductsShowcaseListView(title: "Explore", children: discount0!),
      ],
    );
  }

  void getData() async {
    List<Widget> temp70 =
        await CloudFirestoreClass().getProductsFromDiscount(70);
    List<Widget> temp60 =
        await CloudFirestoreClass().getProductsFromDiscount(60);
    List<Widget> temp50 =
        await CloudFirestoreClass().getProductsFromDiscount(50);
    List<Widget> temp0 = await CloudFirestoreClass().getProductsFromDiscount(0);
    print("everything is done");
    setState(() {
      discount70 = temp70;
      discount60 = temp60;
      discount50 = temp50;
      discount0 = temp0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(
        isReadOnly: true,
        hasBackButton: false,
      ),
      // body: Stack(
      //   children: [
      //     SingleChildScrollView(
      //       controller: controller,
      //       child: Column(
      //         children: [
      //           const SizedBox(height: 80 / 2),
      //           const CategoriesHorizontalListViewBar(),
      //           const AdBannerWidget(),
      //           ProductsShowcaseListView(
      //               title: "Upto 70% Off", children: testChildren),
      //           ProductsShowcaseListView(
      //               title: "Upto 60% Off", children: testChildren),
      //           ProductsShowcaseListView(
      //               title: "Upto 50% Off", children: testChildren),
      //           ProductsShowcaseListView(
      //               title: "Explore More", children: testChildren)
      //         ],
      //       ),
      //     ),
      //     UserDetailsBar(
      //       offset: offset,
      //     ),
      //   ],
      // ),
      body: discount70 != null &&
              discount60 != null &&
              discount50 != null &&
              discount0 != null
          ? Stack(
              children: [
                SingleChildScrollView(
                  controller: controller,
                  child: detailSection(),
                ),
                UserDetailsBar(
                  offset: offset,
                ),
              ],
            )
          : const LoadingWidget(),
    );
  }
}
