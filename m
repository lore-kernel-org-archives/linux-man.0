From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Aw: Re: [PATCH 1/1] getrandom(2) : new man page
Date: Tue, 30 Sep 2014 11:22:13 +0200
Message-ID: <542A7645.8070802@gmail.com>
References: <1410614156-16175-1-git-send-email-xypron.glpk@gmx.de>, <5429791D.6080903@gmail.com> <trinity-3771278a-8ee9-40ea-afb0-2acd7fd152ef-1412037494921@3capp-gmx-bs36>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <trinity-3771278a-8ee9-40ea-afb0-2acd7fd152ef-1412037494921@3capp-gmx-bs36>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "Theodore Ts\\'o" <tytso-3s7WtUTddSA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Heinrich,

On 09/30/2014 02:38 AM, Heinrich Schuchardt wrote:
> Hello Michael,
> 
> please find below a reworked version of the man page. I considered
> your remarks and reworked it.
> 
> I removed the abbreviations and the reference to NIST as these do
> not help to make better use of getrandom().
>>> +random bytes which can be used to seed user space random number
>>
[...]

Thanks for the detailed checklist of responses. That makes life 
much simpler for me.

A few more comments below.

> diff --git a/man2/getrandom.2 b/man2/getrandom.2
> new file mode 100644
> index 0000000..6a30898
> --- /dev/null
> +++ b/man2/getrandom.2
> @@ -0,0 +1,226 @@
> +.\" Copyright (C) 2014, Theodore Ts'o <tytso-3s7WtUTddSA@public.gmane.org>
> +.\" Copyright (C) 2014, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> +.\"
> +.\" %%%LICENSE_START(VERBATIM)
> +.\" Permission is granted to make and distribute verbatim copies of this
> +.\" manual provided the copyright notice and this permission notice are
> +.\" preserved on all copies.
> +.\"
> +.\" Permission is granted to copy and distribute modified versions of
> +.\" this manual under the conditions for verbatim copying, provided that
> +.\" the entire resulting derived work is distributed under the terms of
> +.\" a permission notice identical to this one.
> +.\"
> +.\" Since the Linux kernel and libraries are constantly changing, this
> +.\" manual page may be incorrect or out-of-date.  The author(s) assume.
> +.\" no responsibility for errors or omissions, or for damages resulting.
> +.\" from the use of the information contained herein.  The author(s) may.
> +.\" not have taken the same level of care in the production of this.
> +.\" manual, which is licensed free of charge, as they might when working.
> +.\" professionally.
> +.\"
> +.\" Formatted or processed versions of this manual, if unaccompanied by
> +.\" the source, must acknowledge the copyright and authors of this work.
> +.\" %%%LICENSE_END
> +
> +.TH GETRANDOM 2 2014-09-13 "Linux" "Linux Programmer's Manual"
> +.SH NAME
> +getrandom \- fill buffer with random bytes

Maybe better:
s/fill buffer with/obtain a series of/
?

> +.SH SYNOPSIS
> +.B #include <linux/random.h>
> +.sp
> +.BI "int getrandom(void *"buf ", size_t " buflen ", unsigned int " flags );
> +.SH DESCRIPTION
> +The system call
> +.BR getrandom ()
> +fills the buffer pointed to by
> +.I buf
> +with up to
> +.I buflen
> +random bytes.
> +These can be used to seed user-space random number generators
> +or for other cryptographic purposes.
> +.PP
> +.BR getrandom ()
> +relies on entropy gathered from device drivers and other sources of
> +environmental noise.
> +Unnecessarily reading large quantities of data will have a negative impact
> +on other users of the
> +.I /dev/random
> +and the
> +.I /dev/urandom
> +devices.
> +Therefore it should not be used for Monte Carlo simulations or other

s/it/.BR getrandom ()/

> +programs/algorithms which are doing probabilistic sampling.
> +.PP
> +The
> +.I flags
> +argument is a bit mask that can contain zero or more of the following values
> +ORed tgether:
> +.TP
> +.B GRND_RANDOM
> +If this bit is set, then random bytes are drawn from the
> +.I /dev/random
> +pool instead of the
> +.I /dev/urandom
> +pool.
> +The
> +.I /dev/random
> +pool is limited based on the entropy that can be obtained from environmental
> +noise, so if there is insufficient entropy, the requested number of bytes may
> +not be returned.

And at this point I ask myself: so, what is returned? Is it a short "read". 
If so, then say something like: "the call may return fewer bytes than 
requested". And what happens if no entropy is available?

> +.TP
> +.B GRND_NONBLOCK
> +If this bit is set and there is no entropy available at all,
> +.BR getrandom ()
> +will return -1 with
> +.I errno
> +set to
> +.BR EAGAIN .
> +If the
> +.B GRND_NONBLOCK
> +bit is not set and there is no entropy available at all,
> +.BR getrandom ()
> +will block.
> +.SH RETURN VALUE
> +On success,
> +.BR getrandom ()
> +returns the number of bytes that were copied to the buffer
> +.IR buf .
> +This may not be all the bytes requested by the caller via

