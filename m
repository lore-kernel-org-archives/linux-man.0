From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 70141] getxattr(2): #include <attr/xattr.h> problem
Date: Thu, 06 Feb 2014 13:30:20 +0000
Message-ID: <bug-70141-11311-iLFiYWy5Z7@https.bugzilla.kernel.org/>
References: <bug-70141-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-70141-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=70141

Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org

--- Comment #1 from Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> ---
attr/xattr.h is provided by the attr package (which might be named diff
depending on your distro).  historically it was the provider of xattr
functionality.

that said, current versions of glibc provide equivalent functionality so there
shouldn't be a need to point people to the attr package.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
