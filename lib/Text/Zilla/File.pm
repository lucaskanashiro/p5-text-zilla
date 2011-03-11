package Text::Zilla::File;
# ABSTRACT: A base file
use Text::Zilla;

tzil_file;

has content => (
	is => 'rw',
	isa => 'Str',
	default => sub {""},
);

around BUILDARGS => sub {
	my $orig  = shift;
	my $class = shift;

	if ( @_ == 1 && !ref $_[0] ) {
		return $class->$orig( content => $_[0] );
	} else {
		return $class->$orig(@_);
	}
};

sub tzil_content { shift->content }

1;