From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 16461] Socket option SO_MARK undocumented.
Date: Sat,  7 Jul 2012 05:12:43 +0000 (UTC)
Message-ID: <20120707051243.A748311FA36@bugzilla.kernel.org>
References: <bug-16461-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-16461-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=16461


Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         Resolution|                            |CODE_FIX




--- Comment #1 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2012-07-07 05:12:43 ---
Martin,

I applied a modified version of your patch for 3.42.

Thanks,

Michael



--- a/man7/socket.7
+++ b/man7/socket.7
@@ -19,11 +19,10 @@
 .\" The following are not yet documented:
 .\"    SO_PEERNAME
 .\"    SO_TIMESTAMPNS
-.\"    SO_MARK (see https://bugzilla.kernel.org/show_bug.cgi?id=16461)
 .\"    SO_TIMESTAMPING (2.6.30)
 .\"    SO_RXQ_OVFL (2.6.33)
 .\"
-.TH SOCKET 7 2012-04-23 Linux "Linux Programmer's Manual"
+.TH SOCKET 7 2012-07-07 Linux "Linux Programmer's Manual"
 .SH NAME
 socket \- Linux socket interface
 .SH SYNOPSIS
@@ -320,6 +319,17 @@ When the socket is closed as part of
 .BR exit (2),
 it always lingers in the background.
 .TP
+.BR SO_MARK " (since Linux 2.6.25)"
+.\" commit 4a19ec5800fc3bb64e2d87c4d9fdd9e636086fe0
+.\" and    914a9ab386a288d0f22252fc268ecbc048cdcbd5
+Set the mark for each packet sent through this socket
+(similar to the netfilter MARK target but socket-based).
+Changing the mark can be used for mark-based
+routing without netfilter or for packet filtering.
+Setting this option requires the
+.B CAP_NET_ADMIN
+capability.
+.TP
 .B SO_OOBINLINE
 If this option is enabled,
 out-of-band data is directly placed into the receive data stream.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
