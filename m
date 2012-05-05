From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: mallinfo(3) man page for review
Date: Sat, 5 May 2012 12:08:01 +1200
Message-ID: <CAKgNAkg2CKaEsOERkLyhsJ9N9nEpCm7oe_XzMBE1XBB_KkDoiQ@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=14dae9340a37d716d904bf3ed539
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org
List-Id: linux-man@vger.kernel.org

--14dae9340a37d716d904bf3ed539
Content-Type: text/plain; charset=ISO-8859-1

I've written the man page page below to document glibc's mallinfo(3).
Review comments welcome!

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
.TH MALLINFO 3  2012-04-28 "Linux" "Linux Programmer's Manual"
.SH NAME
mallinfo \- obtain memory allocation information
.SH SYNOPSIS
.B #include <malloc.h>

.B struct mallinfo mallinfo(void);
.SH DESCRIPTION
The
.BR mallinfo ()
function returns a copy of a structure containing information about
memory allocations performed by
.BR malloc (3)
and related functions.
This structure is defined as follows:
.PP
.in +4n
.nf
struct mallinfo {
    int arena;     /* Non-mmapped space allocated (bytes) */
    int ordblks;   /* Number of free chunks */
    int smblks;    /* Number of free fastbin blocks */
    int hblks;     /* Number of mmapped regions */
    int hblkhd;    /* Space allocated in mmapped regions (bytes) */
    int usmblks;   /* Maximum total allocated space (bytes) */
    int fsmblks;   /* Space in freed fastbin blocks (bytes) */
    int uordblks;  /* Total allocated space (bytes) */
    int fordblks;  /* Total free space (bytes) */
    int keepcost;  /* Top-most, releasable space (bytes) */
};
.fi
.in
.PP
The fields of the
.I mallinfo
structure contain the following information:

