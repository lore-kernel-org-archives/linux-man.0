From: Tomislav Jonjic <jonjic-iEixELS/QsY1GQ1Ptb7lUw@public.gmane.org>
Subject: [patch] timerfd_create.2: fix timerfd_settime() argument
 description
Date: Sat, 30 Apr 2011 17:19:50 +0200
Message-ID: <1304176790.10600.24.camel@soyuz>
Reply-To: jonjic-iEixELS/QsY1GQ1Ptb7lUw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The initial expiration of the timer in timerfd_settime() is specified by
new_value.it_value, both for relative _and_ absolute timers.

diff --git a/man2/timerfd_create.2 b/man2/timerfd_create.2
index c09e030..ae9d922 100644
--- a/man2/timerfd_create.2
+++ b/man2/timerfd_create.2
@@ -152,7 +152,7 @@ are zero, the timer expires just once, at the time specified by
 The
 .I flags
 argument is either 0, to start a relative timer
-.RI ( new_value.it_interval
+.RI ( new_value.it_value
 specifies a time relative to the current value of the clock specified by
 .IR clockid ),
 or

--
Tomislav Jonjic


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
