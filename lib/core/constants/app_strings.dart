class AppStrings{

  static const String appName="LearnLeaf";
  static const String course="course";
  static const String review="review";
  static const String user="user";

  static const idType = 'TEXT PRIMARY KEY';
  static const textType = 'TEXT NOT NULL';
  static const boolType = 'INTEGER NOT NULL';
  static const integerType = 'INTEGER NOT NULL';
  static const realType = 'REAL NOT NULL';

  static const textTypeN = 'TEXT';
  static const boolTypeN = 'INTEGER';
  static const integerTypeN = 'INTEGER';
  static const realTypeN = 'REAL';

  static const String id = 'id';
  static const String fullName = 'fullName';
  static const String email = 'email';
  static const String phone = 'phone';
  static const String password = 'password';
  static const String authType = 'authType';
  static const String img = 'img';
  static const String createdAt = 'createdAt';
  static const String updatedAt = 'updatedAt';

  static const String name = 'name';
  static const String description = 'description';
  static const String startDate = 'startDate';
  static const String endDate = 'endDate';
  static const String instructorId = 'instructorId';

  static const String courseId = 'courseId';
  static const String rating = 'rating';
  static const String reviewText = 'reviewText';


  static const String isAuth = 'isAuth';
  static const String credential = 'credential';

  static const String price = 'price';


  static const createUser = '''
CREATE TABLE ${user} (
  $id $textType,
  $fullName $textType,
  $email $textType,
  $phone $textType,
  $password $textType,
  $authType $textType,
  $img $textType,
  $createdAt $textType,
  $updatedAt $textType
  )
''';


  static const createCourse = '''
CREATE TABLE ${course} (
  $id $textType,
  $name $textType,
  $description $textType,
  $price $realType,
  $startDate $textType,
  $endDate $textType,
  $instructorId $textType,
  $img $textType,
  $createdAt $textType,
  $updatedAt $textType,
        FOREIGN KEY ($instructorId) REFERENCES ${user}(id)
  )
''';

  static const createReview = '''
CREATE TABLE ${review} (
  $id $textType,
  $rating $realType,
   $courseId $textType,
  $reviewText $textTypeN,
  $createdAt $textType,
   $updatedAt $textType,
       FOREIGN KEY ($courseId) REFERENCES ${course}(id)
  )
''';


}