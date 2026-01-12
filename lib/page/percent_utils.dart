
double calcuatePercent(int wins, int losses) {
  return ((wins / (wins + losses)) * 10000).truncate() / 100;
}

