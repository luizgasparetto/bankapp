import 'package:bankapp/app/core/exports.dart';

class CustomInformationTile extends StatelessWidget {
  final double padding;
  final IconData icon;
  final Future<String?>? futureFunction;
  final void Function()? onPressedLeadingIcon;

  const CustomInformationTile({
    Key? key,
    required this.padding,
    required this.icon,
    required this.futureFunction,
    required this.onPressedLeadingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: padding),
      child: ListTile(
        leading: Icon(
          icon,
          color: Theme.of(context).primaryColorDark,
        ),
        tileColor: Colors.grey.shade300,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: FutureBuilder<String?>(
          future: futureFunction,
          builder: ((context, snapshot) {
            return Text(snapshot.data ?? '');
          }),
        ),
        trailing: IconButton(
          onPressed: onPressedLeadingIcon,
          icon: const Icon(Icons.edit),
        ),
      ),
    );
  }
}
