From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 120671] missing info about userns restrictions
Date: Tue, 21 Jun 2016 19:56:44 +0000
Message-ID: <bug-120671-11311-ABmfLRwju4@https.bugzilla.kernel.org/>
References: <bug-120671-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-120671-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D120671

--- Comment #11 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Micha=C5=82 Zegan from comment #10)
> I believe you can mount cgroup2 if cgroup namespaces are enabled and =
used,
> you can also verify if it may apply to cgroupv1 fs?

Could you please test and let me know. (My quick test suggest not.)

> About the text you proposed: can you actually have CAP_SYS_ADMIN in b=
oth
> user namespaces at the same time? I mean in initial and noninitial?

Read the user_namespaces(7) man page. I believe it answers this questio=
n.

--=20
You are receiving this mail because:
You are watching the assignee of the bug.--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
