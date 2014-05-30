From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 76851] inotify_rm_watch(2) unspecified behavior
Date: Fri, 30 May 2014 12:24:00 +0000
Message-ID: <bug-76851-11311-q7imnnq1iG@https.bugzilla.kernel.org/>
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

--- Comment #7 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Jeff from comment #3)

Hi Jeff,

> I tried to be dispassionate in my initial report since I don't know what
> peoples' intents were, but it's my opinion that the current behavior is bad
> enough to warrant changing. I've never used any other multiplexing interface
> that can deliver events after a handle de-registration. I've also never seen
> anyone's inotify-handling code other than my own that even tried to safely
> handle late queued updates, 

(I have some code that handles it.)

> and I suspect that some fraction of those people
> are ignorant of the hazards.

I expect you are right,

> As I tried to imply above, extant IN_IGNORE event generation would provide
> sufficient safety from client poll/rm/read deadlock races in the event of an
> implementation change, but I don't have the slightest clue about tactfully
> approaching the kernel community with this, being a non-established
> individual.

I'm not sure I understand the sentence "As I tried to imply...", but I'm
guessing you mean that it would be sufficient to discard all pending events
except the IN_IGNORED event, right?

It depends on the use case, I guess, some folk would, I expect, want to do log
tracking -- that is, record all events that happened on a file. Such
applications wouldn't want events to be discarded.

Cheers,

Michael

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
