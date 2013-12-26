From: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [PATCH] open: Document O_TMPFILE
Date: Thu, 26 Dec 2013 01:40:38 -0800
Message-ID: <20131226094038.GA18960@infradead.org>
References: <3bec865ec3205e23c997ddc2c9bbacf0e53b0d18.1375896634.git.luto@amacapital.net>
 <CAKgNAkjE5tmeRJMMXpEc1mGz0pyPrt5PL5pkUjViunhtcC2W3A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkjE5tmeRJMMXpEc1mGz0pyPrt5PL5pkUjViunhtcC2W3A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Al Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>, Jeff Layton <jlayton-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Thu, Aug 08, 2013 at 02:00:18PM +0200, Michael Kerrisk (man-pages) wrote:
> See my reply to the thread started by Christoph Hellwig
> (https://lwn.net/Articles/562297/). I've taken your man-pages patch,
> and applied it in a branch. I tweaked the language and formatting a
> bit, and also added documentation of the EINVAL and EISDIR (ick!)
> error cases.
> 
> As noted in the other thread, the API is questionable in the opinion
> of a few people. Maybe it will change, and this man-pages patch will
> need some further tweaking. If that doesn't happen, I'll merge it as
> is, at the time of the 3.11 stable release.

Looks like my API comments were simplify ignored, so maybe it's time to
document things properly and pull the O_TMPFILE bits in?  

> 
> Cheers,
> 
> Michael
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
---end quoted text---
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
