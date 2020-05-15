part of 'vk_api_client.dart';

class VKApiLongPoll {
  Stream stream;

  static final VKApiLongPoll _instance = VKApiLongPoll._();
  VKApiLongPoll._();

  factory VKApiLongPoll() {
    return _instance;
  }

  VKApiLongPoll init(request) {
    stream = IsolateSupervisor().launch(
      VKApiLongPoll._longpollWorker,
      VKApiLongPollArguments(request),
    );
    return this;
  }

  static Stream<Map> _longpollWorker(IsolateContext context) async* {
    print('init2');
    final params = (context.args as VKApiLongPollArguments);
    final apiClient = params.request;

    final serverResponse = await apiClient.execute(
        'messages.getLongPollServer', {'need_pts': 1, 'lp_version': 3});

    final longpollServer =
        VKLongPollServer.fromJson(serverResponse.body['response']);

    final ts = longpollServer.ts;
    int newPts = 0;

    while (true) {
      print('1');
      try {
        final history = await apiClient.execute(
            //TODO: Таймаут сервера
            'messages.getLongPollHistory',
            {'ts': '$ts', 'pts': '$newPts', 'lp_version': '3'});

        if (history.body['response'] != null) {
          newPts = history.body['response']['new_pts'] ?? newPts;

          for (final message in history.body['response']['messages']['items']) {
            yield message;
          }
        }
      } catch (error) {
        print(error);
      }

      await Future.delayed(Duration(milliseconds: params.connectTimeout));
    }
  }
}

class VKApiLongPollArguments {
  final VKApiRequest request;

  final int retryAttempts = 3;
  final int connectTimeout = 15000;

  VKApiLongPollArguments(this.request);
}
