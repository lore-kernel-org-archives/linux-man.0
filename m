From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 12919] posix_fallocate: what if len == 0?
Date: Mon, 30 Mar 2009 01:20:19 GMT
Message-ID: <200903300120.n2U1KJka010038@demeter.kernel.org>
References: <bug-12919-11311@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-12919-11311-V0hAGp6uBxO456/isadD/XN4h3HLQggn@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=12919


Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org




--- Comment #1 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2009-03-30 01:20:18 ---
(In reply to comment #0)

Hi,

Thanks for the great supporting info on this bug report.

> Hi,
> I noticed the following in the manpage for posix_fallocate.  It currently (in
> man-pages 3.19) says under "Errors":
>   EINVAL  offset or len was less than 0.
> However, the Linux kernel also returns EINVAL if len is *equal* to 0.  (See
> fallocate() in
> http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=blob_plain;f=fs/open.c;hb=HEAD).
>  This follows IEEE Std 1003.1-2001, which says
> (http://www.opengroup.org/onlinepubs/009695399/functions/posix_fallocate.html):
> [EINVAL]
>     The len argument was zero or the offset argument was less than zero.
> (Interestingly, this doesn't mention what should happen if len is negative...)
> However POSIX.1-2008 says
> (http://www.opengroup.org/onlinepubs/9699919799/functions/posix_fallocate.html):
> [EINVAL]
>     The len argument is less than zero, or the offset argument is less than   
> zero, or the underlying file system does not support this operation.
> Thus the manpage should probably be updated to reflect that you cannot rely on
> len being allowed to be 0 in portable code.

For man-pages-3.20, I added the words "or equal" when talking about 'len;under
teh EINVAL description.  I also added text under CONFORMING TO describing the
POSIX.1-* specifications for the EINVAL error.

Cheers,

Michael

PS See also:
https://www.opengroup.org/austin/interps/uploads/40/14574/AI-162.txt

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
