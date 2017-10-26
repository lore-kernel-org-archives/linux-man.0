From: Tyler Hicks <tyhicks-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [PATCH 0/4] Document new seccomp interfaces in Linux 4.14
Date: Thu, 26 Oct 2017 04:11:38 +0000
Message-ID: <1508991102-13686-1-git-send-email-tyhicks@canonical.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This patchset adds documentation for most of the new user-facing features
(/proc interfaces, SECCOMP_GET_ACTION_AVAIL operation, SECCOMP_FILTER_FLAG_LOG
flag, SECCOMP_RET_LOG action) merged into Linux 4.14 (commit
c0a3a64e723324ae6dda53214061a71de63808c3). All of these features have something
to do with providing more flexible seccomp logging configuration except for the
SECCOMP_GET_ACTION_AVAIL operation. 

The remaining undocumented changes in 4.14 involve SECCOMP_RET_KILL being
renamed to SECCOMP_RET_KILL_THREAD and the new SECCOMP_RET_KILL_PROCESS action.
As I understand it, Kees Cook will be documenting those changes.

Tyler

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
