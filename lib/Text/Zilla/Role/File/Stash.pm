package Text::Zilla::Role::File::Stash;
# ABSTRACT: File which has a stash
use Moose::Role;

with qw(
	Text::Zilla::Role::File::Base
	Text::Zilla::Role::Stash
);

1;