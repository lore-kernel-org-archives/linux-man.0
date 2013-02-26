From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 54271] readahead() docs incorrectly say it blocks
Date: Tue, 26 Feb 2013 03:15:45 +0000 (UTC)
Message-ID: <20130226031545.11FE811FB07@bugzilla.kernel.org>
References: <bug-54271-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-54271-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=54271





--- Comment #5 from Phillip Susi <psusi-3tLf1voIkJTQT0dZR+AlfA@public.gmane.org>  2013-02-26 03:15:44 ---
After closer inspection, it turned out to be the same issue as before.  I was
testing on an iso file I had downloaded with bittorrent, and looking at it with
debugfs showed that while the data blocks were contiguous, the extent tree was
fragmented, causing ext4 to have to block the readahead to read extent tree
blocks, the last of which was fairly close to the end of the file.  After
creating a new file with dd from /dev/zero, and verifying it did not have the
extent tree problem, readahead() does not block on the file.

Specifically running readahead ; iotop -d 2 ( after drop_caches ) immediately
completes the readahead, then iotop shows lots of read throughput for several
seconds.

So it seems that there are still some ext4 issues that cause readahead to block
more than you would want to, but as I said before, the call is not supposed to
block if possible.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
