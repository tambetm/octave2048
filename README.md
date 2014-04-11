octave2048
==========

This is 2048 game clone for Octave/Matlab. Its main use is the study of playing strategies.

How to run one game session:

    >game_random    % choose random move each time

or

    >game_corner    % choose first of UP, RIGHT, DOWN, LEFT, whichever results in change

or

    >game_corner2   % the same as previous, but UP and RIGHT are swapped after each move

or

    >game_greedy    % chooses the move with most points

Following runs all strategies 100 times and produces some diagrams about effectivess of each:

    >game_plot

To run experimental Q-learning strategy:

    >game_qtable

To plot results of 1000 iterations:

    >results = game_qtable(1000);
    >plot(results);

To save/load learned Q-table:

    >global Q;
    >save Q;

    >load Q;

The game was tested in Octave, but probably runs in Matlab as well.
