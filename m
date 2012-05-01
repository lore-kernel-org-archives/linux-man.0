From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fork(2): add ENOSYS
Date: Wed, 2 May 2012 06:21:36 +1200
Message-ID: <CAKgNAkiHQX4o0EiVW53W=PQbgp+RW6-LMqY7NpOb+4bGPdHFQw@mail.gmail.com>
References: <1335847802-15646-1-git-send-email-vapier@gentoo.org>
 <CAKgNAkjx1a002xLYEYtgJr8Luy8mKSiWo8J8ZT+aYbzhVrRz5g@mail.gmail.com> <201205011149.34086.vapier@gentoo.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201205011149.34086.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, May 2, 2012 at 3:49 AM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrot=
e:
> On Tuesday 01 May 2012 01:38:35 Michael Kerrisk (man-pages) wrote:
>> On Tue, May 1, 2012 at 4:50 PM, Mike Frysinger wrote:
>> > --- a/man2/fork.2
>> > +++ b/man2/fork.2
>> > @@ -184,6 +184,10 @@ capability.
>> > =A0.B ENOMEM
>> > =A0.BR fork ()
>> > =A0failed to allocate the necessary kernel structures because memo=
ry is
>> > tight. +.TP
>> > +.B ENOSYS
>> > +.BR fork ()
>> > +is not supported on this platform (e.g. a no-mmu setup).
>> > =A0.SH "CONFORMING TO"
>> > =A0SVr4, 4.3BSD, POSIX.1-2001.
>> > =A0.SH NOTES
>>
>> I'm curious. Which architectures currently do this, do you know?
>
> ones w/out an mmu ;)
>
> looking at 'config MMU', arch/*/Kconfig, i see it could happen to:
> =A0 =A0 =A0 =A0arm blackfin c6x frv h8300 microblaze mips xtensa

Thanks Mike. Patch applied. (But I couldn't see how one deduces that
mips is on that list.)

Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
