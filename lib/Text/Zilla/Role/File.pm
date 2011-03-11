package Text::Zilla::Role::File;
# ABSTRACT: Required role for all files
use Moose::Role;

with qw(
	Text::Zilla::Role::Rights
);

requires 'tzil_generate';

1;