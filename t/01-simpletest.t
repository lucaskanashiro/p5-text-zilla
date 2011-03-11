use strict;
use warnings;
use Test::More;
use Test::Dirs;
use FindBin qw($Bin);

use Text::Zilla::File;
use Text::Zilla::Dir;

my $root = Text::Zilla::Dir->new;
isa_ok($root, 'Text::Zilla::Dir');

my $test_txt = Text::Zilla::File->new('This is a test');
isa_ok($test_txt, 'Text::Zilla::File');
is($test_txt->content, 'This is a test', 'Checking content of Text::Zilla::File test.txt');

my $testdir = Text::Zilla::Dir->new;
isa_ok($testdir, 'Text::Zilla::Dir');

my $othertest_txt = Text::Zilla::File->new('More tests!');
isa_ok($othertest_txt, 'Text::Zilla::File');
is($othertest_txt->content, 'More tests!', 'Checking content of Text::Zilla::File othertest.txt');

$testdir->tzil_set_entry('othertest.txt',$othertest_txt);
is($testdir->tzil_get_entry('othertest.txt'), $othertest_txt, 'Checking entry othertest.txt of testdir');
$root->tzil_set_entry('testdir',$testdir);
is($root->tzil_get_entry('testdir'), $testdir, 'Checking entry testdir of root');
$root->tzil_set_entry('test.txt',$test_txt);
is($root->tzil_get_entry('test.txt'), $test_txt, 'Checking entry test.txt of root');

my $dir = File::Temp->newdir();

is_dir($dir, $Bin.'/result-01', 'Checking resulting directory', [], 'verbose' );

done_testing;
