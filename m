From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: [PATCH] check_protypes.pl: semi-automatic consistency checks
Date: Tue, 20 May 2014 02:00:46 +0200
Message-ID: <1400544046-4503-1-git-send-email-rv@rasmusvillemoes.dk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Most SYNOPSES are almost compilable as-is. Doing so may cause the
compiler to barf something about conflicting prototypes, which means
that we've found an inconsistency between the man-pages and the
installed headers. One then needs to manually check (e.g., consulting
POSIX, the linux kernel or some other source) who's right.

This script is an attempt at automating the task of extracting the
synopsis, removing non-code phrases which are present in many
synopses, and running gcc on the result. All temporary files are
created in /tmp/somedir; if a particular man-page passes with no
remarks, those are automatically cleaned up. Otherwise, we leave them
for the user to inspect.

I'm not sure whether it is worth including in the git repository, but
since I just had an rm -rf accident followed by a successful first
experience with extundelete, I want to make sure that these bits reach
a machine where my stupid fingers can't touch them.

Signed-off-by: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
---
 scripts/check_proto_arch.txt |   3 +
 scripts/check_proto_skip.txt |  44 +++++++++
 scripts/check_prototypes.pl  | 223 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 270 insertions(+)
 create mode 100644 scripts/check_proto_arch.txt
 create mode 100644 scripts/check_proto_skip.txt
 create mode 100755 scripts/check_prototypes.pl

