From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 60807] not all the pages are encoded using utf-8
Date: Fri, 14 Feb 2014 12:47:13 +0000
Message-ID: <bug-60807-11311-sXbA67eEwN@https.bugzilla.kernel.org/>
References: <bug-60807-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-60807-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=60807

--- Comment #5 from Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> ---
Hi Michael,

1. It looks like it works without the encoding line, but as Colin said in the
email, it's better with it.

2. Also, greatly answered by Colin, I'll just add that we are converting
man-pages to utf-8 since before the first RHEL-6 was released, when Fedora
wasn't using the man-db but man 1.6. In general, we convert almost everything
to the utf-8 what is not and has special characters, otherwise it's usually
troubles..

peter

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
