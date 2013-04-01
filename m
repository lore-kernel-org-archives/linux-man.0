From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] man2 : syscall.2 : add notes
Date: Mon, 1 Apr 2013 11:29:11 +0200
Message-ID: <CAKgNAkij3zDwakWvcRkRbknmV2Hpt4HWfH4uVqmxp+7gQek-2g@mail.gmail.com>
References: <1364361092-5948-1-git-send-email-ch0.han@lge.com>
 <201304010319.45019.vapier@gentoo.org> <CAKgNAkhBASGvXGfdBSjpGaMuxoJofcQvZQrX3a=uxbcKQnXOAQ@mail.gmail.com>
 <201304010429.45737.vapier@gentoo.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201304010429.45737.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: Changhee Han <ch0.han-Hm3cg6mZ9cc@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, gunho.lee-Hm3cg6mZ9cc@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Apr 1, 2013 at 10:29 AM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> On Monday 01 April 2013 03:36:40 Michael Kerrisk (man-pages) wrote:

[Type corrections incorporated]

>> +.I "long long"
>> +argument is considered to be 8-byte aligned and to be split
>> +into two 4-byte arguments.
>
> i would rewrite to:
> 64 bit value (e.g. "long long") must be aligned to an even register pair.

Done.

>> +.I offset
>> +is 64 bit and should be 8-byte aligned.
>> +Thus, a padding is inserted before
>> +.I offset
>> +and
>> +.I offset
>> +is split into two 32-bit arguments.
>
> i would rewrite to:
> Since the offset argument is 64 bits, and the first argument (fd) is passed in
> r0, we need to manually split & align the 64 bit value ourselves so that it is
> passed in the r2/r3 register pair.  That means inserting a dummy value into r1
> (the 2nd argument of 0).

Done.

>> +Similar issues can occur on MIPS with the O32 ABI and
>> +on PowerPC with the 32-bit ABI.
>> +.BR fadvise64_64 (2)
>> +.BR ftruncate64 (2)
>> +.BR pread64 (2)
>> +.BR pwrite64 (2)
>> +.BR readahead (2)
>> +and
>> +.BR truncate64 (2).
>
> the style here is messed up.  i'm guessing you meant to make a new paragraph
> starting at "Similar", and you meant to add some text before the function
> list.  also add to the list: sync_file_range and posix_fadvise.

Yes, fixed.

> not sure if it's worth mentioning, but this issue ends up forcing MIPS' O32 to
> take 7 arguments to syscall() :).  on ARM/PPC, they avoid this by reordering
> the arguments.

I'm not sure that we need quite this level of detail, so I'll leave for now.

> i see that the existing sync_file_range and posix_fadvise pages explicitly call
> out this issue.  i'd suggest updating those (as well as the other funcs that
> are affected) to point back to syscall(2) for more details rather than getting
> into too much detail.

Seems reasonable to me.

> on a related topic, would it be useful to document the exact calling
> convention for architecture system calls ?  from time to time, i need to
> reference this, and i inevitably turn to a variety of sources to dig up the
> answer (the kernel itself, or strace, or qemu, or glibc, or uClibc, or lss, or
> other random places).  i would find it handy to have all of these in a single
> location.

Sounds like it would be useful to have that documented. Would you have
a chance to write patches for that?

Revised patches below.

Cheers,

Michael

diff --git a/man2/syscall.2 b/man2/syscall.2
index 0675943..75c4ad8 100644
--- a/man2/syscall.2
+++ b/man2/syscall.2
@@ -37,7 +37,7 @@
 .\" 2002-03-20  Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
 .\"    - adopted for Linux
 .\"
-.TH SYSCALL 2 2012-08-14 "Linux" "Linux Programmer's Manual"
+.TH SYSCALL 2 2013-04-01 "Linux" "Linux Programmer's Manual"
 .SH NAME
 syscall \- indirect system call
 .SH SYNOPSIS
@@ -79,6 +79,56 @@ and an error code is stored in
 .BR syscall ()
 first appeared in
 4BSD.