s/This may not be all the/This may be less than the number of/

> +.I buflen
> +if insufficient entropy was present in the
> +.IR /dev/random
> +pool, or if the system call was interrupted by a signal.
> +.PP
> +On error, -1 is returned, and
> +.I errno
> +is set appropriately.
> +.SH ERRORS
> +.TP
> +.B EINVAL
> +An invalid flag was passed to
> +.BR getrandom ().
> +.TP
> +.B EFAULT
> +The address referenced in parameter
> +.I buf
> +is outside the accessible address space.
> +.TP
> +.B EAGAIN
> +The requested entropy was not available, and
> +.BR getrandom ()
> +would have blocked if the
> +.B GRND_NONBLOCK
> +flag was not set.
> +.TP
> +.B EINTR
> +While blocked waiting for entropy, the call was interrupted by a signal
> +handler; see the description of how interrupted
> +.BR read (2)
> +calls on "slow" devices are handled with and without the
> +.B SA_RESTART
> +flag in the
> +.BR signal (7)
> +man page.
> +.SH VERSIONS
> +.BR getrandom ()
> +was introduced in version 3.17 of the Linux kernel.
> +.SH CONFORMING TO
> +This system call is Linux-specific.
> +.SH NOTES
> +.SS Interrupt handling

s/Interrupt handling/Interruption by a signal handler/

> +The reaction of
> +.BR getrandom ()
> +in case of an interruption of a blocking call by a signal
> +when reading from
> +.I /dev/urandom
> +.RB ( GRND_RANDOM
> +is not set)
> +depends on the initialization state of the entropy buffer
> +and on the request size
> +.IR buflen .
> +If the entropy is not yet intialized or the request size is large
> +.RI ( buflen
> +> 256),
> +.B EINTR
> +will be returned.
> +If the entropy pool has been intialized and the request size is small
> +.RI ( buflen
> +<= 256),
> +.BR getrandom ()
> +will not return
> +.BR EINTR .
> +Instead it will return all of the bytes that have been requested.

s/Instead/Instead,/

> +.PP
> +When reading from
> +.I /dev/random
> +.RB ( GRND_RANDOM
> +is set)
> +these guarantees do
> +.I not
> +apply.
> +.PP
> +Calling
> +.BR getrandom ()
> +to read
> +.I /dev/urandom
> +for small values of

s/small/small (<= 256)

> +.I buflen
> +is is the preferred mode of usage.

s/is is/is/

> +The described behavior was designed for compatibility with

It's not quite clear what "The described behavior" refers to.
Can you improve this?

> +OpenBSD's
> +.BR getentropy ()
> +system call.
> +.PP
> +The user of
> +.BR getrandom ()
> +.I must
> +always check the return value, in case it returns some error,

s/returns/indicates/

> +or if fewer bytes than requested were returned.
> +In the case of
> +.RB ! GRND_RANDOM
> +and small request, 

Change the preceding to

In the case where 
.B GRND_RANDOM
is not specified and
.I bufken
is less than or equal to 256,

> the latter should never happen, but the careful user-space

s/the latter should never happen/
  a return of fewer bytes than requested should never happen/

> +code should check for this anyway!
> +.SS Choice of random device
> +Unless you are doing long-term key generation (and perhaps not even
> +then), you probably shouldn't be using
> +.B GRND_RANDOM.
> +The cryptographic algorithms used for
> +.I /dev/urandom
> +are quite conservative, and so should be sufficient for all purposes.
> +The disadvantage of
> +.B GRND_RANDOM
> +is that it can block.
> +Furthermore dealing with partially fulfilled

s/Furthermore/Furthermore,/

> +.IR getrandom ()

s/IR/BR/

> +requests increases code complexity.
> +.SS Emulating OpenBSD's getentropy()
> +The
> +.BR getentropy ()
> +system call in OpenBSD can be emulated using the following
> +function:
> +
> +.in +4n
> +.nf
> +int
> +getentropy(void *buf, size_t buflen)
> +{
> +    int ret;
> +
> +    if (buflen > 256)
> +        goto failure;
> +    ret = getrandom(buf, buflen, 0);
> +    if (ret < 0)
> +        return ret;
> +    if (ret == buflen)
> +        return 0;
> +failure:
> +    errno = EIO;
> +    return -1;
> +}
> +.fi
> +.in
> +.SH SEE ALSO
> +.BR random (4),
> +.BR urandom (4)
> 

Could you make you next submission a two-patch series, with the 
second patch adding SEE ALSO entries in random(3) and random(4).

Thanks,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
