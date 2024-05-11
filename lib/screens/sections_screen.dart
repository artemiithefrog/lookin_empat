import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lookin_empat/services/section_service.dart';

class SectionsScreen extends StatefulWidget {
  SectionsScreen({super.key, this.onPressedActive = false});

  bool onPressedActive;

  @override
  State<SectionsScreen> createState() => _SectionsScreenState();
}

class _SectionsScreenState extends State<SectionsScreen> {
  static const CROSS_AXIS_COUNT = 3;
  late Function(int) onPressed;

  @override
  void initState() {
    onPressed = (i) => {
          print(i)
          //todo can react to chosen index of section if onPressedActive
        };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double sectionWidth =
        MediaQuery.of(context).size.width / (CROSS_AXIS_COUNT + 1);
    var sections = SectionService.getSections(width: sectionWidth);
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
      child: StaggeredGridView.countBuilder(
        crossAxisCount: CROSS_AXIS_COUNT,
        crossAxisSpacing: 24,
        mainAxisSpacing: 16,
        itemCount: sections.length,
        itemBuilder: (BuildContext context, int index) {
            return sections[index];
        }, staggeredTileBuilder: (int index) {
        return const StaggeredTile.fit(1);
      },
      ),
    );
  }
}
