From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 15952] man page cmsg(3) inconsistency
Date: Tue,  4 Jun 2013 22:58:00 +0000 (UTC)
Message-ID: <20130604225800.3564011FB0C@bugzilla.kernel.org>
References: <bug-15952-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-15952-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=15952





--- Comment #2 from Josh Bowman <jbowman-2iQDLUlslvR8UrSeD/g0lQ@public.gmane.org>  2013-06-04 22:57:59 ---
(Sorry, that's section 4.2 of rfc 2292.)  

It looks like there's more detail in Appendix A of rfc 3542 (section 20.2):
"While sending an application may or may not include padding at the end of last
ancillary data in msg_controllen and implementations must accept both as
valid."

This seems to indicate that the sample code could be correct either way, but
only because there's only one control message in the buffer. I think it's still
confusing, and should be changed to show msg.msg_controllen initialized with a
value coming from CMSG_SPACE. (Or at least to make clear why we can get away
with using cmsg_len in this case.)

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
