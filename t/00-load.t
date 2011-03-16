use strict;
use warnings;
use Test::More;

use_ok('Text::Zilla');
use_ok('Text::Zilla::Dir::FromHash');
use_ok('Text::Zilla::Dir');
use_ok('Text::Zilla::File');
use_ok('Text::Zilla::Role::Dir::Stash');
use_ok('Text::Zilla::Role::Dir::ShortBase');
use_ok('Text::Zilla::Role::Dir::Base');
use_ok('Text::Zilla::Role::Dir');
use_ok('Text::Zilla::Role::File::Stash');
use_ok('Text::Zilla::Role::File::ShortBase');
use_ok('Text::Zilla::Role::File::Base');
use_ok('Text::Zilla::Role::Stash');
use_ok('Text::Zilla::Role::Rights');
use_ok('Text::Zilla::Role::File');
use_ok('Text::Zilla::Role::MetaClass');
use_ok('Text::Zilla::Types');

done_testing;
