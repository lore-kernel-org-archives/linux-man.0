From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 84871] Improve CONFIG_AUDITSYSCALL describtion
Date: Wed, 10 Dec 2014 19:29:50 +0000
Message-ID: <bug-84871-11311-wOTHTbPtw3@https.bugzilla.kernel.org/>
References: <bug-84871-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-84871-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=84871

Alan <alan-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alan-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org

--- Comment #1 from Alan <alan-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org> ---
The kernel can't really keep up with every one of a million random build
options of a million user space packages.

The best bet is usually to start from the vendors .config

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
