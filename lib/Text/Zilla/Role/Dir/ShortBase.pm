package Text::Zilla::Role::Dir::ShortBase;
# ABSTRACT: Minimum implementation for a dir with shorter function names
use Moose::Role;

with qw(
	Text::Zilla::Role::Dir
);

sub parent { shift->tzil_parent(@_) }
sub has_parent { shift->has_tzil_parent(@_) }

sub entries { shift->tzil_dir_entries(@_) }
sub set_entry { shift->tzil_set_entry(@_) }
sub get_entry { shift->tzil_get_entry(@_) }
sub has_entries { shift->tzil_has_entries(@_) }
sub count_entries { shift->tzil_count_entries(@_) }
sub delete_entry { shift->tzil_delete_entry(@_) }
sub to { shift->tzil_to }

1;