import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoople_machine_test/Controller/homeController.dart';
import 'package:zoople_machine_test/core/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // @override
  // void initState() {
  //   AppServices().getHttp();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final product = Get.put(HomeController());
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {},
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.shopping_cart_outlined),
                    onPressed: () {},
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Women',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              TabBar(
                labelColor: AppColor.kblack,
                indicatorColor: AppColor.kblack,
                indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelColor: AppColor.kgrey,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                indicator: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 2.0),
                  ),
                ),
                tabs: const [
                  Tab(
                    child: Text(
                      'HandBag',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'jewellery',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Footwear',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Dress',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Obx(
                  () => product.loading.isTrue
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : GridView.builder(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 20,
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            childAspectRatio: 1 / 1.2,
                          ),
                          itemCount: product.productList.length,
                          itemBuilder: (BuildContext context, int index) {
                            final _productdata = product.productList[index];

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    //color: Colors.amber,

                                    image: DecorationImage(
                                      image: NetworkImage(
                                        _productdata.image,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 10),
                                  child: Text(
                                    _productdata.name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: AppColor.kgrey,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                  ),
                                  child: Text(
                                    "\$${_productdata.price}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
