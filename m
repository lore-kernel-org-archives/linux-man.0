From: Scott Harvey <scott.harvey-nSGZJWG/ZnXz/TQy74m3OQ@public.gmane.org>
Subject: Re: Simple Bug in unix(7) man page
Date: Sat, 8 Nov 2014 17:09:56 -0500
Message-ID: <CAPhGvuKNnw7yxV+P-SS5bL_iT1XVFTcb-zUNGSFq6hmY+k9KpQ@mail.gmail.com>
References: <CAPhGvuJvh-ssCnRWmqiJk7qq_v=LadrfSe9pcDXG=nWPH413qA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPhGvuJvh-ssCnRWmqiJk7qq_v=LadrfSe9pcDXG=nWPH413qA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,

Under the BUGS section this code snippet appears:

if (getsockname(sfd, (struct sockaddr *) addrp, &addrlen)) != -1)
              /* handle error */ ;


This should be changed to == -1, or < 0, since getsockname(2) returns
-1 on error.

Looks like just a simple typo.

Thanks,
Scott Harvey
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
