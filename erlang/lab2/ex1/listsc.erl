-module(listsc).
-export([squared_int/1, intersect/2, symmetric_difference/2]).

% Write the following functions by using list comprehensions:
%
% squared_int that removes all non-integers from a polymorphic list and returns the resulting list of integers squared, 
%   e.g., squared_int([1, hello, 100, boo, “boo”, 9]) should return [1, 10000, 81].
% intersect that given two lists, returns a new list that is the intersection of the two lists 
%   (e.g., intersect([1,2,3,4,5], [4,5,6,7,8]) should return [4,5]).
% symmetric_difference that given two lists, returns a new list that is the symmetric difference of the two lists. 
%   For example symmetric_difference([1,2,3,4,5], [4,5,6,7,8]) should return [1,2,3,6,7,8].

squared_int(Lst) -> 
  [X*X || X <- Lst, is_integer(X)].

intersect(Lst1, Lst2) -> 
  [X || X <- Lst1, lists:member(X, Lst2)].

symmetric_difference(Lst1, Lst2) ->
  [X || X <- lists:merge(Lst1, Lst2), not (lists:member(X, Lst1) and lists:member(X, Lst2))].

