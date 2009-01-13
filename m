From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Missing interface flags in <net/if.h>?
Date: Tue, 13 Jan 2009 22:00:44 +1300
Message-ID: <496C583C.7000300@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ulrich Drepper <drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Ulrich,

I recently made the change below to the netdevice(7) man page.  Probably,
analogous definitions need to be propagated from <linux/if.h> to <net/if.h>.

Cheers,

Michael

commit 933bd2e6dd0d3f1c4a94cf2c5ccbeaa513d83b98
Author: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date:   Tue Jan 13 17:35:42 2009 +1300

    netdevice.7: Document recently added interface flags

    IFF_LOWER_UP (since Linux 2.6.17)
    IFF_DORMANT (since Linux 2.6.17)
    IFF_ECHO (since Linux 2.6.25)

    Documentation taken from comments in <linux/if.h>

    Signed-off-by: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

diff --git a/man7/netdevice.7 b/man7/netdevice.7
index 7f7763b..d854722 100644
--- a/man7/netdevice.7
+++ b/man7/netdevice.7
@@ -9,7 +9,7 @@
 .\"
 .\" Modified, 2004-11-25, mtk, formatting and a few wording fixes
 .\"
-.TH NETDEVICE  7 1999-05-02 "Linux" "Linux Programmer's Manual"
+.TH NETDEVICE  7 2009-01-14 "Linux" "Linux Programmer's Manual"
 .SH NAME
 netdevice \- Low level access to Linux network devices
 .SH SYNOPSIS
@@ -111,6 +111,11 @@ IFF_AUTOMEDIA:Auto media selection active.
 IFF_DYNAMIC:T{
 The addresses are lost when the interface goes down.
 T}
+IFF_LOWER_UP:Driver signals L1 up (since Linux 2.6.17)
+IFF_DORMANT:Driver signals dormant (since Linux 2.6.17)
+IFF_ECHO:Echo sent packets (since Linux 2.6.25)
+
+
 .TE
 Setting the active flag word is a privileged operation, but any



--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
