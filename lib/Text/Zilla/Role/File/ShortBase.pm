package Text::Zilla::Role::File::ShortBase;
# ABSTRACT: Minimum implementation for a file with shorter function names
use Moose::Role;

with qw(
	Text::Zilla::Role::File
);

requires 'content';

sub tzil_content { shift->content(@_) }
sub write_to { shift->tzil_write_to(@_) }

1;
