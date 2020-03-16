/*
 * Copyright 2020 Pawan Kumar. All rights reserved.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'package:flutter/material.dart';
import 'package:velocity_x/src/velocity_x_extensions.dart';

class VelocityTwo extends StatelessWidget {
  final String title;
  final double titleFontSize;
  final Color titleColor;
  final String subtitle;
  final TextSpan subtitle2;
  final TextSpan subtitle3;
  final double subtitleFontSize;
  final Color subtitleColor;
  final bool isSubtitleBold;
  final bool isHorizontal;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final int maxLinesSubtitle;

  const VelocityTwo({
    Key key,
    @required this.title,
    this.titleFontSize = 16.0,
    this.titleColor = Colors.black,
    @required this.subtitle,
    this.subtitle2,
    this.subtitle3,
    this.subtitleFontSize = 14.0,
    this.subtitleColor,
    this.isSubtitleBold = false,
    this.isHorizontal = false,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.min,
    this.maxLinesSubtitle = 1,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final list = [
      Text(
        title,
        style: TextStyle(fontSize: titleFontSize, color: titleColor),
      ),
      if (isHorizontal) 8.wBox else 8.hBox,
      Text.rich(
        TextSpan(
          text: subtitle,
          children: [
            subtitle2 ?? const TextSpan(),
            subtitle3 ?? const TextSpan(),
          ],
        ),
        maxLines: maxLinesSubtitle,
        textAlign: TextAlign.justify,
        softWrap: true,
        style: TextStyle(
          fontWeight: isSubtitleBold ? FontWeight.bold : FontWeight.normal,
          fontSize: subtitleFontSize,
          textBaseline: TextBaseline.alphabetic,
          color: subtitleColor,
        ),
      )
    ];
    if (isHorizontal) {
      return Row(
        mainAxisSize: mainAxisSize,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: list,
      );
    } else {
      return Column(
        mainAxisSize: mainAxisSize,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: list,
      );
    }
  }
}

class VelocityTwoColumn extends StatelessWidget {
  final Widget top;
  final Widget bottom;

  const VelocityTwoColumn({Key key, @required this.top, @required this.bottom})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        top,
        10.hBox,
        bottom,
      ],
    );
  }
}

class VelocityTwoRow extends StatelessWidget {
  final Widget left;
  final Widget right;

  const VelocityTwoRow({Key key, @required this.left, @required this.right})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        left,
        10.wBox,
        right,
      ],
    );
  }
}

class VelocityTwoIconColumn extends StatelessWidget {
  final Widget top;
  final Widget bottom;
  final Widget icon;

  const VelocityTwoIconColumn(
      {Key key, @required this.top, @required this.bottom, @required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        top,
        10.hBox,
        Row(
          children: <Widget>[
            icon,
            10.wBox,
            bottom,
          ],
        ),
      ],
    );
  }
}
