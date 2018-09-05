#!/usr/bin/perl


print "Press ENTER to exit:";
my $value = <STDIN>;

#if ( $value =~ m/(\w){2,8}/ )
#if ($value =~ /([[:alpha:]])\+/)

#if (($value =~ m/^[! @ # $ % *]+$/) || ($value =~ m/^[a-zA-z0-9]+$/))

#if (($value =~ m/[! @ # $ % * = a-zA-Z0-9]+/) || ($value =~ m/[a-zA-z0-9]+/))
#if ($value =~ m/[! @ # $ % * = a-zA-Z0-9]+/)
#if ($value =~ m/[a-zA-z0-9!@#$%*=]+/)

#if ( $value =~ /(.)\1\1+/ )
#
if ( length($value) >= 8){

	if (($value !~ /\p{Uppercase}/) || ($value !~ /\p{Lowercase}/) || ($value !~ /[! @ # $ % *]/) )

{ print "incorrect\n";}
else {print "correct\n";}

}
else {print "password should be min 8 chars long\n";}
