From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] prctl.2: EINAL when no CONFIG_SECCOMP_FILTER, also excess
 "TP" typo
Date: Fri, 8 Feb 2013 01:29:27 +0100
Message-ID: <CAKgNAkh+5TVoA__m+uMex+4GcSww4Dn+BkfHnHOZ_5MMOs7U3g@mail.gmail.com>
References: <1360178170-9381-1-git-send-email-shawnlandden@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1360178170-9381-1-git-send-email-shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Landden <shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Shawn

Thanks for the patch. A few comments.

* When you send a patch like this please provide an explanation. In
particular, explain how you obtained the info. This helps me verify
it.

* Write separate patches for separate pieces. The typo patch should be
separate. That said, someone else sent in a patch to fix this a couple
of days ago (but only just pushed to kernel.org) so that this piece is
fixed.

* The patch for the SECCOMP stuff is not quite correct, AFAICS. But
more to the point, this seems to be  documented by similar text that
is already in the page; am I missing something?

       EINVAL option is PR_SET_SECCOMP or PR_GET_SECCOMP, and the ker=E2=
=80=90
              nel was not configured with CONFIG_SECCOMP.

Thanks,

Michael

On Wed, Feb 6, 2013 at 8:16 PM, Shawn Landden <shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =
wrote:
> ---
>  man2/prctl.2 |   11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/man2/prctl.2 b/man2/prctl.2
> index fd78f48..e9ad0a5 100644
> --- a/man2/prctl.2
> +++ b/man2/prctl.2
> @@ -803,6 +803,16 @@ and the kernel was not configured with
>  .B EINVAL
>  .I option
>  is
> +.BR PR_SET_SECCOMP ,
> +.I arg2
> +is
> +.BR SECCOMP_MODE_FILTER ,
> +and the kernel was not configured with
> +.BR CONFIG_SECCOMP_FILTER .
> +.TP
> +.B EINVAL
> +.I option
> +is
>  .BR PR_SET_MM ,
>  and one of the following is true
>  .RS
> @@ -850,7 +860,6 @@ is not 0,
>  .BR PR_SET_PTRACER_ANY ,
>  or the PID of an existing process.
>  .TP
> -TP
>  .B EPERM
>  .I option
>  is
> --
> 1.7.9.5
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
