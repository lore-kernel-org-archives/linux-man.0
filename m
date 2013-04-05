From: Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: clone(2) should be clone(3)
Date: Fri, 05 Apr 2013 18:01:06 +0200
Message-ID: <515EF542.8090200@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Michael,

it looks like the clone(2) man page is describing glibc implementation
and not the system call. So I guess it should be moved to the section 3
and a new man page for clone(2) syscall should be created in section 2.

The clone(2) syscall is defined like this:

SYSCALL_DEFINE5(clone, unsigned long, clone_flags, unsigned long, newsp,
                  int __user *, parent_tidptr,
                  int __user *, child_tidptr,
                  int, tls_val)

(I'm sorry, but I don't have a patch this time.)

peter
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
