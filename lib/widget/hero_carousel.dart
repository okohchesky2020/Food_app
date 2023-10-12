import 'package:flutter/material.dart';

import '../model/model.dart';

class HeroCarousalCard extends StatelessWidget {
  const HeroCarousalCard({Key? key, this.category, this.product})
      : super(key: key);
  final Category? category;
  final Product? product;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/catalog', arguments: category);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                Image.network(
                    product == null ? category!.imageurl : product!.imageUrl,
                    fit: BoxFit.cover,
                    width: 1000.0),
                this.product == null
                    ? Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child: Text(
                              product == null ? category!.name : product!.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(color: Colors.white)),
                        ),
                      )
                    : SizedBox(),
              ],
            )),
      ),
    );
  }
}
