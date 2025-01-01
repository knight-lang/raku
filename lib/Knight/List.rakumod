use Knight::Idempotent;
use Knight::Value;

## TODO: why cant lists be parameterized
unit class Knight::List does Knight::Idempotent[Array[Knight::Value], * <=> *, * == *];

method new(*@args --> ::?CLASS)  {
	my @arg is Array[Knight::Value] = @args.Array;
	self.bless: value => @arg
}

method gist(--> Str) {
	'[' ~ ($!value».gist).join("\n") ~ ']'
}

method Str(--> Str) {
	$.join: "\n"
}

method join(Str $sep --> Str) {
	$!value.join: $sep
}

method add(Knight::Value $rhs --> ::?CLASS) {
	::?CLASS.new: |$!value, |$rhs.List
}

# return;
# #| Gets an internal representation of the class; used in debugging.
# method gist(--> Str) {
# 	$.Str;
# }
#
# #| Converts `$rhs` to an `Int`, then adds it to `self`, returning a new Number.
# method add(Knight::Value $rhs, --> ::?CLASS) {
# 	::?CLASS.new: $!value + $rhs.Int
# }
#
# #| Converts `$rhs` to an `Int`, then subtracts it from `self`, returning a new Number.
# method sub(Knight::Value $rhs, --> ::?CLASS) {
# 	::?CLASS.new: $!value - $rhs.Int
# }
#
# #| Converts `$rhs` to an `Int`, then multiplies `self` by it, returning a new Number.
# method mul(Knight::Value $rhs, --> ::?CLASS) {
# 	::?CLASS.new: $!value * $rhs.Int
# }
#
# #| Converts `$rhs` to an `Int`, then divides `self` by it (rounding down), returning a new Number.
# #|
# #| `$rhs` may not be zero when converted to an int, or the program will `die`.
# method div(Knight::Value $rhs, --> ::?CLASS) {
# 	# We have to use `(x / y).Int`, as `div` rounds incorrectly with negative numbers.
# 	::?CLASS.new: ($!value / ($rhs.Int or die 'Cannot divide by zero!')).Int
# }
#
# #| Converts `$rhs` to an `Int`, then modulos `self` by it, returning a new Number.
# #|
# #| `$rhs` may not be zero when converted to an int, or the program will `die`.
# method mod(Knight::Value $rhs, --> ::?CLASS) {
# 	::?CLASS.new: $!value mod ($rhs.Int or die 'Cannot modulo by zero!')
# }
#
# #| Converts `$rhs` to an `Int`, then raises `self` to its power.
# method pow(Knight::Value $rhs, --> ::?CLASS) {
# 	::?CLASS.new: ($!value ** $rhs.Int).Int
# }
#
# #| Gets the chr of the class
# method ascii(--> Knight::Value) {
# 	require Knight::String;
#
# 	die "Invalid ASCII number $!value" unless 0 < $!value && $!value <= 127;
# 	Knight::String.new: $!value.chr
# }
