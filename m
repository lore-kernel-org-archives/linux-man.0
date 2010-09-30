From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 19332] remove editorializing from malloc man page
Date: Thu, 30 Sep 2010 19:01:54 GMT
Message-ID: <201009301901.o8UJ1s2o028814@demeter2.kernel.org>
References: <bug-19332-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-19332-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=19332


Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org




--- Comment #3 from Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>  2010-09-30 19:01:48 ---
i'd agree with the linking to a diff man page.  proc(5) already has a section
on overcommit_memory.  perhaps that should be extended with the stuff from
malloc(3) and then malloc(3) simply makes an explicit note to also read about
overcommit_memory in proc(5).

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
