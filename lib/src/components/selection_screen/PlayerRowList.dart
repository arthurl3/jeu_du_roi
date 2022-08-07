import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeu_du_roi/src/config/SizeConfig.dart';
import 'package:jeu_du_roi/src/constants/constants.dart' as Constants;
import 'package:jeu_du_roi/src/theme/AppColors.dart';

class PlayerRowList extends StatefulWidget {

  PlayerRowList({Key? key, this.initialCount = 2}) : super(key: key);
  final int initialCount;
  List<TextEditingController> controllersList = <TextEditingController>[];

  @override
  _PlayerRowList createState() => _PlayerRowList();
}

class _PlayerRowList extends State<PlayerRowList> {

  int fieldCount = 0;
  int nextIndex = 0;
  List<TextEditingController> controllers = [];

  // create the list of TextFields, based off the list of TextControllers
  List<Widget> _buildList() {
    int i;
    // fill in keys if the list is not long enough (in case we added one)
    if (controllers.length < fieldCount) {
      for (i = controllers.length; i < fieldCount; i++) {
        controllers.add(TextEditingController());
      }
    }

    i = 0;
    // cycle through the controllers, and recreate each, one per available controller
    return controllers.map<Widget>((TextEditingController controller) {
      int displayNumber = i + 1;
      i++;
      return Padding(
        padding: const EdgeInsets.only(top:5.0),
        child: Center(
          child: SizedBox(
            width: SizeConfig.screenWidth!/1.5,
            height: 40.0,
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.words,
              style: TextStyle(
                fontFamily: GoogleFonts.mulish().fontFamily,
              ),
              maxLength: 10,
              decoration: InputDecoration(
                labelText: "Joueur $displayNumber",
                labelStyle: TextStyle(
                  color: AppColors.labelFontColor,
                  fontSize: 16,
                ),
                counterText: "",
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  iconSize: 25,
                  color: AppColors.removeIcon,
                  onPressed: () {
                    setState(() {
                      fieldCount--;
                      controllers.remove(controller);
                    });
                  },
                ),
              ),
            ),
          ),
        ),
      );
    }).toList(); // convert to a list
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // generate the list of TextFields
    final List<Widget> children = _buildList();

    // append an 'add player' button to the end of the list
    if (children.length < Constants.MAX_PLAYER)children.add(
        Center(
          child: IconButton(
              icon: Icon(Icons.add_circle_rounded),
              iconSize: 35,
              color: Colors.green,
              onPressed: () =>  setState(() {
                fieldCount++;
              }),
      ),
        ),
    );

    // build the ListView
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: children,
    );
  }

  @override
  void initState() {
    super.initState();

    // upon creation, copy the starting count to the current count
    fieldCount = widget.initialCount;
    controllers = widget.controllersList;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didUpdateWidget(PlayerRowList oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
}

