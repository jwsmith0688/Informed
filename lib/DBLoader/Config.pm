package DBLoader::Config;

## Import Perl 5.24 features ##
use v5.24;

## Import Moo object-system for Perl ##
use Moo;

## Import useful CPAN modules ##
use Carp;
use Scalar::Util;

## Instance Attributes ##
has 'file' => (
  is => 'ro',
  isa => sub { croak "Configuration filename must not be empty"
    unless defined $_[0] and length $_[0]; },
  predicate => 1,
);

has 'user_config' => (
  is => 'ro',
  isa => sub { croak "Invalid configuration defaults $_[0]"
    unless defined $_[0] and ref $_[0] eq 'HASH' },
  predicate => 1,
  clearer => 1,
);

## Methods ##
## Private Class Methods ##

## Public Instance Methods ##
sub param {
}

1;
