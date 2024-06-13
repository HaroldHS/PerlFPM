use FindBin qw($Bin);
use lib "$Bin/../lib/";

use PerlFPM qw(addn mapp eqto isEven filt zipp zipplist);

my $result = addn->(2)->(1);
print "[*] addn 2 1 = $result\n";

my @input = (1,2,3);
my $f = addn->(1);
my @result = mapp(\&$f, \@input);
print "[*] mapp (addn 1) (1,2,3) = (";
print "$_, " for @result;
print ")\n";

my $num = 1;
my $eqto_result = eqto->($num)->(1);
print "[*] eqto 1 1 = $eqto_result\n";

my $isOdd_result = isEven->($num);
print "[*] isEven 1 = $isOdd_result\n";

my @input = (1,2,3,4,5);
my $cf = isEven;
my @filter_result = filt(\&$cf, \@input);
print "[*] filt isEven (1,2,3,4,5) = (";
print "$_, " for @filter_result;
print ")\n";

my @input_list1 = (1,2,3);
my @input_list2 = (4,5);
my @zipp_result = zipp(\@input_list1, \@input_list2);
print "[*] zipp (1,2,3) (4,5) = (";
foreach $t (@zipp_result) {
	print "[@$t[0],@$t[1]], ";
}
print ")\n";

my $addnf = addn;
my @zipplist_result = zipplist(\&$addnf, \@input_list1, \@input_list2);
print "[*] zipplist addn (1,2,3) (4,5) = (";
print "$_, " for @zipplist_result;
print ")\n";
