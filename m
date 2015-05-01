From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Patch on man4/tty_ioctl.4 regarding TIOCMIWAIT & TIOCGICOUNT
Date: Fri, 01 May 2015 23:12:52 +0200
Message-ID: <5543EC54.6040303@gmail.com>
References: <1234176480.499009e0c8303@imp.free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1234176480.499009e0c8303-HZaT1/I6gcdWj0EZb7rXcA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?windows-1252?Q?Fr=E9d=E9ric_Maria?= <frederic.maria-GANU6spQydw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephane Fillod <fillods-iA+eEnwkJgzk1uMJSBkQmQ@public.gmane.org>Stephane Fillod <fillods-iA+eEnwkJgzk1uMJSBkQmQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

=46r=E9d=E9ric

On 02/09/2009 11:48 AM, Fr=E9d=E9ric Maria wrote:
> Hello,
>=20
> for a personal project I was interrested in using the wait for interr=
upt
> capability of serial ports.
>=20
> After searching for documentation I found very few data about the tty=
 ioctl
> commands: TIOCMIWAIT and TIOCGICOUNT.
> Moreover this was not documented in man4/tty_ioctl.4 file.
>=20
> So here is a possible patch to add quick information on TIOCMIWAIT an=
d
> TIOCGICOUNT commands.
>=20
> This patch is against version 3.17 of the man pages.
>=20
> Please do not hesitate to correct english terms as this is not my bir=
th tongue.

Long after the fact, I've applied this patch. Thanks for sending it.

Cheers,

Michael



> --- /home/fred/man-pages-3.17/man4/tty_ioctl.4	2009-01-19 05:14:02.00=
0000000
> +0100
> +++ /home/fred/man-pages-3.17-new/man4/tty_ioctl.4	2009-02-09 10:20:4=
3.363377700
> +0100
> @@ -349,18 +349,26 @@
>  .SS "Modem control"
>  .TP
>  .BI "TIOCMGET	int *" argp
> -get the status of modem bits.
> +Get the status of modem bits.
>  .TP
>  .BI "TIOCMSET	const int *" argp
> -set the status of modem bits.
> +Set the status of modem bits.
>  .TP
>  .BI "TIOCMBIC	const int *" argp
> -clear the indicated modem bits.
> +Clear the indicated modem bits.
>  .TP
>  .BI "TIOCMBIS	const int *" argp
> -set the indicated modem bits.
> +Set the indicated modem bits.
> +.TP
> +.BI "TIOCMIWAIT	int " arg
> +Wait for any of the 4 modem bits (DCD, RI, DSR, CTS) to change.
> +The mask is passed in arg for bits of interest (use |'ed
> +TIOCM_RNG/DSR/CD/CTS for masking).
> +Caller should use
> +.B TIOCGICOUNT
> +to see which one it was.
>  .LP
> -Bits used by these four ioctls:
> +Bits used by these five ioctls:
>=20
>  .nf
>  TIOCM_LE        DSR (data set ready/line enable)
> @@ -375,6 +383,15 @@
>  TIOCM_RI         see TIOCM_RNG
>  TIOCM_DSR       DSR (data set ready)
>  .fi
> +.TP
> +.BI "TIOCGICOUNT	struct serial_icounter_struct *" argp
> +Get counter of input serial line interrupts (DCD, RI, DSR, CTS).
> +Write counters to the user passed
> +.I argp
> +serial_icounter_struct structure.
> +.br
> +NB: both 1->0 and 0->1 transitions are counted except for
> +RI where only 0->1 is counted.
>  .SS "Marking a line as local"
>  .TP
>  .BI "TIOCGSOFTCAR	int *" argp
>=20
>=20
>=20
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
