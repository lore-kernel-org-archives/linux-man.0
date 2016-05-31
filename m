From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 119351] misleading information about buffer size limits in
 tcp(7)
Date: Tue, 31 May 2016 17:55:26 +0000
Message-ID: <bug-119351-11311-ujcWSwHF8g@https.bugzilla.kernel.org/>
References: <bug-119351-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-119351-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=119351

--- Comment #1 from Nadav Har'El <nyh-TS7m/3hpY0sOpacJJkBjfT4kX+cae0hd@public.gmane.org> ---
Hmm, reading the text again, the tcp_rmem section actually states that: "This
value does not override  the  global net.core.rmem_max.". It's not clear what
this actually means: Does it mean tcp_rmem maximum is just ignored? That it
cannot *increase* core.rmem_max? Or what?

This whole topic is really unclear in tcp(7) :-(

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
