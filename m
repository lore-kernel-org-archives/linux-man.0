From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 118311] Non-free licensed man pages
Date: Tue, 05 Jul 2016 09:17:37 +0000
Message-ID: <bug-118311-11311-hxMOoJqDAX@https.bugzilla.kernel.org/>
References: <bug-118311-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-118311-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=118311

Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #1 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Tom, what's the problem with man2/sysinfo.2? The page source says that
modifications are freely allowed.

Regarding man2/getitimer.2, I've just made some substantial changes to better
describe the APIs, and in fact the page has been modified repeatedly over the
years, and little of the original text remains. I presume the failure by the
original author to grant permission to modify was simply an oversight;
certainly, the large number of people who have changed the page have taken that
to be the case. In the light of all of these facts (and that I'm the majority
author by now), I've changed the license text to note that modifications are
freely permitted.

man2/pciconfig_read.2 is a little more tricky. I assume the failure to
explicitly mention that modifications are allowed was unintentional. The page
has seen modifications over time, but they've all been minor/mechanical. Not
sure what to do there. I find no signs of activity on the email address given
in the page during the last 10 years, which at the least suggests that email
address is no longer active. But, it looks like this is him on LinkedIn:
https://www.linkedin.com/in/niki-rahimi-57766b7. I'll try to contact him.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
