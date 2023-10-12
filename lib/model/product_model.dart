import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String imageUrl;
  final String category;
  final double price;
  final bool isRecommended;
  final bool isPopular;
  const Product(
      {required this.name,
      required this.category,
      required this.imageUrl,
      required this.isPopular,
      required this.isRecommended,
      required this.price});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [name, category, price, imageUrl, isPopular, isRecommended];

  static List<Product> products = [
    const Product(
        name: 'STAR',
        category: 'DRINKS',
        imageUrl:
            'https://theblowfishgroup.com/mashawis/wp-content/uploads/2018/12/ma0078-2.jpg',
        isPopular: false,
        isRecommended: true,
        price: 10500.00),
    const Product(
        name: 'GULDER',
        category: 'DRINKS',
        imageUrl:
            'https://i0.wp.com/beverageindustrynews.com.ng/wp-content/uploads/2015/08/project_gulder_1.jpg?fit=500%2C373&ssl=1',
        isPopular: true,
        isRecommended: false,
        price: 10500.00),
    const Product(
        name: 'DESPERADOS',
        category: 'DRINKS',
        imageUrl:
            'https://bigbarrel.co.nz/content/images/thumbs/006/0060233_desperados-6pk-btls-330ml.jpeg',
        isPopular: false,
        isRecommended: false,
        price: 10500.00),
    const Product(
        name: 'STAR-RADLAR',
        category: 'DRINKS',
        imageUrl:
            'https://htsplus.ng/wp-content/uploads/2021/05/star-radler-bottle.png',
        isPopular: true,
        isRecommended: true,
        price: 10500.00),
    const Product(
        name: 'AMSTEL',
        category: 'DRINKS',
        imageUrl:
            'https://pharmacy.marvicanihealth.com/wp-content/uploads/2020/09/amstel-malta-e1544867273907.jpg',
        isPopular: false,
        isRecommended: true,
        price: 10500.00),
    const Product(
        name: 'EGUSI',
        category: 'FOODS',
        imageUrl:
            'https://www.greenspringsschool.com/wp-content/uploads/2018/12/Pounded-Yam-with-Egusi-Soup-1-1024x683.jpg',
        isPopular: false,
        isRecommended: true,
        price: 10500.00),
    const Product(
        name: 'ABACHA AND FISH',
        category: 'FOODS',
        imageUrl:
            'https://21stcenturychronicle.com/wp-content/uploads/2021/11/Abacha-salad-food.jpg',
        isPopular: true,
        isRecommended: false,
        price: 10500.00),
    const Product(
        name: 'NIGERIAN JOLLOF',
        category: 'FOODS',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDCULwlzCtgVmSxnioBclsoI1rgAjK2EcszA&usqp=CAU',
        isPopular: false,
        isRecommended: false,
        price: 10500.00),
    const Product(
        name: 'UGBA',
        category: 'FOODS',
        imageUrl:
            'https://www.nigerianlazychef.com/wp-content/uploads/2019/01/D0C84AA9-26B0-432C-81A1-7E6472623801.jpeg',
        isPopular: true,
        isRecommended: true,
        price: 10500.00),
    const Product(
        name: 'FRIED RICE AND CHICKEN',
        category: 'FOODS',
        imageUrl:
            'https://img-global.cpcdn.com/recipes/a3f5568bcc2d947e/1200x630cq70/photo.jpg',
        isPopular: false,
        isRecommended: true,
        price: 10500.00),
    const Product(
        name: '1ST FLOOR',
        category: 'LODGING',
        imageUrl:
            'https://www.travelstart.com.ng/blog/wp-content/uploads/2015/07/SweetLifeHome-780x518.jpg',
        isPopular: false,
        isRecommended: true,
        price: 10500.00),
    const Product(
        name: '2ND FLOOR',
        category: 'LODGING',
        imageUrl:
            'https://media-cdn.tripadvisor.com/media/vr-splice-j/08/56/0f/9a.jpg',
        isPopular: true,
        isRecommended: false,
        price: 10500.00),
    const Product(
        name: '3RD FLOOR',
        category: 'LODGING',
        imageUrl:
            'https://cf.bstatic.com/xdata/images/hotel/max1024x768/303107648.jpg?k=20601c89a15ea24960e0e61e62b855372b41d6b2f6814d40a519c071bb3a9389&o=&hp=1',
        isPopular: false,
        isRecommended: false,
        price: 10500.00),
    const Product(
        name: '4TH FLOOR',
        category: 'LODGING',
        imageUrl:
            'https://cf.bstatic.com/xdata/images/hotel/max1024x768/409215493.jpg?k=d5042075482deae299f438ec2c6b173afa1c855d62117c4c4c38602774642f89&o=&hp=1',
        isPopular: true,
        isRecommended: true,
        price: 10500.00),
    const Product(
        name: 'BAR ARENA',
        category: 'SPACE FOR RENT',
        imageUrl:
            'https://s26551.pcdn.co/wp-content/uploads/2019/08/IMG_5509.jpg',
        isPopular: false,
        isRecommended: false,
        price: 10500.00),
    const Product(
        name: 'COMPOUND ARENA',
        category: 'SPACE FOR RENT',
        imageUrl:
            'https://media-cdn.tripadvisor.com/media/photo-s/23/55/45/ac/hotel-compound.jpg',
        isPopular: true,
        isRecommended: true,
        price: 10500.00),
  ];
}
