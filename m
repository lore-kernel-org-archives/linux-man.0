From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 70141] getxattr(2): #include <attr/xattr.h> problem
Date: Thu, 06 Feb 2014 18:40:18 +0000
Message-ID: <bug-70141-11311-ZolZW07djA@https.bugzilla.kernel.org/>
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

--- Comment #4 from Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> ---
(In reply to Fabrice Bauzac from comment #2)

ok, but i didn't say sys/xattr.h, i said attr/xattr.h

(In reply to Michael Kerrisk from comment #3)

i think these manpages were originally imported from the attr project ?

the "standard" funcs have been provided by glibc for a long time:
 - {l,f,}getxattr
 - {l,f,}listxattr
 - {l,f,}removexattr
 - {l,f,}setxattr

the attr package provides more funcs than those, and it provides command line
utils for interacting with file xattrs, so it's not a completely obsolete
package (at least for Linux)

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
