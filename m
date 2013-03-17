From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] capabilities.7: ffix
Date: Sun, 17 Mar 2013 08:07:53 +0100
Message-ID: <CAKgNAkjrnBhRFiDV7gPpJ=1tG38+Ac2Ats8_-UGcnBhjtYUz6A@mail.gmail.com>
References: <1363469864-1679-1-git-send-email-taffit@debian.org> <1363469864-1679-2-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363469864-1679-2-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks David. Applied.

On Sat, Mar 16, 2013 at 10:37 PM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wr=
ote:
> ---
>  man7/capabilities.7 |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/man7/capabilities.7 b/man7/capabilities.7
> index 61a340e..768c026 100644
> --- a/man7/capabilities.7
> +++ b/man7/capabilities.7
> @@ -565,6 +565,7 @@ employ
>  .BR prctl (2)
>  .B PR_SET_MM
>  operation;
> +.IP *
>  set
>  .IR /proc/PID/oom_score_adj
>  to a value lower than the value last set by a process with
> --
> 1.7.10.4
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
