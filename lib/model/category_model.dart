import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageurl;
  Category({required this.name, required this.imageurl});

  @override
  // TODO: implement props
  List<Object?> get props => [name, imageurl];

  static List<Category> categories = [
    Category(
      name: 'DRINKS',
      imageurl:
          'https://www.nbplc.com/storage/2021/11/Updated-Product-Line-Up-min.png',
    ),
    Category(
      name: 'FOODS',
      imageurl:
          'https://asafinland.org/wp-content/uploads/2017/08/igbofood.jpg',
    ),
    Category(
        name: 'LODGING',
        imageurl:
            'https://ik.imgkit.net/3vlqs5axxjf/external/http://media.iceportal.com/117733/photos/64637406_XL.jpg?tr=w-360%2Ch-379%2Cfo-auto'),
    Category(
        name: 'HALL FOR RENT',
        imageurl:
            'https://images.nigeriapropertycentre.com/properties/images/1263548/062351fff1b3d7-130-sqm-event-hall-halls-for-rent-uyo-akwa-ibom.jpg')
  ];
}
