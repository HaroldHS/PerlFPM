use FindBin qw($Bin);
use lib "$Bin/../lib/";

use PerlFPM qw(
	integer
	addition
	isOddInteger
	filtering mapping zipping
	perlListToFunctionalList functionalListToPerlList printFunctionalList print2DFunctionalList
);

my @list1 = (1,2,3,4,5,6);
my $result1 = perlListToFunctionalList(\@list1);
my $cf = isOddInteger;
my @fs = ("Type::Integer", "Type::Integer"); # input = [Integer], output = [Integer]
my $filterResult = filtering(\@fs, \&$cf, $result1);
print "[*] Functional list after filtering (isOddInteger) (functional list (1,2,3,4,5,6)) = ";
printFunctionalList($filterResult, ", ");

my $add_20 = addition->(integer(20));
my $mappingResult = mapping(\@fs, \&$add_20, $filterResult);
print "[*] Functional list after mapping (adding 20) (functional list (1,3,5)) = ";
printFunctionalList($mappingResult, ", ");

my @zipList1 = (1,2,3);
my @zipList2 = (4,5,6);
my $flistNum1 = perlListToFunctionalList(\@zipList1);
my $flistNum2 = perlListToFunctionalList(\@zipList2);
my @zipFS = ("Type::Integer", "Type::Integer", "Type::Integer"); # input 1 = [Integer], input 2 = [Integer], output = [Integer]
my $zippingResult = zipping(\@zipFS, $flistNum1, $flistNum2);
print "[*] Functional list after zipping (functional list (1,2,3)) (functional list (4,5, 6)) = ";
print2DFunctionalList($zippingResult, ", ");