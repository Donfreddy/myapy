import 'package:mypay/common/constants/assest_path.dart';

class Operator {
  int id;
  String name;
  String logoPath;

  Operator({required this.id, required this.name, required this.logoPath});

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'name': this.name,
        'logoPath': this.logoPath,
      };

  factory Operator.fromJson(Map<String, dynamic> json) => Operator(
        id: json['id'] as int,
        name: json['name'] as String,
        logoPath: json['logoPath'] as String,
      );
}

List<Operator> operators = [
  new Operator(id: 1, name: 'Orange Money', logoPath: IMG_ORANGE),
  new Operator(id: 2, name: 'MTN Money', logoPath: IMG_MTN),
  // new Operator(id: 3, name: 'Yup', logoPath: IMG_YUP),
  // new Operator(id: 4, name: 'Express Union Mobile', logoPath: IMG_EXPRESS_UM),
];
