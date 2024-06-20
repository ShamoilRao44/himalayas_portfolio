import 'package:food_portfolio/data/api_service.dart';
import 'package:food_portfolio/data/endpoints.dart';
import 'package:food_portfolio/module/contact_us/models/post_quick_contact_model.dart';
import 'package:food_portfolio/module/contact_us/repo/contact_us_repo.dart';

class ContactUsRepoImpl extends ContactUsRepo{
  ApiService apiService = ApiService();

  @override
  Future<PostQuickContactModel> createQuickContact(Map data) async {
    return postQuickContactModelFromJson(
      await apiService.post(Endpoints.quickContact, data),
    );
  }

}