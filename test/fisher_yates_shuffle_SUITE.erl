-module(fisher_yates_shuffle_SUITE).

-export([all/0]).
-export([test_shuffle/1]).

all() ->
    [test_shuffle].

test_shuffle(_Config) ->
    List = [1,2,3,4,5,6,7,8,9],

    % should return shuffled results
    fisher_yates_shuffle:shuffle([1,2,3,4,5]).

    % shuffle results should be different each time
    %Result1 = fisher_yates_shuffle:shuffle(List),
    %Result2 = fisher_yates_shuffle:shuffle(List),
    %
    %% shuffle should return all the elements
    %Result3 = fisher_yates_shuffle:shuffle(List),
    %erlang:display(Result3),
    %9 = length(Result3),
    %
    %% should work on lists with one item
    %[1] = fisher_yates_shuffle:shuffle([1]).

