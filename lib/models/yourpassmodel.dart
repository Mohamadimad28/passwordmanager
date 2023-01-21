class YourPassWord {
  String image;
  String name;
  String number;

  YourPassWord(this.image, this.name, this.number);

  static List<YourPassWord> yourPasswordList = [
    YourPassWord('assets/images/socials.png', 'Socials', '8'),
    YourPassWord('assets/images/apps.png', 'Apps', '10'),
    YourPassWord('assets/images/card.png', 'Card', '15'),
  ];
}
