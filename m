From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: mallopt(3) man page for review
Date: Sun, 29 Apr 2012 22:42:57 +1200
Message-ID: <CAKgNAkiQ7JtKR2EEfOqv-uaGBV7bjUjuRcAsZLVOVppNzvvH1w@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=14dae9340a376a5f7804becf010b
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

--14dae9340a376a5f7804becf010b
Content-Type: text/plain; charset=ISO-8859-1

Hello,

A short while ago, I wrote a mallopt(3) manual page. I'd be happy to
receive review comments on any pieces that are missing, incorrect,
etc.

Cheers,

Michael

'\" t
.\" Copyright (c) 2012 by Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
.\"
.\" Permission is granted to make and distribute verbatim copies of this
.\" manual provided the copyright notice and this permission notice are
.\" preserved on all copies.
.\"
.\" Permission is granted to copy and distribute modified versions of this
.\" manual under the conditions for verbatim copying, provided that the
.\" entire resulting derived work is distributed under the terms of a
.\" permission notice identical to this one.
.\"
.\" Since the Linux kernel and libraries are constantly changing, this
.\" manual page may be incorrect or out-of-date.  The author(s) assume no
.\" responsibility for errors or omissions, or for damages resulting from
.\" the use of the information contained herein.  The author(s) may not
.\" have taken the same level of care in the production of this manual,
.\" which is licensed free of charge, as they might when working
.\" professionally.
.\"
.\" Formatted or processed versions of this manual, if unaccompanied by
.\" the source, must acknowledge the copyright and authors of this work.
.\"
.TH MALLOPT 3  2012-04-18 "Linux" "Linux Programmer's Manual"
.SH NAME
mallopt \- set memory allocation parameters
.SH SYNOPSIS
.B #include <malloc.h>

.BI "int mallopt(int " param ", int " value );
.SH DESCRIPTION
The
.BR mallopt ()
function adjusts parameters that control the behavior of the
memory-allocation functions (see
.BR malloc (3)).
The
.IR param
argument specifies the parameter to be modified, and
.I value
specifies the new value for that parameter.

The following values can be specified for
.IR param :
.TP
.BR M_CHECK_ACTION
Setting this parameter controls how glibc responds when various kinds
of programming errors are detected (e.g., freeing the same pointer twice).
The 3 least significant bits (2, 1, and 0) of the value assigned
to this parameter determine the glibc behavior, as follows:
.RS
.TP
Bit 0
If this bit is set, then print a one-line message on
.I stderr
that provides details about the error.
The message starts with the string "***\ glibc detected\ ***",
followed by the program name,
the name of the memory-allocation function in which the error was detected,
a brief description of the error,
and the memory address where the error was detected.
.TP
Bit 1
If this bit is set, then,
after printing any error message specified by bit 0,
the program is terminated by calling
.BR abort (3).
In glibc versions since 2.4,
if bit 0 is also set,
then, between printing the error message and aborting,
the program also prints a stack trace in the manner of
.BR backtrace (3),
and prints the process's memory mapping in the style of
.IR /proc/[pid]/maps
(see
.BR proc (5)).
.TP
Bit 2 (since glibc 2.4)
This bit has an effect only if bit 0 is also set.
If this bit is set,
then the one-line message describing the error is simplified
to contain just the name of the function where the error
was detected and the brief description of the error.
.RE
.IP
The remaining bits in
.I value
are ignored.
.IP
Combining the above details,
the following numeric values are meaningful for
.BR M_CHECK_ACTION :
.RS 12
.IP 0 3
Ignore error conditions; continue execution (with undefined results).
.IP 1
Print a detailed error message and continue execution.
.IP 2
Abort the program.
.IP 3
Print detailed error message, stack trace, and memory mappings,
and abort the program.
.IP 5
Print a simple error message and continue execution.
.IP 7
Print simple error message, stack trace, and memory mappings,
and abort the program.
.RE
.IP
Since glibc 2.3.4, the default value for the
.BR M_CHECK_ACTION
parameter is 3.
In glibc version 2.3.3 and earlier, the default value is 1.
.IP
Using a nonzero
.B M_CHECK_ACTION
value can be useful because otherwise a crash may happen much later,
and the true cause of the problem is then very hard to track down.
.TP
.BR M_MMAP_MAX
.\" The following text adapted from comments in the glibc source:
This parameter specifies the maximum number of allocation requests that
may be simultaneously serviced using
.BR mmap (2).
This parameter exists because some systems have a limited number
of internal tables for use by
.BR mmap (2),
and using more than a few of them may degrade performance.
.IP
The default value is 65,536,
a value which has no special significance and
which servers only as a safeguard.
Setting this parameter to 0 disables the use of
.BR mmap (2)
for servicing large allocation requests.
.TP
.BR M_MMAP_THRESHOLD
For allocations greater than or equal to the limit specified (in bytes) by
.BR M_MMAP_THRESHOLD
that can't be satisfied from the free list,
the memory-allocation functions employ
.BR mmap (2)
instead of increasing the program break using
.BR sbrk (2).
.IP
Allocating memory using
.BR mmap (2)
has the significant advantage that the allocated memory blocks
can always be independently released back to the system.
(By contrast,
the heap can be trimmed only if memory is freed at the top end.)
On the other hand, there are some disadvantages to the use of
.BR mmap (2):
deallocated space is not placed on the free list
for reuse by later allocations;
memory may be wasted because
.BR mmap (2)
allocations must be page-aligned;
and the kernel must perform the expensive task of zeroing out
memory allocated via
.BR mmap (2).
Balancing these factors leads to a default setting of 128*1024 for the
.BR M_MMAP_THRESHOLD
parameter.
.IP
The lower limit for this parameter is 0.
The upper limit is
.BR DEFAULT_MMAP_THRESHOLD_MAX :
512*1024 on 32-bit systems or
.IR 4*1024*1024*sizeof(long)
on 64-bit systems.
.IP
.IR Note:
Nowadays, glibc uses a dynamic mmap threshold by default.
The initial value of the threshold is 128*1024,
but when blocks larger than the current threshold and less than or equal to
.BR DEFAULT_MMAP_THRESHOLD_MAX
are freed,
the threshold is adjusted upwards to the size of the freed block.
When dynamic mmap thresholding is in effect,
the threshold for trimming the heap is also dynamically adjusted
to be twice the dynamic mmap threshold.
Dynamic adjustment of the mmap threshold is disabled if any of the
.BR M_TRIM_THRESHOLD ,
.BR M_TOP_PAD ,
.BR M_MMAP_THRESHOLD ,
or
.BR M_MMAP_MAX
parameters is set.
.TP
.BR M_MXFAST " (since glibc 2.3)"
.\" The following text adapted from comments in the glibc sources:
Set the upper limit for memory allocation requests that are satisfied
using "fastbins".
(The measurement unit for this parameter is bytes.)
Fastbins are storage areas that hold deallocated blocks of memory
of the same size without merging adjacent free blocks.
Subsequent reallocation of blocks of the same size can be handled
very quickly by allocating from the fastbin,
although memory fragmentation and the overall memory footprint
of the program can increase.
The default value for this parameter is
.IR "64*sizeof(size_t)/4"
(i.e., 64 on 32-bit architectures).
The range for this parameter is 0 to
.IR "80*sizeof(size_t)/4" .
Setting
.B M_MXFAST
to 0 disables the use of fastbins.
.TP
.BR M_PERTURB " (since glibc 2.4)"
If this parameter is set to a nonzero value,
then bytes of allocated memory (other than allocations via
.BR calloc (3))
are initialized to the complement of the value
in the least significant byte of
.IR value ,
and when allocated memory is released using
.BR free (3),
the freed bytes are set to the least significant byte of
.IR value .
This can be useful for detecting errors where programs
incorrectly rely on allocated memory being initialized to zero,
or reuse values in memory that has already been freed.
.TP
.BR M_TOP_PAD
This parameter defines the amount of padding to employ when calling
.BR sbrk (2)
to modify the program break.
(The measurement unit for this parameter is bytes.)
This parameter has an effect in the following circumstances:
.RS
.IP * 3
When the program break is increased, then
.BR M_TOP_PAD
bytes are added to the
.BR sbrk (2)
request.
.IP *
When the heap is trimmed as a consequence of calling
.BR free (3)
(see the discussion of
.BR M_TRIM_THRESHOLD )
this much free space is preserved at the top of the heap.
.RE
.IP
In either case,
the amount of padding is always rounded to a system page boundary.
.IP
Modifying
.BR M_TOP_PAD
is a trade-off between increasing the number of system calls
(when the parameter is set low)
and wasting unused memory at the top of the heap
(when the parameter is set high).
.IP
The default value for this parameter is 128*1024.
.\" DEFAULT_TOP_PAD in glibc source
.TP
.BR M_TRIM_THRESHOLD
When the amount of contiguous free memory at the top of the heap
grows sufficiently large,
.BR free (3)
employs
.BR sbrk (2)
to release this memory back to the system.
(This can be useful in programs that continue to execute for
a long period after freeing a significant amount of memory.)
The
.BR M_TRIM_THRESHOLD
parameter specifies the minimum size (in bytes) that
this block of memory must reach before
.BR sbrk (2)
is used to trim the heap.
.IP
The default value for this parameter is 128*1024.
Setting
.BR M_TRIM_THRESHOLD
to \-1 disables trimming completely.
.IP
Modifying
.BR M_TRIM_THRESHOLD
is a trade-off between increasing the number of system calls
(when the parameter is set low)
and wasting unused memory at the top of the heap
(when the parameter is set high).
.\" FIXME Do the arena parameters need to be documented?
.\" .TP
.\" .BR M_ARENA_TEST " (since glibc 2.10)"
.\" .TP
.\" .BR M_ARENA_MAX " (since glibc 2.10)"
.\"
.\" Environment variables
.\"     MALLOC_ARENA_MAX_
.\"     MALLOC_ARENA_TEST_
.\"
.\" http://udrepper.livejournal.com/20948.html describes some details
.\"	of the MALLOC_ARENA_* environment variables.
.\"
.\" These macros aren't enabled in production releases until 2.15?
.\" (see glibc malloc/Makefile)
.\"
.SS Environment Variables
A number of environment variables can be defined
to modify some of the same parameters as are controlled by
.BR mallopt ().
Using these variables has the advantage that the source code
of the program need not be changed.
To be effective, these variables must be defined before the
first call to a memory-allocation function.
(If the same parameters are adjusted via
.BR mallopt ()
then the
.BR mallopt ()
settings take precedence.)
For security reasons,
these variables are ignored in set-user-ID and set-group-ID programs.

