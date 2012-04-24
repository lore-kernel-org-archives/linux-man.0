From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] process_vm_{read,write}v(3): initial man pages
Date: Tue, 24 Apr 2012 21:11:54 +1200
Message-ID: <CAKgNAkg2ag9cR217km4vLM0kZYANfayNt=4mvfiObnL4LY3ztQ@mail.gmail.com>
References: <1331358148-17235-1-git-send-email-vapier@gentoo.org>
 <201204140036.28834.vapier@gentoo.org> <CAKgNAkjh46Bpar7qkJBn_r4D1qtFkbK_QLVfE3ESgEuaYMGp5g@mail.gmail.com>
 <201204240024.56967.vapier@gentoo.org> <CAKgNAki+hiCAdGe9ExFsY2MwsLE=yvHib+nb5WQbXqtBXCqHMw@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=14dae9340a37a8292f04be692676
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAki+hiCAdGe9ExFsY2MwsLE=yvHib+nb5WQbXqtBXCqHMw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Christopher Yeoh <cyeoh-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--14dae9340a37a8292f04be692676
Content-Type: text/plain; charset=ISO-8859-1

Christopher,

Mike's provided me with a lot of input on the page, and there's been a
number of changes to it. Before I publish, would you be able to do a
final check of the text. I've appended and attached the page.

Cheers,

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
.TH PROCESS_VM_READV 2 2012-04-14 "Linux" "Linux Programmer's Manual"
.SH NAME
process_vm_readv, process_vm_writev \- transfer data between process
address spaces
.SH SYNOPSIS
.nf
.B #include <sys/uio.h>

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
system call transfers data from the remote process to the local process.
The data to be transferred is identified by
.IR remote_iov
and
.IR riovcnt :
.IR remote_iov
is a pointer to an array describing address ranges in the process
.IR pid ,
and
.IR riovcnt
specifies the number of elements in
.IR remote_iov .
The data is transferred to the locations specified by
.IR local_iov
and
.IR liovcnt :
.IR local_iov
is a pointer to an array describing address ranges in the calling process,
and
.IR liovcnt
specifies the number of elements in
.IR local_iov .

