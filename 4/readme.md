# Advent of Code - 4th of December 2020

The puzzles for this day are split into 1.lisp and 2.lisp. Configuration values (the passports in use) are located in the file `passports.txt`. Simply copy your input from advent of code, and paste it in that file to run the puzzles.
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

This code can be improved, especially in part 2. I am using regex, but there are a few forced if statements to make the code look better which can easily be changed into one. This will make the code easier to maintain in the future. I will look into possibilities to change this in the future.

All regex used are located in `scanners.lisp`

Enjoy!