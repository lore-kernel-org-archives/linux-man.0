From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 42042] strchr(3) and memchr(3) should explain behaviour when
 character 'c' is '\0'.
Date: Wed, 31 Aug 2011 09:05:49 GMT
Message-ID: <201108310905.p7V95nBR000780@demeter2.kernel.org>
References: <bug-42042-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-42042-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=42042





--- Comment #3 from James Hunt <jamesodhunt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2011-08-31 09:05:48 ---
Created an attachment (id=70962)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=70962)
test program showing behaviour of strchr, strrchr, memchr, strchrnul, and
strstr.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
