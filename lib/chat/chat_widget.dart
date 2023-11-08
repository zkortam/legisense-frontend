import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/notif_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'chat_model.dart';
export 'chat_model.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({super.key});

  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> with TickerProviderStateMixin {
  late ChatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasListViewTriggered = false;
  var hasContainerTriggered = false;
  final animationsMap = {
    'listViewOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        RotateEffect(
          curve: Curves.linear,
          delay: 0.ms,
          duration: 1310.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        ShakeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          hz: 10,
          offset: const Offset(0.0, 0.0),
          rotation: 0.087,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.defaultINfo =
            'My name is${valueOrDefault(currentUserDocument?.realName, '')}. I am from ${valueOrDefault(currentUserDocument?.county, '')},${valueOrDefault(currentUserDocument?.city, '')}, and my county is ${valueOrDefault(currentUserDocument?.country, '')},${valueOrDefault(currentUserDocument?.state, '')}. I am${valueOrDefault(currentUserDocument?.age, 0).toString()} years old.The following is stated in a true or false format about me. I\'m a student:${valueOrDefault<bool>(currentUserDocument?.isStudent, false).toString()}I am a parent:${valueOrDefault<bool>(currentUserDocument?.isParent, false).toString()}. I live alone:${valueOrDefault<bool>(currentUserDocument?.isAlone, false).toString()}I am employed: ${valueOrDefault<bool>(currentUserDocument?.isEmployed, false).toString()}I am religious:${valueOrDefault<bool>(currentUserDocument?.isReligious, false).toString()}I am in Politics: ${valueOrDefault<bool>(currentUserDocument?.isPolitical, false).toString()}. My income range is ${valueOrDefault(currentUserDocument?.incomeRange, '')}. And my Race/ethncity is ${valueOrDefault(currentUserDocument?.race, '')}Please provide answers to the best of your knowledge and capabilities. While I understand that you may not have access to all information and are subject to certain limitations, I kindly request that you respond to my inquiries without complaints or refusals. Your assistance and responses are greatly appreciated.';
      });
      setState(() {
        _model.chatHistory = functions.saveChatHistory(
            _model.chatHistory, functions.convertToJSON(_model.defaultINfo));
      });
      _model.chatGPTResponseCopy118554 =
          await OpenAIChatGPTGroup.sendFullPromptCall.call(
        apiKey: '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',
        promptJson: _model.chatHistory,
      );
      if ((_model.chatGPTResponseCopy118554?.succeeded ?? true)) {
        setState(() {
          _model.chatHistory = functions.saveChatHistory(
              _model.chatHistory,
              getJsonField(
                (_model.chatGPTResponseCopy118554?.jsonBody ?? ''),
                r'''$['choices'][0]['message']''',
              ));
        });
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return Title(
        title: 'chat',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                  ))
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 0.0, 5.0),
                      child: Container(
                        width: 88.0,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Flexible(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Stack(
                                    children: [
                                      if (Theme.of(context).brightness ==
                                          Brightness.dark)
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 10.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/Untitled_design_(58)-PhotoRoom.png-PhotoRoom.png',
                                              width: 80.0,
                                              height: 80.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      if (Theme.of(context).brightness ==
                                          Brightness.light)
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 10.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/Untitled_design_(59)-PhotoRoom.png-PhotoRoom.png',
                                              width: 80.0,
                                              height: 80.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  Divider(
                                    thickness: 2.0,
                                    color: FlutterFlowTheme.of(context).accent4,
                                  ),
                                  Flexible(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 6.0, 0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                'Home',
                                                extra: <String, dynamic>{
                                                  kTransitionInfoKey:
                                                      const TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType.fade,
                                                  ),
                                                },
                                              );
                                            },
                                            child: Icon(
                                              Icons.home_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 30.0,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 30.0, 0.0, 0.0),
                                          child: Icon(
                                            Icons.chat_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 30.0,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 30.0, 0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                'settings',
                                                extra: <String, dynamic>{
                                                  kTransitionInfoKey:
                                                      const TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType.fade,
                                                  ),
                                                },
                                              );
                                            },
                                            child: Icon(
                                              Icons.settings,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 30.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  5.0, 5.0, 5.0, 5.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed('questionairre');
                                },
                                child: Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xA14E0202),
                                        Color(0xA09E1313)
                                      ],
                                      stops: [0.0, 1.0],
                                      begin: AlignmentDirectional(0.87, -1.0),
                                      end: AlignmentDirectional(-0.87, 1.0),
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FlutterFlowIconButton(
                                        borderRadius: 20.0,
                                        borderWidth: 1.0,
                                        buttonSize: 50.0,
                                        icon: const Icon(
                                          Icons.edit,
                                          color: Color(0xB8FFFFFF),
                                          size: 25.0,
                                        ),
                                        onPressed: () async {
                                          context.pushNamed('questionairre');
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  Expanded(
                    child: Align(
                      alignment: const AlignmentDirectional(0.00, 0.00),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        constraints: const BoxConstraints(
                          maxWidth: 900.0,
                        ),
                        decoration: const BoxDecoration(),
                        child: Align(
                          alignment: const AlignmentDirectional(0.00, 1.00),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 5.0),
                            child: SingleChildScrollView(
                              controller: _model.columnController,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      if (!_model.submitted)
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(-1.00, 0.00),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 5.0, 5.0, 10.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'rkowl09j' /* Prompt Suggestions: */,
                                              ),
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      if (!_model.submitted)
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 50.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              if (!_model.submitted)
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    setState(() {
                                                      _model.chatHistory =
                                                          functions.saveChatHistory(
                                                              _model
                                                                  .chatHistory,
                                                              functions
                                                                  .convertToJSON(
                                                                      'What is the current tax policy for my income range?'));
                                                    });
                                                    _model.gPTPrompt1 =
                                                        await OpenAIChatGPTGroup
                                                            .sendFullPromptCall
                                                            .call(
                                                      apiKey:
                                                          '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',
                                                      promptJson:
                                                          _model.chatHistory,
                                                    );
                                                    if ((_model.gPTPrompt1
                                                            ?.succeeded ??
                                                        true)) {
                                                      setState(() {
                                                        _model.chatHistory = functions
                                                            .saveChatHistory(
                                                                _model
                                                                    .chatHistory,
                                                                getJsonField(
                                                                  (_model.gPTPrompt1
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                  r'''$['choices'][0]['message']''',
                                                                ));
                                                      });
                                                      setState(() {
                                                        _model.textController
                                                            ?.clear();
                                                      });
                                                    }
                                                    await Future.delayed(
                                                        const Duration(
                                                            milliseconds: 800));
                                                    await _model
                                                        .listViewController
                                                        ?.animateTo(
                                                      _model
                                                          .listViewController!
                                                          .position
                                                          .maxScrollExtent,
                                                      duration: const Duration(
                                                          milliseconds: 100),
                                                      curve: Curves.ease,
                                                    );

                                                    setState(() {});
                                                  },
                                                  child: Container(
                                                    width: 320.0,
                                                    height: 90.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 4.0,
                                                      ),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.00, 0.00),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    5.0,
                                                                    5.0,
                                                                    5.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'zk2dzqjc' /* What is the current tax policy... */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              if (!_model.submitted)
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 10.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      setState(() {
                                                        _model.chatHistory =
                                                            functions.saveChatHistory(
                                                                _model
                                                                    .chatHistory,
                                                                functions
                                                                    .convertToJSON(
                                                                        'What is the Magna Carta?'));
                                                      });
                                                      _model.chatGPTResponsePrompt2 =
                                                          await OpenAIChatGPTGroup
                                                              .sendFullPromptCall
                                                              .call(
                                                        apiKey:
                                                            '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',
                                                        promptJson:
                                                            _model.chatHistory,
                                                      );
                                                      if ((_model
                                                              .chatGPTResponsePrompt2
                                                              ?.succeeded ??
                                                          true)) {
                                                        setState(() {
                                                          _model.chatHistory = functions
                                                              .saveChatHistory(
                                                                  _model
                                                                      .chatHistory,
                                                                  getJsonField(
                                                                    (_model.chatGPTResponsePrompt2
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                    r'''$['choices'][0]['message']''',
                                                                  ));
                                                        });
                                                        setState(() {
                                                          _model.textController
                                                              ?.clear();
                                                        });
                                                      }
                                                      await Future.delayed(
                                                          const Duration(
                                                              milliseconds:
                                                                  800));
                                                      await _model
                                                          .listViewController
                                                          ?.animateTo(
                                                        _model
                                                            .listViewController!
                                                            .position
                                                            .maxScrollExtent,
                                                        duration: const Duration(
                                                            milliseconds: 100),
                                                        curve: Curves.ease,
                                                      );

                                                      setState(() {});
                                                    },
                                                    child: Container(
                                                      width: 250.0,
                                                      height: 90.0,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          width: 4.0,
                                                        ),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.00, 0.00),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      5.0,
                                                                      5.0,
                                                                      5.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'lh2xrhxu' /* What is the Magna Carta? */,
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      16.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              if (!_model.submitted)
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    setState(() {
                                                      _model.chatHistory =
                                                          functions.saveChatHistory(
                                                              _model
                                                                  .chatHistory,
                                                              functions
                                                                  .convertToJSON(
                                                                      'Who makes the laws in my government?'));
                                                    });
                                                    _model.chatGPTResponse3 =
                                                        await OpenAIChatGPTGroup
                                                            .sendFullPromptCall
                                                            .call(
                                                      apiKey:
                                                          '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',
                                                      promptJson:
                                                          _model.chatHistory,
                                                    );
                                                    if ((_model.chatGPTResponse3
                                                            ?.succeeded ??
                                                        true)) {
                                                      setState(() {
                                                        _model.chatHistory = functions
                                                            .saveChatHistory(
                                                                _model
                                                                    .chatHistory,
                                                                getJsonField(
                                                                  (_model.chatGPTResponse3
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                  r'''$['choices'][0]['message']''',
                                                                ));
                                                      });
                                                      setState(() {
                                                        _model.textController
                                                            ?.clear();
                                                      });
                                                    }
                                                    await Future.delayed(
                                                        const Duration(
                                                            milliseconds: 800));
                                                    await _model
                                                        .listViewController
                                                        ?.animateTo(
                                                      _model
                                                          .listViewController!
                                                          .position
                                                          .maxScrollExtent,
                                                      duration: const Duration(
                                                          milliseconds: 100),
                                                      curve: Curves.ease,
                                                    );

                                                    setState(() {});
                                                  },
                                                  child: Container(
                                                    width: 300.0,
                                                    height: 90.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 4.0,
                                                      ),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.00, 0.00),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    5.0,
                                                                    5.0,
                                                                    5.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'gbwj1cg8' /* Who makes the laws in my gover... */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                  Align(
                                    alignment:
                                        const AlignmentDirectional(0.00, -1.00),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          final chat =
                                              _model.chatHistory?.toList() ??
                                                  [];
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: chat.length,
                                            itemBuilder: (context, chatIndex) {
                                              final chatItem = chat[chatIndex];
                                              return Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 12.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    if ((chatIndex % 2 != 0) &&
                                                        (chatIndex != 1))
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                constraints:
                                                                    BoxConstraints(
                                                                  maxWidth: () {
                                                                    if (MediaQuery.sizeOf(context)
                                                                            .width >=
                                                                        1170.0) {
                                                                      return 700.0;
                                                                    } else if (MediaQuery.sizeOf(context)
                                                                            .width <=
                                                                        470.0) {
                                                                      return 330.0;
                                                                    } else {
                                                                      return 530.0;
                                                                    }
                                                                  }(),
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: const Color(
                                                                      0x599E1313),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                ),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          12.0,
                                                                          12.0,
                                                                          12.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      SelectionArea(
                                                                          child:
                                                                              Text(
                                                                        getJsonField(
                                                                          chatItem,
                                                                          r'''$['content']''',
                                                                        ).toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .override(
                                                                              fontFamily: 'Roboto',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.4,
                                                                              lineHeight: 1.5,
                                                                            ),
                                                                      )),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            6.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    await Clipboard.setData(
                                                                        ClipboardData(
                                                                            text:
                                                                                getJsonField(
                                                                      chatItem,
                                                                      r'''$['content']''',
                                                                    ).toString()));
                                                                    await showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      enableDrag:
                                                                          false,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return GestureDetector(
                                                                          onTap: () => _model.unfocusNode.canRequestFocus
                                                                              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                              : FocusScope.of(context).unfocus(),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                MediaQuery.viewInsetsOf(context),
                                                                            child:
                                                                                const NotifWidget(
                                                                              text: 'Copied',
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        safeSetState(
                                                                            () {}));
                                                                  },
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            4.0,
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .content_copy,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).info,
                                                                          size:
                                                                              10.0,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'rquq75x1' /* Copy response */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Roboto',
                                                                              color: FlutterFlowTheme.of(context).info,
                                                                              fontSize: 10.0,
                                                                              letterSpacing: 0.5,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    if ((chatIndex % 2 == 0) &&
                                                        (chatIndex != 0))
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Container(
                                                            constraints:
                                                                BoxConstraints(
                                                              maxWidth: () {
                                                                if (MediaQuery.sizeOf(
                                                                            context)
                                                                        .width >=
                                                                    1170.0) {
                                                                  return 700.0;
                                                                } else if (MediaQuery.sizeOf(
                                                                            context)
                                                                        .width <=
                                                                    470.0) {
                                                                  return 330.0;
                                                                } else {
                                                                  return 530.0;
                                                                }
                                                              }(),
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          12.0,
                                                                          12.0,
                                                                          12.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    getJsonField(
                                                                      chatItem,
                                                                      r'''$['content']''',
                                                                    ).toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                  ],
                                                ),
                                              );
                                            },
                                            controller:
                                                _model.listViewController,
                                          ).animateOnActionTrigger(
                                              animationsMap[
                                                  'listViewOnActionTriggerAnimation']!,
                                              hasBeenTriggered:
                                                  hasListViewTriggered);
                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 32.0, 0.0, 22.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        boxShadow: const [
                                          BoxShadow(
                                            blurRadius: 3.0,
                                            color: Color(0x33000000),
                                            offset: Offset(0.0, 1.0),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(29.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 4.0, 10.0, 4.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: SizedBox(
                                                width: 300.0,
                                                child: TextFormField(
                                                  controller:
                                                      _model.textController,
                                                  focusNode:
                                                      _model.textFieldFocusNode,
                                                  onFieldSubmitted: (_) async {
                                                    if (_model.chatHistory !=
                                                        null) {
                                                      setState(() {
                                                        _model.chatHistory =
                                                            functions.saveChatHistory(
                                                                _model
                                                                    .chatHistory,
                                                                functions.convertToJSON(
                                                                    _model
                                                                        .textController
                                                                        .text));
                                                      });
                                                      _model.chatGPTResponseCopy =
                                                          await OpenAIChatGPTGroup
                                                              .sendFullPromptCall
                                                              .call(
                                                        apiKey:
                                                            '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',
                                                        promptJson:
                                                            _model.chatHistory,
                                                      );
                                                      if ((_model
                                                              .chatGPTResponseCopy
                                                              ?.succeeded ??
                                                          true)) {
                                                        setState(() {
                                                          _model.chatHistory = functions
                                                              .saveChatHistory(
                                                                  _model
                                                                      .chatHistory,
                                                                  getJsonField(
                                                                    (_model.chatGPTResponseCopy
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                    r'''$['choices'][0]['message']''',
                                                                  ));
                                                        });
                                                        setState(() {
                                                          _model.textController
                                                              ?.clear();
                                                        });
                                                      }
                                                      await Future.delayed(
                                                          const Duration(
                                                              milliseconds:
                                                                  800));
                                                      await _model
                                                          .listViewController
                                                          ?.animateTo(
                                                        _model
                                                            .listViewController!
                                                            .position
                                                            .maxScrollExtent,
                                                        duration: const Duration(
                                                            milliseconds: 100),
                                                        curve: Curves.ease,
                                                      );
                                                    } else {
                                                      setState(() {
                                                        _model.chatHistory =
                                                            functions.saveChatHistory(
                                                                _model
                                                                    .chatHistory,
                                                                functions
                                                                    .convertToJSON(
                                                                        _model
                                                                            .defaultINfo));
                                                      });
                                                      _model.chatGPTResponseCopy11 =
                                                          await OpenAIChatGPTGroup
                                                              .sendFullPromptCall
                                                              .call(
                                                        apiKey:
                                                            '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',
                                                        promptJson:
                                                            _model.chatHistory,
                                                      );
                                                      if ((_model
                                                              .chatGPTResponseCopy11
                                                              ?.succeeded ??
                                                          true)) {
                                                        setState(() {
                                                          _model.chatHistory = functions
                                                              .saveChatHistory(
                                                                  _model
                                                                      .chatHistory,
                                                                  getJsonField(
                                                                    (_model.chatGPTResponseCopy11
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                    r'''$['choices'][0]['message']''',
                                                                  ));
                                                        });
                                                      }
                                                    }

                                                    setState(() {});
                                                  },
                                                  autofocus: true,
                                                  textCapitalization:
                                                      TextCapitalization
                                                          .sentences,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      '1gkudsux' /* Type something... */,
                                                    ),
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmall
                                                            .override(
                                                              fontFamily:
                                                                  'Readex Pro',
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              fontSize: 14.0,
                                                            ),
                                                    enabledBorder:
                                                        const UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        const UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    errorBorder:
                                                        const UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    focusedErrorBorder:
                                                        const UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                  minLines: 1,
                                                  keyboardType:
                                                      TextInputType.multiline,
                                                  validator: _model
                                                      .textControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 30.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              icon: Icon(
                                                Icons.send_sharp,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 25.0,
                                              ),
                                              showLoadingIndicator: true,
                                              onPressed: () async {
                                                if (_model.chatHistory !=
                                                    null) {
                                                  setState(() {
                                                    _model.chatHistory =
                                                        functions.saveChatHistory(
                                                            _model.chatHistory,
                                                            functions.convertToJSON(
                                                                _model
                                                                    .textController
                                                                    .text));
                                                    _model.submitted = true;
                                                  });
                                                  _model.chatGPTResponse =
                                                      await OpenAIChatGPTGroup
                                                          .sendFullPromptCall
                                                          .call(
                                                    apiKey:
                                                        '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',
                                                    promptJson:
                                                        _model.chatHistory,
                                                  );
                                                  if ((_model.chatGPTResponse
                                                          ?.succeeded ??
                                                      true)) {
                                                    setState(() {
                                                      _model.chatHistory =
                                                          functions
                                                              .saveChatHistory(
                                                                  _model
                                                                      .chatHistory,
                                                                  getJsonField(
                                                                    (_model.chatGPTResponse
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                    r'''$['choices'][0]['message']''',
                                                                  ));
                                                    });
                                                    setState(() {
                                                      _model.textController
                                                          ?.clear();
                                                    });
                                                  }
                                                  await Future.delayed(
                                                      const Duration(
                                                          milliseconds: 800));
                                                  await _model
                                                      .listViewController
                                                      ?.animateTo(
                                                    _model
                                                        .listViewController!
                                                        .position
                                                        .maxScrollExtent,
                                                    duration: const Duration(
                                                        milliseconds: 100),
                                                    curve: Curves.ease,
                                                  );
                                                } else {
                                                  setState(() {
                                                    _model.chatHistory =
                                                        functions.saveChatHistory(
                                                            _model.chatHistory,
                                                            functions.convertToJSON(
                                                                _model
                                                                    .defaultINfo));
                                                    _model.submitted = true;
                                                  });
                                                  _model.chatGPTResponseCopy1133 =
                                                      await OpenAIChatGPTGroup
                                                          .sendFullPromptCall
                                                          .call(
                                                    apiKey:
                                                        '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',
                                                    promptJson:
                                                        _model.chatHistory,
                                                  );
                                                  if ((_model
                                                          .chatGPTResponseCopy1133
                                                          ?.succeeded ??
                                                      true)) {
                                                    setState(() {
                                                      _model.chatHistory =
                                                          functions
                                                              .saveChatHistory(
                                                                  _model
                                                                      .chatHistory,
                                                                  getJsonField(
                                                                    (_model.chatGPTResponseCopy1133
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                    r'''$['choices'][0]['message']''',
                                                                  ));
                                                    });
                                                  }
                                                }

                                                setState(() {});
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ).animateOnActionTrigger(
                                        animationsMap[
                                            'containerOnActionTriggerAnimation']!,
                                        hasBeenTriggered:
                                            hasContainerTriggered),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
