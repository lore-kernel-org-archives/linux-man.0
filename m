From: Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] recvmmsg.2: correct since fields and correct specification of the timeout parameter
Date: Wed, 19 Dec 2012 23:37:07 +0100
Message-ID: <1355956627-5676-1-git-send-email-eliedebrauwer@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello all,

After playing with and coming up with the example I bumped into some issues
with the current page.

The trivial ones:
 * The page states it was added in 2.6.32 but it is only added in 2.6.33
   (ref: http://kernelnewbies.org/Linux_2_6_33)
 * The MSG_WAITFORONE flag was in turn only added in 2.6.34 
   (ref: http://kernelnewbies.org/Linux_2_6_34)

The less trivial one, if you read the current manpage it seems like the 
timeout option is like a 'free' select/poll call. When reading the page
my impression is you call recvmmsg with a timeout set, that it will not
be able to block indefinitely. However this is not the case. You can
already see this in my example in my previous patch, bash transmits a UDP
packet every 250 msecs, but my demo app seems to recieve 5 packets while
the timeout is only 1 second.

If you look in the code ( http://lxr.linux.no/linux+v3.2/net/socket.c#L2201 )
of __sys_recvmmsg() you can clearly see that in pseudocode it does something
like:
poll_select_set_timeout();
while(datagrams < vlen) {
   err = __sys_recvmsg();
   if (err < 0 ) break
   datagrams++;
   if (timeout) {
     // Update time 
     if (timeout->tv_sec < 0) {
        break;
     }
   }
}

Hence three conditions result in recvmmsg() to return:
 - error in recvmmsg()
 - vlen datagrams received
 - timeout expiration.

But the timeout is only checked *after* __sys_recvmsg(), which may be 
blocking has returned, hence when working in blocking mode and the flow of
incoming data stops all of a sudden, recvmmsg() will also block, even if 
a timeout is set. And this is not what I understood from the original 
page.

A second case, in nonblocking mode, you can also specify a timeout, 
if a large amount of data is available, and the timeout is extremely sharp
it might be that the timeout can also cause an exit from this function
even if data is available in the socket.

The patch belows tries to reword the existing paragraphs to make it reflect
the information stated above.

btw, this patch is isolated from the example patch because they deal with
two separate things actually.

my 2 cents
E. 

---
 man2/recvmmsg.2 |   22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/man2/recvmmsg.2 b/man2/recvmmsg.2
index 3252be7..abcee5b 100644
--- a/man2/recvmmsg.2
+++ b/man2/recvmmsg.2
@@ -93,7 +93,7 @@ The flags are the same as documented for
 .BR recvmsg (2),
 with the following addition:
 .TP
-.B MSG_WAITFORONE
+.BR MSG_WAITFORONE " (since Linux 2.6.34)"
 Turns on
 .B MSG_DONTWAIT
 after the first message has been received.
@@ -105,24 +105,26 @@ argument points to a
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
@@ -158,7 +160,7 @@ is invalid.
 .SH VERSIONS
 The
 .BR recvmmsg ()
-system call was added in Linux 2.6.32.
+system call was added in Linux 2.6.33.
 Support in glibc was added in version 2.12.
 .SH CONFORMING TO
 .BR recvmmsg ()
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
