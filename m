From: Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>
Subject: Outdated scare text in snprintf man page
Date: Sat, 28 Jun 2014 23:45:49 -0400
Message-ID: <20140629034549.GX179@brightrain.aerifal.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The following text appears under BUGS in the snprintf man page:

       Linux libc4.[45] does not have a snprintf(), but provides a
       libbsd that contains an snprintf() equivalent to sprintf(),
       that is, one that ignores the size argument. Thus, the use of
       snprintf() with early libc4 leads to serious security problems.

I've had people cite this as a reason to be wary of using snprintf,
apparently unaware of what libc4 means. IMO it should just be removed;
it's way too old to be relevant.

Rich
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
