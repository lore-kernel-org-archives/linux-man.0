From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 14001] eventfd manpage missing EFD_SEMAPHORE flag
Date: Mon, 30 Aug 2010 05:29:54 GMT
Message-ID: <201008300529.o7U5TsgG013372@demeter1.kernel.org>
References: <bug-14001-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-14001-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=14001


Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org




--- Comment #1 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2010-08-30 05:29:50 ---
For man-pages-3.26, I added this text:

       EFD_SEMAPHORE (since Linux 2.6.30)
              Provide semaphore-like semantics  for  reads  from
              the new file descriptor.  See below.
...
              *  If EFD_SEMAPHORE  was  not  specified  and  the
                 eventfd  counter  has  a  nonzero value, then a
                 read(2) returns 8 bytes containing that  value,
                 and the counter's value is reset to zero.

              *  If  EFD_SEMAPHORE was specified and the eventfd
                 counter has a nonzero  value,  then  a  read(2)
                 returns 8 bytes containing the value 1, and the
                 counter's value is decremented by 1.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
