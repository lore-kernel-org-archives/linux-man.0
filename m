From: Jan Chaloupka <jchaloup-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH]: unix.7: mentioning SOCK_STREAM socket for ioctl_type of
 ioctl function
Date: Wed, 23 Jul 2014 12:54:15 +0200
Message-ID: <53CF9457.7070409@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

 From https://bugzilla.redhat.com/show_bug.cgi?id=1110401.

unix.7 is not clear about socket type of ioctl_type argument of ioctl 
function. The description of SIOCINQ is applicable only for SOCK_STREAM 
socket. For SOCK_DGRAM, udp(7) man page gives correct description of 
SIOCINQ.

---
  man7/unix.7 | 11 +++++++++--
  1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/man7/unix.7 b/man7/unix.7
index b0ade5b..6bcc8ba 100644
--- a/man7/unix.7
+++ b/man7/unix.7
@@ -299,7 +299,9 @@ The correct syntax is:
  can be:
  .TP
  .B SIOCINQ
-Returns the amount of queued unread data in the receive buffer.
+For
+.B SOCK_STREAM
+socket the function returns the amount of queued unread data in the 
receive buffer.
  The socket must not be in LISTEN state, otherwise an error
  .RB ( EINVAL )
  is returned.
@@ -319,6 +321,10 @@ defined in
  .\" That number is normally larger than the number of bytes of pending
  .\" output. Since this info is, from userland's point of view, imprecise,
  .\" and it may well change, probably best not to document this now.
+For
+.B SOCK_DGRAM
+socket, see
+.BR udp (7).
  .SH ERRORS
  .TP
  .B EADDRINUSE
@@ -450,4 +456,5 @@ see
  .BR cmsg (3),
  .BR capabilities (7),
  .BR credentials (7),
-.BR socket (7)
+.BR socket (7),
+.BR udp (7)
-- 
1.9.3
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
