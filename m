From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: gethostid/sethostid in wrong manual section
Date: Tue, 13 Jan 2009 07:46:36 +1300
Message-ID: <cfd18e0f0901121046l24accdcfw9422491ba8ab24c5@mail.gmail.com>
References: <20081222233953.GG16155@riva.ucam.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20081222233953.GG16155-K2jUmMR1UYV4cg9Nei1l7Q@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Watson <cjwatson-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Colin,

On Tue, Dec 23, 2008 at 12:39 PM, Colin Watson <cjwatson-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org> wrote:
> https://bugs.launchpad.net/ubuntu/+source/manpages/+bug/17551 reports
> (and I've confirmed) that gethostid/sethostid are in section 2 despite
> being implemented by glibc, not the kernel; they aren't just syscall
> stubs either. Should they be moved to section 3?

I suspect this is a historical thing, since in the original BSD docs,
these interfaces were documented in Section 2, although I see FreeBSD
for example now has them in Section 3.

Anyway, I have relocated the page to section 3 as you suggest, and
created some .so link files so that "man 2 [gs]ethostid" will continue
to do the right thing.

(There were also a few other broken pieces in the page -- e.g., no
return value or error description for sethostid() -- that I also fixed
along the way.)

The changes will be in man-pages-3.16.

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
