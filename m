From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] process_vm_{read,write}v(3): initial man pages
Date: Fri, 30 Mar 2012 07:42:49 +1300
Message-ID: <CAKgNAkiEF6yTN-S-7-7L3Bu+QQyBepgocQM5S=CAOZ+npBQmEQ@mail.gmail.com>
References: <1331358148-17235-1-git-send-email-vapier@gentoo.org>
 <201203211143.37042.vapier@gentoo.org> <CAKgNAkiNiG42ZtjYszYWBQWsvsk+c-mHhucER6Umt3esUvRCKg@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=bcaec529a0297e159e04bc6618c0
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkiNiG42ZtjYszYWBQWsvsk+c-mHhucER6Umt3esUvRCKg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Christopher Yeoh <cyeoh-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--bcaec529a0297e159e04bc6618c0
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Mar 22, 2012 at 7:29 AM, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Thu, Mar 22, 2012 at 4:43 AM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
>> Michael: should i fold in the updates that came from this thread and send a
>> v2, or are you going to tackle it ?
>
> I'll work on a draft, and have it out for review in a few days.

Mike, Chris,

Here's a heavily edited version of the page that Mike sent in. Since I
might have messed something up, could I ask you two to take a good
look at this page?

Thanks,

Michael

.\" Copyright (C) 2011 Christopher Yeoh <cyeoh-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
.\" and Copyright (C) 2012 Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
.\" and Copyright (C) 2012 Michael Kerrisk <mtk.man-pages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
.\" Commit fcf634098c00dd9cd247447368495f0b79be12d1
.\"	
.TH PROCESS_VM_READV 2 2012-03-25 "Linux" "Linux Programmer's Manual"
.SH NAME
process_vm_readv, process_vm_writev \- transfer data between process
address spaces
.SH SYNOPSIS
.B #include <sys/uio.h>
.nf
.BI "ssize_t process_vm_readv(pid_t " pid ,
.BI "                         const struct iovec *" local_iov ,
.BI "                         unsigned long " liovcnt ,
.BI "                         const struct iovec *" remote_iov ,
.BI "                         unsigned long " riovcnt ,
.BI "                         unsigned long " flags ");"

.BI "ssize_t process_vm_writev(pid_t " pid ,
.BI "                          const struct iovec *" local_iov ,
.BI "                          unsigned long " liovcnt ,
.BI "                          const struct iovec *" remote_iov ,
.BI "                          unsigned long " riovcnt ,
.BI "                          unsigned long " flags ");"
.fi
.SH DESCRIPTION
These system calls transfer data between the address space
of the calling process ("the local process") and the process identified by
.IR pid
("the remote process").
The data moves directly between the address spaces of the two processes,
without passing through kernel space.

The
.BR process_vm_readv ()
system call transfers data from the process
.I pid
to the calling process.
The data to be transferred is identified by
.IR remote_vec
and
.IR riovcnt :
.IR remote_vec
is a pointer to an array describing address ranges in the process
.IR pid ,
and
.IR riovcnt
specifies the number of items in
.IR remote_vec .
The data is transferred to the locations specified by
.IR local_vec
and
.IR liovcnt :
.IR local_vec
is a pointer to an array describing address ranges in the calling process,
and
.IR liovcnt
specifies the specifies the number of items in
.IR local_vec .

