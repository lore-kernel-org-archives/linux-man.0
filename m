From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 76851] inotify_rm_watch(2) unspecified behavior
Date: Mon, 26 May 2014 09:10:02 +0000
Message-ID: <bug-76851-11311-5sWoasewUf@https.bugzilla.kernel.org/>
References: <bug-76851-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-76851-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=76851

Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #2 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Jeff from comment #0)
> The inotify interface leaves unspecified what happens to potentially
> "pending" watch events (i.e., caught by the kernel but not yet read()) after
> an inotify_rm_watch() call.
> 
> IN_IGNORE flagged events *allow* inotify_rm_watch() calls to be monitored
> asynchronously, but it is not stated whether triggering actions between a
> most recent read() and an inotify_rm_watch() call *require* all other watch
> events to be handled so when users key map inotify_event wd fields to local
> objects.
> 
> Similarly, a conservative user would need to keep a queue of removed objects
> formerly associated with a watch descriptor if it is assumed possible that
> the kernel can both deliver events on an rm'd wd and reuse wds before the
> last pertinent event has been read.
> 
> If the purpose of IN_IGNORE being generated on the watch removal is to
> protect against poll/blocking-read vs. inotify_rm_watch() races, it should
> be plainly stated. Likewise, if it is needed for safely reacting to "stale"
> events, this should be explained. I believe that the current language of
> inotify_rm_watch(2) and the read(2) section of inotify(7) leave both
> interpretations defensible, which is sub-optimal.


Jeff, thanks for the report. You're quite correct that there's no spec for the
behavior (and your points about the implications of the lack of such spec are
right on the money). However, man-pages is (sadly) not a spec, at least given
current development practices. Nevertheless, something should be documented.

One thing that would have been useful in the bug report would have been a
statement of what the existing behavior actually is. As far as I can see, as
things stand, if a watch is removed, pending unread events for that watch
descriptor remain pending. Can you confirm?

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
