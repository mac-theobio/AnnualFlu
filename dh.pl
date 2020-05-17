#!/usr/bin/perl -w

use strict;

$/ = "";

print "<html><head>\n";

while(<>){
	next if /^#/;
	last if /^END/;

	if (s/^TITLE *//){
		print "<title>$_</title>\n</head>\n";
		next;
	}
	s/^[^!]/<p>$&/;
	s/^!(\S+)\s+(.+)/<$1>$2<\/$1>/s;
	s/\{\{(\S+)\}\}/<a href=$1>$1<\/a>/gs;
	s/\{(\S+)\s+([^}]+)\}/<a href=$1>$2<\/a>/gs;
	s/\|/<br>/g;
	s/__([^_]+)__/<em>$1<\/em>/gs;

	print;

}

print "</html>\n";
