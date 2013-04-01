From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] man2 : syscall.2 : add notes
Date: Mon, 1 Apr 2013 09:36:40 +0200
Message-ID: <CAKgNAkhBASGvXGfdBSjpGaMuxoJofcQvZQrX3a=uxbcKQnXOAQ@mail.gmail.com>
References: <1364361092-5948-1-git-send-email-ch0.han@lge.com>
 <201304010213.06056.vapier@gentoo.org> <CAKgNAki_8bOsuKTJLx3iMLeSvVXHo0bZf8zSUQ08RR7+D33xgQ@mail.gmail.com>
 <201304010319.45019.vapier@gentoo.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201304010319.45019.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: Changhee Han <ch0.han-Hm3cg6mZ9cc@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, gunho.lee-Hm3cg6mZ9cc@public.gmane.org
List-Id: linux-man@vger.kernel.org

Mike,

On Mon, Apr 1, 2013 at 9:19 AM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> On Monday 01 April 2013 02:22:45 Michael Kerrisk (man-pages) wrote:
>> On Mon, Apr 1, 2013 at 8:13 AM, Mike Frysinger wrote:
>> > On Monday 01 April 2013 01:33:49 Changhee Han wrote:
>> >> +However, when using
>> >> +.BR syscall ()
>> >> +to make a system call,
>> >> +the caller may need to handle architecture-dependent details.
>> >> +For example, on ARM architecture, a
>> >> +.I "long long"
>> >> +argument is considered to be 8-byte aligned and to be split into two
>> >> 4-byte arguments. +
>> >> +.BR readahead ()
>> >> +system call could be called like below in ARM architecture.
>> >
>> > this has nothing to do with alignment.  syscalls pass args via registers,
>> > and in the 32bit ARM port, registers are 32bits wide.  so in order to
>> > pass a 64bit value, you have to manually split it up.
>>
>> So, I'm not familiar with all the details here. What is the purpose of
>> the '0' argument that precedes 'offset' then?
>
> ok, so the answer is more nuanced, and the reasoning above is incorrect (or at
> the very least, poorly phrased).
>
> for ARM OABI, there is no such padding, and the proposed example is wrong and
> will not work.
>
> for ARM EABI, the ABI requires that 64bit values be passed in register pairs.
> since the kernel people wanted to avoid an assembly trampoline to unpack the
> 64bit value with EABI, you have to call it as proposed:
>         syscall(readahead, fd, _pad, high32, low32)
>
> for MIPS, only the O32 ABI has this behavior.
>
> for PPC, only the 32bit ABI has this behavior.
>
> otherwise, i don't believe anyone else does this -- they just pass things
> along in registers w/out padding.
>
> since the current list of syscalls which are impacted is small, it might be
> useful to explicitly enumerate them.  they are:
>         fadvise64_64
>         ftruncate64
>         pread64
>         pwrite64
>         readahead
>         truncate64
> -mike

So, in summary, is the following patch okay? (If not, could you
suggest specific rewordings.)

Thanks,

Michael


diff --git a/man2/syscall.2 b/man2/syscall.2
index 0675943..cad1f20 100644
--- a/man2/syscall.2
+++ b/man2/syscall.2
@@ -79,6 +79,48 @@ and an error code is stored in
 .BR syscall ()
 first appeared in
 4BSD.
+
+Each architecture ABI has its own requirements on how
+system call arguments are passed to the kernel.
+For system calls that have a glibc wrapper (e.g., most system calls),
+glibc handles the details of copyiing arguments to the right registers
+in a manner suitable for the architecture.
+However, when using
+.BR syscall ()
+to make a system call,
+the caller may need to handle architecture-dependent details.
+For example, on the ARM architecture Embbeded ABI (EABI), a
+.I "long long"
+argument is considered to be 8-byte aligned and to be split
+into two 4-byte arguments.
+
+For example, the
+.BR readahead ()
+system call would be invoked as follows on the ARM architecture with the EABI:
+
+.in +4n
+.nf
+syscall(__NR_readahead, fd, 0, (unsigned int)(offset >> 32),
+        (unsigned int)(offset & 0xFFFFFFFF), count);
+.fi
+.in
+.PP
+.I offset
+is 64 bit and should be 8-byte aligned.
+Thus, a padding is inserted before
+.I offset
+and
+.I offset
+is split into two 32-bit arguments.
+Similar issues can occur on MIPS with the O32 ABI and
+on PowerPC with the 32-bit ABI.
+.BR fadvise64_64 (2)
+.BR ftruncate64 (2)
+.BR pread64 (2)
+.BR pwrite64 (2)
+.BR readahead (2)
+and
+.BR truncate64 (2).
 .SH EXAMPLE
 .nf
 #define _GNU_SOURCE
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
