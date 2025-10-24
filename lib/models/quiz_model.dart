class QuizModel {
  String id;
  String question;
  List <String> options;
  String answer;

  QuizModel({
    required this.id, 
    required this.question, 
    required this.options, 
    required this.answer
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
    id: json['_id'],
    question: json['question'],
    options: List<String>.from(json['options']),
    answer: json['answer']
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "question": question,
    "options": List<String>.from(options.map((x) => x)),
    "answer": answer
  };
}