The environment variables are as follows
(note the trailing underscore at the end of the name of each variable):
.TP
.BR MALLOC_CHECK_
This environment variable controls the same parameter as
.BR mallopt ()
.BR M_CHECK_ACTION .
If this variable is set to a nonzero value,
then a special implementation of the memory-allocation functions is used.
(This is accomplished using the
.BR malloc_hook (3)
feature.)
This implementation performs additional error checking,
but is slower
.\" On glibc 2.12/x86, a simple malloc()+free() loop is about 70% slower
.\" when MALLOC_CHECK_ was set.
than the standard set of memory-allocation functions.
(This implementation does not detect all possible errors;
memory leaks can still occur.)
.IP
The value assigned to this environment variable should be a single digit,
whose meaning is as described for
.BR M_CHECK_ACTION .
Any characters beyond the initial digit are ignored.
.IP
For security reasons, the effect of
.BR MALLOC_CHECK_
is disabled by default for set-user-ID and set-group-ID programs.
However, if the file
.IR /etc/suid\-debug
exists (the content of the file is irrelevant), then
.BR MALLOC_CHECK_
also has an effect for set-user-ID and set-group-ID programs.
.TP
.BR MALLOC_MMAP_MAX_
Controls the same parameter as
.BR mallopt ()
.BR M_MMAP_MAX .
.TP
.BR MALLOC_MMAP_THRESHOLD_
Controls the same parameter as
.BR mallopt ()
.BR M_MMAP_THRESHOLD .
.TP
.BR MALLOC_PERTURB_
Controls the same parameter as
.BR mallopt ()
.BR M_PERTURB .
.TP
.BR MALLOC_TRIM_THRESHOLD_
Controls the same parameter as
.BR mallopt ()
.BR M_TRIM_THRESHOLD .
.TP
.BR MALLOC_TOP_PAD_
Controls the same parameter as
.BR mallopt ()
.BR M_TOP_PAD .
.SH RETURN VALUE
On success,
.BR mallopt ()
returns 1.
On error, it returns 0.
.SH ERRORS
On error,
.I errno
is
.I not
set.
.\" .SH VERSIONS
.\" Available already in glibc 2.0, possibly earlier
.SH CONFORMING TO
This function is not specified by POSIX or the C standards.
A similar function exists on many System V derivatives,
but the range of values for
.IR param
varies across systems.
The SVID defined options
.BR M_MXFAST ,
.BR M_NLBLKS ,
.BR M_GRAIN ,
and
.BR M_KEEP ,
but only the first of these is implemented in glibc.
.\" .SH NOTES
.SH BUGS
Specifying an invalid value for
.I param
does not generate an error.

A calculation error within the glibc implementation means that
a call of the form:
.\" FIXME This looks buggy:
.\" setting the M_MXFAST limit rounds up:    (s + SIZE_SZ) & ~MALLOC_ALIGN_MASK)
.\" malloc requests are rounded up:
.\"    (req) + SIZE_SZ + MALLOC_ALIGN_MASK) & ~MALLOC_ALIGN_MASK
.\" http://sources.redhat.com/bugzilla/show_bug.cgi?id=12129
.nf

    mallopt(M_MXFAST, n)

.fi
does not result in fastbins being employed for all allocations of size up to
.IR n .
To ensure desired results,
.I n
should be rounded up to the next multiple greater than or equal to
.IR (2k+1)*sizeof(size_t) ,
where
.I k
is an integer.
.\" Bins are multiples of 2 * sizeof(size_t) + sizeof(size_t)

The
.BR MALLOC_MMAP_THRESHOLD_
and
.BR MALLOC_MMAP_MAX_
variables are
.I not
ignored in set-group-ID programs.
.\" FIXME MALLOC_MMAP_THRESHOLD_ and MALLOC_MMAP_MAX_
.\" do have an effect for set-user-ID programs (but not
.\" set-group-ID programs).
.\" http://sources.redhat.com/bugzilla/show_bug.cgi?id=12155

If
.BR mallopt ()
is used to set
.BR M_PERTURB ,
then, as expected, the bytes of allocated memory are initialized
to the complement of the byte in
.IR value ,
and when that memory is freed,
the bytes of the region are initialized to the byte specified in
.IR value .
However, there is an
.RI off-by- sizeof(size_t)
error in the implementation:
.\" FIXME http://sources.redhat.com/bugzilla/show_bug.cgi?id=12140
instead of initializing precisely the block of memory
being freed by the call
.IR free(p) ,
the block starting at
.I p+sizeof(size_t)
is initialized.
.SH EXAMPLE
The program below demonstrates the use of
.BR M_CHECK_ACTION .
If the program is supplied with an (integer) command-line argument,
then that argument is used to set the
.BR M_CHECK_ACTION
parameter.
The program then allocates a block of memory,
and frees it twice (an error).

The following shell session shows what happens when we run this program
under glibc, with the default value for
.BR M_CHECK_ACTION :
.in +4n
.nf

$ \fB./a.out\fP
*** glibc detected *** ./a.out: double free or corruption (top): 0x09d30008 ***
======= Backtrace: =========
/lib/libc.so.6(+0x6c501)[0x523501]
/lib/libc.so.6(+0x6dd70)[0x524d70]
/lib/libc.so.6(cfree+0x6d)[0x527e5d]
\&./a.out[0x80485db]
/lib/libc.so.6(__libc_start_main+0xe7)[0x4cdce7]
\&./a.out[0x8048471]
======= Memory map: ========
001e4000\-001fe000 r\-xp 00000000 08:06 1083555    /lib/libgcc_s.so.1
001fe000\-001ff000 r\-\-p 00019000 08:06 1083555    /lib/libgcc_s.so.1
[some lines omitted]
b7814000\-b7817000 rw\-p 00000000 00:00 0
bff53000\-bff74000 rw\-p 00000000 00:00 0          [stack]
Aborted (core dumped)
.fi
.in
.PP
The following runs show the results when employing other values for
.BR M_CHECK_ACTION :
.PP
.in +4n
.nf
$ \fB./a.out 1\fP             # Diagnose error and continue
main(): returned from first free() call
*** glibc detected *** ./a.out: double free or corruption (top): 0x09cbe008 ***
main(): returned from second free() call
$ \fB./a.out 2\fP             # Abort without error message
main(): returned from first free() call
Aborted (core dumped)
$ \fB./a.out 0\fP             # Ignore error and continue
main(): returned from first free() call
main(): returned from second free() call
.fi
.in
.PP
The next run shows how to set the same parameter using the
.B MALLOC_CHECK_
environment variable:
.PP
.in +4n
.nf
$ \fBMALLOC_CHECK_=1 ./a.out\fP
main(): returned from first free() call
*** glibc detected *** ./a.out: free(): invalid pointer: 0x092c2008 ***
main(): returned from second free() call
.fi
.in
.SS Program source
\&
.nf
#include <malloc.h>
#include <stdio.h>
#include <stdlib.h>

int
main(int argc, char *argv[])
{
    char *p;

    if (argc > 1) {
        if (argc != 2) {
            fprintf(stderr, "%s <M_CHECK_ACTION\-value>\\n", argv[0]);
            exit(EXIT_FAILURE);
        }
    }

    if (mallopt(M_CHECK_ACTION, atoi(argv[1])) != 1) {
        fprintf(stderr, "mallopt() failed");
        exit(EXIT_FAILURE);
    }

    p = malloc(1000);
    if (p == NULL) {
        fprintf(stderr, "malloc() failed");
        exit(EXIT_FAILURE);
    }

    free(p);
    printf("main(): returned from first free() call\\n");

    free(p);
    printf("main(): returned from second free() call\\n");

    exit(EXIT_SUCCESS);
}
.fi
.SH SEE ALSO
.ad l
.nh
.BR mmap (2)
.BR sbrk (2),
.BR mallinfo (3),
.BR malloc (3),
.BR malloc_hook (3),
.BR malloc_info (3),
.BR malloc_stats (3),
.BR malloc_trim (3),
.BR mcheck (3),
.BR mtrace (3),
.BR posix_memalign (3)

