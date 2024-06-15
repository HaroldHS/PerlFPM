package HighOrderFunction::Filter;

use Exporter "import";
our @EXPORT_OK = qw(filt);

sub filt {
	my $conditional_function = $_[0];
	my @target_list = @{$_[1]};
	my @result = ();

	foreach $target (@target_list) {
		if ($conditional_function->($target) == 1) {
			push(@result, $target);
		}
	}

	return @result;
}

1;
