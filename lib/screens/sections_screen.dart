import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lookin_empat/repositories/section_repository.dart';
import 'package:lookin_empat/services/section_service.dart';

import '../models/logger.dart';
import '../services/i_section_service.dart';

class SectionsScreen extends StatefulWidget {
  SectionsScreen({super.key, this.onPressedActive = false, this.onPressed}) {
    assert(!onPressedActive || onPressedActive && onPressed != null);
  }

  bool onPressedActive;
  Function(int)? onPressed;

  @override
  State<SectionsScreen> createState() => _SectionsScreenState();
}

class _SectionsScreenState extends State<SectionsScreen> {
  static const CROSS_AXIS_COUNT = 3;
  late ISectionService _sectionService;

  @override
  void initState() {
    _sectionService = SectionService(SectionRepository());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double sectionWidth =
        MediaQuery.of(context).size.width / (CROSS_AXIS_COUNT + 1);
    var sections = _sectionService.getSections(
        width: sectionWidth,
        onPressed: widget.onPressedActive
            ? widget.onPressed
            : (i) => {
                  // todo delete logger
                  Logger.log("default onPressed, id: $i")
                });
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
      child: StaggeredGridView.countBuilder(
        crossAxisCount: CROSS_AXIS_COUNT,
        crossAxisSpacing: 24,
        mainAxisSpacing: 16,
        itemCount: sections.length,
        itemBuilder: (BuildContext context, int index) {
          return sections[index];
        },
        staggeredTileBuilder: (int index) {
          return const StaggeredTile.fit(1);
        },
      ),
    );
  }
}
