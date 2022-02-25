import 'package:bankapp/app/core/exports.dart';
import 'package:bankapp/app/modules/widgets/shimmer/skeleton.dart';

class SkeletonListView extends StatelessWidget {
  const SkeletonListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return ListView.separated(
      itemCount: 8,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Container(
              margin: EdgeInsets.only(right: width * 0.75),
              child: Skeleton(
                child: Container(
                  height: height * 0.09,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: width * 0.25, top: height * 0.02),
              child: Skeleton(
                child: Container(
                  height: height * 0.025,
                  width: width * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: width * 0.25, top: height * 0.06),
              child: Skeleton(
                child: Container(
                  height: height * 0.015,
                  width: width * 0.3,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: width * 0.85, top: height * 0.035),
              child: Skeleton(
                child: Container(
                  height: height * 0.015,
                  width: width * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        );
      },
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}
