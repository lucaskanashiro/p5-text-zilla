package Text::Zilla::Role::File;
# ABSTRACT: Required role for all files
use Moose::Role;

with qw(
	Text::Zilla::Role::Rights
);

excludes 'Text::Zilla::Role::Dir';

requires 'tzil_content';

sub tzil_write_to {
	my ( $self, $filename ) = @_;
	die __PACKAGE__." dont getting a filename on tzil_write_to" if !$filename;
	open(TARGET, ">:utf8", $filename) or die __PACKAGE__." cant write to ".$filename;
	print TARGET $self->tzil_content;
	return close TARGET;
}

1;