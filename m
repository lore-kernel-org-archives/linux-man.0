From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug
 84151]=?UTF-8?Q?=20right=20and=20side=20=E2=86=92=20right=20hand=20side?=
Date: Fri, 08 May 2015 09:37:51 +0000
Message-ID: <bug-84151-11311-5HUV4g97Ch@https.bugzilla.kernel.org/>
References: <bug-84151-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-84151-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=84151

--- Comment #5 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Dan Jacobson from comment #4)
> All I am trying to say is that you need a general bug tracker for such
> problems. People will not know that they are supposed to look in various
> files to find various names. And indeed posting to that list often meets
> with no answer. So do consider a Debian-like policy, where one can
> always still post to their bug-tracker, no matter what.

The kernel community is heterogeneous in this respect--some use the bug
tracker, some don't. There is no global (ly enforced) policy. BTSs are of
course not a panacea. I know from my own experience with Debisn that man pages
bug reports sometimes sit there for *years* unattended, sometimes even for
years after I add a note saying the problem is fixed upstream.

The general problem I think is this: Bug Trackers facilitate throwing a problem
to someone else, rather than rolling up your sleeves and getting involved in
the fixing yourself. Yes, we need bug reporters, but the problem is there
aren't enough bug *fixers*. And I think bug reports like this illustrate the
problem quite well. You may say that mails to that list are sometimes ignored,
and I won't disagree, but I think if you sent a well formatted patch to the
list, it'd likely be attended to. For my part, with respect to man-pages, I
explicitly request[1] that people don't use Bugzilla for this kind of report.

Thanks,

Michael

[1] https://www.kernel.org/doc/man-pages/reporting_bugs.html

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