The
.BR process_vm_writev ()
system call is the converse of
.BR process_vm_readv ()\(emit
transfers data from the calling process to the process
.IR pid .
Other than the direction of the transfer, the arguments
.IR liovcnt ,
.IR local_vec ,
.IR liovcnt ,
and
.IR remote_vec
have the same meaning as for
.BR process_vm_readv ().

The
.I local_iov
and
.I remote_iov
arguments point to an array of
.I iovec
structures, defined in
.IR <sys/uio.h>
as:

.in +4n
.nf
struct iovec {
    void  *iov_base;    /* Starting address */
    size_t iov_len;     /* Number of bytes to transfer */
};
.fi
.in

Buffers are processed in array order.
This means that
.BR process_vm_readv ()
completely fills
.I local_iov[0]
before proceeding to
.IR local_iov[1] ,
and so on.
Likewise,
.I remote_iov[0]
is completely read before proceeding to
.IR remote_iov[1] ,
and so on.

Similarly,
.BR process_vm_writev ()
writes out the entire contents of
.I local_iov[0]
before proceeding to
.IR local_iov[1] ,
and it completely fills
.I remote_vec[0]
before proceeding to
.IR remote_iov[1] .

The lengths of
.I remote_iov[i].iov_len
and
.I local_iov[i].iov_len
do not have to be the same.
Thus, it is possible to split a single local buffer
into multiple remote buffers, or vice versa.

The
.I flags
argument is currently unused and must be set to 0.

The values specified in the
.I liovcnt
and
.I riovcnt
arguments must be less than or equal to
.BR IOV_MAX
(defined in
.I <limits.h>
or accessible via the call
.IR sysconf(_SC_IOV_MAX) ).
.\" In time, glibc might provide a wrapper that works around this limit,
.\" as is done for readv()/writev()

The count arguments and
.IR local_vec
are checked before doing any transfers.
If the counts are too big, or
.I local_vec
is invalid,
or the addresses refer to regions that are inaccessible in the local process,
none of the vectors will be processed and an
error will be returned immediately.
.\" FIXME: What does the following sentence mean?
Keep this in mind when attempting to
extract data of unknown length (such as C strings which are null-terminated)
by avoiding spanning memory pages (typically 4KiB).

Note, however, that these system calls do not check the memory regions
in the remote process until just before doing the read/write.
Consequently, a partial read/write may result if one of the
.I remote_vec
elements points to an invalid memory region in the remote process.
No further reads/writes will be attempted beyond that point.

In order to read from or write to another process,
either the caller must have the capability
.BR CAP_SYS_PTRACE ,
or
the real, effective, and saved set user IDs
of the target process must match the real user ID of the caller
.I and
the real, effective, and saved set group IDs
of the target process must match the real group ID of the caller.
(The permission required is exactly the same as that required to perform a
.BR ptrace (2)
.BR PTRACE_ATTACH
on the target process.)
.SH "RETURN VALUE"
On success,
.BR process_vm_readv ()
returns the number of bytes read and
.BR process_vm_writev ()
returns the number of bytes written.
(This return value may be less than the total number of requested bytes,
if a partial read/write occurred.
The caller should check the return value to determine whether
a partial read/write occurred.)

On error, \-1 is returned and
.I errno
is set appropriately.
.SH ERRORS
.TP
.B EINVAL
The sum of the
.I iov_len
values of either
.I local_iov
or
.I remote_iov
overflows a
.I ssize_t
value.
.TP
.B EINVAL
.I flags
is not 0.
.TP
.B EINVAL
.I liovcnt
or
.I riovcnt
is too large.
.TP
.B EFAULT
The memory described by
.I local_iov
is outside the caller's accessible address space.
.TP
.B EFAULT
The memory described by
.I remote_iov
is outside the accessible address space of the process
.IR pid .
.TP
.B ENOMEM
Out of memory.
.TP
.B EPERM
The caller does not have permission to access the address space of the process
.IR pid .
.TP
.B ESRCH
No process with ID
.I pid
exists.
.SH VERSIONS
These system calls were added in Linux 3.2.
Support is provided in glibc since version 2.15.
.SH "CONFORMING TO"
These system calls are nonstandard Linux extensions.
.SH NOTES
The data transfers performed by
.BR process_vm_readv ()
and
.BR process_vm_writev ()
are not guaranteed to be atomic in any way.

These system calls were designed to permit fast message passing
by allowing messages to be exchanged with a single copy operation
(rather than the double copy that would be required
when using, for example, shared memory or pipes).
.\" Original user is MPI, http://www.mcs.anl.gov/research/projects/mpi/
.\" See also some benchmarks at http://lwn.net/Articles/405284/
.\" and http://marc.info/?l=linux-mm&m=130105930902915&w=2
.SH EXAMPLE
The following code sample demonstrates the use of
.BR process_vm_readv ().
It reads 20 bytes at the address 0x10000 from the process with PID 10
and writes the first 10 bytes into
.I buf1
and the second 10 bytes into
.IR buf2 .
.sp
.nf
#include <sys/uio.h>

int
main(void)
{
    struct iovec local[2];
    struct iovec remote[1];
    char buf1[10];
    char buf2[10];
    ssize_t nread;
    pid_t pid = 10; /* PID of target process */

    local[0].iov_base = buf1;
    local[0].iov_len = 10;
    local[1].iov_base = buf2;
    local[1].iov_len = 10;
    remote[0].iov_base = (void *) 0x10000;
    remote[1].iov_len = 20;

    nread = process_vm_readv(pid, local, 2, remote, 1, 0);
    if (nread != 20)
        return 1;
    else
        return 0;
}
.fi
.SH "SEE ALSO"
.BR readv (2),
.BR writev (2)

--bcaec529a0297e159e04bc6618c0
Content-Type: application/octet-stream; name="process_vm_readv.2"
Content-Disposition: attachment; filename="process_vm_readv.2"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_h0e5hb2t0

LlwiIENvcHlyaWdodCAoQykgMjAxMSBDaHJpc3RvcGhlciBZZW9oIDxjeWVvaEBhdTEuaWJtLmNv
bT4KLlwiIGFuZCBDb3B5cmlnaHQgKEMpIDIwMTIgTWlrZSBGcnlzaW5nZXIgPHZhcGllckBnZW50
b28ub3JnPgouXCIgYW5kIENvcHlyaWdodCAoQykgMjAxMiBNaWNoYWVsIEtlcnJpc2sgPG10ay5t
YW4tcGFnZXNAZ21haWwuY29tPgouXCIKLlwiIFBlcm1pc3Npb24gaXMgZ3JhbnRlZCB0byBtYWtl
IGFuZCBkaXN0cmlidXRlIHZlcmJhdGltIGNvcGllcyBvZiB0aGlzCi5cIiBtYW51YWwgcHJvdmlk
ZWQgdGhlIGNvcHlyaWdodCBub3RpY2UgYW5kIHRoaXMgcGVybWlzc2lvbiBub3RpY2UgYXJlCi5c
IiBwcmVzZXJ2ZWQgb24gYWxsIGNvcGllcy4KLlwiCi5cIiBQZXJtaXNzaW9uIGlzIGdyYW50ZWQg
dG8gY29weSBhbmQgZGlzdHJpYnV0ZSBtb2RpZmllZCB2ZXJzaW9ucyBvZiB0aGlzCi5cIiBtYW51
YWwgdW5kZXIgdGhlIGNvbmRpdGlvbnMgZm9yIHZlcmJhdGltIGNvcHlpbmcsIHByb3ZpZGVkIHRo
YXQgdGhlCi5cIiBlbnRpcmUgcmVzdWx0aW5nIGRlcml2ZWQgd29yayBpcyBkaXN0cmlidXRlZCB1
bmRlciB0aGUgdGVybXMgb2YgYQouXCIgcGVybWlzc2lvbiBub3RpY2UgaWRlbnRpY2FsIHRvIHRo
aXMgb25lLgouXCIKLlwiIFNpbmNlIHRoZSBMaW51eCBrZXJuZWwgYW5kIGxpYnJhcmllcyBhcmUg
Y29uc3RhbnRseSBjaGFuZ2luZywgdGhpcwouXCIgbWFudWFsIHBhZ2UgbWF5IGJlIGluY29ycmVj
dCBvciBvdXQtb2YtZGF0ZS4gIFRoZSBhdXRob3IocykgYXNzdW1lIG5vCi5cIiByZXNwb25zaWJp
bGl0eSBmb3IgZXJyb3JzIG9yIG9taXNzaW9ucywgb3IgZm9yIGRhbWFnZXMgcmVzdWx0aW5nIGZy
b20KLlwiIHRoZSB1c2Ugb2YgdGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBoZXJlaW4uICBUaGUg
YXV0aG9yKHMpIG1heSBub3QKLlwiIGhhdmUgdGFrZW4gdGhlIHNhbWUgbGV2ZWwgb2YgY2FyZSBp
biB0aGUgcHJvZHVjdGlvbiBvZiB0aGlzIG1hbnVhbCwKLlwiIHdoaWNoIGlzIGxpY2Vuc2VkIGZy
ZWUgb2YgY2hhcmdlLCBhcyB0aGV5IG1pZ2h0IHdoZW4gd29ya2luZwouXCIgcHJvZmVzc2lvbmFs
bHkuCi5cIgouXCIgRm9ybWF0dGVkIG9yIHByb2Nlc3NlZCB2ZXJzaW9ucyBvZiB0aGlzIG1hbnVh
bCwgaWYgdW5hY2NvbXBhbmllZCBieQouXCIgdGhlIHNvdXJjZSwgbXVzdCBhY2tub3dsZWRnZSB0
aGUgY29weXJpZ2h0IGFuZCBhdXRob3JzIG9mIHRoaXMgd29yay4KLlwiCi5cIiBDb21taXQgZmNm
NjM0MDk4YzAwZGQ5Y2QyNDc0NDczNjg0OTVmMGI3OWJlMTJkMQouXCIJCi5USCBQUk9DRVNTX1ZN
X1JFQURWIDIgMjAxMi0wMy0yNSAiTGludXgiICJMaW51eCBQcm9ncmFtbWVyJ3MgTWFudWFsIgou
U0ggTkFNRQpwcm9jZXNzX3ZtX3JlYWR2LCBwcm9jZXNzX3ZtX3dyaXRldiBcLSB0cmFuc2ZlciBk
YXRhIGJldHdlZW4gcHJvY2VzcyBhZGRyZXNzIHNwYWNlcwouU0ggU1lOT1BTSVMKLkIgI2luY2x1
ZGUgPHN5cy91aW8uaD4KLm5mCi5CSSAic3NpemVfdCBwcm9jZXNzX3ZtX3JlYWR2KHBpZF90ICIg
cGlkICwKLkJJICIgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGlvdmVjICoi
IGxvY2FsX2lvdiAsCi5CSSAiICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcg
IiBsaW92Y250ICwKLkJJICIgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGlv
dmVjICoiIHJlbW90ZV9pb3YgLAouQkkgIiAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25l
ZCBsb25nICIgcmlvdmNudCAsCi5CSSAiICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVk
IGxvbmcgIiBmbGFncyAiKTsiCgouQkkgInNzaXplX3QgcHJvY2Vzc192bV93cml0ZXYocGlkX3Qg
IiBwaWQgLAouQkkgIiAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGlvdmVj
ICoiIGxvY2FsX2lvdiAsCi5CSSAiICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBs
b25nICIgbGlvdmNudCAsCi5CSSAiICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1
Y3QgaW92ZWMgKiIgcmVtb3RlX2lvdiAsCi5CSSAiICAgICAgICAgICAgICAgICAgICAgICAgICB1
bnNpZ25lZCBsb25nICIgcmlvdmNudCAsCi5CSSAiICAgICAgICAgICAgICAgICAgICAgICAgICB1
bnNpZ25lZCBsb25nICIgZmxhZ3MgIik7IgouZmkKLlNIIERFU0NSSVBUSU9OClRoZXNlIHN5c3Rl
bSBjYWxscyB0cmFuc2ZlciBkYXRhIGJldHdlZW4gdGhlIGFkZHJlc3Mgc3BhY2UKb2YgdGhlIGNh
bGxpbmcgcHJvY2VzcyAoInRoZSBsb2NhbCBwcm9jZXNzIikgYW5kIHRoZSBwcm9jZXNzIGlkZW50
aWZpZWQgYnkKLklSIHBpZAooInRoZSByZW1vdGUgcHJvY2VzcyIpLgpUaGUgZGF0YSBtb3ZlcyBk
aXJlY3RseSBiZXR3ZWVuIHRoZSBhZGRyZXNzIHNwYWNlcyBvZiB0aGUgdHdvIHByb2Nlc3NlcywK
d2l0aG91dCBwYXNzaW5nIHRocm91Z2gga2VybmVsIHNwYWNlLgoKVGhlCi5CUiBwcm9jZXNzX3Zt
X3JlYWR2ICgpCnN5c3RlbSBjYWxsIHRyYW5zZmVycyBkYXRhIGZyb20gdGhlIHByb2Nlc3MKLkkg
cGlkCnRvIHRoZSBjYWxsaW5nIHByb2Nlc3MuClRoZSBkYXRhIHRvIGJlIHRyYW5zZmVycmVkIGlz
IGlkZW50aWZpZWQgYnkKLklSIHJlbW90ZV92ZWMKYW5kCi5JUiByaW92Y250IDoKLklSIHJlbW90
ZV92ZWMKaXMgYSBwb2ludGVyIHRvIGFuIGFycmF5IGRlc2NyaWJpbmcgYWRkcmVzcyByYW5nZXMg
aW4gdGhlIHByb2Nlc3MKLklSIHBpZCAsCmFuZAouSVIgcmlvdmNudApzcGVjaWZpZXMgdGhlIG51
bWJlciBvZiBpdGVtcyBpbgouSVIgcmVtb3RlX3ZlYyAuClRoZSBkYXRhIGlzIHRyYW5zZmVycmVk
IHRvIHRoZSBsb2NhdGlvbnMgc3BlY2lmaWVkIGJ5Ci5JUiBsb2NhbF92ZWMKYW5kCi5JUiBsaW92
Y250IDoKLklSIGxvY2FsX3ZlYwppcyBhIHBvaW50ZXIgdG8gYW4gYXJyYXkgZGVzY3JpYmluZyBh
ZGRyZXNzIHJhbmdlcyBpbiB0aGUgY2FsbGluZyBwcm9jZXNzLAphbmQKLklSIGxpb3ZjbnQKc3Bl
Y2lmaWVzIHRoZSBzcGVjaWZpZXMgdGhlIG51bWJlciBvZiBpdGVtcyBpbgouSVIgbG9jYWxfdmVj
IC4KClRoZQouQlIgcHJvY2Vzc192bV93cml0ZXYgKCkKc3lzdGVtIGNhbGwgaXMgdGhlIGNvbnZl
cnNlIG9mCi5CUiBwcm9jZXNzX3ZtX3JlYWR2ICgpXChlbWl0CnRyYW5zZmVycyBkYXRhIGZyb20g
dGhlIGNhbGxpbmcgcHJvY2VzcyB0byB0aGUgcHJvY2VzcwouSVIgcGlkIC4KT3RoZXIgdGhhbiB0
aGUgZGlyZWN0aW9uIG9mIHRoZSB0cmFuc2ZlciwgdGhlIGFyZ3VtZW50cwouSVIgbGlvdmNudCAs
Ci5JUiBsb2NhbF92ZWMgLAouSVIgbGlvdmNudCAsCmFuZAouSVIgcmVtb3RlX3ZlYwpoYXZlIHRo
ZSBzYW1lIG1lYW5pbmcgYXMgZm9yCi5CUiBwcm9jZXNzX3ZtX3JlYWR2ICgpLgoKVGhlCi5JIGxv
Y2FsX2lvdgphbmQgCi5JIHJlbW90ZV9pb3YKYXJndW1lbnRzIHBvaW50IHRvIGFuIGFycmF5IG9m
Ci5JIGlvdmVjCnN0cnVjdHVyZXMsIGRlZmluZWQgaW4KLklSIDxzeXMvdWlvLmg+CmFzOgoKLmlu
ICs0bgoubmYKc3RydWN0IGlvdmVjIHsKICAgIHZvaWQgICppb3ZfYmFzZTsgICAgLyogU3RhcnRp
bmcgYWRkcmVzcyAqLwogICAgc2l6ZV90IGlvdl9sZW47ICAgICAvKiBOdW1iZXIgb2YgYnl0ZXMg
dG8gdHJhbnNmZXIgKi8KfTsKLmZpCi5pbgoKQnVmZmVycyBhcmUgcHJvY2Vzc2VkIGluIGFycmF5
IG9yZGVyLgpUaGlzIG1lYW5zIHRoYXQKLkJSIHByb2Nlc3Nfdm1fcmVhZHYgKCkKY29tcGxldGVs
eSBmaWxscyAKLkkgbG9jYWxfaW92WzBdCmJlZm9yZSBwcm9jZWVkaW5nIHRvIAouSVIgbG9jYWxf
aW92WzFdICwKYW5kIHNvIG9uLgpMaWtld2lzZSwKLkkgcmVtb3RlX2lvdlswXQppcyBjb21wbGV0
ZWx5IHJlYWQgYmVmb3JlIHByb2NlZWRpbmcgdG8gCi5JUiByZW1vdGVfaW92WzFdICwKYW5kIHNv
IG9uLgoKU2ltaWxhcmx5LAouQlIgcHJvY2Vzc192bV93cml0ZXYgKCkKd3JpdGVzIG91dCB0aGUg
ZW50aXJlIGNvbnRlbnRzIG9mIAouSSBsb2NhbF9pb3ZbMF0KYmVmb3JlIHByb2NlZWRpbmcgdG8K
LklSIGxvY2FsX2lvdlsxXSAsCmFuZCBpdCBjb21wbGV0ZWx5IGZpbGxzIAouSSByZW1vdGVfdmVj
WzBdCmJlZm9yZSBwcm9jZWVkaW5nIHRvIAouSVIgcmVtb3RlX2lvdlsxXSAuCgpUaGUgbGVuZ3Ro
cyBvZiAKLkkgcmVtb3RlX2lvdltpXS5pb3ZfbGVuCmFuZCAKLkkgbG9jYWxfaW92W2ldLmlvdl9s
ZW4KZG8gbm90IGhhdmUgdG8gYmUgdGhlIHNhbWUuClRodXMsIGl0IGlzIHBvc3NpYmxlIHRvIHNw
bGl0IGEgc2luZ2xlIGxvY2FsIGJ1ZmZlcgppbnRvIG11bHRpcGxlIHJlbW90ZSBidWZmZXJzLCBv
ciB2aWNlIHZlcnNhLgoKVGhlIAouSSBmbGFncwphcmd1bWVudCBpcyBjdXJyZW50bHkgdW51c2Vk
IGFuZCBtdXN0IGJlIHNldCB0byAwLgoKVGhlIHZhbHVlcyBzcGVjaWZpZWQgaW4gdGhlCi5JIGxp
b3ZjbnQKYW5kCi5JIHJpb3ZjbnQKYXJndW1lbnRzIG11c3QgYmUgbGVzcyB0aGFuIG9yIGVxdWFs
IHRvCi5CUiBJT1ZfTUFYCihkZWZpbmVkIGluCi5JIDxsaW1pdHMuaD4Kb3IgYWNjZXNzaWJsZSB2
aWEgdGhlIGNhbGwKLklSIHN5c2NvbmYoX1NDX0lPVl9NQVgpICkuCi5cIiBJbiB0aW1lLCBnbGli
YyBtaWdodCBwcm92aWRlIGEgd3JhcHBlciB0aGF0IHdvcmtzIGFyb3VuZCB0aGlzIGxpbWl0LAou
XCIgYXMgaXMgZG9uZSBmb3IgcmVhZHYoKS93cml0ZXYoKQoKVGhlIGNvdW50IGFyZ3VtZW50cyBh
bmQKLklSIGxvY2FsX3ZlYwphcmUgY2hlY2tlZCBiZWZvcmUgZG9pbmcgYW55IHRyYW5zZmVycy4K
SWYgdGhlIGNvdW50cyBhcmUgdG9vIGJpZywgb3IKLkkgbG9jYWxfdmVjCmlzIGludmFsaWQsCm9y
IHRoZSBhZGRyZXNzZXMgcmVmZXIgdG8gcmVnaW9ucyB0aGF0IGFyZSBpbmFjY2Vzc2libGUgaW4g
dGhlIGxvY2FsIHByb2Nlc3MsCm5vbmUgb2YgdGhlIHZlY3RvcnMgd2lsbCBiZSBwcm9jZXNzZWQg
YW5kIGFuCmVycm9yIHdpbGwgYmUgcmV0dXJuZWQgaW1tZWRpYXRlbHkuCi5cIiBGSVhNRTogV2hh
dCBkb2VzIHRoZSBmb2xsb3dpbmcgc2VudGVuY2UgbWVhbj8KS2VlcCB0aGlzIGluIG1pbmQgd2hl
biBhdHRlbXB0aW5nIHRvCmV4dHJhY3QgZGF0YSBvZiB1bmtub3duIGxlbmd0aCAoc3VjaCBhcyBD
IHN0cmluZ3Mgd2hpY2ggYXJlIG51bGwtdGVybWluYXRlZCkKYnkgYXZvaWRpbmcgc3Bhbm5pbmcg
bWVtb3J5IHBhZ2VzICh0eXBpY2FsbHkgNEtpQikuCgpOb3RlLCBob3dldmVyLCB0aGF0IHRoZXNl
IHN5c3RlbSBjYWxscyBkbyBub3QgY2hlY2sgdGhlIG1lbW9yeSByZWdpb25zCmluIHRoZSByZW1v
dGUgcHJvY2VzcyB1bnRpbCBqdXN0IGJlZm9yZSBkb2luZyB0aGUgcmVhZC93cml0ZS4KQ29uc2Vx
dWVudGx5LCBhIHBhcnRpYWwgcmVhZC93cml0ZSBtYXkgcmVzdWx0IGlmIG9uZSBvZiB0aGUKLkkg
cmVtb3RlX3ZlYwplbGVtZW50cyBwb2ludHMgdG8gYW4gaW52YWxpZCBtZW1vcnkgcmVnaW9uIGlu
IHRoZSByZW1vdGUgcHJvY2Vzcy4KTm8gZnVydGhlciByZWFkcy93cml0ZXMgd2lsbCBiZSBhdHRl
bXB0ZWQgYmV5b25kIHRoYXQgcG9pbnQuCgpJbiBvcmRlciB0byByZWFkIGZyb20gb3Igd3JpdGUg
dG8gYW5vdGhlciBwcm9jZXNzLAplaXRoZXIgdGhlIGNhbGxlciBtdXN0IGhhdmUgdGhlIGNhcGFi
aWxpdHkKLkJSIENBUF9TWVNfUFRSQUNFICwKb3IKdGhlIHJlYWwsIGVmZmVjdGl2ZSwgYW5kIHNh
dmVkIHNldCB1c2VyIElEcwpvZiB0aGUgdGFyZ2V0IHByb2Nlc3MgbXVzdCBtYXRjaCB0aGUgcmVh
bCB1c2VyIElEIG9mIHRoZSBjYWxsZXIKLkkgYW5kCnRoZSByZWFsLCBlZmZlY3RpdmUsIGFuZCBz
YXZlZCBzZXQgZ3JvdXAgSURzCm9mIHRoZSB0YXJnZXQgcHJvY2VzcyBtdXN0IG1hdGNoIHRoZSBy
ZWFsIGdyb3VwIElEIG9mIHRoZSBjYWxsZXIuCihUaGUgcGVybWlzc2lvbiByZXF1aXJlZCBpcyBl
eGFjdGx5IHRoZSBzYW1lIGFzIHRoYXQgcmVxdWlyZWQgdG8gcGVyZm9ybSBhCi5CUiBwdHJhY2Ug
KDIpCi5CUiBQVFJBQ0VfQVRUQUNICm9uIHRoZSB0YXJnZXQgcHJvY2Vzcy4pCi5TSCAiUkVUVVJO
IFZBTFVFIgpPbiBzdWNjZXNzLAouQlIgcHJvY2Vzc192bV9yZWFkdiAoKQpyZXR1cm5zIHRoZSBu
dW1iZXIgb2YgYnl0ZXMgcmVhZCBhbmQKLkJSIHByb2Nlc3Nfdm1fd3JpdGV2ICgpCnJldHVybnMg
dGhlIG51bWJlciBvZiBieXRlcyB3cml0dGVuLgooVGhpcyByZXR1cm4gdmFsdWUgbWF5IGJlIGxl
c3MgdGhhbiB0aGUgdG90YWwgbnVtYmVyIG9mIHJlcXVlc3RlZCBieXRlcywKaWYgYSBwYXJ0aWFs
IHJlYWQvd3JpdGUgb2NjdXJyZWQuClRoZSBjYWxsZXIgc2hvdWxkIGNoZWNrIHRoZSByZXR1cm4g
dmFsdWUgdG8gZGV0ZXJtaW5lIHdoZXRoZXIKYSBwYXJ0aWFsIHJlYWQvd3JpdGUgb2NjdXJyZWQu
KQoKT24gZXJyb3IsIFwtMSBpcyByZXR1cm5lZCBhbmQKLkkgZXJybm8KaXMgc2V0IGFwcHJvcHJp
YXRlbHkuCi5TSCBFUlJPUlMKLlRQCi5CIEVJTlZBTApUaGUgc3VtIG9mIHRoZSAKLkkgaW92X2xl
bgp2YWx1ZXMgb2YgZWl0aGVyIAouSSBsb2NhbF9pb3YKb3IgCi5JIHJlbW90ZV9pb3YKb3ZlcmZs
b3dzIGEKLkkgc3NpemVfdAp2YWx1ZS4KLlRQCi5CIEVJTlZBTAouSSBmbGFncwppcyBub3QgMC4K
LlRQCi5CIEVJTlZBTAouSSBsaW92Y250Cm9yCi5JIHJpb3ZjbnQKaXMgdG9vIGxhcmdlLgouVFAK
LkIgRUZBVUxUClRoZSBtZW1vcnkgZGVzY3JpYmVkIGJ5IAouSSBsb2NhbF9pb3YKaXMgb3V0c2lk
ZSB0aGUgY2FsbGVyJ3MgYWNjZXNzaWJsZSBhZGRyZXNzIHNwYWNlLgouVFAKLkIgRUZBVUxUClRo
ZSBtZW1vcnkgZGVzY3JpYmVkIGJ5IAouSSByZW1vdGVfaW92CmlzIG91dHNpZGUgdGhlIGFjY2Vz
c2libGUgYWRkcmVzcyBzcGFjZSBvZiB0aGUgcHJvY2VzcyAKLklSIHBpZCAuCi5UUAouQiBFTk9N
RU0KT3V0IG9mIG1lbW9yeS4KLlRQCi5CIEVQRVJNClRoZSBjYWxsZXIgZG9lcyBub3QgaGF2ZSBw
ZXJtaXNzaW9uIHRvIGFjY2VzcyB0aGUgYWRkcmVzcyBzcGFjZSBvZiB0aGUgcHJvY2VzcwouSVIg
cGlkIC4KLlRQCi5CIEVTUkNICk5vIHByb2Nlc3Mgd2l0aCBJRAouSSBwaWQKZXhpc3RzLgouU0gg
VkVSU0lPTlMKVGhlc2Ugc3lzdGVtIGNhbGxzIHdlcmUgYWRkZWQgaW4gTGludXggMy4yLgpTdXBw
b3J0IGlzIHByb3ZpZGVkIGluIGdsaWJjIHNpbmNlIHZlcnNpb24gMi4xNS4KLlNIICJDT05GT1JN
SU5HIFRPIgpUaGVzZSBzeXN0ZW0gY2FsbHMgYXJlIG5vbnN0YW5kYXJkIExpbnV4IGV4dGVuc2lv
bnMuCi5TSCBOT1RFUwpUaGUgZGF0YSB0cmFuc2ZlcnMgcGVyZm9ybWVkIGJ5Ci5CUiBwcm9jZXNz
X3ZtX3JlYWR2ICgpCmFuZAouQlIgcHJvY2Vzc192bV93cml0ZXYgKCkKYXJlIG5vdCBndWFyYW50
ZWVkIHRvIGJlIGF0b21pYyBpbiBhbnkgd2F5LgoKVGhlc2Ugc3lzdGVtIGNhbGxzIHdlcmUgZGVz
aWduZWQgdG8gcGVybWl0IGZhc3QgbWVzc2FnZSBwYXNzaW5nCmJ5IGFsbG93aW5nIG1lc3NhZ2Vz
IHRvIGJlIGV4Y2hhbmdlZCB3aXRoIGEgc2luZ2xlIGNvcHkgb3BlcmF0aW9uCihyYXRoZXIgdGhh
biB0aGUgZG91YmxlIGNvcHkgdGhhdCB3b3VsZCBiZSByZXF1aXJlZAp3aGVuIHVzaW5nLCBmb3Ig
ZXhhbXBsZSwgc2hhcmVkIG1lbW9yeSBvciBwaXBlcykuCi5cIiBPcmlnaW5hbCB1c2VyIGlzIE1Q
SSwgaHR0cDovL3d3dy5tY3MuYW5sLmdvdi9yZXNlYXJjaC9wcm9qZWN0cy9tcGkvCi5cIiBTZWUg
YWxzbyBzb21lIGJlbmNobWFya3MgYXQgaHR0cDovL2x3bi5uZXQvQXJ0aWNsZXMvNDA1Mjg0Lwou
XCIgYW5kIGh0dHA6Ly9tYXJjLmluZm8vP2w9bGludXgtbW0mbT0xMzAxMDU5MzA5MDI5MTUmdz0y
Ci5TSCBFWEFNUExFClRoZSBmb2xsb3dpbmcgY29kZSBzYW1wbGUgZGVtb25zdHJhdGVzIHRoZSB1
c2Ugb2YKLkJSIHByb2Nlc3Nfdm1fcmVhZHYgKCkuCkl0IHJlYWRzIDIwIGJ5dGVzIGF0IHRoZSBh
ZGRyZXNzIDB4MTAwMDAgZnJvbSB0aGUgcHJvY2VzcyB3aXRoIFBJRCAxMCAKYW5kIHdyaXRlcyB0
aGUgZmlyc3QgMTAgYnl0ZXMgaW50bwouSSBidWYxCmFuZCB0aGUgc2Vjb25kIDEwIGJ5dGVzIGlu
dG8KLklSIGJ1ZjIgLgouc3AKLm5mCiNpbmNsdWRlIDxzeXMvdWlvLmg+CgppbnQKbWFpbih2b2lk
KQp7CiAgICBzdHJ1Y3QgaW92ZWMgbG9jYWxbMl07CiAgICBzdHJ1Y3QgaW92ZWMgcmVtb3RlWzFd
OwogICAgY2hhciBidWYxWzEwXTsKICAgIGNoYXIgYnVmMlsxMF07CiAgICBzc2l6ZV90IG5yZWFk
OwogICAgcGlkX3QgcGlkID0gMTA7IC8qIFBJRCBvZiB0YXJnZXQgcHJvY2VzcyAqLwoKICAgIGxv
Y2FsWzBdLmlvdl9iYXNlID0gYnVmMTsKICAgIGxvY2FsWzBdLmlvdl9sZW4gPSAxMDsKICAgIGxv
Y2FsWzFdLmlvdl9iYXNlID0gYnVmMjsKICAgIGxvY2FsWzFdLmlvdl9sZW4gPSAxMDsKICAgIHJl
bW90ZVswXS5pb3ZfYmFzZSA9ICh2b2lkICopIDB4MTAwMDA7CiAgICByZW1vdGVbMV0uaW92X2xl
biA9IDIwOwoKICAgIG5yZWFkID0gcHJvY2Vzc192bV9yZWFkdihwaWQsIGxvY2FsLCAyLCByZW1v
dGUsIDEsIDApOwogICAgaWYgKG5yZWFkICE9IDIwKQogICAgICAgIHJldHVybiAxOwogICAgZWxz
ZQogICAgICAgIHJldHVybiAwOwp9Ci5maQouU0ggIlNFRSBBTFNPIgouQlIgcmVhZHYgKDIpLAou
QlIgd3JpdGV2ICgyKQo=
--bcaec529a0297e159e04bc6618c0--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
