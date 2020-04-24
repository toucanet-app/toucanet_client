import 'vk_api_exception.dart';

class VKApiLongPollException extends VKApiException
{
  VKApiLongPollException([String message]) :
    super(2100, 'LongPoll is not available for this group', message ?? '');
}