diff --git a/scripts/check_proto_arch.txt b/scripts/check_proto_arch.txt
new file mode 100644
index 0000000..568557e
--- /dev/null
+++ b/scripts/check_proto_arch.txt
@@ -0,0 +1,3 @@
+perfmonctl.2	IA-64
+spu_create.2	ppc
+spu_run.2	ppc
diff --git a/scripts/check_proto_skip.txt b/scripts/check_proto_skip.txt
new file mode 100644
index 0000000..7d4b4ff
--- /dev/null
+++ b/scripts/check_proto_skip.txt
@@ -0,0 +1,44 @@
+# The usual conventions: Empty lines and lines starting with # are
+# ignored. Other lines are supposed to contain key-value pairs for the
+# %skip hash. The key is a man-page to skip, the value is optional and
+# can for example be a comment explaining why we skip it.
+
+_syscall.2
+arch_prctl.2
+bdflush.2
+
+eventfd.2	<http://thread.gmane.org/gmane.comp.lib.glibc.alpha/41725>
+
+# nmask is not const, and addr is unsigned long, not void*.
+get_mempolicy.2	numactl
+
+# keyutils.h should include <sys/types.h>, since it uses uid_t, gid_t,
+# size_t
+add_key.2	libkeyutils 
+request_key.2	libkeyutils 
+keyctl.2	libkeyutils
+
+# prctl() is really a varargs function
+prctl.2
+# ptrace() is really a varargs function
+ptrace.2
+reboot.2
+# There's no reasonable way to check setpgid.2 automatically...
+setpgid.2
+recvmmsg.2	<https://bugzilla.kernel.org/show_bug.cgi?id=75371>
+
+# Can't check pseudo-prototypes for macros assert{,_perror}
+assert.3
+assert_perror.3
+
+cfree.3
+# Can't check pseudo-prototypes for macros CMSG_*
+cmsg.3
+
+# htobe16 and friends are really macros
+endian.3
+
+# macros
+fpclassify.3
+
+finite.3
diff --git a/scripts/check_prototypes.pl b/scripts/check_prototypes.pl
new file mode 100755
index 0000000..f5d00c4
--- /dev/null
+++ b/scripts/check_prototypes.pl
@@ -0,0 +1,223 @@
+#!/usr/bin/perl
+#
+# File: check_prototypes.pl
+# Time-stamp: <2014-05-20 01:30:47 villemoes>
+# Author: Rasmus Villemoes
+#
+# Usage: ./check_prototypes.pl ../man[23]/some_man_pages
+#
+# The basic idea behind the script is rather simple: Extract the
+# SYNOPSIS from the man-page, remove text which is often present, and
+# hope that the remainder is valid C. Try to compile it, and if gcc
+# complains, it may be because the prototypes in the SYNOPSIS does not
+# match those provided by the #included header files.
+
+use strict;
+use warnings;
+
+use File::Temp qw/ tempfile tempdir /;
+use File::Basename;
+use File::Slurp;
+use List::Util qw/max/;
+
+my $verbose = 2;
+my $tmpd = tempdir("manpagecheck_XXXXXX", TMPDIR => 1, CLEANUP => 0);
+my $CC = "gcc";
+
+
+my %has_header_cache = ();
+sub has_header {
+    my $h = shift;
+    return $has_header_cache{$h} if exists $has_header_cache{$h};
+
+    # Check the obvious place first.
+    if (-r "/usr/include/$h") {
+	$has_header_cache{$h} = 1;
+	return 1;
+    }
+    # Now ask gcc.
+    my $cfile = "${tmpd}/check_header.c";
+    write_file($cfile, "#include <${h}>\n")
+	or die "error writing temporary file $cfile: $!";
+    system("${CC} -E ${cfile} > /dev/null 2> /dev/null");
+    $has_header_cache{$h} = ($? == 0);
+    unlink $cfile;
+    return $has_header_cache{$h};
+}
+
+
+sub msg {
+    my $pri = shift;
+    return if $verbose < $pri;
+    my $fmt = shift;
+    my $s = sprintf $fmt, @_;
+    $s .= "\n" unless $s =~ m/\n$/;
+    print STDOUT $s;
+};
+
+
+sub read_hash {
+    my $href = shift;
+    my $file = shift;
+    return unless -e $file;
+    open(my $fh, '<', $file)
+	or die "unable to open $file: $!";
+    while (<$fh>) {
+	chomp;
+	s/^\s+//;
+	next if $_ eq '';
+	next if m/^#/;
+	my ($key, $val) = split /\s+/, $_, 2;
+	$href->{$key} = $val;
+    }
+}
+
+# I skip some pages: In some cases, the interface is so messy
+# (e.g. conflicting definitions by multiple standards, or some
+# mysterious varargs function) that automatic checking is
+# pointless. But it may also be the header files which are wrong; in
+# some of those cases I've submitted a bug report to the appropriate
+# instance.
+my %skip;
+my $skipfile = 'check_proto_skip.txt';
+read_hash(\%skip, $skipfile);
+
+# Also hardcode a few arch-only syscalls.
+# fixme: figure out a way to ensure $arch is "normalized" to one of "ia-64", "ppc", "x86_64", ...
+my $arch = lc(qx(uname -p));
+my %arch_only;
+my $archfile = 'check_proto_arch.txt';
+read_hash(\%arch_only, $archfile);
+
+
+# Some synopses need a little tweaking before they are valid C.
+my %tweaks;
+
+# remove the raw syscall prototype
+$tweaks{'clone.2'} = sub { $_[0] =~ s/long clone\([^()]*\);//; };
+
+# remove partial struct definition.
+$tweaks{'sched_setparam.2'} = sub { $_[0] =~ s/struct sched_param \{[^{}]+\};//; };
+$tweaks{'swapon.2'} = sub { $_[0] =~ s/^\s*#include <asm\/page\.h>.*$//m; };
+$tweaks{'open.2'} = sub {
+    # open and openat are actually varargs functions, but creat is not.
+    $_[0] =~ s/(open(?:at)?\(.*)mode_t mode/$1.../g;
+    $_[0] =~ s/int open(?:at)?\(.*flags\)//g;
+};
+$tweaks{'open_by_handle_at.2'} = sub { $_[0] =~ s/^/struct file_handle;\n/; };
+
+# Remove the pseudo-prototypes of the function-like macros FD_*.
+$tweaks{'select.2'} = $tweaks{'select_tut.2'}
+    = sub { $_[0] =~ s/^\s*(int|void)\s+FD_[A-Z]+\(.*\);\s*$//mg; };
+
+$tweaks{'des_crypt.3'} = sub { $_[0] =~ s/^\s*int\s+DES_FAILED.*//m; };
+
+$tweaks{'exec.3'} = sub { $_[0] =~ s/\Q..., char * const envp[]\E/.../; };
+
+# Some interfaces are defined in terms of e.g. __pid_t, and only if
+# sys/types.h is included does one get the appropriate typedefs. To
+# avoid cluttering the man-pages with #include <sys/types.h>, we just
+# fake it.
+sub include_sys_types { $_[0] =~ s@^@#include <sys/types.h>\n@; }
+$tweaks{'getrlimit.2'} = \&include_sys_types;
+$tweaks{'getdirentries.3'} = \&include_sys_types;
+
+
+my @trouble = ();
+
+for my $f (@ARGV) {
+    my $base = basename($f);
+
+    next if (-s $f < 100); # crude check for a man link
+    if (exists $skip{$base}) {
+	msg(2, "skipping %s: %s", $f, $skip{$base} // "explicitly excluded");
+	next;
+    }
+    if (exists $arch_only{$base} && $arch ne lc($arch_only{$base})) {
+	msg(2, "skipping %s: %s only", $f, $arch_only{$base});
+	next;
+    }
+
+    # fixme: is there a better way to get the man-page stripped of all formatting?
+    my $manpage = qx/MANWIDTH=2000 man $f/;
+    if (!($manpage =~ m/SYNOPSIS(.*?)DESCRIPTION/s)) {
+	msg(1, "skipping %s: missing SYNOPSIS\n", $f);
+	next;
+    };
+    my $synops = $1;
+
+    # Remove text which is present in some synopses. Matching against
+    # rather specific strings helps to ensure that a consistent style
+    # is used throughout the man-pages (because if some text is not
+    # removed by this, gcc will complain).
+    $synops =~ s/^\s*Feature Test Macro Requirements for.*//sm;
+    $synops =~ s/^\s*Link with -l.*\.\s*$//m;
+    $synops =~ s/^\s*Each of these requires linking with -l.*\.\s*$//m; # encrypt.3 uses this wording
+    $synops =~ s/^\s*Note: There (is|are) no glibc wrappers? for th(is|ese) system calls?; see NOTES\.\s*$//m;
+    $synops =~ s/^\s*See NOTES for information on feature test macro requirements\.\s*$//m;
+
+    # If the synopsis mentions _GNU_SOURCE, we define it to check as
+    # much as possible. But we don't unconditionally define it: We get
+    # a sort-of false positive for some files (getitimer.2,
+    # getrlimit.2 etc.), since various headers play a game with
+    # typedef'ing __foobar_t as an enum type if __USE_GNU, and int
+    # otherwise.
+    my $gnu_source = ($synops =~ s/^\s*#define _GNU_SOURCE\b.*//m) ? '-D_GNU_SOURCE' : '';
+    my $xopen_source = 0;
+    while ($synops =~ s/^\s*#define _XOPEN_SOURCE (\b[0-9]+\b)?.*//m) {
+	$xopen_source = max($xopen_source, defined $1 ? $1 : 1);
+    }
+    $xopen_source = $xopen_source ? "-D_XOPEN_SOURCE=${xopen_source}" : '';
+    my $bsd_source = ($synops =~ s/^\s*#define _BSD_SOURCE\b.*//m) ? '-D_BSD_SOURCE' : '';
+
+    # Apply individual tweaks.
+    $tweaks{$base}($synops) if exists $tweaks{$base};
+
+    # Find all needed headers.
+    my @headers = ($synops =~ m/#include <([^>]+)>/g);
+    if (!@headers) {
+	msg(1, "skipping %s: no header files mentioned in SYNOPSIS\n", $f);
+	next;
+    }
+    my @missing_headers = grep {!has_header($_)} @headers;
+    if (@missing_headers) {
+	msg(1, "skipping %s: missing header file(s) %s\n", $f, join(",", @missing_headers));
+	next;
+    }
+
+    my $cfile = "${tmpd}/${base}.c";
+    my $auxfile = "${tmpd}/${base}.aux";
+    my $outfile = "${tmpd}/${base}.out";
+    my $errfile = "${tmpd}/${base}.err";
+    my $cmdfile = "${tmpd}/${base}.cmdline";
+
+    my $cmdline = "${CC} ${gnu_source} ${xopen_source} ${bsd_source} " .
+	"-aux-info ${auxfile} -c -o /dev/null ${cfile} > ${outfile} 2> ${errfile}";
+    write_file($cfile, $synops)
+	or die "error writing temporary file $cfile: $!";
+    write_file($cmdfile, $cmdline . "\n")
+	or die "error writing temporary file $cmdfile: $!";
+
+    system($cmdline);
+
+    if ($? == 0 && -s $errfile == 0) {
+    	unlink $cfile, $auxfile, $outfile, $errfile, $cmdfile
+    	    or die "error cleaning up: $!";
+    }
+    else {
+	push @trouble, $base;
+    }
+}
+
+if (@trouble) {
+    print "Problems encountered with the following files:\n";
+    for (@trouble) {
+	print "  $_\n";
+    }
+    print "The files in the directory ${tmpd} contain the details.\n";
+}
+else {
+    rmdir $tmpd;
+}
+
+
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
