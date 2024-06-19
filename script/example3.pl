use FindBin qw($Bin);
use lib "$Bin/../lib/";

use PerlFPM qw(addn f_mapp perlListToFunctionalList functionalListToPerlList);

my @list = (1,2,3);
my $result = perlListToFunctionalList(\@list);

print "[*] First element of functional list of (1,2,3): ".$result->getHead()."\n";
print "[*] Second element of functional list of (1,2,3): ".$result->getTail()->getHead()."\n";

my $f = addn->(1);
f_mapp(\&$f, $result);
my @f_mapp_result = functionalListToPerlList($result);
print "[*] Perl list after f_mapp (addn (1)) (functional list of (1,2,3)): ";
print "$_, " for @f_mapp_result;
print "\n";

1;
