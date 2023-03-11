import 'package:store/constants.dart';
import 'package:flutter/material.dart';


class Navigation extends StatelessWidget {
  const Navigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhiteColor,
      width: double.infinity,
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints(
              maxWidth: kMaxWidth,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      const Text(
                        "company name",
                        textScaleFactor: 1.6,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      const WebMenu(),
                      const Spacer(),
                      IconButton(onPressed: (){}, icon: const Icon(Icons.search,color: kDarkGreyColor,size: 25,),),
                      IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart_outlined,color: kDarkGreyColor,size: 25,),),
                      IconButton(onPressed: (){}, icon: const Icon(Icons.person_outline,color: kDarkGreyColor,size: 25,),),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WebMenu extends StatelessWidget {
  const WebMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MenuItems(title: 'Home', press: () {},isActive: true,),
        MenuItems(title: 'Products', press: () {}),
        MenuItems(title: 'Categories', press: () {}),
        MenuItems(title: 'Contact us', press: () {}),
      ],
    );
  }
}

class MenuItems extends StatefulWidget {
  final String title;
  final VoidCallback press;
  final bool isActive;
  const MenuItems({super.key, required this.title, required this.press, this.isActive=false});

  @override
  State<MenuItems> createState() => _MenuItemsState();
}

class _MenuItemsState extends State<MenuItems> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: widget.press,
        onHover: (val) {
          setState(() {
            isHover = val;
          });
        },
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: widget.isActive==true? kPrimaryColor:isHover ? kPrimaryColor : Colors.transparent,
                        width: 1))),
            child: Text(
              widget.title,
              style: TextStyle(
                fontWeight: widget.isActive==true? FontWeight.bold: isHover? FontWeight.bold:FontWeight.normal,
                fontSize: 18,
                color: widget.isActive==true? kPrimaryColor: isHover? kPrimaryColor.withOpacity(0.5) : Colors.black,
              ),
            )),
      ),
    );
  }
}
