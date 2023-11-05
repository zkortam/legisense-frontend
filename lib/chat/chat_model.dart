import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_widget.dart' show ChatWidget;
import 'package:flutter/material.dart';

class ChatModel extends FlutterFlowModel<ChatWidget> {
  ///  Local state fields for this page.

  String? inputContent = '';

  dynamic chatHistory;

  String defaultINfo = '0';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Column widget.
  ScrollController? columnController;
  // Stores action output result for [Backend Call - API (Send Full Prompt)] action in Container widget.
  ApiCallResponse? gPTPrompt1;
  // Stores action output result for [Backend Call - API (Send Full Prompt)] action in Container widget.
  ApiCallResponse? chatGPTResponsePrompt2;
  // Stores action output result for [Backend Call - API (Send Full Prompt)] action in Container widget.
  ApiCallResponse? chatGPTResponse3;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Send Full Prompt)] action in TextField widget.
  ApiCallResponse? chatGPTResponseCopy;
  // Stores action output result for [Backend Call - API (Send Full Prompt)] action in TextField widget.
  ApiCallResponse? chatGPTResponseCopy11;
  // Stores action output result for [Backend Call - API (Send Full Prompt)] action in IconButton widget.
  ApiCallResponse? chatGPTResponse;
  // Stores action output result for [Backend Call - API (Send Full Prompt)] action in IconButton widget.
  ApiCallResponse? chatGPTResponseCopy1133;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    listViewController = ScrollController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    columnController?.dispose();
    listViewController?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
