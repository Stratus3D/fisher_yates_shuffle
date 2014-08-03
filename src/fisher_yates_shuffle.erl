-module(fisher_yates_shuffle).

-export([shuffle/1]).

-spec shuffle(List :: list()) -> list().

shuffle(List) ->
    % Start with a list of items and a empty list
    do_shuffle(List, []).


-spec do_shuffle(List :: list(), ShuffledList :: list()) -> list().

do_shuffle([], []) ->
    % When the list is empty we simply return an empty list
    [];
do_shuffle([Item], ShuffledList) ->
    % When we only have one item remaining we add it to the result
    % list and return the completed list.
    [Item|ShuffledList];
do_shuffle(List, ShuffledList) ->
    % Calculate length for range
    Len = length(List),

    % Use length to generate a random number, get the item at that
    % index and remove it from the list of unshuffled items.
    Index = random:uniform(Len),
    Item = lists:nth(Index, List),
    RemainingList = lists:delete(Item, List),

    % Process all remaining elements
    do_shuffle(RemainingList, [Item|ShuffledList]).
