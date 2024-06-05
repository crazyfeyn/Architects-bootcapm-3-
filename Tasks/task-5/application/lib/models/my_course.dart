class CourseModel {
    final String description;
    final String imageUrl;
    final Lessons lessons;
    final double price;
    final String title;

    CourseModel({
        required this.description,
        required this.imageUrl,
        required this.lessons,
        required this.price,
        required this.title,
    });

    factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
        description: json["description"],
        imageUrl: json["imageUrl"],
        lessons: Lessons.fromJson(json["lessons"]),
        price: json["price"]?.toDouble(),
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "description": description,
        "imageUrl": imageUrl,
        "lessons": lessons.toJson(),
        "price": price,
        "title": title,
    };
}

class Lessons {
    final Lesson1 lesson1;

    Lessons({
        required this.lesson1,
    });

    factory Lessons.fromJson(Map<String, dynamic> json) => Lessons(
        lesson1: Lesson1.fromJson(json["lesson1"]),
    );

    Map<String, dynamic> toJson() => {
        "lesson1": lesson1.toJson(),
    };
}

class Lesson1 {
    final String courseSeld;
    final String description;
    final String id;
    final Quizes quizes;
    final String title;
    final String videoUrl;

    Lesson1({
        required this.courseSeld,
        required this.description,
        required this.id,
        required this.quizes,
        required this.title,
        required this.videoUrl,
    });

    factory Lesson1.fromJson(Map<String, dynamic> json) => Lesson1(
        courseSeld: json["courseSeld"],
        description: json["description"],
        id: json["id"],
        quizes: Quizes.fromJson(json["quizes"]),
        title: json["title"],
        videoUrl: json["videoUrl"],
    );

    Map<String, dynamic> toJson() => {
        "courseSeld": courseSeld,
        "description": description,
        "id": id,
        "quizes": quizes.toJson(),
        "title": title,
        "videoUrl": videoUrl,
    };
}

class Quizes {
    final Quiz1 quiz1;

    Quizes({
        required this.quiz1,
    });

    factory Quizes.fromJson(Map<String, dynamic> json) => Quizes(
        quiz1: Quiz1.fromJson(json["quiz1"]),
    );

    Map<String, dynamic> toJson() => {
        "quiz1": quiz1.toJson(),
    };
}

class Quiz1 {
    final int correctOptionIndex;
    final String id;
    final List<int> options;
    final String question;

    Quiz1({
        required this.correctOptionIndex,
        required this.id,
        required this.options,
        required this.question,
    });

    factory Quiz1.fromJson(Map<String, dynamic> json) => Quiz1(
        correctOptionIndex: json["correctOptionIndex"],
        id: json["id"],
        options: List<int>.from(json["options"].map((x) => x)),
        question: json["question"],
    );

    Map<String, dynamic> toJson() => {
        "correctOptionIndex": correctOptionIndex,
        "id": id,
        "options": List<dynamic>.from(options.map((x) => x)),
        "question": question,
    };
}
