int checkAnswers(List <String> answers, List <String> chosen) {
  int score = 0;

  for (int i = 0; i < answers.length; i++) {
    if (answers[i] == chosen[i]) {
      score += 1;
    }
  }

  return score;
}