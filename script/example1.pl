use FindBin qw($Bin);
use lib "$Bin/../lib/";

use PerlFPM qw(addn muln eqto isEven imprMap imprFilter imprZip imprZipList imprSeqApplication);

my $result = addn->(2)->(1);
print "[*] addn 2 1 = $result\n";

my @input = (1,2,3);
my $f = addn->(1);
my @result = imprMap(\&$f, \@input);
print "[*] imprMap (addn 1) (1,2,3) = (";
print "$_, " for @result;
print ")\n";

my $num = 1;
my $eqto_result = eqto->($num)->(1);
print "[*] eqto 1 1 = $eqto_result\n";

my $isOdd_result = isEven->($num);
print "[*] isEven 1 = $isOdd_result\n";

my @input = (1,2,3,4,5);
my $cf = isEven;
my @filter_result = imprFilter(\&$cf, \@input);
print "[*] imprFilter isEven (1,2,3,4,5) = (";
print "$_, " for @filter_result;
print ")\n";

my @input_list1 = (1,2,3);
my @input_list2 = (4,5);
my @zip_result = imprZip(\@input_list1, \@input_list2);
print "[*] imprZip (1,2,3) (4,5) = (";
foreach $t (@zip_result) {
	print "[@$t[0],@$t[1]], ";
}
print ")\n";

my $addnf = addn;
my @zip_list_result = imprZipList(\&$addnf, \@input_list1, \@input_list2);
print "[*] imprZipList addn (1,2,3) (4,5) = (";
print "$_, " for @zip_list_result;
print ")\n";

my $addn1 = addn->(1);
my $muln2 = muln->(2);
my @functions_list = (\&$addn1, \&$muln2);
my @input_list = (1,2);
my @seq_application_result = imprSeqApplication(\@functions_list, \@input_list);
print "[*] imprSeqApplication ((addn 1), (muln 2)) (1,2) : (";
print "$_, " for @seq_application_result;
print ")\n";
