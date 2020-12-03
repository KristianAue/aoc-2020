# Advent of Code - 3rd of December 2020

The puzzles for this day are split into 1.lisp and 2.lisp. Configuration values (the trees in use) are located in the file `trees.txt`. Simply copy your input from advent of code, and paste it in that file to run the puzzles.
```bash
clisp 1.lisp
clisp 2.lisp
```

Please note that the puzzles for this day is using the package `cl-ppcre` installed with quicklisp. It will fail if those packages are not installed correctly. Make sure you have downloaded the quicklisp file structure with this repository (should automatically be done if you pull the repo). This is an unnecessary approach, and I will probably look into making this work better by excluding the quicklisp structure from this repository and building the application with only the necessary packages in the future. This will cause the puzzles to be slower than they probably should be - 1-2 seconds for each one. If and when I have done any changes here, I will update the readme to reflect those changes.

You should get the following in return:
```
Answer to part one: <deducted> 
Answer to part two: <deducted>
```

I wrote this with little time - I will probably go back to make this work better with less code, probably a function. This is currently running with a lot of variables that aren't quite necessary. I will look into this another day.

Enjoy!