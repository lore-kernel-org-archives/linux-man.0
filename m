From: Sam Liao <phyomh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: pthread_join man page bug
Date: Wed, 2 Dec 2009 16:38:04 +0800
Message-ID: <da5b0fda0912020038n1cda0b8ay59fc4f4d0c43c1fc@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The pthread_create here should be pthread_join.

-Sam


-----

NOTES

After a successful call to pthread_create(), the caller is guaranteed
that the target thread has terminated.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
