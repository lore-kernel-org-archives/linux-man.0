From: Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] Update the random(4) documentation towards a more
 accurate view on /dev/urandom
Date: Tue, 26 Apr 2016 16:46:23 +0200
Message-ID: <1461681983.15804.76.camel@redhat.com>
References: <20160425154605.7445.qmail@ns.horizon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160425154605.7445.qmail-HzZAx2gCgqrSUeElwK9/Pw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: George Spelvin <linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org>, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mpm-VDJrAJ4Gl5ZBDgjK7y7TUQ@public.gmane.org, tytso-3s7WtUTddSA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, 2016-04-25 at 11:46 -0400, George Spelvin wrote:
> I like the bit about indeterminate delays.
>=20
> Removing the examples of high quality randomness I'm less fond of;
> the whole idea is to inform people who don't quite understand what
> the general terms mean.=C2=A0=C2=A0Good enough for one-time pads is a=
 design
> goal of /dev/random.

If that's about documenting a design goal I'd prefer to move it out of
the main text for 2 reasons. (a) There is no practical crypto system
using one time pads, thus mentioning it in the main body only creates
confusion (b), one time pad is such a theoretical construction that any
real algorithm wouldn't implement it.

> The whole language about "if not X. then a pseudorandom number
> generator
> is used" is actually pretty confusing now that I read it.=C2=A0=C2=A0=
It implies
> some sort of mode switch which doen't exist.
>=20
> The bit about early boot is actually not as much of an issue as you
> think.
> Even /dev/urandom will stall early on boot until a minimum initial
> seed
> (128 bits at present) has been acumulated.=C2=A0=C2=A0(grep for
> "urandom_init_wait")

No it will not. We notice often the keys for sshd being generated
*before* the kernel logs that the random pool has been
initialized.

> How about something more like (draft, not final edit):
>=20
> =C2=A0A read from the \fI/dev/urandom\fP device will not block
> =C2=A0waiting for more entropy.
> +If the estimated fresh entropy is not sufficient, a
> \fI/dev/urandom\fP
> +will produce output anyway, relying on the cryptographic primitives
> in
> +the driver's pseudo-random number generator to ensure that the
> output,
> +although correlated with previous output in an information theoretic
> +sense (it exceeds the unicity distance), is secure for all practical
> +purposes.

What is the purpose of this text? To whom does it target? I wouldn't
like to get into such details about the device in the manpage, but if
you would=C2=A0like a section studying the theoretical properties of
/dev/urandom I'd again suggest to keep it separate and elaborate. What
is on the text above is certainly not complete analysis and is
certainly not targetting administrators and developers who would like
to understand what this device does.

> I don't like the bit about "use /dev/random or getrandom(2)"; while
> getrandom(2) should be mentioned in "see also", the equivalent is
> "getrandom(..., GRND_RANDOM)".=C2=A0=C2=A0It's the flag, no the sysca=
ll.

It is the syscall. According the description in getrandom(2):
"If the pool has not yet been initialized, then the call blocks,
unless=C2=A0=C2=A0GRND_RANDOM=C2=A0=C2=A0is=C2=A0=C2=A0specified=C2=A0=C2=
=A0in flags."

> I strongly dislike the deletion of the "as a general rule" advice.
> Specific recommendations are very valuable.

This advice despite being present for so long, is widely ignored as
/dev/urandom is used unconditionally by all software generating keys
(SSH/SSL), gnupg being the exception.

regards,
Nikos

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
