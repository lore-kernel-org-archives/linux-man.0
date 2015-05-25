From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 98851] the man page tc-filters is missing
Date: Mon, 25 May 2015 09:04:59 +0000
Message-ID: <bug-98851-11311-Ue7JP9ZQFY@https.bugzilla.kernel.org/>
References: <bug-98851-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-98851-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=98851

Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org

--- Comment #1 from Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> ---
not a problem w/the man-pages project: `tc` is provided by iproute2, not
man-pages.  my guess is it's a problem with your system (missing package) or
your distro (package is broken).  `man tc` works for me.

status -> RESOLVED:INVALID

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
