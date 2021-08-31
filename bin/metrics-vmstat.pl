#!/usr/bin/perl -w
# This plugin uses vmstat to collect basic system metrics, produces Graphite formated output.
# Based on https://github.com/sensu-plugins/sensu-plugins-vmstats/blob/master/bin/metrics-vmstat.rb

use Getopt::Long qw(:config no_auto_abbrev no_ignore_case);
use Pod::Usage;
use Sys::Hostname;
use List::Util qw(any);

my $scheme = hostname() . '.vmstat';

GetOptions(
	'scheme|s=s' => \$scheme,
) or pod2usage(2);

my $now = time();
open(my $fh, 'vmstat 1 2|tail -n1|') or die("Cannot run vmstat");

sub output {
	my ($name, $value) = @_;
	print "$scheme.$name $value $now\n";
}

while (my $line = <$fh>) {
	$line =~ s/^\s*//;
	my @values = split(/\s+/, $line);
	
	output("procs.waiting", $values[0]);
	output("procs.uninterruptible", $values[1]);
	output("memory.swap_used", $values[2]);
	output("memory.free", $values[3]);
	output("memory.buffers", $values[4]);
	output("memory.cache", $values[5]);
	output("swap.in", $values[6]);
	output("swap.out", $values[7]);
	output("io.received", $values[8]);
	output("io.sent", $values[9]);
	output("system.interrupts_per_second", $values[10]);
	output("system.context_switches_per_second", $values[11]);
	output("cpu.user", $values[12]);
	output("cpu.system", $values[13]);
	output("cpu.idle", $values[14]);
	output("cpu.waiting", $values[15]);
	output("cpu.steal", $values[16]);
}

close($fh);
