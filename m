From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] vm86.2: Add 32-bit specific to CONFORMING TO
Date: Fri, 20 Feb 2009 12:39:01 +1300
Message-ID: <cfd18e0f0902191539y3f883931rc088631cb583b849@mail.gmail.com>
References: <alpine.LFD.2.00.0902151421470.19327@localhost.localdomain>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.LFD.2.00.0902151421470.19327-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Parag Warudkar <parag.lkml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Parag,

On 2/16/09, Parag Warudkar <parag.lkml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> While playing around with Wine on 64-bit kernel I noticed that vm86 is
> not supposed to work there.
>
> It might be a good idea to clarify that in the vm86 man page.

Agreed -- see below.

> --- man-pages-3.18/man2/vm86.2	2009-02-08 21:14:13.000000000 -0500
> +++ man-pages-3.18-wk/man2/vm86.2	2009-02-15 14:19:08.072201220 -0500
> @@ -69,7 +69,7 @@
>  (This is a kernel sanity check; the saved
>  stack should only exist within vm86 mode itself.)
>  .SH "CONFORMING TO"
> -This call is specific to Linux on Intel processors, and should not be
> +This call is specific to 32-bit Linux on Intel processors, and should not

I made it:

This call is specific to Linux on 32-bit Intel processors

The change will be in 3.19.

Thanks for reporting this.  I put the probablem down to bit-rot, since
the last major change to this page was in 1997, when 64-bit Intel was
not on most people's horizons.

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
