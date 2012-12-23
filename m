From: Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] recvmmsg.2 Updated timeout documentation
Date: Sun, 23 Dec 2012 13:06:55 +0100
Message-ID: <1356264415-5108-1-git-send-email-eliedebrauwer@gmail.com>
References: <CAKgNAkhz1E8c2jpECcYrKJyMv1RB36qC_HjW9s=i=+bYLfii4w@mail.gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkhz1E8c2jpECcYrKJyMv1RB36qC_HjW9s=i=+bYLfii4w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

All,

This is the second part of my recvmmsg update, this is splitted off from the 
version related information.

At first I considered the possibility of it being a kernel patch too, but I
compared the original commit and checked if it might have been evolved
upstream but short from the WAITFORNONE addition it has not.

In any case, when operating in non-blocking mode, the timeout is taken into
account, which could mean that recvmmsg() returns while data is still 
available (which was not clearly stated). (Combination of much data to 
copy and a very sharp timeout).

And when operating in blocking mode, the timeout is only taken into account
after the reception of data. Which may mean infinity when no data arrives. 
Having the timeout function in kernel space would probably imply calling 
something (e)poll()/select()-ish before attempting to recieve.

my 2 cents
E.

---
 man2/recvmmsg.2 |   18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/man2/recvmmsg.2 b/man2/recvmmsg.2
index 85e4080..b16335f 100644
--- a/man2/recvmmsg.2
+++ b/man2/recvmmsg.2
@@ -107,24 +107,26 @@ argument points to a
 (see
 .BR clock_gettime (2))
 defining a timeout (seconds plus nanoseconds) for the receive operation.
-(This interval will be rounded up to the system clock granularity,
-and kernel scheduling delays mean that the blocking interval
-may overrun by a small amount.)
 If
 .I timeout
 is
 .I NULL
-then the operation blocks indefinitely.
+then the timeout is not taken into account.
 
 A blocking
 .BR recvmmsg ()
 call blocks until
 .I vlen
-messages have been received
-or until the timeout expires.
+messages have been received,
+or the timeout expires, or until a reception error occurs. 
+The timeout expiration is checked each time a message has 
+been received in a buffer. Hence a blocking call may block
+indefinitely if no messages are arriving.
 A nonblocking call reads as many messages as are available
-(up to the limit specified by
-.IR vlen )
+(up to the limits specified by
+.IR vlen
+and
+.IR timeout)
 and returns immediately.
 
 On return from
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
