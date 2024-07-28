abstract class ApiInterface {
  static const baseUrl = "http://86.38.204.199:8100/";

  Future post(url, data);
  Future delete(url, data);
  Future put(url, data);
  Future get(url);
}
