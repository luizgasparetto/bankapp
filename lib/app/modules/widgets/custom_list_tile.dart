import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.title,
    this.subtitle,
    this.subtitleText = '',
    this.onPressedFunction,
    //required this.height,
  }) : super(key: key);

  //final double height;
  final String title;
  final Widget? subtitle;
  final String subtitleText;
  final Function()? onPressedFunction;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          title: Text(
            title,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          subtitle: subtitle ??
              Text(
                subtitleText,
                style: TextStyle(fontSize: height * 0.028, color: Colors.black),
              ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      onTap: onPressedFunction ?? () {},
    );
  }
}
