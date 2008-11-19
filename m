From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Current state of CLONE_NEWUSER?
Date: Wed, 19 Nov 2008 15:04:22 -0500
Message-ID: <cfd18e0f0811191204r4ccaeaf4m4145e67f408543e0@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Serge Hallyn <serue-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
Cc: Subrata Modak <subrata-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, clg-NmTC/0ZBporQT0dZR+AlfA@public.gmane.org, herbert-dBHVzrDq9nF4Lj/PQRBjDg@public.gmane.org, dev-3ImXcnM4P+0@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Serge,

What is the current status of CLONE_NEWUSER?  I'm currently trying to
test this flag in preparation for documenting it in the clone(2) man
page, but am running into an ENOMEM error from the clone() call, which
seems to occur after a failure in kobject_init_and_add() in the
following call sequence:

clone_user_ns() --> alloc_uid() --> uids_user_create() -->
kobject_init_and_add()

Are there already some test programs somewhere?  Is there any
documentation already available for this flag?

Thanks,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
