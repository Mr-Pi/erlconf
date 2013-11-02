#!/usr/bin/env escript
main(_Args) ->
	ok = application:start(sasl),
	ok = application:start(crypto),
	ok = application:start(asn1),
	ok = application:start(public_key),
	ok = application:start(ssl),
	[_|[PathIn|_]] = code:get_path(),
	{ok,[[{_,ReleaseVersionSpec,ReleaseVersion,ErtsVersion,_,_}]]} =
		file:consult(string:substr(PathIn,1,string:rstr(PathIn,"/lib/"))++"releases/RELEASES"),
	Data={release, {ReleaseVersionSpec, ReleaseVersion}, {erts, ErtsVersion},
			lists:map(fun(X) -> {AppName,_,AppVsn} = X, {AppName,AppVsn} end,
				lists:reverse(application:which_applications()))},
	ok = file:write_file("start_ssl.rel",io_lib:fwrite("~p.~n",[Data])),
	io:format("\e[H\e[2J\e[33mresult is: \e[1m~p\e[0m~n", [systools:make_script("start_ssl",[])]).
