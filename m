From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] proc.5: cfix
Date: Sun, 04 May 2014 07:41:59 +0200
Message-ID: <5365D327.3010002@gmail.com>
References: <1399166675-16019-1-git-send-email-taffit@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399166675-16019-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi David,

Including the ':' was intended. Why did you want to remove it?

Cheers,

Michael

On 05/04/2014 03:24 AM, David Pr=E9vot wrote:
> ---
>  man5/proc.5 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/man5/proc.5 b/man5/proc.5
> index be6b755..123bc8f 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -155,14 +155,14 @@ bits for all file-mapped pages associated with =
the process.
>  .IP
>  Clearing the PG_Referenced and ACCESSED/YOUNG bits provides a method
>  to measure approximately how much memory a process is using.
> -One first inspects the values in the "Referenced:" fields
> +One first inspects the values in the "Referenced" fields
>  for the VMAs shown in
>  .IR /proc/[pid]/smaps
>  to get an idea of the memory footprint of the
>  process.
>  One then clears the PG_Referenced and ACCESSED/YOUNG bits
>  and, after some measured time interval,
> -once again inspects the values in the "Referenced:" fields
> +once again inspects the values in the "Referenced" fields
>  to get an idea of the change in memory footprint of the
>  process during the measured interval.
>  If one is interested only in inspecting the selected mapping types,
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
