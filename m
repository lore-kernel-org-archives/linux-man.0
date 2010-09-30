From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 19382] oom_adj and oom_score are undocumented
Date: Thu, 30 Sep 2010 18:43:17 GMT
Message-ID: <201009301843.o8UIhH82028220@demeter1.kernel.org>
References: <bug-19382-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-19382-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=19382


Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org




--- Comment #1 from Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>  2010-09-30 18:43:13 ---
Documentation/filesystems/proc.txt contains some info in these 2 sections:

  3.1    /proc/<pid>/oom_adj & /proc/<pid>/oom_score_adj - Adjust the
oom-killer
                                score
  3.2    /proc/<pid>/oom_score - Display current oom-killer score


Are these correct or do they need to be updated?  If they need to be
updated, please send patches against this file.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
