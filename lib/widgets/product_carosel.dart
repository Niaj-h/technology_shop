import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:technology/Screens/product_info.dart';
import 'package:technology/models/product.dart';

class ProductCarosel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Top Products',
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.8)),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'See all',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5),
                ),
              )
            ],
          ),
        ),
        Container(
          height: 300.0,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dummyproducts.length,
              itemBuilder: (context, index) {
                ProductModel dumprod = dummyproducts[index];
                return Container(
                  margin: EdgeInsets.all(10.0),
                  width: 210.0,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Positioned(
                        bottom: 15.0,
                        child: Container(
                          height: 120.0,
                          width: 200.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ListTile(
                                title: Text(
                                  '${dumprod.title}',
                                  style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w600),
                                ),
                                subtitle: Text('\$${dumprod.price}'),
                                trailing: Icon(
                                  FontAwesomeIcons.plusCircle,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0.0, 2.0),
                                blurRadius: 6.0),
                          ],
                        ),
                        child: Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(ProductInfo.routeName,
                                        arguments: ({
                                          'id': dumprod.id,
                                          'image': dumprod.imgurl,
                                          'titlep': dumprod.title,
                                          'price': dumprod.price
                                        }));
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Hero(
                                  tag: dumprod.id,
                                  child: Image(
                                    height: 180,
                                    width: 180,
                                    image: NetworkImage(dumprod.imgurl),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
