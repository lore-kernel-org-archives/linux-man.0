From: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: import queue(3) man page ?
Date: Sun, 26 Oct 2008 04:30:55 -0400
Message-ID: <20081026083055.GA9020@infradead.org>
References: <200810260058.02527.vapier@gentoo.org> <20081026081335.GA20872@infradead.org> <200810260422.47918.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <200810260422.47918.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sun, Oct 26, 2008 at 04:22:46AM -0400, Mike Frysinger wrote:
> it's the "updated" part that's the rub.  stock glibc has an ancient queue.h 
> while we've been updating it in Gentoo.  i thought i checked and found that 
> man-pages simply didnt have one, but it's more a matter of it being old.

When I imported queue.h it matches what was in glibc back then.  I tried
updating queue.h in glibc around the same time, but Uli doesn't like it.

Updating the man page to reflected some distro fork of the header
doesn't seem like a good idea.

And at least five year ago all the maintained BSDs actually had quite
different additions to queue.h, so which one to pick would be rather
hard and I at least partially understand Uli's rejection.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
