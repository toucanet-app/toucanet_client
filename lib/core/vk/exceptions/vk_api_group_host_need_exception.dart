import 'vk_api_exception.dart';

class VKApiGroupHostNeed2faException extends VKApiException
{
  VKApiGroupHostNeed2faException([String message]) :
    super(704, 'User needs to enable 2FA for this action', message ?? '');
}