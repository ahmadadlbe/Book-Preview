import 'package:booklyapp/Features/Home/Data/Models/book_model/book_model.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> urlLaunch(List<BookModel> listModel, int index) async {
  Uri uri = Uri.parse(listModel[index].items[index].volumeInfo.previewLink!);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  }
}
