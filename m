From: "fkater-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org" <fkater-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: man gettimeofday: first arg cannot be NULL
Date: Wed, 10 Mar 2010 17:58:10 +0100
Message-ID: <20100310165810.GC2165@comppasch2>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

in man 2 gettimeofday (2009-03-25), section DESCRIPTION, it
is said:

"If either tv or tz is NULL, ..."

However, if the first arg is NULL, the compiler (gcc 4.3.4)
issues a warning that it shouldn't be NULL.

 Felix


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
