#!/usr/bin/env perl

use strict;
use warnings;
no warnings ;
use Pod::Usage;
use IPC::Run qw(start pump);
use AnyEvent::I3;
use AnyEvent;
use v5.10;
use utf8;

my $dmplex = "";
if ($#ARGV >= 0) {
	$dmplex = $ARGV[0] . " ";
}

my $i3 = i3;
my $workspaces = [];

# Disable buffering
$| = 1;

# Wait a short amount of time and try to connect to i3 again
sub reconnect {
	my $timer;
	my $c = sub {
		$timer = AnyEvent->timer(
			after => 0.01,
			cb => sub { $i3->connect->cb(\&connected) }
		);
	};
	$c->();
}

# Connection attempt succeeded or failed
sub connected {
	my ($cv) = @_;
	
	if (!$cv->recv) {
		reconnect();
		return;
	}
	
	$i3->subscribe({
		workspace => \&ws_change,
		_error => sub { reconnect() }
	});
	ws_change();
}

# Called when a ws changes
sub ws_change {
	# Request the current workspaces and update the output afterwards
	$i3->get_workspaces->cb(
		sub {
			my ($cv) = @_;
			$workspaces = $cv->recv;
			update_output();
		}
	);
}

sub update_output {
	my $drop_esc = "\e[30m\e[0m";
	my $out;
	my $xstart = 1;
	my $cb = "";

	$out .= "\e[0;".$xstart."H";
	for my $ws (@{$workspaces})
	{
		$out .= "\e[0;".$xstart."H";
		my $lb = "";
		$cb = "" if $ws->{visible};
		$cb = "" if $ws->{urgent};
		my $name = $ws->{name};
		my $bg = "\e[37;100m";
		$bg = "\e[37;44m" if $ws->{visible};
		$bg = "\e[90;106m" if $ws->{urgent};
		my $fg = "\e[90m";
		$fg = "\e[34m" if $ws->{visible};
		$fg = "\e[96m" if $ws->{urgent};
		$out .= qq|$fg$cb|;
		$out .= qq|$bg $name |;
		$cb = "\e[37m";
		#$cb = "\e[37m";
		$cb = "" if $ws->{visible};
		$cb = "" if $ws->{urgent};
		$xstart += 6;
	}
	$out .= "$drop_esc       ";
	#$out .= "\e[40m$rb$drop_esc                           ";
	print $out;
}

$i3->connect->cb(\&connected);

# let AnyEvent do the rest ("endless loop")
AnyEvent->condvar->recv
