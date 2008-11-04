From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: import queue(3) man page ?
Date: Tue, 04 Nov 2008 11:07:47 -0500
Message-ID: <49107353.2010906@gmail.com>
References: <200810260058.02527.vapier@gentoo.org> <200810260422.47918.vapier@gentoo.org> <20081026083055.GA9020@infradead.org> <200810260500.39607.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <200810260500.39607.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Mike,

Mike Frysinger wrote:
> On Sunday 26 October 2008, Christoph Hellwig wrote:
>> On Sun, Oct 26, 2008 at 04:22:46AM -0400, Mike Frysinger wrote:
>>> it's the "updated" part that's the rub.  stock glibc has an ancient
>>> queue.h while we've been updating it in Gentoo.  i thought i checked and
>>> found that man-pages simply didnt have one, but it's more a matter of it
>>> being old.
>> When I imported queue.h it matches what was in glibc back then.  I tried
>> updating queue.h in glibc around the same time, but Uli doesn't like it.
> 
> yeah, it should get updated or punted already.
> 
>> Updating the man page to reflected some distro fork of the header
>> doesn't seem like a good idea.
> 
> i wasnt suggesting we do that.  i was explaining why i started this thread in 
> the first place.
> 
>> And at least five year ago all the maintained BSDs actually had quite
>> different additions to queue.h, so which one to pick would be rather
>> hard and I at least partially understand Uli's rejection.
> 
> meh, having an outdated one is just as bad i think.

Are there some specific pieces you can see that need fixing in the
upstream page?  If so, would you have the time to write a patch?

thanks,

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
