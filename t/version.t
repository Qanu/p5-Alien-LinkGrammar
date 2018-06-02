#!/usr/bin/env perl

use Test2::V0;
use Test::Alien;
use Alien::LinkGrammar;

subtest 'Link Grammar version' => sub {
	alien_ok 'Alien::LinkGrammar';

	my $xs = do { local $/; <DATA> };
	xs_ok {
		xs => $xs,
		verbose => 5,
	}, with_subtest {
		my($module) = @_;
		is $module->version, "link-grammar-@{[ Alien::LinkGrammar->version ]}",
			"Got Link Grammar version @{[ Alien::LinkGrammar->version ]}";
	};

};

done_testing;

__DATA__
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "link-grammar/link-includes.h"

const char *
version(const char *class)
{
	return linkgrammar_get_version();
}

MODULE = TA_MODULE PACKAGE = TA_MODULE

const char *version(class);
	const char *class;
