import 'package:flutter/material.dart';

import '../../../../application/subtitle/model/subtitle_model.dart';

class SpellPrompter extends StatefulWidget {
  SpellPrompter({Key? key, required this.models}) : super(key: key);

  final List<SubtitleModels> models;

  @override
  State<SpellPrompter> createState() => _SpellPrompterState();
}

class _SpellPrompterState extends State<SpellPrompter> {

  // TODO : 
  // We want to countdown a given diff from startTime and endTime in each item in SubtitleModels
  // After it finish just increase the currentIndex

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}