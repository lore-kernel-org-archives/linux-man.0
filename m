From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 42042] strchr(3) and memchr(3) should explain behaviour when
 character 'c' is '\0'.
Date: Mon, 23 Apr 2012 20:36:57 GMT
Message-ID: <201204232036.q3NKavrf000617@bugzilla.kernel.org>
References: <bug-42042-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-42042-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=42042





--- Comment #7 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2012-04-23 20:36:56 ---
James,

Regarding memchr(), I'm not sure a change is warranted. memchr() is defined in
terms of 'bytes' and 'memory areas', rather than strings, so I'd have said it
would take an obtuse reading to consider that '\0' is interpreted specially
(whereas, as you say, one could be left doubtful about what strchr() does when
c is '\0'). 

I'd guess that this is also why POSIX and the FreeBSD man page make no
statement on this pont.

So, I'm inclined not to make a change.

Thanks,

Michael

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
