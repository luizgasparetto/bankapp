import 'package:bankapp/app/shared/core/exports.dart';

class PixPage extends StatelessWidget {
  const PixPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pix Page'),
      ),
      body: const Center(
        child: Text('Pix'),
      ),
    );
  }
}
