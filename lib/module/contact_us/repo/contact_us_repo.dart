import 'package:food_portfolio/module/contact_us/models/post_quick_contact_model.dart';

abstract class ContactUsRepo{
  Future<PostQuickContactModel> createQuickContact(Map data);
}