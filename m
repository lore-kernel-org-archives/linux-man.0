From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: incorrect clock_nanosleep.2
Date: Thu, 12 Aug 2010 09:59:39 +0400
Message-ID: <20100812095939.13c8ab26@keeper.home.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello.

Next two paragraph is contradict.

If the call is interrupted by a signal handler, clock_nanosleep() returns
-1, and sets errno to EINTR.

And below:
RETURN VALUE
       On successfully sleeping for the requested interval,
       clock_nanosleep() returns 0.  If the call is interrupted by a
       signal handler or encounters an error, then it returns a positive
       error number.

So, return value is positive or -1 ?


-- 
Best Regards,
Yuri Kozlov

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
