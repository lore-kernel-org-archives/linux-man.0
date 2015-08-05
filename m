From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] sched.7: Fix swapped descriptions of sched_get_priority_max
 and sched_get_priority_min
Date: Wed, 05 Aug 2015 21:14:16 +0200
Message-ID: <55C26088.9090604@gmail.com>
References: <1438682920.3375.7.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1438682920.3375.7.camel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Nikola,

Thanks for the patch. I applied it. But, be aware that your mailer
is mangling patches (line wrapping), so I had to manually fix before
I applied.

Cheers,

Michael

On 08/04/2015 12:08 PM, Nikola Forr=C3=B3 wrote:
> ---
>  man7/sched.7 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/man7/sched.7 b/man7/sched.7
> index ac518b2..743d52b 100644
> --- a/man7/sched.7
> +++ b/man7/sched.7
> @@ -49,10 +49,10 @@ Set the scheduling parameters of a specified
> thread.
>  Fetch the scheduling parameters of a specified thread.
>  .TP
>  .BR sched_get_priority_max (2)
> -Return the minimum priority available in a specified scheduling
> policy.
> +Return the maximum priority available in a specified scheduling
> policy.
>  .TP
>  .BR sched_get_priority_min (2)
> -Return the maximum priority available in a specified scheduling
> policy.
> +Return the minimum priority available in a specified scheduling
> policy.
>  .TP
>  .BR sched_rr_get_interval (2)
>  Fetch the quantum used for threads that are scheduled under
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
