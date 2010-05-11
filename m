From: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Subject: Re: stat(2) does not indicate behavior with NULL filename arg, man
 pages 3.24
Date: Tue, 11 May 2010 03:46:03 +0200
Message-ID: <20100511014603.GE16800@machine.or.cz>
References: <4BCF4B3A.8020909@dreamworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4BCF4B3A.8020909-hCDZnVt6e3JSwrhanM7KvQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeff Mahovsky <Jeff.Mahovsky-hCDZnVt6e3JSwrhanM7KvQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, Apr 21, 2010 at 12:00:10PM -0700, Jeff Mahovsky wrote:
> The stat(2) manpage does not indicate the behavior of the stat()
> function when the filename is a NULL pointer.  Does stat() return an
> error or is the behavior undefined?

I think it is generally not safe to rely on proper handling of such NULL
pointers unless it is explicitly specified that they are handled
correctly. I think e.g. glibc will happily peek at the stat()'s filename
if you compile with -fbounded-pointers.

-- 
				Petr "Pasky" Baudis
When I feel like exercising, I just lie down until the feeling
goes away.  -- xed_over
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
