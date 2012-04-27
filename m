From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: malloc_info(3) man page for review
Date: Fri, 27 Apr 2012 15:59:58 +1200
Message-ID: <CAKgNAki-o30f4NfBOa1wJ7Ro=OaE77yHeci5Svk2KaEoQPKffg@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=14dae93404bf82cca004bea12423
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org
List-Id: linux-man@vger.kernel.org

--14dae93404bf82cca004bea12423
Content-Type: text/plain; charset=ISO-8859-1

Gidday,

I've written the man page page below to document glibc's
malloc_info(3). Review comments welcome!

Cheers,

Michael


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
.TH MALLOC_INFO 3  2012-04-28 "GNU" "Linux Programmer's Manual"
.SH NAME
malloc_info \- export malloc state to a stream
.SH SYNOPSIS
.nf
.B #include <malloc.h>
.sp
.BI "int malloc_info(int " options ", FILE *" fp );
.fi
.SH DESCRIPTION
The
.BR malloc_info ()
function exports an XML string that describes the current state
of the memory-allocation
implementation in the caller.
The string is printed on the file stream
.IR fp .
The exported string includes information about all arenas (see
.BR malloc (3)).

As currently implemented,
.I options
must be zero.
.SH RETURN VALUE
On success,
.BR malloc_info ()
returns 0;
on error, it returns \-1.
.SH ERRORS
.TP
.B EINVAL
.I options
was nonzero.
.SH VERSIONS
.BR malloc_info (3)
was added to glibc in version 2.10.
.SH CONFORMING TO
This function is a GNU extension.
.SH NOTES
The memory-allocation information is provided as an XML string
(rather than a C structure)
because the information may change over time
(according to changes in the underlying implementation).
The output XML string includes a version field.

The
.BR malloc_info ()
function is designed to address deficiencies in
.BR malloc_stats(3)
and
.BR mallinfo (3).
.SH EXAMPLE
The program below takes up to four command-line arguments,
of which the first three are mandatory.
The first argument specifies the number of threads that
the program should create.
All of the threads, including the main thread,
allocate the number of blocks of memory specified by the second argument.
The third argument controls the size of the blocks to be allocated.
The main thread creates blocks of this size,
the second thread created by the program allocates blocks of twice this size,
the third thread allocates blocks of three times this size, and so on.

The program calls
.BR malloc_info ()
twice to display the memory-allocation state.
The first call takes place before any threads
are created or memory allocated.
The second call is performed after all threads have allocated memory.

In the following example,
the command-line arguments specify the creation of one additional thread,
and both the main thread and the additional thread
allocate 10000 blocks of memory.
After the blocks of memory have been allocated,
.BR malloc_info ()
shows the state of two allocation arenas.
.in +4
.nf

.RB "$ " "getconf GNU_LIBC_VERSION"
glibc 2.13
.RB "$ " "./a.out 1 10000 100"
============ Before allocating blocks ============
<malloc version="1">
<heap nr="0">
<sizes>
</sizes>
<total type="fast" count="0" size="0"/>
<total type="rest" count="0" size="0"/>
<system type="current" size="135168"/>
<system type="max" size="135168"/>
<aspace type="total" size="135168"/>
<aspace type="mprotect" size="135168"/>
</heap>
<total type="fast" count="0" size="0"/>
<total type="rest" count="0" size="0"/>
<system type="current" size="135168"/>
<system type="max" size="135168"/>
<aspace type="total" size="135168"/>
<aspace type="mprotect" size="135168"/>
</malloc>

