use FindBin qw($Bin);
use lib "$Bin/../lib/";

use PerlFPM qw(integer addition greaterThan smallerTo isOddInteger);

$num1 = integer("10");
print "[*] num with type Integer = ".$num1->getValue()."\n";

$num2 = integer("20");
$result = addition->($num1)->($num2);
print "[*] addition (integer 10) (integer 20) = ".$result->getValue()."\n";

print "[*] greaterThan (interger 10) (integer 15) = ".greaterThan->(integer("10"))->(integer("15"))."\n";
print "[*] smallerTo (interger 10) (integer 15) = ".smallerTo->(integer("10"))->(integer("15"))."\n";

print "[*] isOddInteger (integer 15) = ".isOddInteger->(integer("15"))."\n";
