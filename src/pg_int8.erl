-module(pg_int8).

-behaviour(pg_types).

-export([init/1,
         encode/2,
         decode/2]).

-include("pg_protocol.hrl").

init(_Opts) ->
    {[<<"int8send">>], []}.

encode(N, _) ->
    <<8:?int32, N:?int64>>.

decode(<<N:?int64>>, _) ->
    N.
