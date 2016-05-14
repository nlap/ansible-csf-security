#!/usr/bin/perl
###############################################################################
# Copyright 2006-2014, Way to the Web Limited
# URL: http://www.configserver.com
# Email: sales@waytotheweb.com
###############################################################################
# start main
#use strict;
use lib '/usr/local/csf/lib';
use Fcntl qw(:DEFAULT :flock);
use File::Basename;
use Net::CIDR::Lite;
use IPC::Open3;
use ConfigServer::Config;
use ConfigServer::CheckIP;
use ConfigServer::Ports;
use ConfigServer::URLGet;
use ConfigServer::Sanity;
use ConfigServer::ServerCheck;
use ConfigServer::ServerStats;
use HTML::Strip;

umask(0177);
my $hs = HTML::Strip->new();
my $clean_text = $hs->parse( ConfigServer::ServerCheck::report($FORM{verbose}) );
$hs->eof;
$clean_text =~ s/&nbsp;\n//g;
$clean_text =~ s/&nbsp;//g;
$clean_text =~ s/\n\n\n/\n\n/g;
print $clean_text;