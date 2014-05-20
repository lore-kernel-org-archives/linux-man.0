From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 19/20] getutent.3: fix prototypes
Date: Tue, 20 May 2014 08:36:54 +0200
Message-ID: <537AF806.8070500@gmail.com>
References: <1400540546-25578-1-git-send-email-rv@rasmusvillemoes.dk> <1400540546-25578-20-git-send-email-rv@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400540546-25578-20-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks. Applied!

Cheers,

Michael


On 05/20/2014 01:02 AM, Rasmus Villemoes wrote:
> The arguments to getutid(), getutline() and pututline() are const.
> ---
>  man3/getutent.3 | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/man3/getutent.3 b/man3/getutent.3
> index 6c7ff1b..5f5ac68 100644
> --- a/man3/getutent.3
> +++ b/man3/getutent.3
> @@ -37,11 +37,11 @@ utmpname \- access utmp file entries
>  .sp
>  .B struct utmp *getutent(void);
>  .br
> -.BI "struct utmp *getutid(struct utmp *" ut );
> +.BI "struct utmp *getutid(const struct utmp *" ut );
>  .br
> -.BI "struct utmp *getutline(struct utmp *" ut );
> +.BI "struct utmp *getutline(const struct utmp *" ut );
>  .sp
> -.BI "struct utmp *pututline(struct utmp *" ut );
> +.BI "struct utmp *pututline(const struct utmp *" ut );
>  .sp
>  .B void setutent(void);
>  .br
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
