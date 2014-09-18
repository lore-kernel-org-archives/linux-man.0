From: Paolo Bonzini <pbonzini-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: euidaccess/faccessat vs. ACLs
Date: Thu, 18 Sep 2014 14:25:05 +0200
Message-ID: <541ACF21.5060105@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jiri Popelka <jpopelka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi,

the euidaccess and faccessat(AT_EACCESS) functions are emulated in glibc
and only look at the file's uid/gid.  They do not take ACLs into
account, and this can cause subtle bugs.  This should be noted in the
BUGS section.

Also, the AT_SYMLINK_NOFOLLOW flag to faccessat currently will not work
if specified alone, because Linux does not have an laccess() system
call.  It works if specified together with AT_EACCESS, modulo the above
ACL bug of course.

Paolo
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
