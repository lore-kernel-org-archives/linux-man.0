From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 82841] sendfile doesn't work with O_APPEND
Date: Fri, 22 Aug 2014 08:31:48 +0000
Message-ID: <bug-82841-11311-wpcpf5WhcB@https.bugzilla.kernel.org/>
References: <bug-82841-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-82841-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=82841

--- Comment #3 from Alan <alan-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org> ---
sendfile is just a wrapper around splice()

Whether it could therefore support O_APPEND is a good question - but one that
would need asking and discussing on the lists not here, and someone to
contribute the patches to do so.

In the meantime we ought to get the man page fixed.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
