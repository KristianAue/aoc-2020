# Advent of Code - 5th of December 2020

The puzzles for this day are split into 1.lisp and 2.lisp. Configuration values (the boarding passes in use) are located in the file `passes.txt`. Simply copy your input from advent of code, and paste it in that file to run the puzzles.
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

I am happy with the code I made today. I will probably change some things with the cl-ppcre package in the future as menitoned above, but other than that I don't think I will change how I went about achieving this. I have started using functions here, which makes things easier to work with. If I were to change something, it would probably be to add functions used by both puzzles in a single file, to make it easier to maintain in the future, but I will probably not go back to change this in the future.

Enjoy!