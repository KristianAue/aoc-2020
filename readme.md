# Advent of Code 2020
This is my answers to [advent of code 2020](https://adventofcode.com/2020).

**SPOILER WARNING:** If you're trying to solve the puzzles yourself, I strongly advice against looking at the files in this repository. You have been warned.

I am writing each puzzle in Lisp. They can be found in `DAY/PUZZLE.lisp`; so `1/1.lisp` corresponds to the 1st puzzle on the 1st of December. The parts are seperated into different files. Configuration files will be imported (typically lists with numbers and such) and can be found easily by reading the readme for the corresponding day.

I will try my best to answer all of the puzzles this year. I am new to Lisp and will probably make some mistakes in my code - this is mainly for fun and a learning experiment for myself. Some things may use algorithms, while other things may be brute forced based on my knowledge and available time.

If you want to run my code, install lisp to your computer (I am too lazy to write a guide here), and run this from the terminal:
```bash
clisp DAY/PUZZLE.lisp
```

Each puzzle will answer the puzzle with the following return text:
```
Answer to part ?: ? 
```

Please note that inputs may need to be changed based on your user account.

Some of the puzzles might use external packages installed with quicklisp. These packages are stored in the quicklisp folder, and might be needed to run specific puzzles. If a puzzle is requiring quicklisp, it will tell you so in the readme file of that day. I know this is not an ideal way to do this - and I will look into ways to make this work better in the future.