// class UserInfoModel {
//   String name;
//   int phonenumber;
//   dynamic email;
//   String imgurl;
//   String profession;
//   UserInfoModel(
//       {this.imgurl, this.email, this.name, this.phonenumber, this.profession});
// }

var userinfomodel = {
  "fullname": "Emma Phillips",
  "phonenumber": "(102)2131 231 232",
  "email": "emmaphillips@gmail.com",
  "imgurl":
      "https://images.unsplash.com/photo-1496440737103-cd596325d314?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80",
  "profession": "programmer"
};

var myMap = Map<dynamic, dynamic>.from(userinfomodel);