.TP 10
.I arena
The total amount of memory allocated by means other than
.BR mmap (2)
(i.e., memory allocated on the heap).
This figure includes both in-use blocks and blocks on the free list.
.TP
.I ordblks
The number of ordinary (i.e., non-fastbin) free blocks.
.TP
.I smblks
The number of fastbin free blocks (see
.BR mallopt (3)).
.TP
.I hblks
The number of blocks currently allocated using
.BR mmap (2).
.TP
.I hblkhd
The number of bytes in blocks currently allocated using
.BR mmap (2).
.TP
.I usmblks
The "highwater mark" for allocated space\(emthat is,
the maximum amount of space that was ever allocated.
This field is maintained only in nonthreading environments.
.TP
.I fsmblks
The total number of bytes in fastbin free blocks.
.TP
.I uordblks
The total number of bytes used by in-use allocations.
.TP
.I fordblks
The total number of bytes in free blocks.
.TP
.I keepcost
The total amount of releasable free space at the top
of the heap.
This is the maximum number of bytes that could ideally
(i.e., ignoring page alignment restrictions, and so on) be released by
.BR malloc_trim (3).
.\" .SH VERSIONS
.\" Available already in glibc 2.0, possibly earlier
.SH CONFORMING TO
This function is not specified by POSIX or the C standards.
A similar function exists on many System V derivatives,
and was specified in the SVID.
.SH BUGS
.\" FIXME http://sourceware.org/bugzilla/show_bug.cgi?id=208
.\" See the 24 Aug 2011 mail by Paul Pluzhnikov:
.\"     "[patch] Fix mallinfo() to accumulate results for all arenas"
.\" on libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org
.B Information is returned for only the main memory allocation area.
Allocations in other arenas are excluded.
See
.BR malloc_stats (3)
and
.BR malloc_info (3)
for alternatives that include information about other arenas.

The fields of the
.I mallinfo
structure are typed as
.IR int .
However, because some internal bookkeeping values may be of type
.IR long ,
the reported values may wrap around zero and thus be inaccurate.
.SH EXAMPLE
The program below employs
.BR mallinfo ()
to retrieve memory allocation statistics before and after
allocating and freeing some blocks of memory.
The statistics are displayed on standard output.

The first two command-line arguments specify the number and size of
blocks to be allocated with
.BR malloc (3).

The remaining three arguments specify which of the allocated blocks
should be freed with
.BR free (3).
These three arguments are optional, and specify (in order):
the step size to be used in the loop that frees blocks
(the default is 1, meaning free all blocks in the range);
the ordinal position of the first block to be freed
(default 0, meaning the first allocated block);
and a number one greater than the ordinal position
of the last block to be freed
(default is one greater than the maximum block number).
If these three arguments are omitted,
then the defaults cause all allocated blocks to be freed.

In the following example run of the program,
1000 allocations of 100 bytes are performed,
and then every second allocated block is freed:
.PP
.in +4n
.nf
$ \fB./a.out 1000 100 2\fP
============== Before allocating blocks ==============
Total non\-mmapped bytes (arena):       0
# of free chunks (ordblks):            1
# of free fastbin blocks (smblks):     0
# of mapped regions (hblks):           0
Bytes in mapped regions (hblkhd):      0
Max. total allocated space (usmblks):  0
Free bytes held in fastbins (fsmblks): 0
Total allocated space (uordblks):      0
Total free space (fordblks):           0
Topmost releasable block (keepcost):   0

============== After allocating blocks ==============
Total non\-mmapped bytes (arena):       135168
# of free chunks (ordblks):            1
# of free fastbin blocks (smblks):     0
# of mapped regions (hblks):           0
Bytes in mapped regions (hblkhd):      0
Max. total allocated space (usmblks):  0
Free bytes held in fastbins (fsmblks): 0
Total allocated space (uordblks):      104000
Total free space (fordblks):           31168
Topmost releasable block (keepcost):   31168

============== After freeing blocks ==============
Total non\-mmapped bytes (arena):       135168
# of free chunks (ordblks):            501
# of free fastbin blocks (smblks):     0
# of mapped regions (hblks):           0
Bytes in mapped regions (hblkhd):      0
Max. total allocated space (usmblks):  0
Free bytes held in fastbins (fsmblks): 0
Total allocated space (uordblks):      52000
Total free space (fordblks):           83168
Topmost releasable block (keepcost):   31168
.fi
.in
.SS Program source
\&
.nf
#include <malloc.h>
#include "tlpi_hdr.h"

static void
display_mallinfo(void)
{
    struct mallinfo mi;

    mi = mallinfo();

    printf("Total non\-mmapped bytes (arena):       %d\\n", mi.arena);
    printf("# of free chunks (ordblks):            %d\\n", mi.ordblks);
    printf("# of free fastbin blocks (smblks):     %d\\n", mi.smblks);
    printf("# of mapped regions (hblks):           %d\\n", mi.hblks);
    printf("Bytes in mapped regions (hblkhd):      %d\\n", mi.hblkhd);
    printf("Max. total allocated space (usmblks):  %d\\n", mi.usmblks);
    printf("Free bytes held in fastbins (fsmblks): %d\\n", mi.fsmblks);
    printf("Total allocated space (uordblks):      %d\\n", mi.uordblks);
    printf("Total free space (fordblks):           %d\\n", mi.fordblks);
    printf("Topmost releasable block (keepcost):   %d\\n", mi.keepcost);
}

int
main(int argc, char *argv[])
{
#define MAX_ALLOCS 2000000
    char *alloc[MAX_ALLOCS];
    int numBlocks, j, freeBegin, freeEnd, freeStep;
    size_t blockSize;

    if (argc < 3 || strcmp(argv[1], "\-\-help") == 0)
        usageErr("%s num\-blocks block\-size [free\-step [start\-free "
                "[end\-free]]]\\n", argv[0]);

    numBlocks = atoi(argv[1]);
    blockSize = atoi(argv[2]);
    freeStep = (argc > 3) ? atoi(argv[3]) : 1;
    freeBegin = (argc > 4) ? atoi(argv[4]) : 0;
    freeEnd = (argc > 5) ? atoi(argv[5]) : numBlocks;

    printf("============== Before allocating blocks ==============\\n");
    display_mallinfo();

    for (j = 0; j < numBlocks; j++) {
        if (numBlocks >= MAX_ALLOCS)
            fatal("Too many allocations");

        alloc[j] = malloc(blockSize);
        if (alloc[j] == NULL)
            errExit("malloc");
    }

    printf("\\n============== After allocating blocks ==============\\n");
    display_mallinfo();

    for (j = freeBegin; j < freeEnd; j += freeStep)
        free(alloc[j]);

    printf("\\n============== After freeing blocks ==============\\n");
    display_mallinfo();

    exit(EXIT_SUCCESS);
}
.fi
.SH SEE ALSO
.ad l
.nh
.BR mmap (2),
.BR malloc (3),
.BR malloc_info (3),
.BR malloc_stats (3),
.BR malloc_trim (3),
.BR mallopt (3)

--14dae9340a37d716d904bf3ed539
Content-Type: application/octet-stream; name="mallinfo.3"
Content-Disposition: attachment; filename="mallinfo.3"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_h1ip53vs0

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
b3B5cmlnaHQgYW5kIGF1dGhvcnMgb2YgdGhpcyB3b3JrLgouXCIKLlRIIE1BTExJTkZPIDMgIDIw
MTItMDQtMjggIkxpbnV4IiAiTGludXggUHJvZ3JhbW1lcidzIE1hbnVhbCIKLlNIIE5BTUUKbWFs
bGluZm8gXC0gb2J0YWluIG1lbW9yeSBhbGxvY2F0aW9uIGluZm9ybWF0aW9uCi5TSCBTWU5PUFNJ
UwouQiAjaW5jbHVkZSA8bWFsbG9jLmg+CgouQiBzdHJ1Y3QgbWFsbGluZm8gbWFsbGluZm8odm9p
ZCk7Ci5TSCBERVNDUklQVElPTgpUaGUKLkJSIG1hbGxpbmZvICgpCmZ1bmN0aW9uIHJldHVybnMg
YSBjb3B5IG9mIGEgc3RydWN0dXJlIGNvbnRhaW5pbmcgaW5mb3JtYXRpb24gYWJvdXQKbWVtb3J5
IGFsbG9jYXRpb25zIHBlcmZvcm1lZCBieQouQlIgbWFsbG9jICgzKQphbmQgcmVsYXRlZCBmdW5j
dGlvbnMuClRoaXMgc3RydWN0dXJlIGlzIGRlZmluZWQgYXMgZm9sbG93czoKLlBQCi5pbiArNG4K
Lm5mCnN0cnVjdCBtYWxsaW5mbyB7CiAgICBpbnQgYXJlbmE7ICAgICAvKiBOb24tbW1hcHBlZCBz
cGFjZSBhbGxvY2F0ZWQgKGJ5dGVzKSAqLwogICAgaW50IG9yZGJsa3M7ICAgLyogTnVtYmVyIG9m
IGZyZWUgY2h1bmtzICovCiAgICBpbnQgc21ibGtzOyAgICAvKiBOdW1iZXIgb2YgZnJlZSBmYXN0
YmluIGJsb2NrcyAqLwogICAgaW50IGhibGtzOyAgICAgLyogTnVtYmVyIG9mIG1tYXBwZWQgcmVn
aW9ucyAqLwogICAgaW50IGhibGtoZDsgICAgLyogU3BhY2UgYWxsb2NhdGVkIGluIG1tYXBwZWQg
cmVnaW9ucyAoYnl0ZXMpICovCiAgICBpbnQgdXNtYmxrczsgICAvKiBNYXhpbXVtIHRvdGFsIGFs
bG9jYXRlZCBzcGFjZSAoYnl0ZXMpICovCiAgICBpbnQgZnNtYmxrczsgICAvKiBTcGFjZSBpbiBm
cmVlZCBmYXN0YmluIGJsb2NrcyAoYnl0ZXMpICovCiAgICBpbnQgdW9yZGJsa3M7ICAvKiBUb3Rh
bCBhbGxvY2F0ZWQgc3BhY2UgKGJ5dGVzKSAqLwogICAgaW50IGZvcmRibGtzOyAgLyogVG90YWwg
ZnJlZSBzcGFjZSAoYnl0ZXMpICovCiAgICBpbnQga2VlcGNvc3Q7ICAvKiBUb3AtbW9zdCwgcmVs
ZWFzYWJsZSBzcGFjZSAoYnl0ZXMpICovCn07Ci5maQouaW4KLlBQClRoZSBmaWVsZHMgb2YgdGhl
Ci5JIG1hbGxpbmZvCnN0cnVjdHVyZSBjb250YWluIHRoZSBmb2xsb3dpbmcgaW5mb3JtYXRpb246
CgouVFAgMTAKLkkgYXJlbmEKVGhlIHRvdGFsIGFtb3VudCBvZiBtZW1vcnkgYWxsb2NhdGVkIGJ5
IG1lYW5zIG90aGVyIHRoYW4KLkJSIG1tYXAgKDIpCihpLmUuLCBtZW1vcnkgYWxsb2NhdGVkIG9u
IHRoZSBoZWFwKS4KVGhpcyBmaWd1cmUgaW5jbHVkZXMgYm90aCBpbi11c2UgYmxvY2tzIGFuZCBi
bG9ja3Mgb24gdGhlIGZyZWUgbGlzdC4KLlRQCi5JIG9yZGJsa3MKVGhlIG51bWJlciBvZiBvcmRp
bmFyeSAoaS5lLiwgbm9uLWZhc3RiaW4pIGZyZWUgYmxvY2tzLgouVFAKLkkgc21ibGtzClRoZSBu
dW1iZXIgb2YgZmFzdGJpbiBmcmVlIGJsb2NrcyAoc2VlCi5CUiBtYWxsb3B0ICgzKSkuCi5UUAou
SSBoYmxrcwpUaGUgbnVtYmVyIG9mIGJsb2NrcyBjdXJyZW50bHkgYWxsb2NhdGVkIHVzaW5nCi5C
UiBtbWFwICgyKS4KLlRQCi5JIGhibGtoZApUaGUgbnVtYmVyIG9mIGJ5dGVzIGluIGJsb2NrcyBj
dXJyZW50bHkgYWxsb2NhdGVkIHVzaW5nCi5CUiBtbWFwICgyKS4KLlRQCi5JIHVzbWJsa3MKVGhl
ICJoaWdod2F0ZXIgbWFyayIgZm9yIGFsbG9jYXRlZCBzcGFjZVwoZW10aGF0IGlzLAp0aGUgbWF4
aW11bSBhbW91bnQgb2Ygc3BhY2UgdGhhdCB3YXMgZXZlciBhbGxvY2F0ZWQuClRoaXMgZmllbGQg
aXMgbWFpbnRhaW5lZCBvbmx5IGluIG5vbnRocmVhZGluZyBlbnZpcm9ubWVudHMuCi5UUAouSSBm
c21ibGtzClRoZSB0b3RhbCBudW1iZXIgb2YgYnl0ZXMgaW4gZmFzdGJpbiBmcmVlIGJsb2Nrcy4K
LlRQCi5JIHVvcmRibGtzClRoZSB0b3RhbCBudW1iZXIgb2YgYnl0ZXMgdXNlZCBieSBpbi11c2Ug
YWxsb2NhdGlvbnMuCi5UUAouSSBmb3JkYmxrcwpUaGUgdG90YWwgbnVtYmVyIG9mIGJ5dGVzIGlu
IGZyZWUgYmxvY2tzLgouVFAKLkkga2VlcGNvc3QKVGhlIHRvdGFsIGFtb3VudCBvZiByZWxlYXNh
YmxlIGZyZWUgc3BhY2UgYXQgdGhlIHRvcApvZiB0aGUgaGVhcC4KVGhpcyBpcyB0aGUgbWF4aW11
bSBudW1iZXIgb2YgYnl0ZXMgdGhhdCBjb3VsZCBpZGVhbGx5CihpLmUuLCBpZ25vcmluZyBwYWdl
IGFsaWdubWVudCByZXN0cmljdGlvbnMsIGFuZCBzbyBvbikgYmUgcmVsZWFzZWQgYnkKLkJSIG1h
bGxvY190cmltICgzKS4KLlwiIC5TSCBWRVJTSU9OUwouXCIgQXZhaWxhYmxlIGFscmVhZHkgaW4g
Z2xpYmMgMi4wLCBwb3NzaWJseSBlYXJsaWVyCi5TSCBDT05GT1JNSU5HIFRPClRoaXMgZnVuY3Rp
b24gaXMgbm90IHNwZWNpZmllZCBieSBQT1NJWCBvciB0aGUgQyBzdGFuZGFyZHMuCkEgc2ltaWxh
ciBmdW5jdGlvbiBleGlzdHMgb24gbWFueSBTeXN0ZW0gViBkZXJpdmF0aXZlcywKYW5kIHdhcyBz
cGVjaWZpZWQgaW4gdGhlIFNWSUQuCi5TSCBCVUdTCi5cIiBGSVhNRSBodHRwOi8vc291cmNld2Fy
ZS5vcmcvYnVnemlsbGEvc2hvd19idWcuY2dpP2lkPTIwOAouXCIgU2VlIHRoZSAyNCBBdWcgMjAx
MSBtYWlsIGJ5IFBhdWwgUGx1emhuaWtvdjoKLlwiICAgICAiW3BhdGNoXSBGaXggbWFsbGluZm8o
KSB0byBhY2N1bXVsYXRlIHJlc3VsdHMgZm9yIGFsbCBhcmVuYXMiCi5cIiBvbiBsaWJjLWFscGhh
QHNvdXJjZXdhcmUub3JnCi5CIEluZm9ybWF0aW9uIGlzIHJldHVybmVkIGZvciBvbmx5IHRoZSBt
YWluIG1lbW9yeSBhbGxvY2F0aW9uIGFyZWEuCkFsbG9jYXRpb25zIGluIG90aGVyIGFyZW5hcyBh
cmUgZXhjbHVkZWQuClNlZQouQlIgbWFsbG9jX3N0YXRzICgzKQphbmQKLkJSIG1hbGxvY19pbmZv
ICgzKQpmb3IgYWx0ZXJuYXRpdmVzIHRoYXQgaW5jbHVkZSBpbmZvcm1hdGlvbiBhYm91dCBvdGhl
ciBhcmVuYXMuCgpUaGUgZmllbGRzIG9mIHRoZQouSSBtYWxsaW5mbwpzdHJ1Y3R1cmUgYXJlIHR5
cGVkIGFzCi5JUiBpbnQgLgpIb3dldmVyLCBiZWNhdXNlIHNvbWUgaW50ZXJuYWwgYm9va2tlZXBp
bmcgdmFsdWVzIG1heSBiZSBvZiB0eXBlCi5JUiBsb25nICwKdGhlIHJlcG9ydGVkIHZhbHVlcyBt
YXkgd3JhcCBhcm91bmQgemVybyBhbmQgdGh1cyBiZSBpbmFjY3VyYXRlLgouU0ggRVhBTVBMRQpU
aGUgcHJvZ3JhbSBiZWxvdyBlbXBsb3lzCi5CUiBtYWxsaW5mbyAoKQp0byByZXRyaWV2ZSBtZW1v
cnkgYWxsb2NhdGlvbiBzdGF0aXN0aWNzIGJlZm9yZSBhbmQgYWZ0ZXIKYWxsb2NhdGluZyBhbmQg
ZnJlZWluZyBzb21lIGJsb2NrcyBvZiBtZW1vcnkuClRoZSBzdGF0aXN0aWNzIGFyZSBkaXNwbGF5
ZWQgb24gc3RhbmRhcmQgb3V0cHV0LgoKVGhlIGZpcnN0IHR3byBjb21tYW5kLWxpbmUgYXJndW1l
bnRzIHNwZWNpZnkgdGhlIG51bWJlciBhbmQgc2l6ZSBvZgpibG9ja3MgdG8gYmUgYWxsb2NhdGVk
IHdpdGgKLkJSIG1hbGxvYyAoMykuCgpUaGUgcmVtYWluaW5nIHRocmVlIGFyZ3VtZW50cyBzcGVj
aWZ5IHdoaWNoIG9mIHRoZSBhbGxvY2F0ZWQgYmxvY2tzCnNob3VsZCBiZSBmcmVlZCB3aXRoCi5C
UiBmcmVlICgzKS4KVGhlc2UgdGhyZWUgYXJndW1lbnRzIGFyZSBvcHRpb25hbCwgYW5kIHNwZWNp
ZnkgKGluIG9yZGVyKToKdGhlIHN0ZXAgc2l6ZSB0byBiZSB1c2VkIGluIHRoZSBsb29wIHRoYXQg
ZnJlZXMgYmxvY2tzCih0aGUgZGVmYXVsdCBpcyAxLCBtZWFuaW5nIGZyZWUgYWxsIGJsb2NrcyBp
biB0aGUgcmFuZ2UpOwp0aGUgb3JkaW5hbCBwb3NpdGlvbiBvZiB0aGUgZmlyc3QgYmxvY2sgdG8g
YmUgZnJlZWQKKGRlZmF1bHQgMCwgbWVhbmluZyB0aGUgZmlyc3QgYWxsb2NhdGVkIGJsb2NrKTsK
YW5kIGEgbnVtYmVyIG9uZSBncmVhdGVyIHRoYW4gdGhlIG9yZGluYWwgcG9zaXRpb24Kb2YgdGhl
IGxhc3QgYmxvY2sgdG8gYmUgZnJlZWQKKGRlZmF1bHQgaXMgb25lIGdyZWF0ZXIgdGhhbiB0aGUg
bWF4aW11bSBibG9jayBudW1iZXIpLgpJZiB0aGVzZSB0aHJlZSBhcmd1bWVudHMgYXJlIG9taXR0
ZWQsCnRoZW4gdGhlIGRlZmF1bHRzIGNhdXNlIGFsbCBhbGxvY2F0ZWQgYmxvY2tzIHRvIGJlIGZy
ZWVkLgoKSW4gdGhlIGZvbGxvd2luZyBleGFtcGxlIHJ1biBvZiB0aGUgcHJvZ3JhbSwKMTAwMCBh
bGxvY2F0aW9ucyBvZiAxMDAgYnl0ZXMgYXJlIHBlcmZvcm1lZCwKYW5kIHRoZW4gZXZlcnkgc2Vj
b25kIGFsbG9jYXRlZCBibG9jayBpcyBmcmVlZDoKLlBQCi5pbiArNG4KLm5mCiQgXGZCLi9hLm91
dCAxMDAwIDEwMCAyXGZQCj09PT09PT09PT09PT09IEJlZm9yZSBhbGxvY2F0aW5nIGJsb2NrcyA9
PT09PT09PT09PT09PQpUb3RhbCBub25cLW1tYXBwZWQgYnl0ZXMgKGFyZW5hKTogICAgICAgMAoj
IG9mIGZyZWUgY2h1bmtzIChvcmRibGtzKTogICAgICAgICAgICAxCiMgb2YgZnJlZSBmYXN0Ymlu
IGJsb2NrcyAoc21ibGtzKTogICAgIDAKIyBvZiBtYXBwZWQgcmVnaW9ucyAoaGJsa3MpOiAgICAg
ICAgICAgMApCeXRlcyBpbiBtYXBwZWQgcmVnaW9ucyAoaGJsa2hkKTogICAgICAwCk1heC4gdG90
YWwgYWxsb2NhdGVkIHNwYWNlICh1c21ibGtzKTogIDAKRnJlZSBieXRlcyBoZWxkIGluIGZhc3Ri
aW5zIChmc21ibGtzKTogMApUb3RhbCBhbGxvY2F0ZWQgc3BhY2UgKHVvcmRibGtzKTogICAgICAw
ClRvdGFsIGZyZWUgc3BhY2UgKGZvcmRibGtzKTogICAgICAgICAgIDAKVG9wbW9zdCByZWxlYXNh
YmxlIGJsb2NrIChrZWVwY29zdCk6ICAgMAoKPT09PT09PT09PT09PT0gQWZ0ZXIgYWxsb2NhdGlu
ZyBibG9ja3MgPT09PT09PT09PT09PT0KVG90YWwgbm9uXC1tbWFwcGVkIGJ5dGVzIChhcmVuYSk6
ICAgICAgIDEzNTE2OAojIG9mIGZyZWUgY2h1bmtzIChvcmRibGtzKTogICAgICAgICAgICAxCiMg
b2YgZnJlZSBmYXN0YmluIGJsb2NrcyAoc21ibGtzKTogICAgIDAKIyBvZiBtYXBwZWQgcmVnaW9u
cyAoaGJsa3MpOiAgICAgICAgICAgMApCeXRlcyBpbiBtYXBwZWQgcmVnaW9ucyAoaGJsa2hkKTog
ICAgICAwCk1heC4gdG90YWwgYWxsb2NhdGVkIHNwYWNlICh1c21ibGtzKTogIDAKRnJlZSBieXRl
cyBoZWxkIGluIGZhc3RiaW5zIChmc21ibGtzKTogMApUb3RhbCBhbGxvY2F0ZWQgc3BhY2UgKHVv
cmRibGtzKTogICAgICAxMDQwMDAKVG90YWwgZnJlZSBzcGFjZSAoZm9yZGJsa3MpOiAgICAgICAg
ICAgMzExNjgKVG9wbW9zdCByZWxlYXNhYmxlIGJsb2NrIChrZWVwY29zdCk6ICAgMzExNjgKCj09
PT09PT09PT09PT09IEFmdGVyIGZyZWVpbmcgYmxvY2tzID09PT09PT09PT09PT09ClRvdGFsIG5v
blwtbW1hcHBlZCBieXRlcyAoYXJlbmEpOiAgICAgICAxMzUxNjgKIyBvZiBmcmVlIGNodW5rcyAo
b3JkYmxrcyk6ICAgICAgICAgICAgNTAxCiMgb2YgZnJlZSBmYXN0YmluIGJsb2NrcyAoc21ibGtz
KTogICAgIDAKIyBvZiBtYXBwZWQgcmVnaW9ucyAoaGJsa3MpOiAgICAgICAgICAgMApCeXRlcyBp
biBtYXBwZWQgcmVnaW9ucyAoaGJsa2hkKTogICAgICAwCk1heC4gdG90YWwgYWxsb2NhdGVkIHNw
YWNlICh1c21ibGtzKTogIDAKRnJlZSBieXRlcyBoZWxkIGluIGZhc3RiaW5zIChmc21ibGtzKTog
MApUb3RhbCBhbGxvY2F0ZWQgc3BhY2UgKHVvcmRibGtzKTogICAgICA1MjAwMApUb3RhbCBmcmVl
IHNwYWNlIChmb3JkYmxrcyk6ICAgICAgICAgICA4MzE2OApUb3Btb3N0IHJlbGVhc2FibGUgYmxv
Y2sgKGtlZXBjb3N0KTogICAzMTE2OAouZmkKLmluCi5TUyBQcm9ncmFtIHNvdXJjZQpcJgoubmYK
I2luY2x1ZGUgPG1hbGxvYy5oPgojaW5jbHVkZSAidGxwaV9oZHIuaCIKCnN0YXRpYyB2b2lkCmRp
c3BsYXlfbWFsbGluZm8odm9pZCkKewogICAgc3RydWN0IG1hbGxpbmZvIG1pOwoKICAgIG1pID0g
bWFsbGluZm8oKTsKCiAgICBwcmludGYoIlRvdGFsIG5vblwtbW1hcHBlZCBieXRlcyAoYXJlbmEp
OiAgICAgICAlZFxcbiIsIG1pLmFyZW5hKTsKICAgIHByaW50ZigiIyBvZiBmcmVlIGNodW5rcyAo
b3JkYmxrcyk6ICAgICAgICAgICAgJWRcXG4iLCBtaS5vcmRibGtzKTsKICAgIHByaW50ZigiIyBv
ZiBmcmVlIGZhc3RiaW4gYmxvY2tzIChzbWJsa3MpOiAgICAgJWRcXG4iLCBtaS5zbWJsa3MpOwog
ICAgcHJpbnRmKCIjIG9mIG1hcHBlZCByZWdpb25zIChoYmxrcyk6ICAgICAgICAgICAlZFxcbiIs
IG1pLmhibGtzKTsKICAgIHByaW50ZigiQnl0ZXMgaW4gbWFwcGVkIHJlZ2lvbnMgKGhibGtoZCk6
ICAgICAgJWRcXG4iLCBtaS5oYmxraGQpOwogICAgcHJpbnRmKCJNYXguIHRvdGFsIGFsbG9jYXRl
ZCBzcGFjZSAodXNtYmxrcyk6ICAlZFxcbiIsIG1pLnVzbWJsa3MpOwogICAgcHJpbnRmKCJGcmVl
IGJ5dGVzIGhlbGQgaW4gZmFzdGJpbnMgKGZzbWJsa3MpOiAlZFxcbiIsIG1pLmZzbWJsa3MpOwog
ICAgcHJpbnRmKCJUb3RhbCBhbGxvY2F0ZWQgc3BhY2UgKHVvcmRibGtzKTogICAgICAlZFxcbiIs
IG1pLnVvcmRibGtzKTsKICAgIHByaW50ZigiVG90YWwgZnJlZSBzcGFjZSAoZm9yZGJsa3MpOiAg
ICAgICAgICAgJWRcXG4iLCBtaS5mb3JkYmxrcyk7CiAgICBwcmludGYoIlRvcG1vc3QgcmVsZWFz
YWJsZSBibG9jayAoa2VlcGNvc3QpOiAgICVkXFxuIiwgbWkua2VlcGNvc3QpOwp9CgppbnQKbWFp
bihpbnQgYXJnYywgY2hhciAqYXJndltdKQp7CiNkZWZpbmUgTUFYX0FMTE9DUyAyMDAwMDAwCiAg
ICBjaGFyICphbGxvY1tNQVhfQUxMT0NTXTsKICAgIGludCBudW1CbG9ja3MsIGosIGZyZWVCZWdp
biwgZnJlZUVuZCwgZnJlZVN0ZXA7CiAgICBzaXplX3QgYmxvY2tTaXplOwoKICAgIGlmIChhcmdj
IDwgMyB8fCBzdHJjbXAoYXJndlsxXSwgIlwtXC1oZWxwIikgPT0gMCkKICAgICAgICB1c2FnZUVy
cigiJXMgbnVtXC1ibG9ja3MgYmxvY2tcLXNpemUgW2ZyZWVcLXN0ZXAgW3N0YXJ0XC1mcmVlICIK
ICAgICAgICAgICAgICAgICJbZW5kXC1mcmVlXV1dXFxuIiwgYXJndlswXSk7CgogICAgbnVtQmxv
Y2tzID0gYXRvaShhcmd2WzFdKTsKICAgIGJsb2NrU2l6ZSA9IGF0b2koYXJndlsyXSk7CiAgICBm
cmVlU3RlcCA9IChhcmdjID4gMykgPyBhdG9pKGFyZ3ZbM10pIDogMTsKICAgIGZyZWVCZWdpbiA9
IChhcmdjID4gNCkgPyBhdG9pKGFyZ3ZbNF0pIDogMDsKICAgIGZyZWVFbmQgPSAoYXJnYyA+IDUp
ID8gYXRvaShhcmd2WzVdKSA6IG51bUJsb2NrczsKCiAgICBwcmludGYoIj09PT09PT09PT09PT09
IEJlZm9yZSBhbGxvY2F0aW5nIGJsb2NrcyA9PT09PT09PT09PT09PVxcbiIpOwogICAgZGlzcGxh
eV9tYWxsaW5mbygpOwoKICAgIGZvciAoaiA9IDA7IGogPCBudW1CbG9ja3M7IGorKykgewogICAg
ICAgIGlmIChudW1CbG9ja3MgPj0gTUFYX0FMTE9DUykKICAgICAgICAgICAgZmF0YWwoIlRvbyBt
YW55IGFsbG9jYXRpb25zIik7CgogICAgICAgIGFsbG9jW2pdID0gbWFsbG9jKGJsb2NrU2l6ZSk7
CiAgICAgICAgaWYgKGFsbG9jW2pdID09IE5VTEwpCiAgICAgICAgICAgIGVyckV4aXQoIm1hbGxv
YyIpOwogICAgfQoKICAgIHByaW50ZigiXFxuPT09PT09PT09PT09PT0gQWZ0ZXIgYWxsb2NhdGlu
ZyBibG9ja3MgPT09PT09PT09PT09PT1cXG4iKTsKICAgIGRpc3BsYXlfbWFsbGluZm8oKTsKCiAg
ICBmb3IgKGogPSBmcmVlQmVnaW47IGogPCBmcmVlRW5kOyBqICs9IGZyZWVTdGVwKQogICAgICAg
IGZyZWUoYWxsb2Nbal0pOwoKICAgIHByaW50ZigiXFxuPT09PT09PT09PT09PT0gQWZ0ZXIgZnJl
ZWluZyBibG9ja3MgPT09PT09PT09PT09PT1cXG4iKTsKICAgIGRpc3BsYXlfbWFsbGluZm8oKTsK
CiAgICBleGl0KEVYSVRfU1VDQ0VTUyk7Cn0KLmZpCi5TSCBTRUUgQUxTTwouYWQgbAoubmgKLkJS
IG1tYXAgKDIpLAouQlIgbWFsbG9jICgzKSwKLkJSIG1hbGxvY19pbmZvICgzKSwKLkJSIG1hbGxv
Y19zdGF0cyAoMyksCi5CUiBtYWxsb2NfdHJpbSAoMyksCi5CUiBtYWxsb3B0ICgzKQo=
--14dae9340a37d716d904bf3ed539--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
