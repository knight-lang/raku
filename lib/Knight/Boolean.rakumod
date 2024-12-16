use Knight::Idempotent;

#| The Boolean class within Knight.
unit class Knight::Boolean does Knight::Idempotent[Bool, * <=> *, * == *];

#| Returns either `true` or `false`, depending on whether we are empty.
method Str(--> Str) is pure {
	$!value ?? 'true' !! 'false'
}

#| Gets an internal representation of the class; used in debugging.
method gist(--> Str) is pure {
	$.Str;
}
