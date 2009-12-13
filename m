From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 14795] getdents manpage wrong
Date: Sun, 13 Dec 2009 09:19:21 GMT
Message-ID: <200912130919.nBD9JLm2009059@demeter.kernel.org>
References: <bug-14795-11311@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-14795-11311-V0hAGp6uBxO456/isadD/XN4h3HLQggn@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=14795





--- Comment #1 from blah-hRtevi7K+EU+Va1GwOuvDg@public.gmane.org  2009-12-13 09:19:21 ---
the d_type byte moving possibly means the length calculation for d_name in
there is wrong too.

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
