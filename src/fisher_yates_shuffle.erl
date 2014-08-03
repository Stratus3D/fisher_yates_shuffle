-module(fisher_yates_shuffle).

-behaviour(application).

-export([start/2, stop/1]).
-export([shuffle/1]).


%% Application callbacks
start(_StartType, _StartArgs) ->
    case 'TopSupervisor':start_link() of
        {ok, Pid} ->
            {ok, Pid};
        Error ->
            Error
    end.


stop(_State) ->
    ok.


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
    RemainingList = remove_element(Index, List),

    % Process all remaining elements
    do_shuffle(RemainingList, [Item|ShuffledList]).


-spec remove_element(ElemPos :: integer(), List :: list()) -> list().

remove_element(1, List) ->
    [_|Rest] = List,
    Rest;
remove_element(ElemPos, List) when length(List) == ElemPos ->
    [_|Rest] = lists:reverse(List),
    lists:reverse(Rest);
remove_element(ElemPos, List) ->
    {ListA, ListB} = lists:split(ElemPos - 1, List),
    [_|ListC] = ListB,
    ListA ++ ListC.