============ After allocating blocks ============
<malloc version="1">
<heap nr="0">
<sizes>
</sizes>
<total type="fast" count="0" size="0"/>
<total type="rest" count="0" size="0"/>
<system type="current" size="1081344"/>
<system type="max" size="1081344"/>
<aspace type="total" size="1081344"/>
<aspace type="mprotect" size="1081344"/>
</heap>
<heap nr="1">
<sizes>
</sizes>
<total type="fast" count="0" size="0"/>
<total type="rest" count="0" size="0"/>
<system type="current" size="1032192"/>
<system type="max" size="1032192"/>
<aspace type="total" size="1032192"/>
<aspace type="mprotect" size="1032192"/>
</heap>
<total type="fast" count="0" size="0"/>
<total type="rest" count="0" size="0"/>
<system type="current" size="2113536"/>
<system type="max" size="2113536"/>
<aspace type="total" size="2113536"/>
<aspace type="mprotect" size="2113536"/>
</malloc>
.fi
.in
.SS Program source
.nf

#include <unistd.h>
#include <stdlib.h>
#include <pthread.h>
#include <malloc.h>
#include <errno.h>

static size_t blockSize;
static int numThreads, numBlocks;

#define errExit(msg)    do { perror(msg); exit(EXIT_FAILURE); \\
                        } while (0)

static void *
thread_func(void *arg)
{
    int j;
    int tn = (int) arg;

    /* The multiplier \(aq(2 + tn)\(aq ensures that each thread (including
       the main thread) allocates a different amount of memory */

    for (j = 0; j < numBlocks; j++)
        if (malloc(blockSize * (2 + tn)) == NULL)
            errExit("malloc\-thread");

    sleep(100);         /* Sleep until main thread terminates */
    return NULL;
}

int
main(int argc, char *argv[])
{
    int j, tn, sleepTime;
    pthread_t *thr;

    if (argc < 4) {
        fprintf(stderr,
                "%s num\-threads num\-blocks block\-size [sleep\-time]\\n",
                argv[0]);
        exit(EXIT_FAILURE);
    }

    numThreads = atoi(argv[1]);
    numBlocks = atoi(argv[2]);
    blockSize = atoi(argv[3]);
    sleepTime = (argc > 4) ? atoi(argv[4]) : 0;

    thr = calloc(numThreads, sizeof(pthread_t));
    if (thr == NULL)
        errExit("calloc");

    printf("============ Before allocating blocks ============\\n");
    malloc_info(0, stdout);

    /* Create threads that allocate different amounts of memory */

    for (tn = 0; tn < numThreads; tn++) {
        errno = pthread_create(&thr[tn], NULL, thread_func,
                               (void *) tn);
        if (errno != 0)
            errExit("pthread_create");

        /* If we add a sleep interval after the start\-up of each
           thread, the threads likely won\(aqt contend for malloc
           mutexes, and therefore additional arenas won\(aqt be
           allocated (see malloc(3)). */

        if (sleepTime > 0)
            sleep(sleepTime);
    }

    /* The main thread also allocates some memory */

    for (j = 0; j < numBlocks; j++)
        if (malloc(blockSize) == NULL)
            errExit("malloc");

    sleep(2);           /* Give all threads a chance to
                           complete allocations */

    printf("\\n============ After allocating blocks ============\\n");
    malloc_info(0, stdout);

    exit(EXIT_SUCCESS);
}
.fi
.SH SEE ALSO
.BR fmemopen (3),
.BR mallinfo (3),
.BR malloc (3),
.BR malloc_stats (3),
.BR mallopt (3)

--14dae93404bf82cca004bea12423
Content-Type: application/octet-stream; name="malloc_info.3"
Content-Disposition: attachment; filename="malloc_info.3"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_h1ip5b0s0

