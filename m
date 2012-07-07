From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch]: Wrong year in "Changes" and "man-pages-3.41.lsm"
Date: Sat, 7 Jul 2012 07:51:15 +0200
Message-ID: <CAKgNAkhaS+_H8CZ+mYt-i5gCKd6gLet-nDdCPV4x-XNEM7+P2Q@mail.gmail.com>
References: <20120619193752.GA809@rhi.hi.is>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120619193752.GA809-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Bjarni,

I've applied your patch to Changes.old, but I won't worry about the lsm.

Thanks,

Michael

On Tue, Jun 19, 2012 at 9:37 PM, Bjarni Ingi Gislason
<bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org> wrote:
> Package: manpages
> Version: 3.41
> Severity: minor
> Tags: patch
>
>   1. patch:
>
> --- Changes     2012-05-10 20:13:19.000000000 +0000
> +++ Changes.new 2012-06-19 01:43:35.000000000 +0000
> @@ -1,6 +1,6 @@
>  ==================== Changes in man-pages-3.41 ====================
>
> -Released: 2011-05-11, Christchurch
> +Released: 2012-05-11, Christchurch
>
>
>  Contributors
>
>
>   2. patch:
>
> --- man-pages-3.41.lsm  2012-05-10 20:13:19.000000000 +0000
> +++ man-pages-3.41.lsm.new      2012-06-19 01:44:57.000000000 +0000
> @@ -1,7 +1,7 @@
>  Begin3
>  Title:          Section 2, 3, 4, 5 and 7 man pages for Linux
>  Version:        3.41
> -Entered-date:   2011-05-11
> +Entered-date:   2012-05-11
>  Description:    Linux manual pages
>  Keywords:       man pages
>  Author:         several
>
> --
> Bjarni I. Gislason



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
