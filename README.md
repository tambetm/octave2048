octave2048
==========

This is 2048 game clone for Octave/Matlab. Its main use is the study of playing strategies.

How to run one game session:

    >game_random

or

    >game_corner

or

    >game_corner2

or

    >game_greedy

Following runs all algorithms 100 times and produces some diagrams about effectivess of each algorithm:

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
