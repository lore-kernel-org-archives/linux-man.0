From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 54271] readahead() docs incorrectly say it blocks
Date: Mon, 25 Feb 2013 15:47:12 +0000 (UTC)
Message-ID: <20130225154712.3C90011FB5A@bugzilla.kernel.org>
References: <bug-54271-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-54271-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=54271





--- Comment #2 from Phillip Susi <psusi-3tLf1voIkJTQT0dZR+AlfA@public.gmane.org>  2013-02-25 15:47:11 ---
Common usage of the call ( see the ureadahead, sreadahead packages ),
inspection of blktrace data while using these packages, discussion on linux-mm,
inspection of the kernel sources.  The call *can* block, for instance, if it
must read ext2/3 indirect blocks to map the data blocks so their reads can be
queued, but the whole point of the call is to *avoid* blocking.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
