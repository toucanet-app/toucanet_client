import 'vk_api_exception.dart';

class VKApiEnabledInTestException extends VKApiException
{
  VKApiEnabledInTestException([String message]) :
    super(11, 'In test mode application should be disabled or user should be authorized', message ?? '');
}