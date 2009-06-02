From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: poll never return EBADF?
Date: Tue, 2 Jun 2009 06:45:22 +0200
Message-ID: <cfd18e0f0906012145h28827eccu1d9fa2aed2e7355@mail.gmail.com>
References: <20090526175622.687B.A69D9226@jp.fujitsu.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20090526175622.687B.A69D9226-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: KOSAKI Motohiro <kosaki.motohiro-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Motohiro,

On Tue, May 26, 2009 at 11:09 AM, KOSAKI Motohiro
<kosaki.motohiro-+CUm20s59erQFUHtdCDX3A@public.gmane.org> wrote:
> Hi
>
> I have one stupid question.

It doesn't look stupid to me...

> "man poll" describe this error code.
>
>>ERRORS
>> =A0 =A0 =A0 EBADF =A0An invalid file descriptor was given in one of =
the sets.

This text seems to have been added in man-pages-1.39 (around 2000),
but with no explanation or note on authorship. I suspect someone was
confused.

> but current kernel implementation ignore invalid file descriptor,
> not return EBADF.

Which is what I understand it should do.

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D cut code =3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> static inline unsigned int do_pollfd(struct pollfd *pollfd, poll_tabl=
e *pwait)
> {
> =A0 =A0 =A0 =A0unsigned int mask;
> =A0 =A0 =A0 =A0int fd;
>
> =A0 =A0 =A0 =A0mask =3D 0;
> =A0 =A0 =A0 =A0fd =3D pollfd->fd;
> =A0 =A0 =A0 =A0if (fd >=3D 0) { =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0//// here
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0int fput_needed;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct file * file;
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file =3D fget_light(fd, &fput_needed);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mask =3D POLLNVAL;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (file !=3D NULL) { =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 //// and here
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mask =3D DEFAULT_POLLM=
ASK;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (file->f_op && file=
->f_op->poll)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mask =3D=
 file->f_op->poll(file, pwait);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Mask out unneeded e=
vents. */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mask &=3D pollfd->even=
ts | POLLERR | POLLHUP;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fput_light(file, fput_=
needed);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0}
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D end code =3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> In the other hand, SUSv3 talk about
>
>> POLLNVAL
>> =A0 =A0The specified fd value is invalid. This flag is only valid in=
 the
>> =A0 =A0revents member; it shall ignored in the events member.
>
> and
>
>> If the value of fd is less than 0, events shall be ignored, and reve=
nts
>> shall be set to 0 in that entry on return from poll().

Exactly.

> but, no desribe EBADF.
> (see http://www.opengroup.org/onlinepubs/009695399/functions/poll.htm=
l)
>
> So, I think the implementation is correct.

Agreed.

> Why don't we remove EBADF description?

Yes, that seems corrrrect for me. I've removed it for the next release =
(3.22).

Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
=46ound a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
