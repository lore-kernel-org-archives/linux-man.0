From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 35852] SO_PRIORITY does not set TOS field in IP header
Date: Tue, 05 May 2015 19:24:28 +0000
Message-ID: <bug-35852-11311-D2jjKsMZ8s@https.bugzilla.kernel.org/>
References: <bug-35852-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-35852-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=35852

Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         Resolution|---                         |CODE_FIX

--- Comment #2 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to advaitdixit from comment #0)
> The socket man page says that setsockopt with level=SOL_SOCKET  and
> optname=SO_PRIORITY sets the TOS field in IP header:
> http://www.kernel.org/doc/man-pages/online/pages/man7/socket.7.html
> 
> However, my experiments and other web search results suggest that the socket
> man page is wrong. SO_PRIORITY does not seem to set the TOS field in the IP
> header.

A quick scan of the kernel source also finds nothing to suggest that
SO_PRIORITY sets the TOS field in the IP header.

Various URLs question this text in teh man page
http://mailman.isi.edu/pipermail/ns-developers/2012-September/010638.html
https://athena.ecs.csus.edu/~bransone/pub/misc/netfilter_notes/qos
https://ocrete.ca/2009/07/24/when-a-man-page-lies/
http://lkml.iu.edu/hypermail/linux/net/0512.3/0008.html

So, I'll remove this text from socket(7) (and also similar text in ip(7)), and
close this bug.

Thanks.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
