From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 50151] glibc 2.16 included a new function __ppc_get_timebase
Date: Tue, 12 May 2015 22:12:16 +0000
Message-ID: <bug-50151-11311-P67GQs6NFb@https.bugzilla.kernel.org/>
References: <bug-50151-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-50151-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=50151

--- Comment #6 from Tulio Magno Quites Machado Filho <tuliom-Igl6534fJ5VwFqzsTH5u/w@public.gmane.org> ---
(In reply to Michael Kerrisk from comment #5)
> Okay -- this fell on the ground for a very long time. Sorry about that. But
> your patch is applied now.

Thanks for applying it!

> What shall we do about __ppc_get_timebase_freq()?  (I see there is documentation in the glibc manual.)

Yes, it does.
I'll add it to the same man page.  Just give me some time because I'll be on a
trip for the next 2 weeks.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
