From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] sys_waitid: return -EFAULT for NULL
Date: Wed, 14 Jan 2009 15:28:35 +1300
Message-ID: <cfd18e0f0901131828p3a737e6cx317ccda67ba9f733@mail.gmail.com>
References: <cfd18e0f0901131436ud2cf61bkf0e6b00f4b765bb5@mail.gmail.com>
	 <cfd18e0f0901131438n232ba114n27ea2d7964d071de@mail.gmail.com>
	 <20090113224759.7DFB7FC3DD@magilla.sf.frob.com>
	 <20090113224941.36F19FC3DD@magilla.sf.frob.com>
	 <alpine.LFD.2.00.0901131629220.6528@localhost.localdomain>
	 <cfd18e0f0901131653y76a827b5i906fadce63ada56b@mail.gmail.com>
	 <alpine.LFD.2.00.0901131655040.6528@localhost.localdomain>
	 <cfd18e0f0901131739v5119271flc28b5531604e682@mail.gmail.com>
	 <alpine.LFD.2.00.0901131808070.6528@localhost.localdomain>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.LFD.2.00.0901131808070.6528-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Roland McGrath <roland-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ulrich Drepper <drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Vegard Nossum <vegard.nossum-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, Jan 14, 2009 at 3:10 PM, Linus Torvalds
<torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org> wrote:
>
>
> On Wed, 14 Jan 2009, Michael Kerrisk wrote:
>>
>> It isn't an extension.  It's an accident.
>
> Bah. It doesn't matter. It's an ABI. Your arguments make no sense - simply
> because there are other differences that means that if you develop under
> one OS, you can't expect it to run on another.

(I don't think implied such an expectation.  On the other hand, we can
do things to make more or less difficult for writers of portable
applications.)

> Arguing that "accident" is somehow different than "extension" is a totally
> inane and _idiotic_ argument. Because it's just arguing about the words,
> not about the end result.
>
> If you're doing a dissertation in English literature, arguing about the
> words you use is valid. But if you're talking about operating systems,
> it's just pointless masturbation.

I agree that for practical purposes with respect to waitid(),
"extension" versus "accident" is only about words: we've had the
interface in its current form for so long that changing it shouldn't
be done without consideration.

But (and this was why I constrasted "extension" with "accident"), I
already made it clear that IMO there was another point that was more
important than this specific case:

: And the fact that such accidents happen more often than necessary is
: the real problem, rather than the fact that this API in particular is
: inconsistent with expectations.

but you responded to the point I found less important.

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
