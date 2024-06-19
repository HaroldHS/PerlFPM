use FindBin qw($Bin);
use lib "$Bin/../lib/";

use PerlFPM qw(integer list);

$num = integer("10");
print "[*] num with type Integer = ".$num->getValue()."\n";
