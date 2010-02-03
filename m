From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: some unification section headers in the man pages
Date: Wed, 3 Feb 2010 07:19:05 +0100
Message-ID: <cfd18e0f1002022219q5d6175b7o476b4ed9dbe72be9@mail.gmail.com>
References: <20091206130519.7d997197@keeper.home.local>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20091206130519.7d997197-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Yuri

On Sun, Dec 6, 2009 at 11:05 AM, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org> wrote:
> Hello.
>
> $grep -r 'Authors and Copyright Conditions' man-pages-git/
> man-pages-git/man4/intro.4:.SS Authors and Copyright Conditions
> man-pages-git/man6/intro.6:.SS Authors and Copyright Conditions
> man-pages-git/man5/intro.5:.SS Authors and Copyright Conditions
> man-pages-git/man8/intro.8:.SS Authors and Copyright Conditions
> man-pages-git/man7/intro.7:.SS Authors and Copyright Conditions
>
> $ grep -r 'Authors and Copyright Terms' man-pages-git/
> man-pages-git/man2/intro.2:.SS Authors and Copyright Terms
> man-pages-git/man3/intro.3:.SS Authors and Copyright Terms
>
> May be choose just one?

Makes sense. I made .2 and .3 the same as the other pages. Changes
will be in man-pages 3.24.

Thanks for the report!

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
