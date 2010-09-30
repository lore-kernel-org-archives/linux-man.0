From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 19332] remove editorializing from malloc man page
Date: Thu, 30 Sep 2010 20:10:17 GMT
Message-ID: <201009302010.o8UKAHHU007403@demeter1.kernel.org>
References: <bug-19332-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-19332-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=19332





--- Comment #4 from landijk-user-/E1597aS9LQAvxtiuMwx3w@public.gmane.org  2010-09-30 20:10:11 ---
Created an attachment (id=32102)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=32102)
clean up paragraph, point to proc(5)

Indeed the proc man page has plenty of information about overcommit, and seems
to to be the right place to treat the subject.  This patch:

* removes inflammatory language
* moves the paragraph to the beginning of the notes section
* points the reader to the overcommit_memory and oom_adj sections of proc(5)

It was tested using "man -l" with man version 2.5.7.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
