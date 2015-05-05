From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 18132] ipv6(7) describes IP_PKTINFO, but should be
 IP_RECVPKTINFO instead
Date: Tue, 05 May 2015 19:43:41 +0000
Message-ID: <bug-18132-11311-rXMgFs59PE@https.bugzilla.kernel.org/>
References: <bug-18132-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-18132-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=18132

Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         Resolution|---                         |CODE_FIX

--- Comment #3 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
This issue has been address by a seaparate fix, some time ago

man-pages commit d796c68d5ab6dc10c3737e40305b1ee23d7b0adc
Author: Bert Hubert <bert.hubert-dxZxOz86jR8sYtaaK7K+xw@public.gmane.org>
Date:   Sun Oct 21 12:51:33 2012 +0200

    ipv6.7: Document IPV6_RECVPKTINFO

I believe the man page nowadays addresses the concerns of this bug report, so
I'm closing. Please reopen, if you believe otherwise.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
