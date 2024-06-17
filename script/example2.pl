use FindBin qw($Bin);
use lib "$Bin/../lib/";

use PerlFPM qw(integer list);

$num = integer("10");
print "[*] num with type Integer = ".$num->getValue()."\n";

@inputs = (1, 2, 3, 4);
$l = list(\@inputs);
print "[*] l with type List = (";
print "$_, " for $l->getValue();
print ")\n";
