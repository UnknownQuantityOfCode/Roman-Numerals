use v5.10;

my $roman = {
	"M"  => 1000,
	"CM" => 900,
	"D"  => 500,
	"CD" => 400,
	"C"  => 100,
	"XC" => 90,
	"L"  => 50,
	"XL" => 40,
	"X"  => 10,
	"IX" => 9,
	"V"  => 5,
	"IV" => 4,
	"I"  => 1
};

sub to_roman {
	my $number = shift;
	my $string = '';
	foreach my $letter (sort {$roman->{$b} <=> $roman->{$a}} keys %{$roman}){
		my $amount = $roman->{$letter};
		while($number-$amount >= 0){
			$string .= $letter;
			$number -= $amount;
		}
	}
	return $string;
}

sub from_roman {
	my $string = shift;
	my $number;
	my $regex = "^(".join('|', sort {$roman->{$b} <=> $roman->{$a}} keys %{$roman}).")";
	while ($string =~ /$regex/igm){
		my $letter = $1;
		$number += $roman->{$letter};
		$string = substr($string,length($letter));
	}
	return $number;
}

# Tests

# foreach (qw(1000 2000 200 2018 4 9)){
# 	say "$_: ".to_roman($_);
# }
# say "EXPECTING II got: " . 			to_roman(2). 		"\t ".("II" eq to_roman(2));
# say "EXPECTING III got: " . 		to_roman(3). 		"\t ".("III" eq to_roman(3));
# say "EXPECTING IV got: " . 			to_roman(4). 		"\t ".("IV" eq to_roman(4));
# say "EXPECTING MVI got: " . 		to_roman(1006). 	"\t ".("MVI" eq to_roman(1006));
# say "EXPECTING MXXIII got: " . 		to_roman(1023). 	"\t ".("MXXIII" eq to_roman(1023));
# say "EXPECTING MMXIV got: " . 		to_roman(2014). 	"\t ".("MMXIV" eq to_roman(2014));
# say "EXPECTING MMMCMXCIX got: " . 	to_roman(3999). 	"\t ".("MMMCMXCIX" eq to_roman(3999));

# foreach (qw(D CCC I XXVI IV IX)){
# 	say "$_: ".from_roman($_);
# }
# say "EXPECTING 2 got: " . 			from_roman('II'). 		"\t ".("2" eq from_roman('II'));
# say "EXPECTING 3 got: " . 		from_roman('III'). 		"\t ".("3" eq from_roman('III'));
# say "EXPECTING 97 got: " . 		from_roman('XCVII'). 		"\t ".("97" eq from_roman('XCVII'));
# say "EXPECTING 99 got: " . 		from_roman('XCIX'). 		"\t ".("99" eq from_roman('XCIX'));
# say "EXPECTING 400 got: " . 			from_roman('CD'). 		"\t ".("400" eq from_roman('CD'));
# say "EXPECTING 500 got: " . 			from_roman('D'). 		"\t ".("500" eq from_roman('D'));
# say "EXPECTING 501 got: " . 			from_roman('DI'). 		"\t ".("501" eq from_roman('DI'));
# say "EXPECTING 649 got: " . 		from_roman('DCXLIX'). 		"\t ".("649" eq from_roman('DCXLIX'));
# say "EXPECTING 798 got: " . 	from_roman('DCCXCVIII'). 		"\t ".("798" eq from_roman('DCCXCVIII'));
# say "EXPECTING 891 got: " . 	from_roman('DCCCXCI'). 		"\t ".("891" eq from_roman('DCCCXCI'));
# say "EXPECTING 1000 got: " . 			from_roman('M'). 	"\t ".("1000" eq from_roman('M'));
# say "EXPECTING 3999 got: " . 	from_roman('MMMCMXCIX'). 	"\t ".("3999" eq from_roman('MMMCMXCIX'));