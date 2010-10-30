From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] clone.2: remove forward reference to 2.6.28
Date: Sat, 30 Oct 2010 08:11:28 +0200
Message-ID: <AANLkTikgTd=onzd1rMkqfB8mcBhv+8ZA1xqV9MDG4_iB@mail.gmail.com>
References: <1287105955-32499-1-git-send-email-lucian.grijincu@gmail.com>
 <1287105955-32499-2-git-send-email-lucian.grijincu@gmail.com>
 <AANLkTik4kzXOTyeiYauMSri0xJVPamK4_RwxuJs9+Ufc@mail.gmail.com> <AANLkTi=QfA_h_U6A_W7TbYNXh2v2xnkbgLjVKRTJMX0X@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTi=QfA_h_U6A_W7TbYNXh2v2xnkbgLjVKRTJMX0X-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucian Adrian Grijincu <lucian.grijincu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexey Dobriyan <adobriyan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Emelyanov <xemul-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>, "Eric W. Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sun, Oct 24, 2010 at 6:13 PM, Lucian Adrian Grijincu
<lucian.grijincu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Sun, Oct 24, 2010 at 5:42 PM, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> I am reluctant to apply this patch, since it would be more useful to
>> document exactly when the implementation was completed. Would you be
>> able to determine this information and resubmit the patch?
>
> In http://lxc.sourceforge.net/man/lxc.html they say: "With the kernel
> 2.6.29, lxc is fully functional".

Lucian,

I applied the patch below, for man-pages-3.30.

Alexey, Pavel, Eric,pulling your names from the git logs, it looks
like you might be able to answer the question: by which kernel version
did the CLONE_NEWNET implementation become complete? We suppose it is
2.6.29, but it would be good to have confirmation

Cheers,

Michael


diff --git a/man2/clone.2 b/man2/clone.2
index a126a05..eadec90 100644
--- a/man2/clone.2
+++ b/man2/clone.2
@@ -288,8 +288,8 @@ This flag can't be specified in conjunction with
 .BR CLONE_SYSVSEM .
 .TP
 .BR CLONE_NEWNET " (since Linux 2.6.24)"
-(The implementation of this flag is not yet complete,
-but probably will be mostly complete by about Linux 2.6.28.)
+(The implementation of this flag was only completed
+by about kernel version 2.6.29.)

 If
 .B CLONE_NEWNET


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
