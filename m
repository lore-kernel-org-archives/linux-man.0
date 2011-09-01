From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 42042] strchr(3) and memchr(3) should explain behaviour when
 character 'c' is '\0'.
Date: Thu, 1 Sep 2011 08:04:51 GMT
Message-ID: <201109010804.p8184pZk003860@demeter1.kernel.org>
References: <bug-42042-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-42042-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=42042





--- Comment #5 from James Hunt <jamesodhunt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2011-09-01 08:04:46 ---
The BSD folk already have this behaviour documented in their man pages:

http://www.freebsd.org/cgi/man.cgi?query=strchr&apropos=0&sektion=0&manpath=FreeBSD+8.2-RELEASE&arch=default&format=html

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
