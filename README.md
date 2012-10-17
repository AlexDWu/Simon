Simon
=====

CompE 102 Final Projct

Code skeleton would probably look something like this

Main()
{
  setup();
  8bit array pattern;
  for (bpm = 40; bpm < 200; bpm += 20)
  {
    for(patternSize = 1; patternSize <= 8; patternSize++)
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