From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 76851] inotify_rm_watch(2) unspecified behavior
Date: Mon, 26 May 2014 16:38:43 +0000
Message-ID: <bug-76851-11311-JWr1plZj0w@https.bugzilla.kernel.org/>
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

--- Comment #3 from Jeff <junk.jsmith+kernel.org-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Michael Kerrisk from comment #2)
> Jeff, thanks for the report. You're quite correct that there's no spec for
> the behavior (and your points about the implications of the lack of such
> spec are right on the money). However, man-pages is (sadly) not a spec, at
> least given current development practices. Nevertheless, something should be
> documented.
> 
> One thing that would have been useful in the bug report would have been a
> statement of what the existing behavior actually is. As far as I can see, as
> things stand, if a watch is removed, pending unread events for that watch
> descriptor remain pending. Can you confirm?

Michael, I can confirm that this behavior, for at least 3.x kernels. I didn't
test this or dig through the kernel source for anything older though.

I've not been involved enough in the kernel scene to know best how to approach
this, so far as claiming what exactly seemed wrong, but the documentation
seemed like the most innocuous reasonable place to start. I frankly don't even
know where "standard" system call APIs are supposed to be officially specified,
if anywhere.

I tried to be dispassionate in my initial report since I don't know what
peoples' intents were, but it's my opinion that the current behavior is bad
enough to warrant changing. I've never used any other multiplexing interface
that can deliver events after a handle de-registration. I've also never seen
anyone's inotify-handling code other than my own that even tried to safely
handle late queued updates, and I suspect that some fraction of those people
are ignorant of the hazards.

As I tried to imply above, extant IN_IGNORE event generation would provide
sufficient safety from client poll/rm/read deadlock races in the event of an
implementation change, but I don't have the slightest clue about tactfully
approaching the kernel community with this, being a non-established individual.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
