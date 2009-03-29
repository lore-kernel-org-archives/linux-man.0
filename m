From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [Patch] describe 'swappiness' for proc(5)
Date: Mon, 30 Mar 2009 11:12:09 +1300
Message-ID: <cfd18e0f0903291512q4159105dx8da64065797d48f4@mail.gmail.com>
References: <20090320034647.GC14567@hack>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20090320034647.GC14567@hack>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Am=E9rico_Wang?= <xiyou.wangcong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Fri, Mar 20, 2009 at 4:46 PM, Am=E9rico Wang <xiyou.wangcong@gmail.c=
om> wrote:
>
> Add descriptions for /proc/sys/vm/swappiness.
>
> Signed-off-by: WANG Cong <xiyou.wangcong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Thanks!  Applied for man-pages-3.20.

Cheers,

Michael


> ---
> diff --git a/man5/proc.5 b/man5/proc.5
> index 48c103a..c74d7f7 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -2382,6 +2382,14 @@ user should run
> =A0.BR sync (8)
> =A0first.
> =A0.TP
> +.IR /proc/sys/vm/swappiness
> +.\" The following is from Documentation/sysctl/vm.txt
> +This control is used to define how aggressive the kernel will swap
> +memory pages. =A0Higher values will increase agressiveness, lower va=
lues
> +descrease the amount of swap.
> +
> +The default value is 60.
> +.TP
> =A0.IR /proc/sys/vm/legacy_va_layout " (since Linux 2.6.9)"
> =A0.\" The following is from Documentation/filesystems/proc.txt
> =A0If non-zero, this disables the new 32-bit memory-mapping layout;
>
>
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
=46ound a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
