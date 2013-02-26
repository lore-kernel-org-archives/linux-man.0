From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 54271] readahead() docs incorrectly say it blocks
Date: Tue, 26 Feb 2013 00:56:26 +0000 (UTC)
Message-ID: <20130226005626.3566411FB07@bugzilla.kernel.org>
References: <bug-54271-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-54271-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=54271





--- Comment #4 from Phillip Susi <psusi-3tLf1voIkJTQT0dZR+AlfA@public.gmane.org>  2013-02-26 00:56:25 ---
Around two years back I dug into why readahead() was blocking when it wasn't
supposed to and after discussion on linux-mm, it turned out to be due to ext3
using indirect blocks which had to be read first to learn the location of the
data blocks before they could be queued.  Switching to ext4 extents fixed that
and readahead() stopped blocking.  It seems there has been a regression
recently so I started a thread on linux-mm to try and figure it out.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
