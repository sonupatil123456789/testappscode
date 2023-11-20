import 'package:flutter/material.dart';
import 'package:test1/view/screens/all_product_list.dart';
import '../../utils/constants/colorpallets.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

List Categories = [
  "smartphones",
  "laptops",
  "fragrances",
  "skincare",
  "groceries",
  "home-decoration",
  "furniture",
  "tops",
  "womens-dresses",
  "womens-shoes",
  "mens-shirts",
  "mens-shoes",
  "mens-watches",
  "womens-watches",
  "womens-bags",
  "womens-jewellery",
  "sunglasses",
  "automotive",
  "motorcycle",
  "lighting"
];

class _ProductsScreenState extends State<ProductsScreen> {
  TextEditingController searchBarInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;
    return Expanded(
      child: Container(
        width: screenwidth,
        child: DefaultTabController(
          length: Categories.length,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              flexibleSpace: Container(
                width: screenwidth * 0.70,
                height: screenhight * 0.05,
                child: TextFormField(
                    autocorrect: true,
                    onFieldSubmitted: (String value) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Product should not be empty ';
                      } else {
                        return null;
                      }
                    },
                    controller: searchBarInput,
                    onChanged: (value) {},
                    style: TextStyle(color: TheamColors.primaryColor),
                    textAlign: TextAlign.justify,
                    textAlignVertical: TextAlignVertical.bottom,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: Icon(Icons.tune),
                      hintText: "Search product here",
                      hintStyle: TextStyle(color: TheamColors.primaryColor),
                      // labelStyle: TextStyle(  color: Colors.amber,),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(
                            color: TheamColors.backgroundColor, width: 0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(
                            color: TheamColors.backgroundColor, width: 0),
                      ),
                    )),
              ),
              bottom: TabBar(
                  isScrollable: true,
                  unselectedLabelColor: Color.fromARGB(255, 245, 245, 245),
                  // labelColor: Colors.black,
                  labelColor: Color.fromARGB(255, 143, 143, 143),
                  onTap: (value) {
                    print(value);
                  },
                  tabs: List.generate(
                    Categories.length,
                    (index) => Tab(
                      child: Text(
                        Categories[index],
                        style: TextStyle(
                            fontSize: screenwidth * 0.038,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 143, 143, 143)),
                      ),
                    ),
                  )),
              // title: Text('Tabs Demo'),
            ),
            body: const TabBarView(
              children: [
                AllProductList(),
                AllProductList(),
                AllProductList(),
                AllProductList(),
                AllProductList(),
                AllProductList(),
                AllProductList(),
                AllProductList(),
                AllProductList(),
                AllProductList(),
                AllProductList(),
                AllProductList(),
                AllProductList(),
                AllProductList(),
                AllProductList(),
                AllProductList(),
                AllProductList(),
                AllProductList(),
                AllProductList(),
                AllProductList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
