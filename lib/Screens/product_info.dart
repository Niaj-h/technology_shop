import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  // ProductModel productmodel;
  // ProductInfo(this.productmodel);
  static const routeName = '/productinfo';

  @override
  Widget build(BuildContext context) {
    final productdet =
        ModalRoute.of(context).settings.arguments as Map<dynamic, dynamic>;
    final prodinnnn = productdet['image'];
    final prodidd = productdet['id'];
    final prodtitle = productdet['titlep'];
    final prodprice = productdet['price'];

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0.0, 2.0),
                          blurRadius: 6.0)
                    ]),
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(30)),
                  child: Hero(
                    tag: prodidd,
                    child: Image(
                      image: NetworkImage(prodinnnn),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Theme.of(context).primaryColor,
                    size: 25.0,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Positioned(
                bottom: 12.0,
                left: 18,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Colors.black26,
                    child: Text(
                      prodtitle,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          letterSpacing: 2),
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.remove_circle_outline,
                    size: 35,
                  ),
                  onPressed: null),
              Text(
                '1',
                style: TextStyle(fontSize: 25),
              ),
              IconButton(
                  icon: Icon(
                    Icons.add_circle_outline,
                    size: 35,
                  ),
                  onPressed: null),
              SizedBox(width: 150),
              Text(
                '\$$prodprice',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              )
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(60)),
                  border: Border.all(
                      width: 0.5,
                      color: Colors.black,
                      style: BorderStyle.solid),
                ),
                child: Icon(
                  Icons.favorite_border,
                  size: 25,
                  color: Colors.black,
                ),
              ),
              title: SizedBox.shrink()),
          BottomNavigationBarItem(
            icon: Container(
              alignment: AlignmentDirectional.center,
              width: 150,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Theme.of(context).primaryColor),
              child: Text(
                'Add to Bucket',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1),
              ),
            ),
            title: SizedBox.shrink(),
          ),
        ],
        elevation: 0,
      ),
    );
  }
}
