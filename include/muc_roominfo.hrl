%% Created automatically by xdata generator (xdata_codec.erl)
%% Source: muc_roominfo.xdata
%% Form type: http://jabber.org/protocol/muc#roominfo
%% Document: XEP-0045

-type 'allowpm'() :: anyone | participants | moderators | none.

-type property() :: {'maxhistoryfetch', non_neg_integer()} |
                    {'allowinvites', boolean()} |
                    {'allow_query_users', boolean()} |
                    {'allowpm', 'allowpm'()} |
                    {'contactjid', [jid:jid()]} |
                    {'description', binary()} |
                    {'lang', binary()} |
                    {'ldapgroup', binary()} |
                    {'logs', binary()} |
                    {'roomname', binary()} |
                    {'occupants', non_neg_integer()} |
                    {'subject', binary()} |
                    {'subjectmod', boolean()} |
                    {'pubsub', binary()} |
                    {'changesubject', boolean()} |
                    {'meetingId', binary()} |
                    {'timeremained', binary()} |
                    {'sttenabled', boolean()} |
                    {'lobbyroom', binary()} |
                    {'isbreakout', boolean()} |
                    {'breakout_main_room', binary()} |
                    {'timer_end_time', binary()} |
                    {'timer_initiator', binary()} |
                    {'facedetect', boolean()} |
                    {'created_timestamp', binary()}.
-type result() :: [property()].

-type options(T) :: [{binary(), T}].
-type form_property() ::
      {'maxhistoryfetch', non_neg_integer() | undefined} |
      {'allowinvites', boolean() | undefined} |
      {'allow_query_users', boolean() | undefined} |
      {'allowpm', 'allowpm'() | undefined} |
      {'allowpm', 'allowpm'() | undefined, options('allowpm'())} |
      {'contactjid', [jid:jid()]} |
      {'description', binary()} |
      {'lang', binary() | undefined} |
      {'ldapgroup', binary()} |
      {'logs', binary()} |
      {'roomname', binary()} |
      {'occupants', non_neg_integer() | undefined} |
      {'subject', binary()} |
      {'subjectmod', boolean() | undefined} |
      {'pubsub', binary() | undefined} |
      {'changesubject', boolean() | undefined} |
      {'meetingId', binary()} |
      {'timeremained', binary()} |
      {'sttenabled', boolean() | undefined} |
      {'lobbyroom', binary()} |
      {'isbreakout', boolean() | undefined} |
      {'breakout_main_room', binary()} |
      {'timer_end_time', binary()} |
      {'timer_initiator', binary()} |
      {'facedetect', boolean() | undefined} |
      {'created_timestamp', binary()}.
-type form() :: [form_property() | xdata_field()].

-type error_reason() :: {form_type_mismatch, binary()} |
                        {bad_var_value, binary(), binary()} |
                        {missing_required_var, binary(), binary()} |
                        {missing_value, binary(), binary()} |
                        {too_many_values, binary(), binary()} |
                        {unknown_var, binary(), binary()}.
