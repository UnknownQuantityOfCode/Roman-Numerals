package Numerals;

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

1;
