From: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: import queue(3) man page ?
Date: Sun, 26 Oct 2008 04:13:35 -0400
Message-ID: <20081026081335.GA20872@infradead.org>
References: <200810260058.02527.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <200810260058.02527.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sun, Oct 26, 2008 at 12:58:01AM -0400, Mike Frysinger wrote:
> how do people feel about importing the queue(3) man page from FreeBSD ?  glibc 
> provides the queue.h and related headers from FreeBSD, so i think it makes 
> sense if we include relevant documentation as well ...
> http://www.freebsd.org/cgi/cvsweb.cgi/src/share/man/man3/queue.3?rev=1.42

We have queue(3).  I submitted it based on a FreeBSD one back in the
days when Andries maintained the man pages.  Note that it's not a
straight import all modern BSDs have a lot of changes over the old 4.4BSD
version we're using.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
