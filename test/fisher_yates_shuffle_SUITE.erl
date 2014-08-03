-module(fisher_yates_shuffle_SUITE).

-export([all/0]).
-export([test_shuffle/1]).

all() ->
    [test_shuffle].

test_shuffle(_Config) ->
    List = [1,2,3,4,5,6,7,8,9],

    % should return shuffled results
    Result = fisher_yates_shuffle:shuffle(List),

    % shuffle results should be different each time
    Result1 = fisher_yates_shuffle:shuffle(List),
    Result2 = fisher_yates_shuffle:shuffle(List),

    % shuffle should return all the elements
    9 = length(fisher_yates_shuffle:shuffle(List)),

    % should work on lists with one item
    [1] = fisher_yates_shuffle:shuffle([1]),

    % should work when list contains duplicate items
    [1,1,1] = fisher_yates_shuffle:shuffle([1,1,1]).

