import 'package:flutter/material.dart';
import '../models/section_dto.dart';

class SectionRepository {
  static int staticIdCounter = 1;
  static List<SectionDTO>? sectionDTOs;

  static const String iconPathBase = 'lib/assets/icons/section/';
  static const double defaultWidth = 50;

  static SectionDTO errorDTO = SectionDTO(
    id: 0,
    color: Colors.red,
    name: "Error",
    iconData: Icons.error
  );

  static List<SectionDTO> initialiseSections() {
    var temp = [
      SectionDTO(
        id: staticIdCounter++,
        color: Colors.yellow,
        name: 'T-shirts',
        svgIconPath: '${iconPathBase}t-shirt.svg',
      ),
      SectionDTO(
        id: staticIdCounter++,
        color: Colors.green,
        name: 'Shorts',
        svgIconPath: '${iconPathBase}shorts.svg',
      ),
      SectionDTO(
        id: staticIdCounter++,
        color: Colors.red,
        name: 'Caps',
        svgIconPath: '${iconPathBase}cap.svg',
      ),
      SectionDTO(
        id: staticIdCounter++,
        color: Colors.blue,
        name: 'Caps',
        svgIconPath: '${iconPathBase}beanie.svg',
      ),
      SectionDTO(
        id: staticIdCounter++,
        color: Colors.yellow,
        name: 'Caps',
        svgIconPath: '${iconPathBase}blouse.svg',
      ),
    ];
    sectionDTOs = [];
    sectionDTOs!.addAll(temp);
    return sectionDTOs!;
  }

  static SectionDTO? getByID(int id) {
    if(sectionDTOs == null) {
      return null;
    }

    for (SectionDTO section in sectionDTOs!) {
      if (section.id == id) {
        return section;
      }
    }
    return null;
  }

  static SectionDTO getByIndex(int i) {
    if(sectionDTOs == null) {
      return errorDTO;
    }

    if (i < sectionDTOs!.length) {
      return sectionDTOs![i];
    }

    return errorDTO;
  }
}
