
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/product_controller.dart';
import '../components/card4.dart';

class AllProductList extends StatefulWidget {
  const AllProductList({super.key});

  @override
  State<AllProductList> createState() => _AllProductListState();
}

class _AllProductListState extends State<AllProductList> {
  late ProductController productController = ProductController();

  @override
  void initState() {
    productController = Provider.of<ProductController>(context, listen: false);
    productController.getAllProductsController(context);
    productController.getAllCategoryController(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;
    return Consumer<ProductController>(
      builder: (BuildContext context, value, Widget? child) {
        print("value : ${value.products}");
    
        var dataListLength = value.products.products;
    
        if (value.loading == true || dataListLength == null) {
          return Container(
              alignment: Alignment.center,
              child:  CircularProgressIndicator(
                color: Colors.green.shade900,
              ));
        } else {
          if (dataListLength.length == 0 || dataListLength == null) {
            return Center(
              child: Text("No products"),
            );
          } else {
            return Container(
                width: screenwidth,
                height: screenhight * 0.36,
                // color: Color.fromARGB(255, 214, 83, 83),
                child: GridView.builder(
                  shrinkWrap: false,
                  itemCount: value.products.products!.length,
                  gridDelegate:
                      new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 3,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    var items = value.products.products![index];
                    return Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Card4(
                        addToCart: () {},
                        discription: "Lowest Asked",
                        price: items.price.toString(),
                        thumbnailImage: items.thumbnail.toString(),
                        title: items.title.toString(),
                        productId: items.id.toString(),
                      ),
                    );
                  },
                ));
          }
        }
      },
    );
  }
}
