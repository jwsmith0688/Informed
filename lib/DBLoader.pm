package DBLoader;

use v5.24;  ## Import Perl 5.24 features ##

## Import Moo object-system for Perl ##
use Moo;

## Import useful CPAN modules ##
use Carp;
use Scalar::Util;
use Mojo::Log;

## Import Application Modules ##
use DBLoader::Config;

## Instance Attributes ##
has 'config' => (
  is => 'ro',
  isa => sub {
    croak "Supplied config attribute is not a hash reference"
      unless defined $_[0] and $_[0]->isa('DBLoader::Config');
  },
  lazy => 1,
  predicate => 1,
  clearer => 1,
  default => sub { return DBLoader::Config->new; },
);

has 'logger' => (
  is => 'lazy',
  init_arg => undef,
  clearer => 1,
);

## Methods ##
## Private Class Methods ##
sub _build_logger {
  my $self = shift;
  my $path = $self->config->param('main', 'logfile') || undef;
  my $logger = Mojo::Log->new(path => $path);

  $logger->level('info') unless $self->config->param('main', 'debug');

  return $logger;
}
## Public Instance Methods ##
sub start {
  my $self = shift;

  croak "No configuration passed in constructor..."
    unless $self->has_config;

  $self->logger->debug("Beginning database synchronization with data sources...");

  return $self;
}

1;

=head1 NAME

DBLoader - Informed's data synchronization framework
