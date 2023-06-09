#! -- perl --
use strict;
use warnings;
use Data::Dumper qw{Dumper};
use Test::More tests => 2 + 6;
BEGIN { use_ok('RPM::Query') };

my $rpm  = RPM::Query->new;
isa_ok($rpm, 'RPM::Query');

my $skip = 1;
foreach (1) {
  last unless $^O eq 'linux';
  last unless qx{rpm -q perl};
  last if $?;
  $skip = 0;
}

SKIP: {
  skip 'rpm command not found or perl not installed by rpm', 6 if $skip;
  my $list = $rpm->provides('perl');
  isa_ok($list, 'ARRAY');

  my $cap = $list->[0];
  isa_ok($cap, 'RPM::Query::Capability');
  is($cap->name, 'perl');
  is($cap->version, '4:5.16.3-299.el7_9'); #not protable

  my $pkg = $cap->package;
  isa_ok($pkg, 'RPM::Query::Package');
  diag(Dumper $cap);
  is($pkg->name, 'perl');
}
