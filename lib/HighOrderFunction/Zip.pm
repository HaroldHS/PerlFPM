package HighOrderFunction::Zip;

use Exporter "import";
our @EXPORT_OK = qw(imprZip imprZipList);

use HighOrderFunction::Map qw(imprMap);

# NOTE: DO NOT MODIFY. This subroutine is intended for mapping in ziplist. #
sub apply {
	return sub {
		my $function = $_[0];

		return sub {
			my $pair = $_[0];
			return $function->(@$pair[0])->(@$pair[1]);
		}
	}
}
############################################################################

sub imprZip {
	my @list1 = @{$_[0]};
	my @list2 = @{$_[1]};

	my @result = ();
	my $index = 0;
	my $run_flag = 1;

	while ($run_flag) {
		if ($list1[$index] and $list2[$index]) {
			push(@result, [$list1[$index], $list2[$index]]);
			$index = $index + 1;
		} else {
			$run_flag = 0;
		}
	}	

	return @result;
}

sub imprZipList {
	my $function = $_[0];
	my @list1 = @{$_[1]};
	my @list2 = @{$_[2]};
	
	my @zipp_result = imprZip(\@list1, \@list2);
	return imprMap(apply->($function), \@zipp_result);
}

1;
