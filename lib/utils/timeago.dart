import 'package:timeago/timeago.dart' as timeAgo;

String createTimeAgoString(DateTime postDateTime) {
  final now = DateTime.now();
  final difference = now.difference(postDateTime);
  return timeAgo.format(now.subtract(difference), locale: "ja");
}
