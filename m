From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 91931] fflush(3) is misleading about input streams
Date: Wed, 28 Jan 2015 08:31:33 +0000
Message-ID: <bug-91931-11311-Hc8f73Wj4f@https.bugzilla.kernel.org/>
References: <bug-91931-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-91931-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=91931

--- Comment #3 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to cubbi from comment #0)

> On a very minor note, fflush(3) also claims that
> "The standards do not specify the behavior for input streams"
> 
> This is no longer precisely correct; POSIX specifies behavior for seekable
> input streams to move fileno's offset to match FILE's offset and undo all
> ungetc's:
> http://pubs.opengroup.org/onlinepubs/9699919799/functions/fflush.html and
> glibc conforms to that (or tries to,
> https://sourceware.org/bugzilla/show_bug.cgi?id=5994 is still open)

Thanks. I modified the text to note that POSIX.1-2008 does add specification
for input streams.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
