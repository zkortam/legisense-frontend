import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start OpenAI ChatGPT Group Code

class OpenAIChatGPTGroup {
  static String baseUrl = 'https://api.openai.com/v1';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static SendFullPromptCall sendFullPromptCall = SendFullPromptCall();
}

class SendFullPromptCall {
  Future<ApiCallResponse> call({
    String? apiKey = '',
    dynamic promptJson,
  }) async {
    final prompt = _serializeJson(promptJson);
    final ffApiRequestBody = '''
{
  "model": "gpt-3.5-turbo",
  "messages": $prompt
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Send Full Prompt',
      apiUrl: '${OpenAIChatGPTGroup.baseUrl}/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End OpenAI ChatGPT Group Code

class QueryCorpusCall {
  static Future<ApiCallResponse> call({
    String? queryVar =
        'i need help with a legal matter pertaining to data in schools what legislation can help me?',
    int? corpusNum = 3,
    int? maxResults = 3,
  }) async {
    final ffApiRequestBody = '''
{
  "query": [
    {
      "query": "$queryVar",
      "start": 0,
      "numResults": 10,
      "contextConfig": {
        "charsBefore": 30,
        "charsAfter": 30,
        "sentencesBefore": 3,
        "sentencesAfter": 3,
        "startTag": "<b>",
        "endTag": "</b>"
      },
      "corpusKey": [
        {
          "customerId": 1236398232,
          "corpusId": $corpusNum,
          "semantics": "DEFAULT",
          "dim": [
            {
              "name": "string",
              "weight": 0
            }
          ],
          "metadataFilter": "part.lang = 'eng'",
          "lexicalInterpolationConfig": {
            "lambda": 0
          }
        }
      ],
      "summary": [
        {
          "summarizerPromptName": "vectara-summary-ext-v1.2.0",
          "maxSummarizedResults": $maxResults,
          "responseLang": "eng"
        }
      ]
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Query Corpus',
      apiUrl: 'https://legisense-backend.onrender.com/v1/query',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic documentName(dynamic response) => getJsonField(
        response,
        r'''$.responseSet[:].document[:].id''',
        true,
      );
  static dynamic summary(dynamic response) => getJsonField(
        response,
        r'''$.responseSet[:].summary[:].text''',
      );
  static dynamic responseSet(dynamic response) => getJsonField(
        response,
        r'''$.responseSet''',
        true,
      );
  static dynamic text(dynamic response) => getJsonField(
        response,
        r'''$.responseSet[:].response[:].text''',
        true,
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
