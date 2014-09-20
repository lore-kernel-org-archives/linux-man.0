From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 84871] New: Improve CONFIG_AUDITSYSCALL describtion
Date: Sat, 20 Sep 2014 22:16:30 +0000
Message-ID: <bug-84871-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=84871

            Bug ID: 84871
           Summary: Improve CONFIG_AUDITSYSCALL describtion
           Product: Documentation
           Version: unspecified
          Hardware: x86-64
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: nucrap-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org
        Regression: No

Hi,
I have recently configured my own kernel from pretty much from scratch and
nearly everything went well. One thing that made issues however was consolekit.

After some investigating and comparing my config with some generic kernels, the
issue turned out to be that I have deactivated CONFIG_AUDITSYSCALL.

The CONFIG_AUDITSYSCALL describtion states:

> Enable low-overhead system-call auditing infrastructure that can be used independently or with another kernel subsystem, such as SELinux.

Since I do not use SElinux I thought it was save to disable this feature.

IMO something like consolekit support should definately be mentioned in the
describtion alongside with SElinux, considering that it is probably more
frequently used than SElinux.
Otherwise it may be misleading.

Hope this gets fixed :)

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
