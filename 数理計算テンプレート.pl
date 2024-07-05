#!/usr/bin/env perl
use strict;
use warnings;
my $pi = 3.1415926535897932384626433832;
my $e = (1 + 0.00000000001) ** 100000000000;
my $g = 9.8;
my $T0 = -273.15;
my $t = 0;
#座標から一次関数
sub fx{
	my ($x1, $y1, $x2, $y2) = @_;
	my $a = ($y2 - $y1) / ($x2 - $x1);
#	$y = $a * ($x - $x1) + $y1;
	my $b = ($a * -$x1) + $y1;
	if ($b == 0){
		$b = '';
	} else {
		if ($b > 0){
			$b = '+'.$b;
		}
	}
	return 'Y = '.$a.'X'.$b;
}
#度数法の正弦
sub sin_a{
	my $d = shift;
	glob $pi;
	return sin(2 * $pi * $d/360);
}
#度数法の余弦
sub cos_a{
	my $d = shift;
	glob $pi;
	return cos(2 * $pi * $d/360);
}
#度数法の正接
sub tan_a{
	my $d = shift;
	return sin_a($d)/cos_a($d);
}
#階乗
sub pow_i{
	my $n = shift;
	my $m = 1;
	for (my $i = 0; $i < $n; ++$i){
		$m *= $i+1;
	}
	return $m;
}
#偏差値
sub Ti{
	my ($ave, $my, $sig) = @_;
	unless (defined $sig){
		$sig = 10;
	}
	return ((10*($my - $ave)/$sig) +50);
}
#標準変化量
sub Zi{
	my ($ave, $my, $sig) = @_;
	unless (defined $sig){
		$sig = 10;
	}
	return (($my - $ave)/$sig);
}
#ポアソン
sub poason{
	my ($x, $ram) = @_;
	glob $e;
	return (($ram**$x) * ($e**-$ram) / pow_i($x));
}

print "数理計算機です。入力が直接perlとして実行されます。(exitで終了)\n";
print "円周率=\$pi, 重力加速度=\$g(9.8), 絶対零度=\$T0(-273.15), 自然対数=\$e\n";
print "座標から一次関数を求める: fx(x1, y1, x2, y2)\n";
print "度数法 [sin_a(), cos_a(), tan_a()]\n";
print "階乗 pow_i(整数)\n";
print "偏差値 Ti(平均点, 自分の点数, 標準偏差=10)\n";
print "標準変化量 Zi(平均点, 自分の点数, 標準偏差=10)\n";
print "ポアソン poason(x, ラムダ)\n";
while (1){
	my $input = <STDIN>;
	eval $input;
	print "\n\n";
}


