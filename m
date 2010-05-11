From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 15568] O_NONBLOCK is NOOP on block devices
Date: Tue, 11 May 2010 02:09:39 GMT
Message-ID: <201005110209.o4B29dWQ010693@demeter.kernel.org>
References: <bug-15568-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-15568-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=15568


Petr Baudis <pasky-+ZI9xUNit7I@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |pasky-+ZI9xUNit7I@public.gmane.org




--- Comment #1 from Petr Baudis <pasky-+ZI9xUNit7I@public.gmane.org>  2010-05-11 02:09:35 ---
 I find the patch rather intrusive; it seems reasonable to me to devote no more
than a short sentence in the NOTES section to it in each manpage (or more, but
really just in the NOTES section); it should be also noted as of which kernel
version does this hold.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
