From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 19332] remove editorializing from malloc man page
Date: Thu, 30 Sep 2010 18:36:04 GMT
Message-ID: <201009301836.o8UIa4Mn018158@demeter2.kernel.org>
References: <bug-19332-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-19332-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=19332


landijk-user-/E1597aS9LQAvxtiuMwx3w@public.gmane.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Depends on|                            |19382




--- Comment #2 from landijk-user-/E1597aS9LQAvxtiuMwx3w@public.gmane.org  2010-09-30 18:36:01 ---
With regard to removing the instructions on how to disable overcommit, I
thought it would be better to simply direct people to the proper documentation,
so they can understand all the options.  But I'm not an expert in this area, so
I would be glad to put the instructions back in if that's the right thing.

With regard to the link to Red Hat, I think there is no kernel documentation on
oom_adj and oom_score.  If the manual page for malloc is going to discuss the
OOM killer, it ought to at least point to some documentation about how to tune
its behavior.

So I created a new bug for that, and now this bug depends on that one.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
