From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 50151] glibc 2.16 included a new function __ppc_get_timebase
Date: Wed, 23 Jan 2013 19:12:52 +0000 (UTC)
Message-ID: <20130123191252.4CE4211FC76@bugzilla.kernel.org>
References: <bug-50151-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-50151-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=50151





--- Comment #2 from Tulio Magno Quites Machado Filho <tuliom-Igl6534fJ5VwFqzsTH5u/w@public.gmane.org>  2013-01-23 19:12:52 ---
(In reply to comment #1)
> What's the significance of the __" prefix in this function name?

It was a convention adopted for platform specific functions.
You may find more information in
http://www.gnu.org/software/libc/manual/html_node/Adding-Platform_002dspecific.html#Adding-Platform_002dspecific

> Is this function really intended for userspace?

Yes.

> Also, what about __ppc_get_timebase_freq(). Does it likewise need to be
> documented?

Yes. I'm also planning to prepare it's manpage.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
