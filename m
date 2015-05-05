From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 80541] man pages for unimplemented functions provoke name clash
Date: Tue, 05 May 2015 08:38:55 +0000
Message-ID: <bug-80541-11311-84GlE70cHS@https.bugzilla.kernel.org/>
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

--- Comment #3 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Summary: These functions don't exist in glibc, aren't specified in C99 or C11
(those standards merely reserve the names for future use), cause package
conflicts for libcerf (http://apps.jcns.fz-juelich.de/doku/sc/libcerf), which
does provide implementations and man-pages for these functions, and cause
confusion for readers who (not looking too closely at the page) wonder where
the glibc implementation is.

I've removed the cerf(3) and its links from man-pages. Sorry for the slow
follow up.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
