

import 'package:muslim_taqvim_by_abduaxad/utilits/package.dart';
import 'package:muslim_taqvim_by_abduaxad/utilits/size_config.dart';

class ContainerDecoration extends StatelessWidget {
  ContainerDecoration({
    Key? key,
    required this.child,
    required this.height,
    required this.width,
  }) : super(key: key);

  Widget child;
  double height;
  double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(height),
      width: getWidth(width),
      padding: const EdgeInsets.all(15),
      child: child,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
    );
  }
}
