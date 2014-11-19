From: Mark Veltzer <mark.veltzer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Missing manual pages for pthread_mutexattr_{get|set}robust(3)
Date: Wed, 19 Nov 2014 05:57:02 +0200
Message-ID: <CABFkpbBuP2CwdtZd9C36aNr+qkhN=U9aQ0490fzdLw=pj2kcYw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "mtk.manpages" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

These functions actually exist and work in current day distributions
(I am on ubuntu 13.10, 14.04 and 14.10) but are not documented in any
way.

I actually found out that these functions exist using the pthread
library on win32...:)

These functions determine whether a futex is robust or not.

I have checked the latest version of manpages to make sure that it is
indeed missing.

Cheers,
    Mark
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
