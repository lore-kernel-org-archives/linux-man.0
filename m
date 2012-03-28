From: Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [patch] nsswitch.conf.5: clarify the "notfound" status
Date: Wed, 28 Mar 2012 20:27:12 +0200
Message-ID: <4F735800.6040807@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,

I am suggesting the following update of the  "notfound" status on the 
nsswitch.conf.5 man page. I am not 100% sure that this is the correct 
place where this information on the man page should be placed. Any 
comments are welcome.

Source for this update is comment in initgroups.c file on line 135 in 
glibc [1].

Version of the man pages: 3.38


Thanks,

peter


[1] 
http://sourceware.org/git/?p=glibc.git;a=blob;f=grp/initgroups.c;h=62fd1fc6de5f9ea08f31134c5ab9a36ae2d5af9e;hb=HEAD



--- nsswitch.conf.5.orig    2012-03-24 19:47:30.000000000 +0100
+++ nsswitch.conf.5    2012-03-28 20:10:37.268495257 +0200
@@ -201,6 +201,9 @@
  .B notfound
  The lookup process succeeded, but the needed value was not found.
  The default action is `continue'.
+For compatibility reasons, if the selected action for the `group' database
+is `return' and the configuration file does not contain the 
`initgroups' line,
+the next service is always used to search for more entries.
  .TP
  .B unavail
  The service is permanently unavailable.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
