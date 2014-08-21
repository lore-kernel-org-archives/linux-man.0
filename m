From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 82841] sendfile doesn't work with O_APPEND
Date: Thu, 21 Aug 2014 15:22:42 +0000
Message-ID: <bug-82841-11311-XkyyouukoS@https.bugzilla.kernel.org/>
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

Alan <alan-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alan-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org
          Component|Other                       |man-pages
           Assignee|io_other-ztI5WcYan/vQLgFONoPN6+46SIhDJjyZ@public.gmane.org |documentation_man-pages@ker
                   |rg                          |nel-bugs.osdl.org
            Product|IO/Storage                  |Documentation

--- Comment #1 from Alan <alan-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org> ---
O_APPEND is not supported for sendfile().

It's documented in the splice() manual page but not for sendfile so I've moved
this to a documentation bug

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