--14dae9340a376a5f7804becf010b
Content-Type: application/octet-stream; name="mallopt.3"
Content-Disposition: attachment; filename="mallopt.3"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_h1k75o4v0

J1wiIHQKLlwiIENvcHlyaWdodCAoYykgMjAxMiBieSBNaWNoYWVsIEtlcnJpc2sgPG10ay5tYW5w
YWdlc0BnbWFpbC5jb20+Ci5cIgouXCIgUGVybWlzc2lvbiBpcyBncmFudGVkIHRvIG1ha2UgYW5k
IGRpc3RyaWJ1dGUgdmVyYmF0aW0gY29waWVzIG9mIHRoaXMKLlwiIG1hbnVhbCBwcm92aWRlZCB0
aGUgY29weXJpZ2h0IG5vdGljZSBhbmQgdGhpcyBwZXJtaXNzaW9uIG5vdGljZSBhcmUKLlwiIHBy
ZXNlcnZlZCBvbiBhbGwgY29waWVzLgouXCIKLlwiIFBlcm1pc3Npb24gaXMgZ3JhbnRlZCB0byBj
b3B5IGFuZCBkaXN0cmlidXRlIG1vZGlmaWVkIHZlcnNpb25zIG9mIHRoaXMKLlwiIG1hbnVhbCB1
bmRlciB0aGUgY29uZGl0aW9ucyBmb3IgdmVyYmF0aW0gY29weWluZywgcHJvdmlkZWQgdGhhdCB0
aGUKLlwiIGVudGlyZSByZXN1bHRpbmcgZGVyaXZlZCB3b3JrIGlzIGRpc3RyaWJ1dGVkIHVuZGVy
IHRoZSB0ZXJtcyBvZiBhCi5cIiBwZXJtaXNzaW9uIG5vdGljZSBpZGVudGljYWwgdG8gdGhpcyBv
bmUuCi5cIgouXCIgU2luY2UgdGhlIExpbnV4IGtlcm5lbCBhbmQgbGlicmFyaWVzIGFyZSBjb25z
dGFudGx5IGNoYW5naW5nLCB0aGlzCi5cIiBtYW51YWwgcGFnZSBtYXkgYmUgaW5jb3JyZWN0IG9y
IG91dC1vZi1kYXRlLiAgVGhlIGF1dGhvcihzKSBhc3N1bWUgbm8KLlwiIHJlc3BvbnNpYmlsaXR5
IGZvciBlcnJvcnMgb3Igb21pc3Npb25zLCBvciBmb3IgZGFtYWdlcyByZXN1bHRpbmcgZnJvbQou
XCIgdGhlIHVzZSBvZiB0aGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGhlcmVpbi4gIFRoZSBhdXRo
b3IocykgbWF5IG5vdAouXCIgaGF2ZSB0YWtlbiB0aGUgc2FtZSBsZXZlbCBvZiBjYXJlIGluIHRo
ZSBwcm9kdWN0aW9uIG9mIHRoaXMgbWFudWFsLAouXCIgd2hpY2ggaXMgbGljZW5zZWQgZnJlZSBv
ZiBjaGFyZ2UsIGFzIHRoZXkgbWlnaHQgd2hlbiB3b3JraW5nCi5cIiBwcm9mZXNzaW9uYWxseS4K
LlwiCi5cIiBGb3JtYXR0ZWQgb3IgcHJvY2Vzc2VkIHZlcnNpb25zIG9mIHRoaXMgbWFudWFsLCBp
ZiB1bmFjY29tcGFuaWVkIGJ5Ci5cIiB0aGUgc291cmNlLCBtdXN0IGFja25vd2xlZGdlIHRoZSBj
b3B5cmlnaHQgYW5kIGF1dGhvcnMgb2YgdGhpcyB3b3JrLgouXCIKLlRIIE1BTExPUFQgMyAgMjAx
Mi0wNC0xOCAiTGludXgiICJMaW51eCBQcm9ncmFtbWVyJ3MgTWFudWFsIgouU0ggTkFNRQptYWxs
b3B0IFwtIHNldCBtZW1vcnkgYWxsb2NhdGlvbiBwYXJhbWV0ZXJzCi5TSCBTWU5PUFNJUwouQiAj
aW5jbHVkZSA8bWFsbG9jLmg+CgouQkkgImludCBtYWxsb3B0KGludCAiIHBhcmFtICIsIGludCAi
IHZhbHVlICk7Ci5TSCBERVNDUklQVElPTgpUaGUKLkJSIG1hbGxvcHQgKCkKZnVuY3Rpb24gYWRq
dXN0cyBwYXJhbWV0ZXJzIHRoYXQgY29udHJvbCB0aGUgYmVoYXZpb3Igb2YgdGhlCm1lbW9yeS1h
bGxvY2F0aW9uIGZ1bmN0aW9ucyAoc2VlCi5CUiBtYWxsb2MgKDMpKS4KVGhlCi5JUiBwYXJhbQph
cmd1bWVudCBzcGVjaWZpZXMgdGhlIHBhcmFtZXRlciB0byBiZSBtb2RpZmllZCwgYW5kCi5JIHZh
bHVlCnNwZWNpZmllcyB0aGUgbmV3IHZhbHVlIGZvciB0aGF0IHBhcmFtZXRlci4KClRoZSBmb2xs
b3dpbmcgdmFsdWVzIGNhbiBiZSBzcGVjaWZpZWQgZm9yCi5JUiBwYXJhbSA6Ci5UUAouQlIgTV9D
SEVDS19BQ1RJT04KU2V0dGluZyB0aGlzIHBhcmFtZXRlciBjb250cm9scyBob3cgZ2xpYmMgcmVz
cG9uZHMgd2hlbiB2YXJpb3VzIGtpbmRzCm9mIHByb2dyYW1taW5nIGVycm9ycyBhcmUgZGV0ZWN0
ZWQgKGUuZy4sIGZyZWVpbmcgdGhlIHNhbWUgcG9pbnRlciB0d2ljZSkuClRoZSAzIGxlYXN0IHNp
Z25pZmljYW50IGJpdHMgKDIsIDEsIGFuZCAwKSBvZiB0aGUgdmFsdWUgYXNzaWduZWQKdG8gdGhp
cyBwYXJhbWV0ZXIgZGV0ZXJtaW5lIHRoZSBnbGliYyBiZWhhdmlvciwgYXMgZm9sbG93czoKLlJT
Ci5UUApCaXQgMApJZiB0aGlzIGJpdCBpcyBzZXQsIHRoZW4gcHJpbnQgYSBvbmUtbGluZSBtZXNz
YWdlIG9uCi5JIHN0ZGVycgp0aGF0IHByb3ZpZGVzIGRldGFpbHMgYWJvdXQgdGhlIGVycm9yLgpU
aGUgbWVzc2FnZSBzdGFydHMgd2l0aCB0aGUgc3RyaW5nICIqKipcIGdsaWJjIGRldGVjdGVkXCAq
KioiLApmb2xsb3dlZCBieSB0aGUgcHJvZ3JhbSBuYW1lLAp0aGUgbmFtZSBvZiB0aGUgbWVtb3J5
LWFsbG9jYXRpb24gZnVuY3Rpb24gaW4gd2hpY2ggdGhlIGVycm9yIHdhcyBkZXRlY3RlZCwKYSBi
cmllZiBkZXNjcmlwdGlvbiBvZiB0aGUgZXJyb3IsCmFuZCB0aGUgbWVtb3J5IGFkZHJlc3Mgd2hl
cmUgdGhlIGVycm9yIHdhcyBkZXRlY3RlZC4KLlRQCkJpdCAxCklmIHRoaXMgYml0IGlzIHNldCwg
dGhlbiwKYWZ0ZXIgcHJpbnRpbmcgYW55IGVycm9yIG1lc3NhZ2Ugc3BlY2lmaWVkIGJ5IGJpdCAw
LAp0aGUgcHJvZ3JhbSBpcyB0ZXJtaW5hdGVkIGJ5IGNhbGxpbmcKLkJSIGFib3J0ICgzKS4KSW4g
Z2xpYmMgdmVyc2lvbnMgc2luY2UgMi40LAppZiBiaXQgMCBpcyBhbHNvIHNldCwKdGhlbiwgYmV0
d2VlbiBwcmludGluZyB0aGUgZXJyb3IgbWVzc2FnZSBhbmQgYWJvcnRpbmcsCnRoZSBwcm9ncmFt
IGFsc28gcHJpbnRzIGEgc3RhY2sgdHJhY2UgaW4gdGhlIG1hbm5lciBvZgouQlIgYmFja3RyYWNl
ICgzKSwKYW5kIHByaW50cyB0aGUgcHJvY2VzcydzIG1lbW9yeSBtYXBwaW5nIGluIHRoZSBzdHls
ZSBvZgouSVIgL3Byb2MvW3BpZF0vbWFwcwooc2VlCi5CUiBwcm9jICg1KSkuCi5UUApCaXQgMiAo
c2luY2UgZ2xpYmMgMi40KQpUaGlzIGJpdCBoYXMgYW4gZWZmZWN0IG9ubHkgaWYgYml0IDAgaXMg
YWxzbyBzZXQuCklmIHRoaXMgYml0IGlzIHNldCwKdGhlbiB0aGUgb25lLWxpbmUgbWVzc2FnZSBk
ZXNjcmliaW5nIHRoZSBlcnJvciBpcyBzaW1wbGlmaWVkCnRvIGNvbnRhaW4ganVzdCB0aGUgbmFt
ZSBvZiB0aGUgZnVuY3Rpb24gd2hlcmUgdGhlIGVycm9yCndhcyBkZXRlY3RlZCBhbmQgdGhlIGJy
aWVmIGRlc2NyaXB0aW9uIG9mIHRoZSBlcnJvci4KLlJFCi5JUApUaGUgcmVtYWluaW5nIGJpdHMg
aW4KLkkgdmFsdWUKYXJlIGlnbm9yZWQuCi5JUApDb21iaW5pbmcgdGhlIGFib3ZlIGRldGFpbHMs
CnRoZSBmb2xsb3dpbmcgbnVtZXJpYyB2YWx1ZXMgYXJlIG1lYW5pbmdmdWwgZm9yCi5CUiBNX0NI
RUNLX0FDVElPTiA6Ci5SUyAxMgouSVAgMCAzCklnbm9yZSBlcnJvciBjb25kaXRpb25zOyBjb250
aW51ZSBleGVjdXRpb24gKHdpdGggdW5kZWZpbmVkIHJlc3VsdHMpLgouSVAgMQpQcmludCBhIGRl
dGFpbGVkIGVycm9yIG1lc3NhZ2UgYW5kIGNvbnRpbnVlIGV4ZWN1dGlvbi4KLklQIDIKQWJvcnQg
dGhlIHByb2dyYW0uCi5JUCAzClByaW50IGRldGFpbGVkIGVycm9yIG1lc3NhZ2UsIHN0YWNrIHRy
YWNlLCBhbmQgbWVtb3J5IG1hcHBpbmdzLAphbmQgYWJvcnQgdGhlIHByb2dyYW0uCi5JUCA1ClBy
aW50IGEgc2ltcGxlIGVycm9yIG1lc3NhZ2UgYW5kIGNvbnRpbnVlIGV4ZWN1dGlvbi4KLklQIDcK
UHJpbnQgc2ltcGxlIGVycm9yIG1lc3NhZ2UsIHN0YWNrIHRyYWNlLCBhbmQgbWVtb3J5IG1hcHBp
bmdzLAphbmQgYWJvcnQgdGhlIHByb2dyYW0uCi5SRQouSVAKU2luY2UgZ2xpYmMgMi4zLjQsIHRo
ZSBkZWZhdWx0IHZhbHVlIGZvciB0aGUKLkJSIE1fQ0hFQ0tfQUNUSU9OCnBhcmFtZXRlciBpcyAz
LgpJbiBnbGliYyB2ZXJzaW9uIDIuMy4zIGFuZCBlYXJsaWVyLCB0aGUgZGVmYXVsdCB2YWx1ZSBp
cyAxLgouSVAKVXNpbmcgYSBub256ZXJvCi5CIE1fQ0hFQ0tfQUNUSU9OCnZhbHVlIGNhbiBiZSB1
c2VmdWwgYmVjYXVzZSBvdGhlcndpc2UgYSBjcmFzaCBtYXkgaGFwcGVuIG11Y2ggbGF0ZXIsCmFu
ZCB0aGUgdHJ1ZSBjYXVzZSBvZiB0aGUgcHJvYmxlbSBpcyB0aGVuIHZlcnkgaGFyZCB0byB0cmFj
ayBkb3duLgouVFAKLkJSIE1fTU1BUF9NQVgKLlwiIFRoZSBmb2xsb3dpbmcgdGV4dCBhZGFwdGVk
IGZyb20gY29tbWVudHMgaW4gdGhlIGdsaWJjIHNvdXJjZToKVGhpcyBwYXJhbWV0ZXIgc3BlY2lm
aWVzIHRoZSBtYXhpbXVtIG51bWJlciBvZiBhbGxvY2F0aW9uIHJlcXVlc3RzIHRoYXQKbWF5IGJl
IHNpbXVsdGFuZW91c2x5IHNlcnZpY2VkIHVzaW5nCi5CUiBtbWFwICgyKS4KVGhpcyBwYXJhbWV0
ZXIgZXhpc3RzIGJlY2F1c2Ugc29tZSBzeXN0ZW1zIGhhdmUgYSBsaW1pdGVkIG51bWJlcgpvZiBp
bnRlcm5hbCB0YWJsZXMgZm9yIHVzZSBieQouQlIgbW1hcCAoMiksCmFuZCB1c2luZyBtb3JlIHRo
YW4gYSBmZXcgb2YgdGhlbSBtYXkgZGVncmFkZSBwZXJmb3JtYW5jZS4KLklQClRoZSBkZWZhdWx0
IHZhbHVlIGlzIDY1LDUzNiwKYSB2YWx1ZSB3aGljaCBoYXMgbm8gc3BlY2lhbCBzaWduaWZpY2Fu
Y2UgYW5kCndoaWNoIHNlcnZlcnMgb25seSBhcyBhIHNhZmVndWFyZC4KU2V0dGluZyB0aGlzIHBh
cmFtZXRlciB0byAwIGRpc2FibGVzIHRoZSB1c2Ugb2YKLkJSIG1tYXAgKDIpCmZvciBzZXJ2aWNp
bmcgbGFyZ2UgYWxsb2NhdGlvbiByZXF1ZXN0cy4KLlRQCi5CUiBNX01NQVBfVEhSRVNIT0xECkZv
ciBhbGxvY2F0aW9ucyBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8gdGhlIGxpbWl0IHNwZWNpZmll
ZCAoaW4gYnl0ZXMpIGJ5Ci5CUiBNX01NQVBfVEhSRVNIT0xECnRoYXQgY2FuJ3QgYmUgc2F0aXNm
aWVkIGZyb20gdGhlIGZyZWUgbGlzdCwKdGhlIG1lbW9yeS1hbGxvY2F0aW9uIGZ1bmN0aW9ucyBl
bXBsb3kKLkJSIG1tYXAgKDIpCmluc3RlYWQgb2YgaW5jcmVhc2luZyB0aGUgcHJvZ3JhbSBicmVh
ayB1c2luZwouQlIgc2JyayAoMikuCi5JUApBbGxvY2F0aW5nIG1lbW9yeSB1c2luZwouQlIgbW1h
cCAoMikKaGFzIHRoZSBzaWduaWZpY2FudCBhZHZhbnRhZ2UgdGhhdCB0aGUgYWxsb2NhdGVkIG1l
bW9yeSBibG9ja3MKY2FuIGFsd2F5cyBiZSBpbmRlcGVuZGVudGx5IHJlbGVhc2VkIGJhY2sgdG8g
dGhlIHN5c3RlbS4KKEJ5IGNvbnRyYXN0LAp0aGUgaGVhcCBjYW4gYmUgdHJpbW1lZCBvbmx5IGlm
IG1lbW9yeSBpcyBmcmVlZCBhdCB0aGUgdG9wIGVuZC4pCk9uIHRoZSBvdGhlciBoYW5kLCB0aGVy
ZSBhcmUgc29tZSBkaXNhZHZhbnRhZ2VzIHRvIHRoZSB1c2Ugb2YKLkJSIG1tYXAgKDIpOgpkZWFs
bG9jYXRlZCBzcGFjZSBpcyBub3QgcGxhY2VkIG9uIHRoZSBmcmVlIGxpc3QKZm9yIHJldXNlIGJ5
IGxhdGVyIGFsbG9jYXRpb25zOwptZW1vcnkgbWF5IGJlIHdhc3RlZCBiZWNhdXNlCi5CUiBtbWFw
ICgyKQphbGxvY2F0aW9ucyBtdXN0IGJlIHBhZ2UtYWxpZ25lZDsKYW5kIHRoZSBrZXJuZWwgbXVz
dCBwZXJmb3JtIHRoZSBleHBlbnNpdmUgdGFzayBvZiB6ZXJvaW5nIG91dAptZW1vcnkgYWxsb2Nh
dGVkIHZpYQouQlIgbW1hcCAoMikuCkJhbGFuY2luZyB0aGVzZSBmYWN0b3JzIGxlYWRzIHRvIGEg
ZGVmYXVsdCBzZXR0aW5nIG9mIDEyOCoxMDI0IGZvciB0aGUKLkJSIE1fTU1BUF9USFJFU0hPTEQK
cGFyYW1ldGVyLgouSVAKVGhlIGxvd2VyIGxpbWl0IGZvciB0aGlzIHBhcmFtZXRlciBpcyAwLgpU
aGUgdXBwZXIgbGltaXQgaXMKLkJSIERFRkFVTFRfTU1BUF9USFJFU0hPTERfTUFYIDoKNTEyKjEw
MjQgb24gMzItYml0IHN5c3RlbXMgb3IKLklSIDQqMTAyNCoxMDI0KnNpemVvZihsb25nKQpvbiA2
NC1iaXQgc3lzdGVtcy4KLklQCi5JUiBOb3RlOgpOb3dhZGF5cywgZ2xpYmMgdXNlcyBhIGR5bmFt
aWMgbW1hcCB0aHJlc2hvbGQgYnkgZGVmYXVsdC4KVGhlIGluaXRpYWwgdmFsdWUgb2YgdGhlIHRo
cmVzaG9sZCBpcyAxMjgqMTAyNCwKYnV0IHdoZW4gYmxvY2tzIGxhcmdlciB0aGFuIHRoZSBjdXJy
ZW50IHRocmVzaG9sZCBhbmQgbGVzcyB0aGFuIG9yIGVxdWFsIHRvCi5CUiBERUZBVUxUX01NQVBf
VEhSRVNIT0xEX01BWAphcmUgZnJlZWQsCnRoZSB0aHJlc2hvbGQgaXMgYWRqdXN0ZWQgdXB3YXJk
cyB0byB0aGUgc2l6ZSBvZiB0aGUgZnJlZWQgYmxvY2suCldoZW4gZHluYW1pYyBtbWFwIHRocmVz
aG9sZGluZyBpcyBpbiBlZmZlY3QsCnRoZSB0aHJlc2hvbGQgZm9yIHRyaW1taW5nIHRoZSBoZWFw
IGlzIGFsc28gZHluYW1pY2FsbHkgYWRqdXN0ZWQKdG8gYmUgdHdpY2UgdGhlIGR5bmFtaWMgbW1h
cCB0aHJlc2hvbGQuCkR5bmFtaWMgYWRqdXN0bWVudCBvZiB0aGUgbW1hcCB0aHJlc2hvbGQgaXMg
ZGlzYWJsZWQgaWYgYW55IG9mIHRoZQouQlIgTV9UUklNX1RIUkVTSE9MRCAsCi5CUiBNX1RPUF9Q
QUQgLAouQlIgTV9NTUFQX1RIUkVTSE9MRCAsCm9yCi5CUiBNX01NQVBfTUFYCnBhcmFtZXRlcnMg
aXMgc2V0LgouVFAKLkJSIE1fTVhGQVNUICIgKHNpbmNlIGdsaWJjIDIuMykiCi5cIiBUaGUgZm9s
bG93aW5nIHRleHQgYWRhcHRlZCBmcm9tIGNvbW1lbnRzIGluIHRoZSBnbGliYyBzb3VyY2VzOgpT
ZXQgdGhlIHVwcGVyIGxpbWl0IGZvciBtZW1vcnkgYWxsb2NhdGlvbiByZXF1ZXN0cyB0aGF0IGFy
ZSBzYXRpc2ZpZWQKdXNpbmcgImZhc3RiaW5zIi4KKFRoZSBtZWFzdXJlbWVudCB1bml0IGZvciB0
aGlzIHBhcmFtZXRlciBpcyBieXRlcy4pCkZhc3RiaW5zIGFyZSBzdG9yYWdlIGFyZWFzIHRoYXQg
aG9sZCBkZWFsbG9jYXRlZCBibG9ja3Mgb2YgbWVtb3J5Cm9mIHRoZSBzYW1lIHNpemUgd2l0aG91
dCBtZXJnaW5nIGFkamFjZW50IGZyZWUgYmxvY2tzLgpTdWJzZXF1ZW50IHJlYWxsb2NhdGlvbiBv
ZiBibG9ja3Mgb2YgdGhlIHNhbWUgc2l6ZSBjYW4gYmUgaGFuZGxlZAp2ZXJ5IHF1aWNrbHkgYnkg
YWxsb2NhdGluZyBmcm9tIHRoZSBmYXN0YmluLAphbHRob3VnaCBtZW1vcnkgZnJhZ21lbnRhdGlv
biBhbmQgdGhlIG92ZXJhbGwgbWVtb3J5IGZvb3RwcmludApvZiB0aGUgcHJvZ3JhbSBjYW4gaW5j
cmVhc2UuClRoZSBkZWZhdWx0IHZhbHVlIGZvciB0aGlzIHBhcmFtZXRlciBpcwouSVIgIjY0KnNp
emVvZihzaXplX3QpLzQiCihpLmUuLCA2NCBvbiAzMi1iaXQgYXJjaGl0ZWN0dXJlcykuClRoZSBy
YW5nZSBmb3IgdGhpcyBwYXJhbWV0ZXIgaXMgMCB0bwouSVIgIjgwKnNpemVvZihzaXplX3QpLzQi
IC4KU2V0dGluZwouQiBNX01YRkFTVAp0byAwIGRpc2FibGVzIHRoZSB1c2Ugb2YgZmFzdGJpbnMu
Ci5UUAouQlIgTV9QRVJUVVJCICIgKHNpbmNlIGdsaWJjIDIuNCkiCklmIHRoaXMgcGFyYW1ldGVy
IGlzIHNldCB0byBhIG5vbnplcm8gdmFsdWUsCnRoZW4gYnl0ZXMgb2YgYWxsb2NhdGVkIG1lbW9y
eSAob3RoZXIgdGhhbiBhbGxvY2F0aW9ucyB2aWEKLkJSIGNhbGxvYyAoMykpCmFyZSBpbml0aWFs
aXplZCB0byB0aGUgY29tcGxlbWVudCBvZiB0aGUgdmFsdWUKaW4gdGhlIGxlYXN0IHNpZ25pZmlj
YW50IGJ5dGUgb2YKLklSIHZhbHVlICwKYW5kIHdoZW4gYWxsb2NhdGVkIG1lbW9yeSBpcyByZWxl
YXNlZCB1c2luZwouQlIgZnJlZSAoMyksCnRoZSBmcmVlZCBieXRlcyBhcmUgc2V0IHRvIHRoZSBs
ZWFzdCBzaWduaWZpY2FudCBieXRlIG9mCi5JUiB2YWx1ZSAuClRoaXMgY2FuIGJlIHVzZWZ1bCBm
b3IgZGV0ZWN0aW5nIGVycm9ycyB3aGVyZSBwcm9ncmFtcwppbmNvcnJlY3RseSByZWx5IG9uIGFs
bG9jYXRlZCBtZW1vcnkgYmVpbmcgaW5pdGlhbGl6ZWQgdG8gemVybywKb3IgcmV1c2UgdmFsdWVz
IGluIG1lbW9yeSB0aGF0IGhhcyBhbHJlYWR5IGJlZW4gZnJlZWQuCi5UUAouQlIgTV9UT1BfUEFE
ClRoaXMgcGFyYW1ldGVyIGRlZmluZXMgdGhlIGFtb3VudCBvZiBwYWRkaW5nIHRvIGVtcGxveSB3
aGVuIGNhbGxpbmcKLkJSIHNicmsgKDIpCnRvIG1vZGlmeSB0aGUgcHJvZ3JhbSBicmVhay4KKFRo
ZSBtZWFzdXJlbWVudCB1bml0IGZvciB0aGlzIHBhcmFtZXRlciBpcyBieXRlcy4pClRoaXMgcGFy
YW1ldGVyIGhhcyBhbiBlZmZlY3QgaW4gdGhlIGZvbGxvd2luZyBjaXJjdW1zdGFuY2VzOgouUlMK
LklQICogMwpXaGVuIHRoZSBwcm9ncmFtIGJyZWFrIGlzIGluY3JlYXNlZCwgdGhlbgouQlIgTV9U
T1BfUEFECmJ5dGVzIGFyZSBhZGRlZCB0byB0aGUKLkJSIHNicmsgKDIpCnJlcXVlc3QuCi5JUCAq
CldoZW4gdGhlIGhlYXAgaXMgdHJpbW1lZCBhcyBhIGNvbnNlcXVlbmNlIG9mIGNhbGxpbmcKLkJS
IGZyZWUgKDMpCihzZWUgdGhlIGRpc2N1c3Npb24gb2YKLkJSIE1fVFJJTV9USFJFU0hPTEQgKQp0
aGlzIG11Y2ggZnJlZSBzcGFjZSBpcyBwcmVzZXJ2ZWQgYXQgdGhlIHRvcCBvZiB0aGUgaGVhcC4K
LlJFCi5JUApJbiBlaXRoZXIgY2FzZSwKdGhlIGFtb3VudCBvZiBwYWRkaW5nIGlzIGFsd2F5cyBy
b3VuZGVkIHRvIGEgc3lzdGVtIHBhZ2UgYm91bmRhcnkuCi5JUApNb2RpZnlpbmcKLkJSIE1fVE9Q
X1BBRAppcyBhIHRyYWRlLW9mZiBiZXR3ZWVuIGluY3JlYXNpbmcgdGhlIG51bWJlciBvZiBzeXN0
ZW0gY2FsbHMKKHdoZW4gdGhlIHBhcmFtZXRlciBpcyBzZXQgbG93KQphbmQgd2FzdGluZyB1bnVz
ZWQgbWVtb3J5IGF0IHRoZSB0b3Agb2YgdGhlIGhlYXAKKHdoZW4gdGhlIHBhcmFtZXRlciBpcyBz
ZXQgaGlnaCkuCi5JUApUaGUgZGVmYXVsdCB2YWx1ZSBmb3IgdGhpcyBwYXJhbWV0ZXIgaXMgMTI4
KjEwMjQuCi5cIiBERUZBVUxUX1RPUF9QQUQgaW4gZ2xpYmMgc291cmNlCi5UUAouQlIgTV9UUklN
X1RIUkVTSE9MRApXaGVuIHRoZSBhbW91bnQgb2YgY29udGlndW91cyBmcmVlIG1lbW9yeSBhdCB0
aGUgdG9wIG9mIHRoZSBoZWFwCmdyb3dzIHN1ZmZpY2llbnRseSBsYXJnZSwKLkJSIGZyZWUgKDMp
CmVtcGxveXMKLkJSIHNicmsgKDIpCnRvIHJlbGVhc2UgdGhpcyBtZW1vcnkgYmFjayB0byB0aGUg
c3lzdGVtLgooVGhpcyBjYW4gYmUgdXNlZnVsIGluIHByb2dyYW1zIHRoYXQgY29udGludWUgdG8g
ZXhlY3V0ZSBmb3IKYSBsb25nIHBlcmlvZCBhZnRlciBmcmVlaW5nIGEgc2lnbmlmaWNhbnQgYW1v
dW50IG9mIG1lbW9yeS4pClRoZQouQlIgTV9UUklNX1RIUkVTSE9MRApwYXJhbWV0ZXIgc3BlY2lm
aWVzIHRoZSBtaW5pbXVtIHNpemUgKGluIGJ5dGVzKSB0aGF0CnRoaXMgYmxvY2sgb2YgbWVtb3J5
IG11c3QgcmVhY2ggYmVmb3JlCi5CUiBzYnJrICgyKQppcyB1c2VkIHRvIHRyaW0gdGhlIGhlYXAu
Ci5JUApUaGUgZGVmYXVsdCB2YWx1ZSBmb3IgdGhpcyBwYXJhbWV0ZXIgaXMgMTI4KjEwMjQuClNl
dHRpbmcKLkJSIE1fVFJJTV9USFJFU0hPTEQKdG8gXC0xIGRpc2FibGVzIHRyaW1taW5nIGNvbXBs
ZXRlbHkuCi5JUApNb2RpZnlpbmcKLkJSIE1fVFJJTV9USFJFU0hPTEQKaXMgYSB0cmFkZS1vZmYg
YmV0d2VlbiBpbmNyZWFzaW5nIHRoZSBudW1iZXIgb2Ygc3lzdGVtIGNhbGxzCih3aGVuIHRoZSBw
YXJhbWV0ZXIgaXMgc2V0IGxvdykKYW5kIHdhc3RpbmcgdW51c2VkIG1lbW9yeSBhdCB0aGUgdG9w
IG9mIHRoZSBoZWFwCih3aGVuIHRoZSBwYXJhbWV0ZXIgaXMgc2V0IGhpZ2gpLgouXCIgRklYTUUg
RG8gdGhlIGFyZW5hIHBhcmFtZXRlcnMgbmVlZCB0byBiZSBkb2N1bWVudGVkPwouXCIgLlRQCi5c
IiAuQlIgTV9BUkVOQV9URVNUICIgKHNpbmNlIGdsaWJjIDIuMTApIgouXCIgLlRQCi5cIiAuQlIg
TV9BUkVOQV9NQVggIiAoc2luY2UgZ2xpYmMgMi4xMCkiCi5cIgouXCIgRW52aXJvbm1lbnQgdmFy
aWFibGVzCi5cIiAgICAgTUFMTE9DX0FSRU5BX01BWF8KLlwiICAgICBNQUxMT0NfQVJFTkFfVEVT
VF8KLlwiCi5cIiBodHRwOi8vdWRyZXBwZXIubGl2ZWpvdXJuYWwuY29tLzIwOTQ4Lmh0bWwgZGVz
Y3JpYmVzIHNvbWUgZGV0YWlscwouXCIJb2YgdGhlIE1BTExPQ19BUkVOQV8qIGVudmlyb25tZW50
IHZhcmlhYmxlcy4KLlwiCi5cIiBUaGVzZSBtYWNyb3MgYXJlbid0IGVuYWJsZWQgaW4gcHJvZHVj
dGlvbiByZWxlYXNlcyB1bnRpbCAyLjE1PwouXCIgKHNlZSBnbGliYyBtYWxsb2MvTWFrZWZpbGUp
Ci5cIgouU1MgRW52aXJvbm1lbnQgVmFyaWFibGVzCkEgbnVtYmVyIG9mIGVudmlyb25tZW50IHZh
cmlhYmxlcyBjYW4gYmUgZGVmaW5lZAp0byBtb2RpZnkgc29tZSBvZiB0aGUgc2FtZSBwYXJhbWV0
ZXJzIGFzIGFyZSBjb250cm9sbGVkIGJ5Ci5CUiBtYWxsb3B0ICgpLgpVc2luZyB0aGVzZSB2YXJp
YWJsZXMgaGFzIHRoZSBhZHZhbnRhZ2UgdGhhdCB0aGUgc291cmNlIGNvZGUKb2YgdGhlIHByb2dy
YW0gbmVlZCBub3QgYmUgY2hhbmdlZC4KVG8gYmUgZWZmZWN0aXZlLCB0aGVzZSB2YXJpYWJsZXMg
bXVzdCBiZSBkZWZpbmVkIGJlZm9yZSB0aGUKZmlyc3QgY2FsbCB0byBhIG1lbW9yeS1hbGxvY2F0
aW9uIGZ1bmN0aW9uLgooSWYgdGhlIHNhbWUgcGFyYW1ldGVycyBhcmUgYWRqdXN0ZWQgdmlhCi5C
UiBtYWxsb3B0ICgpCnRoZW4gdGhlCi5CUiBtYWxsb3B0ICgpCnNldHRpbmdzIHRha2UgcHJlY2Vk
ZW5jZS4pCkZvciBzZWN1cml0eSByZWFzb25zLAp0aGVzZSB2YXJpYWJsZXMgYXJlIGlnbm9yZWQg
aW4gc2V0LXVzZXItSUQgYW5kIHNldC1ncm91cC1JRCBwcm9ncmFtcy4KClRoZSBlbnZpcm9ubWVu
dCB2YXJpYWJsZXMgYXJlIGFzIGZvbGxvd3MKKG5vdGUgdGhlIHRyYWlsaW5nIHVuZGVyc2NvcmUg
YXQgdGhlIGVuZCBvZiB0aGUgbmFtZSBvZiBlYWNoIHZhcmlhYmxlKToKLlRQCi5CUiBNQUxMT0Nf
Q0hFQ0tfClRoaXMgZW52aXJvbm1lbnQgdmFyaWFibGUgY29udHJvbHMgdGhlIHNhbWUgcGFyYW1l
dGVyIGFzCi5CUiBtYWxsb3B0ICgpCi5CUiBNX0NIRUNLX0FDVElPTiAuCklmIHRoaXMgdmFyaWFi
bGUgaXMgc2V0IHRvIGEgbm9uemVybyB2YWx1ZSwKdGhlbiBhIHNwZWNpYWwgaW1wbGVtZW50YXRp
b24gb2YgdGhlIG1lbW9yeS1hbGxvY2F0aW9uIGZ1bmN0aW9ucyBpcyB1c2VkLgooVGhpcyBpcyBh
Y2NvbXBsaXNoZWQgdXNpbmcgdGhlCi5CUiBtYWxsb2NfaG9vayAoMykKZmVhdHVyZS4pClRoaXMg
aW1wbGVtZW50YXRpb24gcGVyZm9ybXMgYWRkaXRpb25hbCBlcnJvciBjaGVja2luZywKYnV0IGlz
IHNsb3dlcgouXCIgT24gZ2xpYmMgMi4xMi94ODYsIGEgc2ltcGxlIG1hbGxvYygpK2ZyZWUoKSBs
b29wIGlzIGFib3V0IDcwJSBzbG93ZXIKLlwiIHdoZW4gTUFMTE9DX0NIRUNLXyB3YXMgc2V0Lgp0
aGFuIHRoZSBzdGFuZGFyZCBzZXQgb2YgbWVtb3J5LWFsbG9jYXRpb24gZnVuY3Rpb25zLgooVGhp
cyBpbXBsZW1lbnRhdGlvbiBkb2VzIG5vdCBkZXRlY3QgYWxsIHBvc3NpYmxlIGVycm9yczsKbWVt
b3J5IGxlYWtzIGNhbiBzdGlsbCBvY2N1ci4pCi5JUApUaGUgdmFsdWUgYXNzaWduZWQgdG8gdGhp
cyBlbnZpcm9ubWVudCB2YXJpYWJsZSBzaG91bGQgYmUgYSBzaW5nbGUgZGlnaXQsCndob3NlIG1l
YW5pbmcgaXMgYXMgZGVzY3JpYmVkIGZvcgouQlIgTV9DSEVDS19BQ1RJT04gLgpBbnkgY2hhcmFj
dGVycyBiZXlvbmQgdGhlIGluaXRpYWwgZGlnaXQgYXJlIGlnbm9yZWQuCi5JUApGb3Igc2VjdXJp
dHkgcmVhc29ucywgdGhlIGVmZmVjdCBvZgouQlIgTUFMTE9DX0NIRUNLXwppcyBkaXNhYmxlZCBi
eSBkZWZhdWx0IGZvciBzZXQtdXNlci1JRCBhbmQgc2V0LWdyb3VwLUlEIHByb2dyYW1zLgpIb3dl
dmVyLCBpZiB0aGUgZmlsZQouSVIgL2V0Yy9zdWlkXC1kZWJ1ZwpleGlzdHMgKHRoZSBjb250ZW50
IG9mIHRoZSBmaWxlIGlzIGlycmVsZXZhbnQpLCB0aGVuCi5CUiBNQUxMT0NfQ0hFQ0tfCmFsc28g
aGFzIGFuIGVmZmVjdCBmb3Igc2V0LXVzZXItSUQgYW5kIHNldC1ncm91cC1JRCBwcm9ncmFtcy4K
LlRQCi5CUiBNQUxMT0NfTU1BUF9NQVhfCkNvbnRyb2xzIHRoZSBzYW1lIHBhcmFtZXRlciBhcwou
QlIgbWFsbG9wdCAoKQouQlIgTV9NTUFQX01BWCAuCi5UUAouQlIgTUFMTE9DX01NQVBfVEhSRVNI
T0xEXwpDb250cm9scyB0aGUgc2FtZSBwYXJhbWV0ZXIgYXMKLkJSIG1hbGxvcHQgKCkKLkJSIE1f
TU1BUF9USFJFU0hPTEQgLgouVFAKLkJSIE1BTExPQ19QRVJUVVJCXwpDb250cm9scyB0aGUgc2Ft
ZSBwYXJhbWV0ZXIgYXMKLkJSIG1hbGxvcHQgKCkKLkJSIE1fUEVSVFVSQiAuCi5UUAouQlIgTUFM
TE9DX1RSSU1fVEhSRVNIT0xEXwpDb250cm9scyB0aGUgc2FtZSBwYXJhbWV0ZXIgYXMKLkJSIG1h
bGxvcHQgKCkKLkJSIE1fVFJJTV9USFJFU0hPTEQgLgouVFAKLkJSIE1BTExPQ19UT1BfUEFEXwpD
b250cm9scyB0aGUgc2FtZSBwYXJhbWV0ZXIgYXMKLkJSIG1hbGxvcHQgKCkKLkJSIE1fVE9QX1BB
RCAuCi5TSCBSRVRVUk4gVkFMVUUKT24gc3VjY2VzcywKLkJSIG1hbGxvcHQgKCkKcmV0dXJucyAx
LgpPbiBlcnJvciwgaXQgcmV0dXJucyAwLgouU0ggRVJST1JTCk9uIGVycm9yLAouSSBlcnJubwpp
cwouSSBub3QKc2V0LgouXCIgLlNIIFZFUlNJT05TCi5cIiBBdmFpbGFibGUgYWxyZWFkeSBpbiBn
bGliYyAyLjAsIHBvc3NpYmx5IGVhcmxpZXIKLlNIIENPTkZPUk1JTkcgVE8KVGhpcyBmdW5jdGlv
biBpcyBub3Qgc3BlY2lmaWVkIGJ5IFBPU0lYIG9yIHRoZSBDIHN0YW5kYXJkcy4KQSBzaW1pbGFy
IGZ1bmN0aW9uIGV4aXN0cyBvbiBtYW55IFN5c3RlbSBWIGRlcml2YXRpdmVzLApidXQgdGhlIHJh
bmdlIG9mIHZhbHVlcyBmb3IKLklSIHBhcmFtCnZhcmllcyBhY3Jvc3Mgc3lzdGVtcy4KVGhlIFNW
SUQgZGVmaW5lZCBvcHRpb25zCi5CUiBNX01YRkFTVCAsCi5CUiBNX05MQkxLUyAsCi5CUiBNX0dS
QUlOICwKYW5kCi5CUiBNX0tFRVAgLApidXQgb25seSB0aGUgZmlyc3Qgb2YgdGhlc2UgaXMgaW1w
bGVtZW50ZWQgaW4gZ2xpYmMuCi5cIiAuU0ggTk9URVMKLlNIIEJVR1MKU3BlY2lmeWluZyBhbiBp
bnZhbGlkIHZhbHVlIGZvcgouSSBwYXJhbQpkb2VzIG5vdCBnZW5lcmF0ZSBhbiBlcnJvci4KCkEg
Y2FsY3VsYXRpb24gZXJyb3Igd2l0aGluIHRoZSBnbGliYyBpbXBsZW1lbnRhdGlvbiBtZWFucyB0
aGF0CmEgY2FsbCBvZiB0aGUgZm9ybToKLlwiIEZJWE1FIFRoaXMgbG9va3MgYnVnZ3k6Ci5cIiBz
ZXR0aW5nIHRoZSBNX01YRkFTVCBsaW1pdCByb3VuZHMgdXA6ICAgIChzICsgU0laRV9TWikgJiB+
TUFMTE9DX0FMSUdOX01BU0spCi5cIiBtYWxsb2MgcmVxdWVzdHMgYXJlIHJvdW5kZWQgdXA6Ci5c
IiAgICAocmVxKSArIFNJWkVfU1ogKyBNQUxMT0NfQUxJR05fTUFTSykgJiB+TUFMTE9DX0FMSUdO
X01BU0sKLlwiIGh0dHA6Ly9zb3VyY2VzLnJlZGhhdC5jb20vYnVnemlsbGEvc2hvd19idWcuY2dp
P2lkPTEyMTI5Ci5uZgoKICAgIG1hbGxvcHQoTV9NWEZBU1QsIG4pCgouZmkKZG9lcyBub3QgcmVz
dWx0IGluIGZhc3RiaW5zIGJlaW5nIGVtcGxveWVkIGZvciBhbGwgYWxsb2NhdGlvbnMgb2Ygc2l6
ZSB1cCB0bwouSVIgbiAuClRvIGVuc3VyZSBkZXNpcmVkIHJlc3VsdHMsCi5JIG4Kc2hvdWxkIGJl
IHJvdW5kZWQgdXAgdG8gdGhlIG5leHQgbXVsdGlwbGUgZ3JlYXRlciB0aGFuIG9yIGVxdWFsIHRv
Ci5JUiAoMmsrMSkqc2l6ZW9mKHNpemVfdCkgLAp3aGVyZQouSSBrCmlzIGFuIGludGVnZXIuCi5c
IiBCaW5zIGFyZSBtdWx0aXBsZXMgb2YgMiAqIHNpemVvZihzaXplX3QpICsgc2l6ZW9mKHNpemVf
dCkKClRoZQouQlIgTUFMTE9DX01NQVBfVEhSRVNIT0xEXwphbmQKLkJSIE1BTExPQ19NTUFQX01B
WF8KdmFyaWFibGVzIGFyZQouSSBub3QKaWdub3JlZCBpbiBzZXQtZ3JvdXAtSUQgcHJvZ3JhbXMu
Ci5cIiBGSVhNRSBNQUxMT0NfTU1BUF9USFJFU0hPTERfIGFuZCBNQUxMT0NfTU1BUF9NQVhfCi5c
IiBkbyBoYXZlIGFuIGVmZmVjdCBmb3Igc2V0LXVzZXItSUQgcHJvZ3JhbXMgKGJ1dCBub3QKLlwi
IHNldC1ncm91cC1JRCBwcm9ncmFtcykuCi5cIiBodHRwOi8vc291cmNlcy5yZWRoYXQuY29tL2J1
Z3ppbGxhL3Nob3dfYnVnLmNnaT9pZD0xMjE1NQoKSWYKLkJSIG1hbGxvcHQgKCkKaXMgdXNlZCB0
byBzZXQKLkJSIE1fUEVSVFVSQiAsCnRoZW4sIGFzIGV4cGVjdGVkLCB0aGUgYnl0ZXMgb2YgYWxs
b2NhdGVkIG1lbW9yeSBhcmUgaW5pdGlhbGl6ZWQKdG8gdGhlIGNvbXBsZW1lbnQgb2YgdGhlIGJ5
dGUgaW4KLklSIHZhbHVlICwKYW5kIHdoZW4gdGhhdCBtZW1vcnkgaXMgZnJlZWQsCnRoZSBieXRl
cyBvZiB0aGUgcmVnaW9uIGFyZSBpbml0aWFsaXplZCB0byB0aGUgYnl0ZSBzcGVjaWZpZWQgaW4K
LklSIHZhbHVlIC4KSG93ZXZlciwgdGhlcmUgaXMgYW4KLlJJIG9mZi1ieS0gc2l6ZW9mKHNpemVf
dCkKZXJyb3IgaW4gdGhlIGltcGxlbWVudGF0aW9uOgouXCIgRklYTUUgaHR0cDovL3NvdXJjZXMu
cmVkaGF0LmNvbS9idWd6aWxsYS9zaG93X2J1Zy5jZ2k/aWQ9MTIxNDAKaW5zdGVhZCBvZiBpbml0
aWFsaXppbmcgcHJlY2lzZWx5IHRoZSBibG9jayBvZiBtZW1vcnkKYmVpbmcgZnJlZWQgYnkgdGhl
IGNhbGwKLklSIGZyZWUocCkgLAp0aGUgYmxvY2sgc3RhcnRpbmcgYXQKLkkgcCtzaXplb2Yoc2l6
ZV90KQppcyBpbml0aWFsaXplZC4KLlNIIEVYQU1QTEUKVGhlIHByb2dyYW0gYmVsb3cgZGVtb25z
dHJhdGVzIHRoZSB1c2Ugb2YKLkJSIE1fQ0hFQ0tfQUNUSU9OIC4KSWYgdGhlIHByb2dyYW0gaXMg
c3VwcGxpZWQgd2l0aCBhbiAoaW50ZWdlcikgY29tbWFuZC1saW5lIGFyZ3VtZW50LAp0aGVuIHRo
YXQgYXJndW1lbnQgaXMgdXNlZCB0byBzZXQgdGhlCi5CUiBNX0NIRUNLX0FDVElPTgpwYXJhbWV0
ZXIuClRoZSBwcm9ncmFtIHRoZW4gYWxsb2NhdGVzIGEgYmxvY2sgb2YgbWVtb3J5LAphbmQgZnJl
ZXMgaXQgdHdpY2UgKGFuIGVycm9yKS4KClRoZSBmb2xsb3dpbmcgc2hlbGwgc2Vzc2lvbiBzaG93
cyB3aGF0IGhhcHBlbnMgd2hlbiB3ZSBydW4gdGhpcyBwcm9ncmFtCnVuZGVyIGdsaWJjLCB3aXRo
IHRoZSBkZWZhdWx0IHZhbHVlIGZvcgouQlIgTV9DSEVDS19BQ1RJT04gOgouaW4gKzRuCi5uZgoK
JCBcZkIuL2Eub3V0XGZQCioqKiBnbGliYyBkZXRlY3RlZCAqKiogLi9hLm91dDogZG91YmxlIGZy
ZWUgb3IgY29ycnVwdGlvbiAodG9wKTogMHgwOWQzMDAwOCAqKioKPT09PT09PSBCYWNrdHJhY2U6
ID09PT09PT09PQovbGliL2xpYmMuc28uNigrMHg2YzUwMSlbMHg1MjM1MDFdCi9saWIvbGliYy5z
by42KCsweDZkZDcwKVsweDUyNGQ3MF0KL2xpYi9saWJjLnNvLjYoY2ZyZWUrMHg2ZClbMHg1Mjdl
NWRdClwmLi9hLm91dFsweDgwNDg1ZGJdCi9saWIvbGliYy5zby42KF9fbGliY19zdGFydF9tYWlu
KzB4ZTcpWzB4NGNkY2U3XQpcJi4vYS5vdXRbMHg4MDQ4NDcxXQo9PT09PT09IE1lbW9yeSBtYXA6
ID09PT09PT09CjAwMWU0MDAwXC0wMDFmZTAwMCByXC14cCAwMDAwMDAwMCAwODowNiAxMDgzNTU1
ICAgIC9saWIvbGliZ2NjX3Muc28uMQowMDFmZTAwMFwtMDAxZmYwMDAgclwtXC1wIDAwMDE5MDAw
IDA4OjA2IDEwODM1NTUgICAgL2xpYi9saWJnY2Nfcy5zby4xCltzb21lIGxpbmVzIG9taXR0ZWRd
CmI3ODE0MDAwXC1iNzgxNzAwMCByd1wtcCAwMDAwMDAwMCAwMDowMCAwCmJmZjUzMDAwXC1iZmY3
NDAwMCByd1wtcCAwMDAwMDAwMCAwMDowMCAwICAgICAgICAgIFtzdGFja10KQWJvcnRlZCAoY29y
ZSBkdW1wZWQpCi5maQouaW4KLlBQClRoZSBmb2xsb3dpbmcgcnVucyBzaG93IHRoZSByZXN1bHRz
IHdoZW4gZW1wbG95aW5nIG90aGVyIHZhbHVlcyBmb3IKLkJSIE1fQ0hFQ0tfQUNUSU9OIDoKLlBQ
Ci5pbiArNG4KLm5mCiQgXGZCLi9hLm91dCAxXGZQICAgICAgICAgICAgICMgRGlhZ25vc2UgZXJy
b3IgYW5kIGNvbnRpbnVlCm1haW4oKTogcmV0dXJuZWQgZnJvbSBmaXJzdCBmcmVlKCkgY2FsbAoq
KiogZ2xpYmMgZGV0ZWN0ZWQgKioqIC4vYS5vdXQ6IGRvdWJsZSBmcmVlIG9yIGNvcnJ1cHRpb24g
KHRvcCk6IDB4MDljYmUwMDggKioqCm1haW4oKTogcmV0dXJuZWQgZnJvbSBzZWNvbmQgZnJlZSgp
IGNhbGwKJCBcZkIuL2Eub3V0IDJcZlAgICAgICAgICAgICAgIyBBYm9ydCB3aXRob3V0IGVycm9y
IG1lc3NhZ2UKbWFpbigpOiByZXR1cm5lZCBmcm9tIGZpcnN0IGZyZWUoKSBjYWxsCkFib3J0ZWQg
KGNvcmUgZHVtcGVkKQokIFxmQi4vYS5vdXQgMFxmUCAgICAgICAgICAgICAjIElnbm9yZSBlcnJv
ciBhbmQgY29udGludWUKbWFpbigpOiByZXR1cm5lZCBmcm9tIGZpcnN0IGZyZWUoKSBjYWxsCm1h
aW4oKTogcmV0dXJuZWQgZnJvbSBzZWNvbmQgZnJlZSgpIGNhbGwKLmZpCi5pbgouUFAKVGhlIG5l
eHQgcnVuIHNob3dzIGhvdyB0byBzZXQgdGhlIHNhbWUgcGFyYW1ldGVyIHVzaW5nIHRoZQouQiBN
QUxMT0NfQ0hFQ0tfCmVudmlyb25tZW50IHZhcmlhYmxlOgouUFAKLmluICs0bgoubmYKJCBcZkJN
QUxMT0NfQ0hFQ0tfPTEgLi9hLm91dFxmUAptYWluKCk6IHJldHVybmVkIGZyb20gZmlyc3QgZnJl
ZSgpIGNhbGwKKioqIGdsaWJjIGRldGVjdGVkICoqKiAuL2Eub3V0OiBmcmVlKCk6IGludmFsaWQg
cG9pbnRlcjogMHgwOTJjMjAwOCAqKioKbWFpbigpOiByZXR1cm5lZCBmcm9tIHNlY29uZCBmcmVl
KCkgY2FsbAouZmkKLmluCi5TUyBQcm9ncmFtIHNvdXJjZQpcJgoubmYKI2luY2x1ZGUgPG1hbGxv
Yy5oPgojaW5jbHVkZSA8c3RkaW8uaD4KI2luY2x1ZGUgPHN0ZGxpYi5oPgoKaW50Cm1haW4oaW50
IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKewogICAgY2hhciAqcDsKCiAgICBpZiAoYXJnYyA+IDEpIHsK
ICAgICAgICBpZiAoYXJnYyAhPSAyKSB7CiAgICAgICAgICAgIGZwcmludGYoc3RkZXJyLCAiJXMg
PE1fQ0hFQ0tfQUNUSU9OXC12YWx1ZT5cXG4iLCBhcmd2WzBdKTsKICAgICAgICAgICAgZXhpdChF
WElUX0ZBSUxVUkUpOwogICAgICAgIH0KICAgIH0KCiAgICBpZiAobWFsbG9wdChNX0NIRUNLX0FD
VElPTiwgYXRvaShhcmd2WzFdKSkgIT0gMSkgewogICAgICAgIGZwcmludGYoc3RkZXJyLCAibWFs
bG9wdCgpIGZhaWxlZCIpOwogICAgICAgIGV4aXQoRVhJVF9GQUlMVVJFKTsKICAgIH0KCiAgICBw
ID0gbWFsbG9jKDEwMDApOwogICAgaWYgKHAgPT0gTlVMTCkgewogICAgICAgIGZwcmludGYoc3Rk
ZXJyLCAibWFsbG9jKCkgZmFpbGVkIik7CiAgICAgICAgZXhpdChFWElUX0ZBSUxVUkUpOwogICAg
fQoKICAgIGZyZWUocCk7CiAgICBwcmludGYoIm1haW4oKTogcmV0dXJuZWQgZnJvbSBmaXJzdCBm
cmVlKCkgY2FsbFxcbiIpOwoKICAgIGZyZWUocCk7CiAgICBwcmludGYoIm1haW4oKTogcmV0dXJu
ZWQgZnJvbSBzZWNvbmQgZnJlZSgpIGNhbGxcXG4iKTsKCiAgICBleGl0KEVYSVRfU1VDQ0VTUyk7
Cn0KLmZpCi5TSCBTRUUgQUxTTwouYWQgbAoubmgKLkJSIG1tYXAgKDIpCi5CUiBzYnJrICgyKSwK
LkJSIG1hbGxpbmZvICgzKSwKLkJSIG1hbGxvYyAoMyksCi5CUiBtYWxsb2NfaG9vayAoMyksCi5C
UiBtYWxsb2NfaW5mbyAoMyksCi5CUiBtYWxsb2Nfc3RhdHMgKDMpLAouQlIgbWFsbG9jX3RyaW0g
KDMpLAouQlIgbWNoZWNrICgzKSwKLkJSIG10cmFjZSAoMyksCi5CUiBwb3NpeF9tZW1hbGlnbiAo
MykK
--14dae9340a376a5f7804becf010b--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
