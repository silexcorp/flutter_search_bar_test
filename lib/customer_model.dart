

class CustomerModel {

  String code;
  String name;
  String nit;
  String nameLowercase;
  String description;
  String address;
  String phone;
  double discount;
  double debt;
  String email;
  String img;
  String thumbnail;
  bool isActive;
  String company;
  DateTime date;

  CustomerModel({
    this.code = '',
    this.name = '',
    this.nit = '',
    this.nameLowercase = '',
    this.description = '',
    this.address = '',
    this.phone = '',
    this.discount = 1.0,
    this.debt = 0,
    this.email = '',
    this.img = '',
    this.thumbnail = '',
    this.isActive = false,
    this.company = '',
    this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'name': name,
      'nit': nit,
      'nameLowercase': nameLowercase,
      'description': description,
      'address': address,
      'phone': phone,
      'discount': discount,
      'debt': debt,
      'email': email,
      'img': img,
      'thumbnail': thumbnail,
      'isActive': isActive,
      'company': company,
      'date': date,
    };
  }

  /*CustomerModel.fromSnapshot(DocumentSnapshot snapshot)
      : code          = snapshot.documentID,
        name          = snapshot['name'],
        nit           = snapshot['nit'],
        nameLowercase = snapshot['nameLowercase'],
        description   = snapshot['description'],
        address       = snapshot['address'],
        phone         = snapshot['phone'],
        discount      = snapshot['discount'],
        debt          = snapshot['debt'] + 0.0,
        email         = snapshot['email'],
        img           = snapshot['img'],
        thumbnail     = snapshot['thumbnail'],
        isActive      = snapshot['isActive'],
        company       = snapshot['company'],
        date          = snapshot['date'].toDate()
  ;*/

}
