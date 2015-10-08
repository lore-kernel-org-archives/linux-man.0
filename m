From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] futex.2: drop pointless editorializing
Date: Thu, 08 Oct 2015 23:21:31 +0200
Message-ID: <5616DE5B.9090702@gmail.com>
References: <1442636954-31590-1-git-send-email-vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1442636954-31590-1-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Mike,

On 09/19/2015 06:29 AM, Mike Frysinger wrote:
> Man pages are technical references to track reality rather than
> pointlessly complain about details.
> ---
>  man2/futex.2 | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/man2/futex.2 b/man2/futex.2
> index 64dd7fb..7bc2324 100644
> --- a/man2/futex.2
> +++ b/man2/futex.2
> @@ -296,10 +296,8 @@ Initial futex support was merged in Linux 2.5.7 but with different semantics
>  from what was described above.
>  A 4-argument system call with the semantics
>  described in this page was introduced in Linux 2.5.40.
> -In Linux 2.5.70, one argument
> -was added.
> -In Linux 2.6.7, a sixth argument was added\(emmessy, especially
> -on the s390 architecture.
> +In Linux 2.5.70, a fifth argument was added.
> +In Linux 2.6.7, a sixth argument was added.
>  .SH CONFORMING TO
>  This system call is Linux-specific.

Agreed that that text is pointless, but other changes that have 
been made (in a branch) in recent times meant your patch did not
apply. I made the change, but elided the two sentences into one.

Thanks for the patch!

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