The
.BR process_vm_writev ()
system call is the converse of
.BR process_vm_readv ()\(emit
transfers data from the local process to the remote process.
Other than the direction of the transfer, the arguments
.IR liovcnt ,
.IR local_iov ,
.IR liovcnt ,
and
.IR remote_iov
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
.I remote_iov[0]
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
.IR local_iov
are checked before doing any transfers.
If the counts are too big, or
.I local_iov
is invalid,
or the addresses refer to regions that are inaccessible to the local process,
none of the vectors will be processed
and an error will be returned immediately.

Note, however, that these system calls do not check the memory regions
in the remote process until just before doing the read/write.
Consequently, a partial read/write (see RETURN VALUE)
may result if one of the
.I remote_iov
elements points to an invalid memory region in the remote process.
No further reads/writes will be attempted beyond that point.
Keep this in mind when attempting to read data of unknown length
(such as C strings that are null-terminated) from a remote process,
by avoiding spanning memory pages (typically 4KiB) in a single remote
.I iovec
element.
(Instead, split the remote read into two
.I remove_iov
elements and have them merge back into a single write array entry.
The first read entry goes up to the page boundary,
while the second starts on the next page boundary.)

In order to read from or write to another process,
either the caller must have the capability
.BR CAP_SYS_PTRACE ,
or
the real user ID, effective user ID, and saved set-user-ID
of the remote process must match the real user ID of the caller
.I and
the real group ID, effective group ID, and saved set-group-ID
of the remote process must match the real group ID of the caller.
(The permission required is exactly the same as that required to perform a
.BR ptrace (2)
.BR PTRACE_ATTACH
on the remote process.)
.SH "RETURN VALUE"
On success,
.BR process_vm_readv ()
returns the number of bytes read and
.BR process_vm_writev ()
returns the number of bytes written.
This return value may be less than the total number of requested bytes,
if a partial read/write occurred.
(Partial transfers apply at the granularity of
.I iovec
elements.
These system calls won't perform a partial transfer that splits a single
.I iovec
element.)
The caller should check the return value to determine whether
a partial read/write occurred.

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
Could not allocate memory for internal copies of the
.I iovec
structures.
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
    pid_t pid = 10;             /* PID of remote process */

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

--14dae9340a37a8292f04be692676
Content-Type: application/octet-stream; name="process_vm_readv.2"
Content-Disposition: attachment; filename="process_vm_readv.2"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_h1eqhbsf0

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
X1JFQURWIDIgMjAxMi0wNC0xNCAiTGludXgiICJMaW51eCBQcm9ncmFtbWVyJ3MgTWFudWFsIgou
U0ggTkFNRQpwcm9jZXNzX3ZtX3JlYWR2LCBwcm9jZXNzX3ZtX3dyaXRldiBcLSB0cmFuc2ZlciBk
YXRhIGJldHdlZW4gcHJvY2VzcyBhZGRyZXNzIHNwYWNlcwouU0ggU1lOT1BTSVMKLm5mCi5CICNp
bmNsdWRlIDxzeXMvdWlvLmg+CgouQkkgInNzaXplX3QgcHJvY2Vzc192bV9yZWFkdihwaWRfdCAi
IHBpZCAsCi5CSSAiICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBpb3ZlYyAq
IiBsb2NhbF9pb3YgLAouQkkgIiAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25n
ICIgbGlvdmNudCAsCi5CSSAiICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBp
b3ZlYyAqIiByZW1vdGVfaW92ICwKLkJJICIgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWdu
ZWQgbG9uZyAiIHJpb3ZjbnQgLAouQkkgIiAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25l
ZCBsb25nICIgZmxhZ3MgIik7IgoKLkJJICJzc2l6ZV90IHByb2Nlc3Nfdm1fd3JpdGV2KHBpZF90
ICIgcGlkICwKLkJJICIgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBpb3Zl
YyAqIiBsb2NhbF9pb3YgLAouQkkgIiAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQg
bG9uZyAiIGxpb3ZjbnQgLAouQkkgIiAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3Ry
dWN0IGlvdmVjICoiIHJlbW90ZV9pb3YgLAouQkkgIiAgICAgICAgICAgICAgICAgICAgICAgICAg
dW5zaWduZWQgbG9uZyAiIHJpb3ZjbnQgLAouQkkgIiAgICAgICAgICAgICAgICAgICAgICAgICAg
dW5zaWduZWQgbG9uZyAiIGZsYWdzICIpOyIKLmZpCi5TSCBERVNDUklQVElPTgpUaGVzZSBzeXN0
ZW0gY2FsbHMgdHJhbnNmZXIgZGF0YSBiZXR3ZWVuIHRoZSBhZGRyZXNzIHNwYWNlCm9mIHRoZSBj
YWxsaW5nIHByb2Nlc3MgKCJ0aGUgbG9jYWwgcHJvY2VzcyIpIGFuZCB0aGUgcHJvY2VzcyBpZGVu
dGlmaWVkIGJ5Ci5JUiBwaWQKKCJ0aGUgcmVtb3RlIHByb2Nlc3MiKS4KVGhlIGRhdGEgbW92ZXMg
ZGlyZWN0bHkgYmV0d2VlbiB0aGUgYWRkcmVzcyBzcGFjZXMgb2YgdGhlIHR3byBwcm9jZXNzZXMs
CndpdGhvdXQgcGFzc2luZyB0aHJvdWdoIGtlcm5lbCBzcGFjZS4KClRoZQouQlIgcHJvY2Vzc192
bV9yZWFkdiAoKQpzeXN0ZW0gY2FsbCB0cmFuc2ZlcnMgZGF0YSBmcm9tIHRoZSByZW1vdGUgcHJv
Y2VzcyB0byB0aGUgbG9jYWwgcHJvY2Vzcy4KVGhlIGRhdGEgdG8gYmUgdHJhbnNmZXJyZWQgaXMg
aWRlbnRpZmllZCBieQouSVIgcmVtb3RlX2lvdgphbmQKLklSIHJpb3ZjbnQgOgouSVIgcmVtb3Rl
X2lvdgppcyBhIHBvaW50ZXIgdG8gYW4gYXJyYXkgZGVzY3JpYmluZyBhZGRyZXNzIHJhbmdlcyBp
biB0aGUgcHJvY2VzcwouSVIgcGlkICwKYW5kCi5JUiByaW92Y250CnNwZWNpZmllcyB0aGUgbnVt
YmVyIG9mIGVsZW1lbnRzIGluCi5JUiByZW1vdGVfaW92IC4KVGhlIGRhdGEgaXMgdHJhbnNmZXJy
ZWQgdG8gdGhlIGxvY2F0aW9ucyBzcGVjaWZpZWQgYnkKLklSIGxvY2FsX2lvdgphbmQKLklSIGxp
b3ZjbnQgOgouSVIgbG9jYWxfaW92CmlzIGEgcG9pbnRlciB0byBhbiBhcnJheSBkZXNjcmliaW5n
IGFkZHJlc3MgcmFuZ2VzIGluIHRoZSBjYWxsaW5nIHByb2Nlc3MsCmFuZAouSVIgbGlvdmNudApz
cGVjaWZpZXMgdGhlIG51bWJlciBvZiBlbGVtZW50cyBpbgouSVIgbG9jYWxfaW92IC4KClRoZQou
QlIgcHJvY2Vzc192bV93cml0ZXYgKCkKc3lzdGVtIGNhbGwgaXMgdGhlIGNvbnZlcnNlIG9mCi5C
UiBwcm9jZXNzX3ZtX3JlYWR2ICgpXChlbWl0CnRyYW5zZmVycyBkYXRhIGZyb20gdGhlIGxvY2Fs
IHByb2Nlc3MgdG8gdGhlIHJlbW90ZSBwcm9jZXNzLgpPdGhlciB0aGFuIHRoZSBkaXJlY3Rpb24g
b2YgdGhlIHRyYW5zZmVyLCB0aGUgYXJndW1lbnRzCi5JUiBsaW92Y250ICwKLklSIGxvY2FsX2lv
diAsCi5JUiBsaW92Y250ICwKYW5kCi5JUiByZW1vdGVfaW92CmhhdmUgdGhlIHNhbWUgbWVhbmlu
ZyBhcyBmb3IKLkJSIHByb2Nlc3Nfdm1fcmVhZHYgKCkuCgpUaGUKLkkgbG9jYWxfaW92CmFuZCAK
LkkgcmVtb3RlX2lvdgphcmd1bWVudHMgcG9pbnQgdG8gYW4gYXJyYXkgb2YKLkkgaW92ZWMKc3Ry
dWN0dXJlcywgZGVmaW5lZCBpbgouSVIgPHN5cy91aW8uaD4KYXM6CgouaW4gKzRuCi5uZgpzdHJ1
Y3QgaW92ZWMgewogICAgdm9pZCAgKmlvdl9iYXNlOyAgICAvKiBTdGFydGluZyBhZGRyZXNzICov
CiAgICBzaXplX3QgaW92X2xlbjsgICAgIC8qIE51bWJlciBvZiBieXRlcyB0byB0cmFuc2ZlciAq
Lwp9OwouZmkKLmluCgpCdWZmZXJzIGFyZSBwcm9jZXNzZWQgaW4gYXJyYXkgb3JkZXIuClRoaXMg
bWVhbnMgdGhhdAouQlIgcHJvY2Vzc192bV9yZWFkdiAoKQpjb21wbGV0ZWx5IGZpbGxzIAouSSBs
b2NhbF9pb3ZbMF0KYmVmb3JlIHByb2NlZWRpbmcgdG8gCi5JUiBsb2NhbF9pb3ZbMV0gLAphbmQg
c28gb24uCkxpa2V3aXNlLAouSSByZW1vdGVfaW92WzBdCmlzIGNvbXBsZXRlbHkgcmVhZCBiZWZv
cmUgcHJvY2VlZGluZyB0byAKLklSIHJlbW90ZV9pb3ZbMV0gLAphbmQgc28gb24uCgpTaW1pbGFy
bHksCi5CUiBwcm9jZXNzX3ZtX3dyaXRldiAoKQp3cml0ZXMgb3V0IHRoZSBlbnRpcmUgY29udGVu
dHMgb2YgCi5JIGxvY2FsX2lvdlswXQpiZWZvcmUgcHJvY2VlZGluZyB0bwouSVIgbG9jYWxfaW92
WzFdICwKYW5kIGl0IGNvbXBsZXRlbHkgZmlsbHMgCi5JIHJlbW90ZV9pb3ZbMF0KYmVmb3JlIHBy
b2NlZWRpbmcgdG8gCi5JUiByZW1vdGVfaW92WzFdIC4KClRoZSBsZW5ndGhzIG9mIAouSSByZW1v
dGVfaW92W2ldLmlvdl9sZW4KYW5kIAouSSBsb2NhbF9pb3ZbaV0uaW92X2xlbgpkbyBub3QgaGF2
ZSB0byBiZSB0aGUgc2FtZS4KVGh1cywgaXQgaXMgcG9zc2libGUgdG8gc3BsaXQgYSBzaW5nbGUg
bG9jYWwgYnVmZmVyCmludG8gbXVsdGlwbGUgcmVtb3RlIGJ1ZmZlcnMsIG9yIHZpY2UgdmVyc2Eu
CgpUaGUgCi5JIGZsYWdzCmFyZ3VtZW50IGlzIGN1cnJlbnRseSB1bnVzZWQgYW5kIG11c3QgYmUg
c2V0IHRvIDAuCgpUaGUgdmFsdWVzIHNwZWNpZmllZCBpbiB0aGUKLkkgbGlvdmNudAphbmQKLkkg
cmlvdmNudAphcmd1bWVudHMgbXVzdCBiZSBsZXNzIHRoYW4gb3IgZXF1YWwgdG8KLkJSIElPVl9N
QVgKKGRlZmluZWQgaW4KLkkgPGxpbWl0cy5oPgpvciBhY2Nlc3NpYmxlIHZpYSB0aGUgY2FsbAou
SVIgc3lzY29uZihfU0NfSU9WX01BWCkgKS4KLlwiIEluIHRpbWUsIGdsaWJjIG1pZ2h0IHByb3Zp
ZGUgYSB3cmFwcGVyIHRoYXQgd29ya3MgYXJvdW5kIHRoaXMgbGltaXQsCi5cIiBhcyBpcyBkb25l
IGZvciByZWFkdigpL3dyaXRldigpCgpUaGUgY291bnQgYXJndW1lbnRzIGFuZAouSVIgbG9jYWxf
aW92CmFyZSBjaGVja2VkIGJlZm9yZSBkb2luZyBhbnkgdHJhbnNmZXJzLgpJZiB0aGUgY291bnRz
IGFyZSB0b28gYmlnLCBvcgouSSBsb2NhbF9pb3YKaXMgaW52YWxpZCwKb3IgdGhlIGFkZHJlc3Nl
cyByZWZlciB0byByZWdpb25zIHRoYXQgYXJlIGluYWNjZXNzaWJsZSB0byB0aGUgbG9jYWwgcHJv
Y2VzcywKbm9uZSBvZiB0aGUgdmVjdG9ycyB3aWxsIGJlIHByb2Nlc3NlZAphbmQgYW4gZXJyb3Ig
d2lsbCBiZSByZXR1cm5lZCBpbW1lZGlhdGVseS4KCk5vdGUsIGhvd2V2ZXIsIHRoYXQgdGhlc2Ug
c3lzdGVtIGNhbGxzIGRvIG5vdCBjaGVjayB0aGUgbWVtb3J5IHJlZ2lvbnMKaW4gdGhlIHJlbW90
ZSBwcm9jZXNzIHVudGlsIGp1c3QgYmVmb3JlIGRvaW5nIHRoZSByZWFkL3dyaXRlLgpDb25zZXF1
ZW50bHksIGEgcGFydGlhbCByZWFkL3dyaXRlIChzZWUgUkVUVVJOIFZBTFVFKQptYXkgcmVzdWx0
IGlmIG9uZSBvZiB0aGUKLkkgcmVtb3RlX2lvdgplbGVtZW50cyBwb2ludHMgdG8gYW4gaW52YWxp
ZCBtZW1vcnkgcmVnaW9uIGluIHRoZSByZW1vdGUgcHJvY2Vzcy4KTm8gZnVydGhlciByZWFkcy93
cml0ZXMgd2lsbCBiZSBhdHRlbXB0ZWQgYmV5b25kIHRoYXQgcG9pbnQuCktlZXAgdGhpcyBpbiBt
aW5kIHdoZW4gYXR0ZW1wdGluZyB0byByZWFkIGRhdGEgb2YgdW5rbm93biBsZW5ndGgKKHN1Y2gg
YXMgQyBzdHJpbmdzIHRoYXQgYXJlIG51bGwtdGVybWluYXRlZCkgZnJvbSBhIHJlbW90ZSBwcm9j
ZXNzLApieSBhdm9pZGluZyBzcGFubmluZyBtZW1vcnkgcGFnZXMgKHR5cGljYWxseSA0S2lCKSBp
biBhIHNpbmdsZQouSSBpb3ZlYwplbGVtZW50LgooSW5zdGVhZCwgc3BsaXQgdGhlIHJlbW90ZSBy
ZWFkIGludG8gdHdvIAouSSByZW1vdmVfaW92CmVsZW1lbnRzIGFuZCBoYXZlIHRoZW0gbWVyZ2Ug
YmFjayBpbnRvIGEgc2luZ2xlIHdyaXRlIGFycmF5IGVudHJ5LgpUaGUgZmlyc3QgcmVhZCBlbnRy
eSBnb2VzIHVwIHRvIHRoZSBwYWdlIGJvdW5kYXJ5LAp3aGlsZSB0aGUgc2Vjb25kIHN0YXJ0cyBv
biB0aGUgbmV4dCBwYWdlIGJvdW5kYXJ5LikKCkluIG9yZGVyIHRvIHJlYWQgZnJvbSBvciB3cml0
ZSB0byBhbm90aGVyIHByb2Nlc3MsCmVpdGhlciB0aGUgY2FsbGVyIG11c3QgaGF2ZSB0aGUgY2Fw
YWJpbGl0eQouQlIgQ0FQX1NZU19QVFJBQ0UgLApvcgp0aGUgcmVhbCB1c2VyIElELCBlZmZlY3Rp
dmUgdXNlciBJRCwgYW5kIHNhdmVkIHNldC11c2VyLUlECm9mIHRoZSByZW1vdGUgcHJvY2VzcyBt
dXN0IG1hdGNoIHRoZSByZWFsIHVzZXIgSUQgb2YgdGhlIGNhbGxlcgouSSBhbmQKdGhlIHJlYWwg
Z3JvdXAgSUQsIGVmZmVjdGl2ZSBncm91cCBJRCwgYW5kIHNhdmVkIHNldC1ncm91cC1JRApvZiB0
aGUgcmVtb3RlIHByb2Nlc3MgbXVzdCBtYXRjaCB0aGUgcmVhbCBncm91cCBJRCBvZiB0aGUgY2Fs
bGVyLgooVGhlIHBlcm1pc3Npb24gcmVxdWlyZWQgaXMgZXhhY3RseSB0aGUgc2FtZSBhcyB0aGF0
IHJlcXVpcmVkIHRvIHBlcmZvcm0gYQouQlIgcHRyYWNlICgyKQouQlIgUFRSQUNFX0FUVEFDSApv
biB0aGUgcmVtb3RlIHByb2Nlc3MuKQouU0ggIlJFVFVSTiBWQUxVRSIKT24gc3VjY2VzcywKLkJS
IHByb2Nlc3Nfdm1fcmVhZHYgKCkKcmV0dXJucyB0aGUgbnVtYmVyIG9mIGJ5dGVzIHJlYWQgYW5k
Ci5CUiBwcm9jZXNzX3ZtX3dyaXRldiAoKQpyZXR1cm5zIHRoZSBudW1iZXIgb2YgYnl0ZXMgd3Jp
dHRlbi4KVGhpcyByZXR1cm4gdmFsdWUgbWF5IGJlIGxlc3MgdGhhbiB0aGUgdG90YWwgbnVtYmVy
IG9mIHJlcXVlc3RlZCBieXRlcywKaWYgYSBwYXJ0aWFsIHJlYWQvd3JpdGUgb2NjdXJyZWQuCihQ
YXJ0aWFsIHRyYW5zZmVycyBhcHBseSBhdCB0aGUgZ3JhbnVsYXJpdHkgb2YgCi5JIGlvdmVjCmVs
ZW1lbnRzLgpUaGVzZSBzeXN0ZW0gY2FsbHMgd29uJ3QgcGVyZm9ybSBhIHBhcnRpYWwgdHJhbnNm
ZXIgdGhhdCBzcGxpdHMgYSBzaW5nbGUKLkkgaW92ZWMKZWxlbWVudC4pClRoZSBjYWxsZXIgc2hv
dWxkIGNoZWNrIHRoZSByZXR1cm4gdmFsdWUgdG8gZGV0ZXJtaW5lIHdoZXRoZXIKYSBwYXJ0aWFs
IHJlYWQvd3JpdGUgb2NjdXJyZWQuCgpPbiBlcnJvciwgXC0xIGlzIHJldHVybmVkIGFuZAouSSBl
cnJubwppcyBzZXQgYXBwcm9wcmlhdGVseS4KLlNIIEVSUk9SUwouVFAKLkIgRUlOVkFMClRoZSBz
dW0gb2YgdGhlIAouSSBpb3ZfbGVuCnZhbHVlcyBvZiBlaXRoZXIgCi5JIGxvY2FsX2lvdgpvciAK
LkkgcmVtb3RlX2lvdgpvdmVyZmxvd3MgYQouSSBzc2l6ZV90CnZhbHVlLgouVFAKLkIgRUlOVkFM
Ci5JIGZsYWdzCmlzIG5vdCAwLgouVFAKLkIgRUlOVkFMCi5JIGxpb3ZjbnQKb3IKLkkgcmlvdmNu
dAppcyB0b28gbGFyZ2UuCi5UUAouQiBFRkFVTFQKVGhlIG1lbW9yeSBkZXNjcmliZWQgYnkgCi5J
IGxvY2FsX2lvdgppcyBvdXRzaWRlIHRoZSBjYWxsZXIncyBhY2Nlc3NpYmxlIGFkZHJlc3Mgc3Bh
Y2UuCi5UUAouQiBFRkFVTFQKVGhlIG1lbW9yeSBkZXNjcmliZWQgYnkgCi5JIHJlbW90ZV9pb3YK
aXMgb3V0c2lkZSB0aGUgYWNjZXNzaWJsZSBhZGRyZXNzIHNwYWNlIG9mIHRoZSBwcm9jZXNzIAou
SVIgcGlkIC4KLlRQCi5CIEVOT01FTQpDb3VsZCBub3QgYWxsb2NhdGUgbWVtb3J5IGZvciBpbnRl
cm5hbCBjb3BpZXMgb2YgdGhlCi5JIGlvdmVjCnN0cnVjdHVyZXMuCi5UUAouQiBFUEVSTQpUaGUg
Y2FsbGVyIGRvZXMgbm90IGhhdmUgcGVybWlzc2lvbiB0byBhY2Nlc3MgdGhlIGFkZHJlc3Mgc3Bh
Y2Ugb2YgdGhlIHByb2Nlc3MKLklSIHBpZCAuCi5UUAouQiBFU1JDSApObyBwcm9jZXNzIHdpdGgg
SUQKLkkgcGlkCmV4aXN0cy4KLlNIIFZFUlNJT05TClRoZXNlIHN5c3RlbSBjYWxscyB3ZXJlIGFk
ZGVkIGluIExpbnV4IDMuMi4KU3VwcG9ydCBpcyBwcm92aWRlZCBpbiBnbGliYyBzaW5jZSB2ZXJz
aW9uIDIuMTUuCi5TSCAiQ09ORk9STUlORyBUTyIKVGhlc2Ugc3lzdGVtIGNhbGxzIGFyZSBub25z
dGFuZGFyZCBMaW51eCBleHRlbnNpb25zLgouU0ggTk9URVMKVGhlIGRhdGEgdHJhbnNmZXJzIHBl
cmZvcm1lZCBieQouQlIgcHJvY2Vzc192bV9yZWFkdiAoKQphbmQKLkJSIHByb2Nlc3Nfdm1fd3Jp
dGV2ICgpCmFyZSBub3QgZ3VhcmFudGVlZCB0byBiZSBhdG9taWMgaW4gYW55IHdheS4KClRoZXNl
IHN5c3RlbSBjYWxscyB3ZXJlIGRlc2lnbmVkIHRvIHBlcm1pdCBmYXN0IG1lc3NhZ2UgcGFzc2lu
ZwpieSBhbGxvd2luZyBtZXNzYWdlcyB0byBiZSBleGNoYW5nZWQgd2l0aCBhIHNpbmdsZSBjb3B5
IG9wZXJhdGlvbgoocmF0aGVyIHRoYW4gdGhlIGRvdWJsZSBjb3B5IHRoYXQgd291bGQgYmUgcmVx
dWlyZWQKd2hlbiB1c2luZywgZm9yIGV4YW1wbGUsIHNoYXJlZCBtZW1vcnkgb3IgcGlwZXMpLgou
XCIgT3JpZ2luYWwgdXNlciBpcyBNUEksIGh0dHA6Ly93d3cubWNzLmFubC5nb3YvcmVzZWFyY2gv
cHJvamVjdHMvbXBpLwouXCIgU2VlIGFsc28gc29tZSBiZW5jaG1hcmtzIGF0IGh0dHA6Ly9sd24u
bmV0L0FydGljbGVzLzQwNTI4NC8KLlwiIGFuZCBodHRwOi8vbWFyYy5pbmZvLz9sPWxpbnV4LW1t
Jm09MTMwMTA1OTMwOTAyOTE1Jnc9MgouU0ggRVhBTVBMRQpUaGUgZm9sbG93aW5nIGNvZGUgc2Ft
cGxlIGRlbW9uc3RyYXRlcyB0aGUgdXNlIG9mCi5CUiBwcm9jZXNzX3ZtX3JlYWR2ICgpLgpJdCBy
ZWFkcyAyMCBieXRlcyBhdCB0aGUgYWRkcmVzcyAweDEwMDAwIGZyb20gdGhlIHByb2Nlc3Mgd2l0
aCBQSUQgMTAgCmFuZCB3cml0ZXMgdGhlIGZpcnN0IDEwIGJ5dGVzIGludG8KLkkgYnVmMQphbmQg
dGhlIHNlY29uZCAxMCBieXRlcyBpbnRvCi5JUiBidWYyIC4KLnNwCi5uZgojaW5jbHVkZSA8c3lz
L3Vpby5oPgoKaW50Cm1haW4odm9pZCkKewogICAgc3RydWN0IGlvdmVjIGxvY2FsWzJdOwogICAg
c3RydWN0IGlvdmVjIHJlbW90ZVsxXTsKICAgIGNoYXIgYnVmMVsxMF07CiAgICBjaGFyIGJ1ZjJb
MTBdOwogICAgc3NpemVfdCBucmVhZDsKICAgIHBpZF90IHBpZCA9IDEwOyAgICAgICAgICAgICAv
KiBQSUQgb2YgcmVtb3RlIHByb2Nlc3MgKi8KCiAgICBsb2NhbFswXS5pb3ZfYmFzZSA9IGJ1ZjE7
CiAgICBsb2NhbFswXS5pb3ZfbGVuID0gMTA7CiAgICBsb2NhbFsxXS5pb3ZfYmFzZSA9IGJ1ZjI7
CiAgICBsb2NhbFsxXS5pb3ZfbGVuID0gMTA7CiAgICByZW1vdGVbMF0uaW92X2Jhc2UgPSAodm9p
ZCAqKSAweDEwMDAwOwogICAgcmVtb3RlWzFdLmlvdl9sZW4gPSAyMDsKCiAgICBucmVhZCA9IHBy
b2Nlc3Nfdm1fcmVhZHYocGlkLCBsb2NhbCwgMiwgcmVtb3RlLCAxLCAwKTsKICAgIGlmIChucmVh
ZCAhPSAyMCkKICAgICAgICByZXR1cm4gMTsKICAgIGVsc2UKICAgICAgICByZXR1cm4gMDsKfQou
ZmkKLlNIICJTRUUgQUxTTyIKLkJSIHJlYWR2ICgyKSwKLkJSIHdyaXRldiAoMikK
--14dae9340a37a8292f04be692676--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
