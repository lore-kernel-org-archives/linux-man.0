From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] proc.5: tfix
Date: Tue, 04 Feb 2014 10:02:07 +0100
Message-ID: <52F0AC8F.4040405@gmail.com>
References: <1391278965-26411-1-git-send-email-taffit@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1391278965-26411-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi David,

Yuri Kozlov got this one in about an hour ahead of you!

Cheers,

Michael


On 02/01/2014 07:22 PM, David Pr=E9vot wrote:
> ---
>  man5/proc.5 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/man5/proc.5 b/man5/proc.5
> index 4607a45..ca976c4 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -1496,7 +1496,7 @@ is set at kernel compilation time.
>  .\" commit 5ed67f05f66c41e39880a6d61358438a25f9fee5
>  .\" commit 48f6a7a511ef8823fdff39afee0320092d43a8a0
>  A list of the POSIX timers for this process.
> -Each timer is listed with a line that starets with the string "ID:".
> +Each timer is listed with a line that starts with the string "ID:".
>  For example:
> =20
>  .in +4n
> @@ -1548,7 +1548,7 @@ a signal if the timer delivers notifications vi=
a a signal.
>  This field identifies the clock that the timer uses for measuring ti=
me.
>  For most clocks, this is a number that matches one of the user-space
>  .BR CLOCK_*
> -constants dexposed via
> +constants exposed via
>  .IR <time.h> .
>  .B CLOCK_PROCESS_CPUTIME_ID
>  timers display with a value of -6
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
