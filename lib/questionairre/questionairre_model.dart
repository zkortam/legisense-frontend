import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'questionairre_widget.dart' show QuestionairreWidget;
import 'package:flutter/material.dart';

class QuestionairreModel extends FlutterFlowModel<QuestionairreWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  // State field(s) for Country widget.
  FocusNode? countryFocusNode;
  TextEditingController? countryController;
  String? Function(BuildContext, String?)? countryControllerValidator;
  // State field(s) for State widget.
  FocusNode? stateFocusNode;
  TextEditingController? stateController;
  String? Function(BuildContext, String?)? stateControllerValidator;
  // State field(s) for County widget.
  FocusNode? countyFocusNode1;
  TextEditingController? countyController1;
  String? Function(BuildContext, String?)? countyController1Validator;
  // State field(s) for County widget.
  FocusNode? countyFocusNode2;
  TextEditingController? countyController2;
  String? Function(BuildContext, String?)? countyController2Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue1;
  FormFieldController<List<String>>? choiceChipsValueController1;
  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue2;
  FormFieldController<List<String>>? choiceChipsValueController2;
  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue3;
  FormFieldController<List<String>>? choiceChipsValueController3;
  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue4;
  FormFieldController<List<String>>? choiceChipsValueController4;
  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue5;
  FormFieldController<List<String>>? choiceChipsValueController5;
  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue6;
  FormFieldController<List<String>>? choiceChipsValueController6;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    nameFocusNode?.dispose();
    nameController?.dispose();

    countryFocusNode?.dispose();
    countryController?.dispose();

    stateFocusNode?.dispose();
    stateController?.dispose();

    countyFocusNode1?.dispose();
    countyController1?.dispose();

    countyFocusNode2?.dispose();
    countyController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
