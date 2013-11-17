erlconf
=======

Erlang configuration, using ssl for distribution


using
-----

First clone this repository, then type `make` in there.

Simply set `$ERL_FLAGS` to `-config <path to erlconf>/main.config -boot <path to erlconf>/start_ssl -proto_dist inet_tls -ssl_dist_opt server_certfile <path to .pem certificate> -ssl_dist_opt server_secure_renegotiate true client_secure_renegotiate true`
