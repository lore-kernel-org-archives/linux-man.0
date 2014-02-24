From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 70801] ptrace PEEKDATA API is incorrect
Date: Mon, 24 Feb 2014 21:26:21 +0000
Message-ID: <bug-70801-11311-KZjYoBtnjv@https.bugzilla.kernel.org/>
References: <bug-70801-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-70801-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=70801

--- Comment #4 from Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> ---
(In reply to Michael Kerrisk from comment #2)

thanks, i got the same bad vibe and ignored it to focus on the technical bits

the ptrace ABI continues to make me sad due to its lack of unittests.  the
utrace API for a while looked like it'd address that, but i guess that work has
failed to merge :(.

i'd like to have a master location to document all this stuff at the kernel ABI
level.  can we do that with the man-pages project somehow without violating the
C library API tenant ?

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
