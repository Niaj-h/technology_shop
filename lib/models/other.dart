class OtherProductModel {
  String id;
  String title;
  String imgurl;
  double price;
  OtherProductModel({this.id, this.imgurl, this.price, this.title});
}

List<OtherProductModel> otherdummy = [
  OtherProductModel(
      id: 'm1',
      imgurl:
          'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
      title: 'Headphone',
      price: 299.99),
  OtherProductModel(
      id: 'm2',
      imgurl:
          'https://images.unsplash.com/photo-1491472253230-a044054ca35f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
      title: 'Mac',
      price: 2999.99),
  OtherProductModel(
      id: 'm3',
      imgurl:
          'https://images.unsplash.com/photo-1434493907317-a46b5bbe7834?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
      title: 'Watch',
      price: 499.99),
  OtherProductModel(
      id: 'm4',
      imgurl:
          'https://images.unsplash.com/photo-1488149048941-581936ced6d6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
      title: 'Mavic Drone',
      price: 999.99),
];
