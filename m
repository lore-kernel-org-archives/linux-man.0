From: Todd Lewis <utoddl-vEoVa6Jh+/J4piUD7e9S/g@public.gmane.org>
Subject: Re: [patch] resolv.conf.5 add "single-request-reopen" option
Date: Tue, 11 Sep 2012 16:26:08 -0400
Message-ID: <504F9E60.5090708@email.unc.edu>
References: <504F8488.6030900@email.unc.edu>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------050500090109090306030605"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <504F8488.6030900-vEoVa6Jh+/J4piUD7e9S/g@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is a multi-part message in MIME format.
--------------050500090109090306030605
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Well, this is embarrassing. It turns out RedHat has this documented in
their RHEL series, but not in Fedora. It's also not in the man-pages
project. The attached patch has a better explanation of the option than
the one I submitted earlier today. This text comes from RedHat.

On 09/11/2012 02:35 PM, Todd Lewis sent:
> The attached "diff -u" formatted patch applies to
> http://git.kernel.org/?p=docs/man-pages/man-pages.git;a=blob_plain;f=man5/resolv.conf.5;hb=HEAD
> as it existed on 2012-09-11--14:31.
> 
> It adds documentation for the "single-request-reopen" option. This
> information was found in the changelog notes
> (http://sourceware.org/ml/libc-alpha/2009-10/msg00063.html) from Ulrich
> Drepper. The issue and solution were both brought to my attention by a
> discussion on our internal mailing list which mentioned this undocumented
> feature. Several users indicated they have been suffering from slow DNS
> resolutions on machines behind certain firewalls and that this solved
> their problems. Seems like others would like to know about it.

-- 
   +--------------------------------------------------------------+
  / Todd_Lewis-gpQNmkgQrW4@public.gmane.org  919-445-0091  http://www.unc.edu/~utoddl /
 /   How many of you believe in telekinesis? Raise my hand...   /
+--------------------------------------------------------------+

--------------050500090109090306030605
Content-Type: text/x-patch;
 name="resolv.conf-single-request-reopen.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="resolv.conf-single-request-reopen.patch"

--- /tmp/man5_resolv.conf.5-orig	2012-09-11 14:25:26.406461617 -0400
+++ /tmp/man5_resolv.conf.5	2012-09-11 16:21:48.264137192 -0400
@@ -168,6 +168,13 @@
 (currently 2, see \fI<resolv.h>\fP).
 The value for this option is silently capped to 5.
 .TP
+.BR single-request-reopen " (since glibc 2.9)"
+The resolver uses the same socket for the A and AAAA requests.  Some hardware
+mistakenly only sends back one reply.  When that happens the client sytem will
+sit and wait for the second reply.  Turning this option on changes this behavior
+so that if two requests from the same port are not handled correctly it will
+close the  socket and open a new one before sending the second request.
+.TP
 .B rotate
 .\" Since glibc 2.2
 sets

--------------050500090109090306030605--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