LlwiIENvcHlyaWdodCAoYykgMjAxMiBieSBNaWNoYWVsIEtlcnJpc2sgPG10ay5tYW5wYWdlc0Bn
bWFpbC5jb20+Ci5cIgouXCIgUGVybWlzc2lvbiBpcyBncmFudGVkIHRvIG1ha2UgYW5kIGRpc3Ry
aWJ1dGUgdmVyYmF0aW0gY29waWVzIG9mIHRoaXMKLlwiIG1hbnVhbCBwcm92aWRlZCB0aGUgY29w
eXJpZ2h0IG5vdGljZSBhbmQgdGhpcyBwZXJtaXNzaW9uIG5vdGljZSBhcmUKLlwiIHByZXNlcnZl
ZCBvbiBhbGwgY29waWVzLgouXCIKLlwiIFBlcm1pc3Npb24gaXMgZ3JhbnRlZCB0byBjb3B5IGFu
ZCBkaXN0cmlidXRlIG1vZGlmaWVkIHZlcnNpb25zIG9mIHRoaXMKLlwiIG1hbnVhbCB1bmRlciB0
aGUgY29uZGl0aW9ucyBmb3IgdmVyYmF0aW0gY29weWluZywgcHJvdmlkZWQgdGhhdCB0aGUKLlwi
IGVudGlyZSByZXN1bHRpbmcgZGVyaXZlZCB3b3JrIGlzIGRpc3RyaWJ1dGVkIHVuZGVyIHRoZSB0
ZXJtcyBvZiBhCi5cIiBwZXJtaXNzaW9uIG5vdGljZSBpZGVudGljYWwgdG8gdGhpcyBvbmUuCi5c
IgouXCIgU2luY2UgdGhlIExpbnV4IGtlcm5lbCBhbmQgbGlicmFyaWVzIGFyZSBjb25zdGFudGx5
IGNoYW5naW5nLCB0aGlzCi5cIiBtYW51YWwgcGFnZSBtYXkgYmUgaW5jb3JyZWN0IG9yIG91dC1v
Zi1kYXRlLiAgVGhlIGF1dGhvcihzKSBhc3N1bWUgbm8KLlwiIHJlc3BvbnNpYmlsaXR5IGZvciBl
cnJvcnMgb3Igb21pc3Npb25zLCBvciBmb3IgZGFtYWdlcyByZXN1bHRpbmcgZnJvbQouXCIgdGhl
IHVzZSBvZiB0aGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGhlcmVpbi4gIFRoZSBhdXRob3Iocykg
bWF5IG5vdAouXCIgaGF2ZSB0YWtlbiB0aGUgc2FtZSBsZXZlbCBvZiBjYXJlIGluIHRoZSBwcm9k
dWN0aW9uIG9mIHRoaXMgbWFudWFsLAouXCIgd2hpY2ggaXMgbGljZW5zZWQgZnJlZSBvZiBjaGFy
Z2UsIGFzIHRoZXkgbWlnaHQgd2hlbiB3b3JraW5nCi5cIiBwcm9mZXNzaW9uYWxseS4KLlwiCi5c
IiBGb3JtYXR0ZWQgb3IgcHJvY2Vzc2VkIHZlcnNpb25zIG9mIHRoaXMgbWFudWFsLCBpZiB1bmFj
Y29tcGFuaWVkIGJ5Ci5cIiB0aGUgc291cmNlLCBtdXN0IGFja25vd2xlZGdlIHRoZSBjb3B5cmln
aHQgYW5kIGF1dGhvcnMgb2YgdGhpcyB3b3JrLgouXCIKLlRIIE1BTExPQ19JTkZPIDMgIDIwMTIt
MDQtMjggIkdOVSIgIkxpbnV4IFByb2dyYW1tZXIncyBNYW51YWwiCi5TSCBOQU1FCm1hbGxvY19p
bmZvIFwtIGV4cG9ydCBtYWxsb2Mgc3RhdGUgdG8gYSBzdHJlYW0KLlNIIFNZTk9QU0lTCi5uZgou
QiAjaW5jbHVkZSA8bWFsbG9jLmg+Ci5zcAouQkkgImludCBtYWxsb2NfaW5mbyhpbnQgIiBvcHRp
b25zICIsIEZJTEUgKiIgZnAgKTsKLmZpCi5TSCBERVNDUklQVElPTgpUaGUKLkJSIG1hbGxvY19p
bmZvICgpCmZ1bmN0aW9uIGV4cG9ydHMgYW4gWE1MIHN0cmluZyB0aGF0IGRlc2NyaWJlcyB0aGUg
Y3VycmVudCBzdGF0ZQpvZiB0aGUgbWVtb3J5LWFsbG9jYXRpb24KaW1wbGVtZW50YXRpb24gaW4g
dGhlIGNhbGxlci4KVGhlIHN0cmluZyBpcyBwcmludGVkIG9uIHRoZSBmaWxlIHN0cmVhbQouSVIg
ZnAgLgpUaGUgZXhwb3J0ZWQgc3RyaW5nIGluY2x1ZGVzIGluZm9ybWF0aW9uIGFib3V0IGFsbCBh
cmVuYXMgKHNlZQouQlIgbWFsbG9jICgzKSkuCgpBcyBjdXJyZW50bHkgaW1wbGVtZW50ZWQsCi5J
IG9wdGlvbnMKbXVzdCBiZSB6ZXJvLgouU0ggUkVUVVJOIFZBTFVFCk9uIHN1Y2Nlc3MsCi5CUiBt
YWxsb2NfaW5mbyAoKQpyZXR1cm5zIDA7Cm9uIGVycm9yLCBpdCByZXR1cm5zIFwtMS4KLlNIIEVS
Uk9SUwouVFAKLkIgRUlOVkFMCi5JIG9wdGlvbnMKd2FzIG5vbnplcm8uCi5TSCBWRVJTSU9OUwou
QlIgbWFsbG9jX2luZm8gKDMpCndhcyBhZGRlZCB0byBnbGliYyBpbiB2ZXJzaW9uIDIuMTAuCi5T
SCBDT05GT1JNSU5HIFRPClRoaXMgZnVuY3Rpb24gaXMgYSBHTlUgZXh0ZW5zaW9uLgouU0ggTk9U
RVMKVGhlIG1lbW9yeS1hbGxvY2F0aW9uIGluZm9ybWF0aW9uIGlzIHByb3ZpZGVkIGFzIGFuIFhN
TCBzdHJpbmcKKHJhdGhlciB0aGFuIGEgQyBzdHJ1Y3R1cmUpCmJlY2F1c2UgdGhlIGluZm9ybWF0
aW9uIG1heSBjaGFuZ2Ugb3ZlciB0aW1lCihhY2NvcmRpbmcgdG8gY2hhbmdlcyBpbiB0aGUgdW5k
ZXJseWluZyBpbXBsZW1lbnRhdGlvbikuClRoZSBvdXRwdXQgWE1MIHN0cmluZyBpbmNsdWRlcyBh
IHZlcnNpb24gZmllbGQuCgpUaGUKLkJSIG1hbGxvY19pbmZvICgpCmZ1bmN0aW9uIGlzIGRlc2ln
bmVkIHRvIGFkZHJlc3MgZGVmaWNpZW5jaWVzIGluCi5CUiBtYWxsb2Nfc3RhdHMoMykKYW5kCi5C
UiBtYWxsaW5mbyAoMykuCi5TSCBFWEFNUExFClRoZSBwcm9ncmFtIGJlbG93IHRha2VzIHVwIHRv
IGZvdXIgY29tbWFuZC1saW5lIGFyZ3VtZW50cywKb2Ygd2hpY2ggdGhlIGZpcnN0IHRocmVlIGFy
ZSBtYW5kYXRvcnkuClRoZSBmaXJzdCBhcmd1bWVudCBzcGVjaWZpZXMgdGhlIG51bWJlciBvZiB0
aHJlYWRzIHRoYXQKdGhlIHByb2dyYW0gc2hvdWxkIGNyZWF0ZS4KQWxsIG9mIHRoZSB0aHJlYWRz
LCBpbmNsdWRpbmcgdGhlIG1haW4gdGhyZWFkLAphbGxvY2F0ZSB0aGUgbnVtYmVyIG9mIGJsb2Nr
cyBvZiBtZW1vcnkgc3BlY2lmaWVkIGJ5IHRoZSBzZWNvbmQgYXJndW1lbnQuClRoZSB0aGlyZCBh
cmd1bWVudCBjb250cm9scyB0aGUgc2l6ZSBvZiB0aGUgYmxvY2tzIHRvIGJlIGFsbG9jYXRlZC4K
VGhlIG1haW4gdGhyZWFkIGNyZWF0ZXMgYmxvY2tzIG9mIHRoaXMgc2l6ZSwKdGhlIHNlY29uZCB0
aHJlYWQgY3JlYXRlZCBieSB0aGUgcHJvZ3JhbSBhbGxvY2F0ZXMgYmxvY2tzIG9mIHR3aWNlIHRo
aXMgc2l6ZSwKdGhlIHRoaXJkIHRocmVhZCBhbGxvY2F0ZXMgYmxvY2tzIG9mIHRocmVlIHRpbWVz
IHRoaXMgc2l6ZSwgYW5kIHNvIG9uLgoKVGhlIHByb2dyYW0gY2FsbHMKLkJSIG1hbGxvY19pbmZv
ICgpCnR3aWNlIHRvIGRpc3BsYXkgdGhlIG1lbW9yeS1hbGxvY2F0aW9uIHN0YXRlLgpUaGUgZmly
c3QgY2FsbCB0YWtlcyBwbGFjZSBiZWZvcmUgYW55IHRocmVhZHMKYXJlIGNyZWF0ZWQgb3IgbWVt
b3J5IGFsbG9jYXRlZC4KVGhlIHNlY29uZCBjYWxsIGlzIHBlcmZvcm1lZCBhZnRlciBhbGwgdGhy
ZWFkcyBoYXZlIGFsbG9jYXRlZCBtZW1vcnkuCgpJbiB0aGUgZm9sbG93aW5nIGV4YW1wbGUsCnRo
ZSBjb21tYW5kLWxpbmUgYXJndW1lbnRzIHNwZWNpZnkgdGhlIGNyZWF0aW9uIG9mIG9uZSBhZGRp
dGlvbmFsIHRocmVhZCwKYW5kIGJvdGggdGhlIG1haW4gdGhyZWFkIGFuZCB0aGUgYWRkaXRpb25h
bCB0aHJlYWQKYWxsb2NhdGUgMTAwMDAgYmxvY2tzIG9mIG1lbW9yeS4KQWZ0ZXIgdGhlIGJsb2Nr
cyBvZiBtZW1vcnkgaGF2ZSBiZWVuIGFsbG9jYXRlZCwKLkJSIG1hbGxvY19pbmZvICgpCnNob3dz
IHRoZSBzdGF0ZSBvZiB0d28gYWxsb2NhdGlvbiBhcmVuYXMuCi5pbiArNAoubmYKCi5SQiAiJCAi
ICJnZXRjb25mIEdOVV9MSUJDX1ZFUlNJT04iCmdsaWJjIDIuMTMKLlJCICIkICIgIi4vYS5vdXQg
MSAxMDAwMCAxMDAiCj09PT09PT09PT09PSBCZWZvcmUgYWxsb2NhdGluZyBibG9ja3MgPT09PT09
PT09PT09CjxtYWxsb2MgdmVyc2lvbj0iMSI+CjxoZWFwIG5yPSIwIj4KPHNpemVzPgo8L3NpemVz
Pgo8dG90YWwgdHlwZT0iZmFzdCIgY291bnQ9IjAiIHNpemU9IjAiLz4KPHRvdGFsIHR5cGU9InJl
c3QiIGNvdW50PSIwIiBzaXplPSIwIi8+CjxzeXN0ZW0gdHlwZT0iY3VycmVudCIgc2l6ZT0iMTM1
MTY4Ii8+CjxzeXN0ZW0gdHlwZT0ibWF4IiBzaXplPSIxMzUxNjgiLz4KPGFzcGFjZSB0eXBlPSJ0
b3RhbCIgc2l6ZT0iMTM1MTY4Ii8+Cjxhc3BhY2UgdHlwZT0ibXByb3RlY3QiIHNpemU9IjEzNTE2
OCIvPgo8L2hlYXA+Cjx0b3RhbCB0eXBlPSJmYXN0IiBjb3VudD0iMCIgc2l6ZT0iMCIvPgo8dG90
YWwgdHlwZT0icmVzdCIgY291bnQ9IjAiIHNpemU9IjAiLz4KPHN5c3RlbSB0eXBlPSJjdXJyZW50
IiBzaXplPSIxMzUxNjgiLz4KPHN5c3RlbSB0eXBlPSJtYXgiIHNpemU9IjEzNTE2OCIvPgo8YXNw
YWNlIHR5cGU9InRvdGFsIiBzaXplPSIxMzUxNjgiLz4KPGFzcGFjZSB0eXBlPSJtcHJvdGVjdCIg
c2l6ZT0iMTM1MTY4Ii8+CjwvbWFsbG9jPgoKPT09PT09PT09PT09IEFmdGVyIGFsbG9jYXRpbmcg
YmxvY2tzID09PT09PT09PT09PQo8bWFsbG9jIHZlcnNpb249IjEiPgo8aGVhcCBucj0iMCI+Cjxz
aXplcz4KPC9zaXplcz4KPHRvdGFsIHR5cGU9ImZhc3QiIGNvdW50PSIwIiBzaXplPSIwIi8+Cjx0
b3RhbCB0eXBlPSJyZXN0IiBjb3VudD0iMCIgc2l6ZT0iMCIvPgo8c3lzdGVtIHR5cGU9ImN1cnJl
bnQiIHNpemU9IjEwODEzNDQiLz4KPHN5c3RlbSB0eXBlPSJtYXgiIHNpemU9IjEwODEzNDQiLz4K
PGFzcGFjZSB0eXBlPSJ0b3RhbCIgc2l6ZT0iMTA4MTM0NCIvPgo8YXNwYWNlIHR5cGU9Im1wcm90
ZWN0IiBzaXplPSIxMDgxMzQ0Ii8+CjwvaGVhcD4KPGhlYXAgbnI9IjEiPgo8c2l6ZXM+Cjwvc2l6
ZXM+Cjx0b3RhbCB0eXBlPSJmYXN0IiBjb3VudD0iMCIgc2l6ZT0iMCIvPgo8dG90YWwgdHlwZT0i
cmVzdCIgY291bnQ9IjAiIHNpemU9IjAiLz4KPHN5c3RlbSB0eXBlPSJjdXJyZW50IiBzaXplPSIx
MDMyMTkyIi8+CjxzeXN0ZW0gdHlwZT0ibWF4IiBzaXplPSIxMDMyMTkyIi8+Cjxhc3BhY2UgdHlw
ZT0idG90YWwiIHNpemU9IjEwMzIxOTIiLz4KPGFzcGFjZSB0eXBlPSJtcHJvdGVjdCIgc2l6ZT0i
MTAzMjE5MiIvPgo8L2hlYXA+Cjx0b3RhbCB0eXBlPSJmYXN0IiBjb3VudD0iMCIgc2l6ZT0iMCIv
Pgo8dG90YWwgdHlwZT0icmVzdCIgY291bnQ9IjAiIHNpemU9IjAiLz4KPHN5c3RlbSB0eXBlPSJj
dXJyZW50IiBzaXplPSIyMTEzNTM2Ii8+CjxzeXN0ZW0gdHlwZT0ibWF4IiBzaXplPSIyMTEzNTM2
Ii8+Cjxhc3BhY2UgdHlwZT0idG90YWwiIHNpemU9IjIxMTM1MzYiLz4KPGFzcGFjZSB0eXBlPSJt
cHJvdGVjdCIgc2l6ZT0iMjExMzUzNiIvPgo8L21hbGxvYz4KLmZpCi5pbgouU1MgUHJvZ3JhbSBz
b3VyY2UKLm5mCgojaW5jbHVkZSA8dW5pc3RkLmg+CiNpbmNsdWRlIDxzdGRsaWIuaD4KI2luY2x1
ZGUgPHB0aHJlYWQuaD4KI2luY2x1ZGUgPG1hbGxvYy5oPgojaW5jbHVkZSA8ZXJybm8uaD4KCnN0
YXRpYyBzaXplX3QgYmxvY2tTaXplOwpzdGF0aWMgaW50IG51bVRocmVhZHMsIG51bUJsb2NrczsK
CiNkZWZpbmUgZXJyRXhpdChtc2cpICAgIGRvIHsgcGVycm9yKG1zZyk7IGV4aXQoRVhJVF9GQUlM
VVJFKTsgXFwKICAgICAgICAgICAgICAgICAgICAgICAgfSB3aGlsZSAoMCkKCnN0YXRpYyB2b2lk
ICoKdGhyZWFkX2Z1bmModm9pZCAqYXJnKQp7CiAgICBpbnQgajsKICAgIGludCB0biA9IChpbnQp
IGFyZzsKCiAgICAvKiBUaGUgbXVsdGlwbGllciBcKGFxKDIgKyB0bilcKGFxIGVuc3VyZXMgdGhh
dCBlYWNoIHRocmVhZCAoaW5jbHVkaW5nCiAgICAgICB0aGUgbWFpbiB0aHJlYWQpIGFsbG9jYXRl
cyBhIGRpZmZlcmVudCBhbW91bnQgb2YgbWVtb3J5ICovCgogICAgZm9yIChqID0gMDsgaiA8IG51
bUJsb2NrczsgaisrKQogICAgICAgIGlmIChtYWxsb2MoYmxvY2tTaXplICogKDIgKyB0bikpID09
IE5VTEwpCiAgICAgICAgICAgIGVyckV4aXQoIm1hbGxvY1wtdGhyZWFkIik7CgogICAgc2xlZXAo
MTAwKTsgICAgICAgICAvKiBTbGVlcCB1bnRpbCBtYWluIHRocmVhZCB0ZXJtaW5hdGVzICovCiAg
ICByZXR1cm4gTlVMTDsKfQoKaW50Cm1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKewogICAg
aW50IGosIHRuLCBzbGVlcFRpbWU7CiAgICBwdGhyZWFkX3QgKnRocjsKCiAgICBpZiAoYXJnYyA8
IDQpIHsKICAgICAgICBmcHJpbnRmKHN0ZGVyciwKICAgICAgICAgICAgICAgICIlcyBudW1cLXRo
cmVhZHMgbnVtXC1ibG9ja3MgYmxvY2tcLXNpemUgW3NsZWVwXC10aW1lXVxcbiIsCiAgICAgICAg
ICAgICAgICBhcmd2WzBdKTsKICAgICAgICBleGl0KEVYSVRfRkFJTFVSRSk7CiAgICB9CgogICAg
bnVtVGhyZWFkcyA9IGF0b2koYXJndlsxXSk7CiAgICBudW1CbG9ja3MgPSBhdG9pKGFyZ3ZbMl0p
OwogICAgYmxvY2tTaXplID0gYXRvaShhcmd2WzNdKTsKICAgIHNsZWVwVGltZSA9IChhcmdjID4g
NCkgPyBhdG9pKGFyZ3ZbNF0pIDogMDsKCiAgICB0aHIgPSBjYWxsb2MobnVtVGhyZWFkcywgc2l6
ZW9mKHB0aHJlYWRfdCkpOwogICAgaWYgKHRociA9PSBOVUxMKQogICAgICAgIGVyckV4aXQoImNh
bGxvYyIpOwoKICAgIHByaW50ZigiPT09PT09PT09PT09IEJlZm9yZSBhbGxvY2F0aW5nIGJsb2Nr
cyA9PT09PT09PT09PT1cXG4iKTsKICAgIG1hbGxvY19pbmZvKDAsIHN0ZG91dCk7CgogICAgLyog
Q3JlYXRlIHRocmVhZHMgdGhhdCBhbGxvY2F0ZSBkaWZmZXJlbnQgYW1vdW50cyBvZiBtZW1vcnkg
Ki8KCiAgICBmb3IgKHRuID0gMDsgdG4gPCBudW1UaHJlYWRzOyB0bisrKSB7CiAgICAgICAgZXJy
bm8gPSBwdGhyZWFkX2NyZWF0ZSgmdGhyW3RuXSwgTlVMTCwgdGhyZWFkX2Z1bmMsCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAodm9pZCAqKSB0bik7CiAgICAgICAgaWYgKGVycm5vICE9
IDApCiAgICAgICAgICAgIGVyckV4aXQoInB0aHJlYWRfY3JlYXRlIik7CgogICAgICAgIC8qIElm
IHdlIGFkZCBhIHNsZWVwIGludGVydmFsIGFmdGVyIHRoZSBzdGFydFwtdXAgb2YgZWFjaAogICAg
ICAgICAgIHRocmVhZCwgdGhlIHRocmVhZHMgbGlrZWx5IHdvblwoYXF0IGNvbnRlbmQgZm9yIG1h
bGxvYwogICAgICAgICAgIG11dGV4ZXMsIGFuZCB0aGVyZWZvcmUgYWRkaXRpb25hbCBhcmVuYXMg
d29uXChhcXQgYmUKICAgICAgICAgICBhbGxvY2F0ZWQgKHNlZSBtYWxsb2MoMykpLiAqLwoKICAg
ICAgICBpZiAoc2xlZXBUaW1lID4gMCkKICAgICAgICAgICAgc2xlZXAoc2xlZXBUaW1lKTsKICAg
IH0KCiAgICAvKiBUaGUgbWFpbiB0aHJlYWQgYWxzbyBhbGxvY2F0ZXMgc29tZSBtZW1vcnkgKi8K
ICAgIAogICAgZm9yIChqID0gMDsgaiA8IG51bUJsb2NrczsgaisrKQogICAgICAgIGlmIChtYWxs
b2MoYmxvY2tTaXplKSA9PSBOVUxMKQogICAgICAgICAgICBlcnJFeGl0KCJtYWxsb2MiKTsKCiAg
ICBzbGVlcCgyKTsgICAgICAgICAgIC8qIEdpdmUgYWxsIHRocmVhZHMgYSBjaGFuY2UgdG8KICAg
ICAgICAgICAgICAgICAgICAgICAgICAgY29tcGxldGUgYWxsb2NhdGlvbnMgKi8KCiAgICBwcmlu
dGYoIlxcbj09PT09PT09PT09PSBBZnRlciBhbGxvY2F0aW5nIGJsb2NrcyA9PT09PT09PT09PT1c
XG4iKTsKICAgIG1hbGxvY19pbmZvKDAsIHN0ZG91dCk7CgogICAgZXhpdChFWElUX1NVQ0NFU1Mp
Owp9Ci5maQouU0ggU0VFIEFMU08KLkJSIGZtZW1vcGVuICgzKSwKLkJSIG1hbGxpbmZvICgzKSwK
LkJSIG1hbGxvYyAoMyksCi5CUiBtYWxsb2Nfc3RhdHMgKDMpLAouQlIgbWFsbG9wdCAoMykK
--14dae93404bf82cca004bea12423--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
