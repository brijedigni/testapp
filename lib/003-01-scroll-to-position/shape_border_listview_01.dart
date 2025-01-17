import 'package:common/extensions/color_extensions.dart';
import 'package:common/model/shape_border_type.dart';
import 'package:flutter/material.dart';

import '../entity/color_code.dart';
import '../widgets/shaped_button.dart';

class ShapeBorderListView extends StatelessWidget {
  final ValueNotifier<ShapeBorderType?>? shapeBorderTypeNotifier;
  final ValueNotifier<ColorCode?>? colorCodeNotifier;
  final MaterialColor sectionColor;

  const ShapeBorderListView({
    Key? key,
    required this.sectionColor,
    required this.shapeBorderTypeNotifier,
    required this.colorCodeNotifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ShapeBorderType> shapeBorders = ShapeBorderType.values;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            for (int i = 0; i < shapeBorders.length; i++)
              ShapedButton(
                shapeBorderType: shapeBorders[i],
                color: sectionColor,
                onPressed: () {
                  colorCodeNotifier!.value = ColorCode(
                    hexColorCode: sectionColor.toHex(),
                    source: ColorCodeSelectionSource.fromButtonClick,
                  );
                  shapeBorderTypeNotifier!.value = shapeBorders[i];
                },
              )
          ],
        ),
      ),
    );
  }
}
