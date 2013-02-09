From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 23282] vsnprintf(3) example promotes code which ignores error
 return code
Date: Sat,  9 Feb 2013 00:16:38 +0000 (UTC)
Message-ID: <20130209001638.72F5E11FE9A@bugzilla.kernel.org>
References: <bug-23282-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-23282-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=23282





--- Comment #2 from Graham Gower <graham.gower-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2013-02-09 00:16:38 ---
Marshel, that patch does not address the ambiguity created by backwards
compatibility with glibc 2.0.6, it merely removes the backwards compatilibility
(while retaining notes that it is compatible). You also omit the return value
in your return statement.

I'd be happy with the backwards compatibility removed (and a note to that
effect), given glibc 2.0 is now 15 years old. The code could then be
simplified. At the time I encountered this issue, I wrote the following code,
which would just error out in the case of truncation with old glibc.
http://code.google.com/p/opkg/source/browse/trunk/libopkg/sprintf_alloc.c

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