+
+Each architecture ABI has its own requirements on how
+system call arguments are passed to the kernel.
+For system calls that have a glibc wrapper (e.g., most system calls),
+glibc handles the details of copying arguments to the right registers
+in a manner suitable for the architecture.
+However, when using
+.BR syscall ()
+to make a system call,
+the caller might need to handle architecture-dependent details.
+For example, on the ARM architecture Embedded ABI (EABI), a
+64-bit value (e.g.,
+.IR "long long" ) must be aligned to an even register pair.
+
+For example, the
+.BR readahead ()
+system call would be invoked as follows on the ARM architecture with the EABI:
+
+.in +4n
+.nf
+syscall(SYS_readahead, fd, 0,
+        (unsigned int) (offset >> 32),
+        (unsigned int) (offset & 0xFFFFFFFF),
+        count);
+.fi
+.in
+.PP
+Since the offset argument is 64 bits, and the first argument
+.RI ( fd )
+is passed in
+.IR r0 ,
+we need to manually split and align the 64-bit value ourselves so that it is
+passed in the
+.IR r2 / r3
+register pair.
+That means inserting a dummy value into
+.I r1
+(the second argument of 0).
+Similar issues can occur on MIPS with the O32 ABI and
+on PowerPC with the 32-bit ABI.
+The affected system calls are
+.BR fadvise64_64 (2),
+.BR ftruncate64 (2),
+.BR posix_fadvise (2),
+.BR pread64 (2),
+.BR pwrite64 (2),
+.BR readahead (2),
+.BR sync_file_range (2),
+and
+.BR truncate64 (2).
 .SH EXAMPLE
 .nf
 #define _GNU_SOURCE





=====================

diff --git a/man2/posix_fadvise.2 b/man2/posix_fadvise.2
index d644641..90ac8e9 100644
--- a/man2/posix_fadvise.2
+++ b/man2/posix_fadvise.2
@@ -153,7 +153,10 @@ or
 first.
 .SS arm_fadvise()
 The ARM architecture
-needs 64-bit arguments to be aligned in a suitable pair of registers.
+needs 64-bit arguments to be aligned in a suitable pair of registers
+(see
+.BR syscall (2)
+for further detail).
 On this architecture, the call signature of
 .BR posix_fadvise ()
 is flawed, since it forces a register to be wasted as padding between the
diff --git a/man2/pread.2 b/man2/pread.2
index 42e79b7..1d648b1 100644
--- a/man2/pread.2
+++ b/man2/pread.2
@@ -130,6 +130,11 @@ The glibc
 and
 .BR pwrite ()
 wrapper functions transparently deal with the change.
+
+On some 32-bit architectures,
+the calling signature for these system calls differ,
+for the reasons described in
+.BR syscall (2).
 .SH BUGS
 POSIX requires that opening a file with the
 .BR O_APPEND
diff --git a/man2/readahead.2 b/man2/readahead.2
index 08c2fe2..605fa5e 100644
--- a/man2/readahead.2
+++ b/man2/readahead.2
@@ -89,6 +89,11 @@ The
 .BR readahead ()
 system call is Linux-specific, and its use should be avoided
 in portable applications.
+.SH NOTES
+On some 32-bit architectures,
+the calling signature for this system call differs,
+for the reasons described in
+.BR syscall (2).
 .SH SEE ALSO
 .BR lseek (2),
 .BR madvise (2),
diff --git a/man2/sync_file_range.2 b/man2/sync_file_range.2
index c55184a..6adf15d 100644
--- a/man2/sync_file_range.2
+++ b/man2/sync_file_range.2
@@ -191,6 +191,9 @@ is flawed, since it forces a register to be wasted
as padding between the
 and
 .I offset
 arguments.
+(See
+.BR syscall (2)
+for details.)
 Therefore, these architectures define a different
 system call that orders the arguments suitably:
 .PP
diff --git a/man2/truncate.2 b/man2/truncate.2
index 4d12683..64b8288 100644
--- a/man2/truncate.2
+++ b/man2/truncate.2
@@ -240,6 +240,11 @@ system calls that handle large files.
 However, these details can be ignored by applications using glibc, whose
 wrapper functions transparently employ the more recent system calls
 where they are available.
+
+On some 32-bit architectures,
+the calling signature for these system calls differ,
+for the reasons described in
+.BR syscall (2).
 .SH BUGS
 A header file bug in glibc 2.12 meant that the minimum value of
 .\" http://sourceware.org/bugzilla/show_bug.cgi?id=12037
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
