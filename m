From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 42704] execve may return EAGAIN on v3.1 or later
Date: Wed, 18 Apr 2012 00:23:10 GMT
Message-ID: <201204180023.q3I0NAp5018003@bugzilla.kernel.org>
References: <bug-42704-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-42704-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=42704





--- Comment #2 from KOSAKI Motohiro <kosaki.motohiro-+CUm20s59erQFUHtdCDX3A@public.gmane.org>  2012-04-18 00:23:10 ---
Hmm..

I'm not Vasiliy and I couldn't add him to cc list (I don't know why).
But maybe I can answer this.

Now, many many applications don't check the return code and this ignorance may
make critical security issue. set*id() is usually used for dropping root
privilege 
 and then a failure mean application run untrusted code w/ root privilege.
that's dangerous. then, set*id() should ignore rlimit and always can drop a
privilege.

In the other hand, execve() is used for getting a privilege. then a failure is
not security threat.

Next, applications still should check set*uid() return value because it may run
on older kernel.

thank you.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
