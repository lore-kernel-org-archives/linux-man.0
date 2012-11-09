From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] time.7: tfix
Date: Fri, 9 Nov 2012 06:52:24 +0100
Message-ID: <CAKgNAkgE3vcRP1rBmWs4S2-L9trJbU1Mc=bNsbvfQcpT+1aQ8Q@mail.gmail.com>
References: <1352427892-13987-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1352427892-13987-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks. Applied.

On Fri, Nov 9, 2012 at 3:24 AM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wrot=
e:
> ---
>  man7/time.7 |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man7/time.7 b/man7/time.7
> index 5d8fedc..03a00ea 100644
> --- a/man7/time.7
> +++ b/man7/time.7
> @@ -177,7 +177,7 @@ value for a thread.
>  The timer slack is the length of time by
>  which the kernel may delay the wake-up of certain
>  system calls that block with a timeout.
> -Permitting this delay allows the kernel to coallesce wake-up events,
> +Permitting this delay allows the kernel to coalesce wake-up events,
>  thus possibly reducing the number of system wake-ups and saving powe=
r.
>  For more details, see the description of
>  .B PR_SET_TIMERSLACK
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
