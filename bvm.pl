#!/usr/bin/perl -w
use POSIX qw(ceil floor);
open("il", "$ARGV[0]") or die "can't open file";
my @cmds = <il>;
my @s;
my $sp = 0;
my $counter = 0;

sub getVal($){
    $val = shift;
    return $val =~ /s\[(.*)\]/ ? $s[$1] : $val;
}

while($sp < @cmds && $counter++ < 10000){
    #print "sp:$sp\n";
    #print "s:@s\n";
    $cmd = $cmds[$sp];
    
	if($cmd =~ /s\[(.*)\]=([-])(.*)/)
	{
		$s[$1] = -getVal($3);
    }
    elsif($cmd =~ /s\[(.*)\]=(.*)([-+*\/])(.*)/)
	{
		$v1 = getVal($2);
		$v2 = getVal($4);
		if($3 eq "-"){$s[$1] = $v1 - $v2;}
		if($3 eq "+"){$s[$1] = $v1 + $v2;}
		if($3 eq "*"){$s[$1] = $v1 * $v2;}
		if($3 eq "/"){$s[$1] = floor($v1 / $v2);}
    }	
	elsif($cmd =~ /if (.*)(==|!=|[<>])(.*) goto (\d+)/)
	{
        $v1 = getVal($1);
        $v2 = getVal($3);
        if($2 eq "==" && $v1 == $v2){$sp = $4; next;}
        if($2 eq "!=" && $v1 != $v2){$sp = $4; next;}
        if($2 eq "<" && $v1 < $v2){$sp = $4; next;}  
        if($2 eq ">" && $v1 > $v2){$sp = $4; next;}
    }
	elsif($cmd =~ /s\[(.*)\]=(.*)/)
	{
		#print "assign $1 $2\n";
		$s[$1] = getVal($2);
    }	
	elsif($cmd =~ /input s\[(\d+)\]/)
	{
		$s[$1] = <STDIN>;
		exit 0 if $s[$1] !~ /\d+/;
    }
	elsif($cmd =~ /print \"(.*)\"/)
	{
		print "$1\n";
    }
	elsif($cmd =~ /printD s\[(.*)\]/)
	{
		print "$s[$1]\n";
    }
	elsif($cmd =~ /printB s\[(.*)\]/)
	{
		printf("%b\n", $s[$1]);
    }
	elsif($cmd =~ /printH s\[(.*)\]/)
	{
		printf("0x%X\n", $s[$1]);
    }
	elsif($cmd =~ /^goto (\d+)/)
	{
		$sp = $1;
		next;
    }
    
    $sp++;
}
