From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: gethostbyname(3) / IPv6
Date: Mon, 11 May 2015 11:17:01 +0200
Message-ID: <5550738D.1090909@gmail.com>
References: <Pine.LNX.4.64.1003040102490.6496@login01.caesar.elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <Pine.LNX.4.64.1003040102490.6496-a7N6hpt6sEOGMAd2kvhVmjlnRINgEMlm@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Ersek, Laszlo" <lacos-hjAHdpL4VZo5Z0SDYBDJZg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Laszlo,

On 03/04/2010 01:14 AM, Ersek, Laszlo wrote:
> Hi,
> 
> we were having a discussion in the comp.unix.programmer Usenet newsgroup, 
> starting with Message-ID: 
> <e8e1cb1d-9693-4803-bf29-b4828de384e0-nbjlO0B5Z98wq+9lhVFwFGB/v6IoIuQBVpNB7YpNyf8@public.gmane.org>. 
> Consequently, I'd like to report two bugs (in separate e-mails):
> 
> (2/2) gethostbyname(3) fails to resolve the IPv6 address "::1", but the 
> manual page says: "If name is an IPv4 or IPv6 address, no lookup is 
> performed and gethostbyname() simply copies name into the h_name field 
> [...]".
> 
> Debian bug report:
> 
> http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=455762
> 
> glibc bug report:
> 
> http://sourceware.org/bugzilla/show_bug.cgi?id=5479
> 
> SUSv3 link for gethostbyname(3):
> 
> http://www.opengroup.org/onlinepubs/000095399/functions/gethostbyname.html
> 
> It seems that the glibc behavior is conformant, and the manual page is in 
> error.
> 
> I'm using the manpages-dev package, version 3.05-1, under Debian Lenny. 
> However, before sending this report, I've verified the bug's existence in 
> the online page under
> 
> http://www.kernel.org/doc/man-pages/online/pages/man3/gethostbyname.3.html
> 
> If this goes anywhere on linux-man@vger, please keep me CC'd.

Late follow up. That text about Ipv6 addresses has been in the
man page since the beginning, but it appears that the author
didn't test this point. I verified your test. The appropriate
path seems to remove mention of IPv6 from the man page, which I 
have done with the patch below.

Thanks for the report.

Cheers,

Michael

diff --git a/man3/gethostbyname.3 b/man3/gethostbyname.3
index e0b94b0..d79eb32 100644
--- a/man3/gethostbyname.3
+++ b/man3/gethostbyname.3
@@ -149,13 +149,11 @@ for the given host
 .IR name .
 Here
 .I name
-is either a hostname, or an IPv4 address in standard dot notation (as for
-.BR inet_addr (3)),
-or an IPv6 address in colon (and possibly dot) notation.
-(See RFC\ 1884 for the description of IPv6 addresses.)
+is either a hostname or an IPv4 address in standard dot notation (as for
+.BR inet_addr (3)).
 If
 .I name
-is an IPv4 or IPv6 address, no lookup is performed and
+is an IPv4 address, no lookup is performed and
 .BR gethostbyname ()
 simply copies
 .I name



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
