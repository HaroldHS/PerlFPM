use FindBin qw($Bin);
use lib "$Bin/../lib/";

use PerlFPM qw(
	integer
	subtraction
	zippingWithFunction
	perlListToFunctionalList functionalListToPerlList printFunctionalList
);

my $subtract = subtraction;
my @list1 = (4,5,6);
my @list2 = (1,2,);
my $flist1 = perlListToFunctionalList(\@list1);
my $flist2 = perlListToFunctionalList(\@list2);
my $result = zippingWithFunction(\&$subtract, $flist1, $flist2);
print "[*] Functional list after zipping (subtract) (functional list (4,5,6)) (functional list (1,2)) = ";
printFunctionalList($result, ", ");
