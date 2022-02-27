import 'package:bankapp/app/core/exports.dart';
import 'package:bankapp/app/modules/widgets/custom_buttom.dart';
import 'package:bankapp/app/modules/widgets/custom_information_tile.dart';
import 'package:bankapp/app/shared/repositories/firestore_repository.dart';
import 'package:bankapp/app/shared/services/implementation.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(color: Theme.of(context).primaryColorDark),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColorDark),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Stack(
          children: [
            Container(
              height: height * 0.2,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade700,
              ),
            ),
            GestureDetector(
              child: Container(
                margin: EdgeInsets.only(left: width * 0.35),
                width: double.infinity,
                height: height * 0.08,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor,
                  border: Border.all(
                    color: Theme.of(context).backgroundColor,
                    width: 5,
                  ),
                ),
                child: Icon(
                  Entypo.camera,
                  color: Theme.of(context).backgroundColor,
                ),
              ),
              onTap: () {},
            ),
            Align(
              alignment: Alignment.topCenter,
              child: FutureBuilder<String?>(
                future: GetIt.I<Implementation>().getName(),
                builder: (context, snapshot) {
                  final name = snapshot.data ?? 'Default';
                  return Container(
                    margin: EdgeInsets.only(top: height * 0.04),
                    child: Text(
                      name[0],
                      style: GoogleFonts.lato(
                        fontSize: MediaQuery.of(context).textScaleFactor * 72,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
            CustomInformationTile(
              padding: height * 0.25,
              icon: AntDesign.user,
              futureFunction: GetIt.I<FirestoreRepository>().getName(),
              onPressedLeadingIcon: () {},
            ),
            CustomInformationTile(
              padding: height * 0.34,
              icon: Icons.email_outlined,
              futureFunction: GetIt.I<FirestoreRepository>().getEmail(),
              onPressedLeadingIcon: () {},
            ),
            Container(
              margin: EdgeInsets.only(bottom: height * 0.09),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomButton(
                  text: 'LOGOUT',
                  color: Theme.of(context).primaryColor,
                  fontSize: MediaQuery.of(context).textScaleFactor * 18,
                  textColor: Colors.white,
                  onPressedFunction: () async =>
                      GetIt.I<Implementation>().logout(context),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomButton(
                text: 'DELETE ACCOUNT',
                color: Colors.red,
                fontSize: 18,
                textColor: Colors.white,
                onPressedFunction: () async =>
                    GetIt.I<Implementation>().deleteAccount(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
