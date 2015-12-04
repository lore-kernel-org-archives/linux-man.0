From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 108821] dlopen example with libm.so is incorrect
Date: Fri, 04 Dec 2015 19:24:31 +0000
Message-ID: <bug-108821-11311-V3GwMOYwyk@https.bugzilla.kernel.org/>
References: <bug-108821-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-108821-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=108821

--- Comment #2 from Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> ---
(In reply to Michael Kerrisk from comment #1)
> Hi Florian,
> 
> I'm reluctant code a glibc dependency into what I would like to be a fairly
> vanilla dlopen example.

Fair point.  Although the example might confuse users because even where it
works, it typically needs development packages at run time (because the .so
link are only installed by them).

> What if I used a function from libc itself (e.g.,
> strlen()). Does the same issue exist?

libc.so is a linker script, too.  libm.so.6 and libc.so.6 are not, but they are
glibc-specific to (some moderately current Solaris versions use libm.so.2 and
libc.so.1, for example).

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
