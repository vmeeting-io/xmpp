%%%-------------------------------------------------------------------
%%% @author Magnus Henoch <henoch@dtek.chalmers.se>
%%%
%%% Copyright (C) 2002-2024 ProcessOne, SARL. All Rights Reserved.
%%%
%%% Licensed under the Apache License, Version 2.0 (the "License");
%%% you may not use this file except in compliance with the License.
%%% You may obtain a copy of the License at
%%%
%%%     http://www.apache.org/licenses/LICENSE-2.0
%%%
%%% Unless required by applicable law or agreed to in writing, software
%%% distributed under the License is distributed on an "AS IS" BASIS,
%%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%%% See the License for the specific language governing permissions and
%%% limitations under the License.
%%%
%%%-------------------------------------------------------------------
-module(xmpp_sasl_anonymous).
-behaviour(xmpp_sasl).
-protocol({xep, 175, '1.2'}).

-export([mech_new/7, mech_step/2]).

-include_lib("xmpp.hrl").

-record(state, {xmpp_socket ::xmpp_socket:socket_state(), host :: binary()}).

-type error_reason() :: not_authorized.
-export_type([error_reason/0]).

-spec format_error(error_reason()) -> {atom(), binary()}.
format_error(not_authorized) ->
    {'not-authorized', <<"Invalid jitsi jwt token">>}.

mech_new(_Mech, Socket, _Mechs, Host, _GetPassword, _CheckPassword, _CheckPasswordDigest) ->
    #state{xmpp_socket = Socket, host = Host}.

mech_step(#state{xmpp_socket = XmppSocket, host = Host}, _ClientIn) ->
    JWTResult = ejabberd_hooks:run_fold(check_jwt_token, Host, ok, [XmppSocket, Host]),

    User = iolist_to_binary([p1_rand:get_string(),
                             integer_to_binary(p1_time_compat:unique_integer([positive]))]),

    if JWTResult == ok ->
        error_logger:info_msg("verification succeeded for ~p~n", [User]),
        {ok, [{username, User},
        {authzid, User},
        {auth_module, anonymous}]};
    true ->
        error_logger:warning_msg("verification failed for ~p~n", [User]),
        {error, not_authorized, User}
    end.
