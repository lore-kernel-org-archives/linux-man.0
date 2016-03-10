From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 103701] timegm() manpage suggests a terrible workaround
Date: Thu, 10 Mar 2016 22:16:18 +0000
Message-ID: <bug-103701-11311-SBDVkeMm4r@https.bugzilla.kernel.org/>
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

Mats Wichmann <mats-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mats-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org

--- Comment #3 from Mats Wichmann <mats-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org> ---
The Gnu glibc documentation has something like this in the portability notes. 
Often the genesis of comments when there's a strange disclaimer in the manpage
:)

I guess I'd suggest the page emphasize the UTC aspect and mention the
threadsafe issue, and stop there - not try to document a workaround.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
