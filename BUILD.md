## xdata 컴파일

$ REBAR=./rebar3 make xdata

## xmpp spec 컴파일

$ make spec

## ejabberd에 통합

1. 수정사항을 commit 후, github에 push
2. commit #를 ejabberd/rebar.config 파일에 업데이트
3. commit #를 ejabberd/mix.exs 파일에 업데이트
