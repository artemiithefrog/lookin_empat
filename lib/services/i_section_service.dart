import '../widgets/section.dart';

abstract class ISectionService {
  List<Section> getSections({
    required double width,
    bool onPressedActive = false,
    Function(int)? onPressed,
  });
}
