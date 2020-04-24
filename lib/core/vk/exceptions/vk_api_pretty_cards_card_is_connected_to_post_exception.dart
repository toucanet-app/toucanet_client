import 'vk_api_exception.dart';

class VKApiPrettyCardsCardIsConnectedToPostException extends VKApiException
{
  VKApiPrettyCardsCardIsConnectedToPostException([String message]) :
    super(1902, 'Card is connected to post', message ?? '');
}