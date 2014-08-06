An Implementation of the Fisher-Yates Shuffle
=============================================

Stratus3D

**Note: The Fisher-Yates shuffle is very inefficient in Erlang due to the lack of an "Array" type. I created a function (`fisher\_yates\_shuffle:improved\_shuffle/1`) that provides a more efficient way of shuffling lists. Do not use `fisher\_yates\_shuffle:shuffle/1` for anything other than experimentation.**

## Description
A simple implementation of the Fisher-Yates shuffle in Erlang. More information on the Fisher-Yates shuffle is available here: ([http://bost.ocks.org/mike/shuffle/](http://bost.ocks.org/mike/shuffle/)).

## Usage

Simply run `make` to compile the source code. To try out the code on the command line run `erl -pa ebin/`. The Fisher-Yates algorithm is in the `shuffle/1` function:

    1> fisher_yates_shuffle:shuffle([1,2,3,4,5,6,7,8,10,a,b,c,d,e,f]).
    [c,8,b,3,2,6,10,4,d,5,e,f,a,1,7]

The more efficient algorithm is in the `improved_shuffle/1` function:

    2> fisher_yates_shuffle:improved_shuffle([1,2,3,4,5,6,7,8,10,a,b,c,d,e,f]).
    [1,c,b,f,e,3,5,4,6,8,d,7,2,10,a]

## Known Issues
No known issues. If you see something that could be improved feel free to open an issue on GitHub ([https://github.com/Stratus3D/fisher\_yates\_shuffle/issues](https://github.com/Stratus3D/fisher_yates_shuffle/issues))

## Contributing
Feel free to create an issue or pull request if you see something that could be improved.
