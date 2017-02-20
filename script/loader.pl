#!/usr/bin/env perl

## Import best practice core modules ##
use strict;
use warnings;
use v5.24;

## Import useful CPAN modules ##
use FindBin;
use Getopt::Long;

## Add Model/Controller classes to our path ##
use lib "$FindBin::Bin/../lib";

## Import Model/Controller classes ##
use DBLoader;
use DBLoader::Config;

## Create config object ##
my $config = DBLoader::Config->new(
  user_config => {},
);

## Create loader object ##
my $loader = DBLoader->new(
  config => $config,
);

## Start load according to config spec ##
$loader->start;


