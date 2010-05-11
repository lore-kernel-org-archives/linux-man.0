From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 15568] O_NONBLOCK is NOOP on block devices
Date: Tue, 11 May 2010 03:38:43 GMT
Message-ID: <201005110338.o4B3chdg027960@demeter.kernel.org>
References: <bug-15568-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-15568-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=15568





--- Comment #2 from Mike Hayward <mh-linux-kernel-AB0c8HnZplU@public.gmane.org>  2010-05-11 03:38:38 ---
Petr, nice to see you reviewed my patch.  As noted above I have demonstrated
this problem exists on numerous kernel versions both old and new; I have been
using linux extensively for about fifteen years now and there is no reason to
believe that there exists any version in which the semantics are actually
nonblocking.  I do not see that the architecture is or has ever been capable of
nonblocking behavior as this family of calls is tightly coupled to the
submitting thread.  To list all versions of linux and continue to update them
would be awkward at best.  If you can find a version in which it is
nonblocking, I would be interested in testing it and reviewing the code.

It has been so long since I submitting this patch that I have no memory of what
exact language is in it, but it was reviewed by a number of other engineers who
did not comment as you have (actually a couple of them wanted more detail). 
Perhaps your idea is a good one and there is a better way; please feel free to
revise or submit another patch if you can improve upon this one.  I think the
important thing is that the actual semantics get documented in the man pages. 
The current incorrect documentation of the behavior of O_NONBLOCK has and
continues to repeatedly lead to confusion, wasted timed and effort, and
unnecessary traffic on lkml as developers eventually learn the actual behavior
and move to libaio, sg, or other nonblocking system calls.

Out of curiousity, do you or anyone else happen to know who the original author
was who documented these io calls as having nonblocking behavior?  It would be
interesting to have the original author's input.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
