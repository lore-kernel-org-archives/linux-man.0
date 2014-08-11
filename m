From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 80541] man pages for unimplemented functions provoke name clash
Date: Mon, 11 Aug 2014 16:37:18 +0000
Message-ID: <bug-80541-11311-WqCANdUtyD@https.bugzilla.kernel.org/>
References: <bug-80541-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-80541-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=80541

--- Comment #2 from Joachim Wuttke <j.wuttke-97/bSmCnXvjoK6nBLMlh1Q@public.gmane.org> ---
(In reply to Michael Kerrisk from comment #1)

cerf(3) and related functions are provided by libcerf. Source available from
http://apps.jcns.fz-juelich.de/doku/sc/libcerf. For binary packages, see links
at bottom of that page.

Removing the man pages of the non-implemented functions sounds like the easiest
and most straightforward solution to me. Thanks for considering this further.

Best regards - Joachim

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
