From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 23072] preadv(2) and pwritev(2) lack man pages, pread64(2) and
 pwrite64(2) aren't mentioned on their man pages
Date: Sun, 21 Nov 2010 05:44:53 GMT
Message-ID: <201011210544.oAL5irq3022423@demeter1.kernel.org>
References: <bug-23072-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-23072-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=23072


Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|                            |CODE_FIX
         AssignedTo|documentation_man-pages@ker |mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
                   |nel-bugs.osdl.org           |




--- Comment #1 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2010-11-21 05:44:52 ---
Eugene, this would have been best submitted as two bug reports, because these
really are two separate issues.

However, by chance, I had recently dealt with on of the issues: the lack of a
preadv() and pwritev() documentation (now added to the readv(2) page).

Your report triggered me to deal with the other issue as well. I added a note
as follows:

       On  Linux,  the  underlying  system calls were renamed in
       kernel 2.6: pread() became pread64(), and pwrite() became
       pwrite64(),  The  system  call numbers remained the same.
       The glibc pread() and pwrite() wrapper  functions  trans-
       parently deal with the change.

All of the changes are already pushed to git,and will be in man-pages 3.32.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
