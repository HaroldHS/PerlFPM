use FindBin qw($Bin);
use lib "$Bin/../lib/";

use PerlFPM qw(
	integer
	addition subtraction
	isOddInteger
	mapping filtering zipping zippingWithFunction
	perlListToFunctionalList functionalListToPerlList printFunctionalList print2DFunctionalList);

my @list = (1,2,3);
my $result = perlListToFunctionalList(\@list);
print "[*] First element of functional list (1,2,3) = ".$result->getHead()->getValue()."\n";
print "[*] Second element of functional list (1,2,3) = ".$result->getTail()->getHead()->getValue()."\n";

my $f = addition->(integer(2));
my $mapResult = mapping(\&$f, $result);
my @mapping_result = functionalListToPerlList($mapResult);
print "[*] Perl list after mapping (addition (2)) (functional list (1,2,3)) = (";
print $_->getValue().", " for @mapping_result;
print ")\n";

my @list1 = (1,2,3,4,5,6);
my $result1 = perlListToFunctionalList(\@list1);
my $cf = isOddInteger;
my $filterResult = filtering(\&$cf, $result1);
print "[*] Functional list after filtering (isOddInteger) (functional list (1,2,3,4,5,6)) = ";
printFunctionalList($filterResult, ", ");

my @listNum1 = (1,2,3);
my @listNum2 = (4,5);
my $flistNum1 = perlListToFunctionalList(\@listNum1);
my $flistNum2 = perlListToFunctionalList(\@listNum2);
my $zippingResult = zipping($flistNum1, $flistNum2);
print "[*] Functional list after zipping (functional list (1,2,3)) (functional list (4,5)) = ";
print2DFunctionalList($zippingResult, ", ");

1;
