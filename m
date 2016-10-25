From: Vincent Lefevre <vincent-buymaDBGzMOsTnJN9+BGXg@public.gmane.org>
Subject: timegm(3): behavior is not described in case of error
Date: Tue, 25 Oct 2016 14:58:16 +0200
Message-ID: <20161025125816.GA29678@cventin.lip.ens-lyon.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

In the timegm(3) man page, the behavior is not described in case of
error, i.e. if the result is not representable in a time_t (e.g.,
with a huge year).

The glibc manual says:

     'timegm' is functionally identical to 'mktime' except it always
     takes the input values to be Coordinated Universal Time (UTC)
     regardless of any local time zone setting.

So, I assume that (time_t) -1 is returned in such a case, just like
mktime.

The man page could add a sentence like the glibc manual one, or
explicitly say what happens in case of error like in the mktime(3)
man page.

This is mainly for the timegm() function. For the timelocal() function,
the man page already says:

    The timelocal() function is equivalent to the POSIX standard
    function mktime(3). [...]

-- 
Vincent Lefèvre <vincent-buymaDBGzMOsTnJN9+BGXg@public.gmane.org> - Web: <https://www.vinc17.net/>
100% accessible validated (X)HTML - Blog: <https://www.vinc17.net/blog/>
Work: CR INRIA - computer arithmetic / AriC project (LIP, ENS-Lyon)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
