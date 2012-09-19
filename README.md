Simon
=====

CompE 102 Final Projct

Code skeleton would probably look something like this

Main()
{
  for (bpm = 40; bpm < 200; bpm += 20)
  {
    for(patternSize = 1; patternSize <= 8; PatternSize++)
    {
      pattern = generatePattern(PatternSize);
      countdown(bpm);
      display(pattern, bpm);
      if(playreCorrect(pattern))
        continue;
      else
        patterSize--;
  }
}