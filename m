From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 19332] remove editorializing from malloc man page
Date: Thu, 30 Sep 2010 08:22:15 GMT
Message-ID: <201009300822.o8U8MFC2027091@demeter2.kernel.org>
References: <bug-19332-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-19332-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=19332


Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |pasky-AlSwsSmVLrQ@public.gmane.org




--- Comment #1 from Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>  2010-09-30 08:22:13 ---
I agree that the paragraph should be rewritten; it always strucks me as really
opinionated one as well every time I stumble upon it. Moreover, I'd move it
from section BUGS to section NOTES.

I do not think it is wise to remove the information on how to turn it off,
though - I see no harm in keeping the extra information. There are already
references to more documentation in the manual page; if there is anything extra
in the web page referenced, the information should be added to the kernel
documentation, I think. I think it is wise to avoid web references in general
whenever possible since most URLs actually tend to be quite volatile, and
vendor-specific documentation specifically to avoid any bias, informational or
otherwise.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
