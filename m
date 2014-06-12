From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] setresuid.2: sfix
Date: Thu, 12 Jun 2014 14:30:50 +0200
Message-ID: <CAKgNAkgcSAjp4qHWiid=TM86ZPpoMm-oKf55Q_+sqSVmMtj4cw@mail.gmail.com>
References: <1402575792-5331-1-git-send-email-yuray@komyakino.ru>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1402575792-5331-1-git-send-email-yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Yuri,

I fixed this one a couple of days ago. See commit
29d3bdc4824833fe8fd3737c32328086e3c8a2dd

Cheers,

Michael



On Thu, Jun 12, 2014 at 2:23 PM, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org> wrote:
> ---
>  man2/setresuid.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man2/setresuid.2 b/man2/setresuid.2
> index f0482cd..847e224 100644
> --- a/man2/setresuid.2
> +++ b/man2/setresuid.2
> @@ -71,7 +71,7 @@ is set appropriately.
>  there are cases where
>  .BR setresuid ()
>  can fail even when the caller is UID 0;
> -it is a grave security error to omit checking for a faulure return from
> +it is a grave security error to omit checking for a failure return from
>  .BR setresuid ().
>  .SH ERRORS
>  .TP
> --
> 1.9.1
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
