import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:technology/models/other.dart';

class OtherCarosel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Other Products',
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
              itemCount: otherdummy.length,
              itemBuilder: (context, index) {
                OtherProductModel dumprod = otherdummy[index];
                return Container(
                  margin: EdgeInsets.all(10.0),
                  width: 240.0,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Positioned(
                        bottom: 15.0,
                        child: Container(
                          height: 120.0,
                          width: 240.0,
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
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image(
                                height: 180,
                                width: 220,
                                image: NetworkImage(dumprod.imgurl),
                                fit: BoxFit.cover,
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
