From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 103701] timegm() manpage suggests a terrible workaround
Date: Thu, 10 Mar 2016 20:00:33 +0000
Message-ID: <bug-103701-11311-csfj1gQARd@https.bugzilla.kernel.org/>
References: <bug-103701-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-103701-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=103701

--- Comment #2 from Stephen Hurd <shurd-f8dUBLffeLvR7s880joybQ@public.gmane.org> ---
I'm not sure why the manpage documents how to not use the function (obviously,
documenting *why* not to use it makes sense.)

If there's honestly no good way to emulate timegm() in a threadsafe manner,
should its use really be discouraged?

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
