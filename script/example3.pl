use FindBin qw($Bin);
use lib "$Bin/../lib/";

use PerlFPM qw(addn mapping filtering isOdd perlListToFunctionalList functionalListToPerlList printFunctionalList);

my @list = (1,2,3);
my $result = perlListToFunctionalList(\@list);

print "[*] First element of functional list of (1,2,3): ".$result->getHead()."\n";
print "[*] Second element of functional list of (1,2,3): ".$result->getTail()->getHead()."\n";

my $f = addn->(1);
mapping(\&$f, $result);
my @f_mapp_result = functionalListToPerlList($result);
print "[*] Perl list after f_mapp (addn (1)) (functional list of (1,2,3)): ";
print "$_, " for @f_mapp_result;
print "\n";

my @list1 = (1,2,3,4,5,6);
my $result1 = perlListToFunctionalList(\@list1);
my $cf = isOdd;
filtering(\&$cf, $result1);
my @f_filt_result = functionalListToPerlList($result1);
print "[*] Perl list after f_filt (isOdd) (functional list of (1,2,3,4,5,6)): ";
printFunctionalList($result1, ", ");
print "\n";

1;
