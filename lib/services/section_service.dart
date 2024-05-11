import 'package:lookin_empat/repositories/section_repository.dart';
import '../widgets/section.dart';

class SectionService {
  static List<Section> getSections({
    required double width,
    bool onPressedActive = false,
    Function(int)? onPressed,
  }) {

    if (SectionRepository.sectionDTOs == null) {
      SectionRepository.initialiseSections();
    }

    return SectionRepository.sectionDTOs!
        .map(
          (dto) => Section(
            sectionDTO: dto,
            onPressed: onPressed ?? (int) => {},
            width: width,
          ),
        )
        .toList();
  }
}
