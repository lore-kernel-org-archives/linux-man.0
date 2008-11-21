From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: TCP_CONGESTION documentation
Date: Fri, 21 Nov 2008 11:06:19 -0500
Message-ID: <4926DC7B.7020203@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Hemminger <shemminger-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, linux-net-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andi Kleen <ak-l3A5Bk7waGM@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Stephen,

Back in 2.6.13, you added the TCP_CONGESTION sockopt, but
provided no man-page patch...

Below is my attempt to document this sockopt.  Could you please
review.  Please don't assume I've well understood the code: I
may well have messed up in my reading of it, so review what
I've written with care.

Also, a question: was the silent truncation of the returned
string on getsockopt() if optlen is too small really intended?
Would it not be/have been better to error on this case?

Cheers,

Michael


   TCP_CONGESTION (since Linux 2.6.13)
      Get  or  set  the  congestion-control algorithm for this
      socket.   The  optval  argument  is  a  pointer   to   a
      character-string buffer.

      For  getsockopt()  *optlen specifies the amount of space
      available in the buffer  pointed  to  by  optval,  which
      should  be  at  least  16  bytes (defined by the kernel-
      internal  constant  TCP_CA_NAME_MAX).   On  return,  the
      buffer  pointed to by optval is set to a null-terminated
      string containing the  name  of  the  congestion-control
      algorithm  for  this  socket,  and *optlen is set to the
      minimum of its original value and  TCP_CA_NAME_MAX.   If
      the  value  passed  in  *optlen  is  too small, then the
      string returned in *optval is silently truncated, and no
      terminating  null  byte is added.  If an empty string is
      returned, then the socket is using the  default  conges-
      tion-control  algorithm,  determined  as described under
      tcp_congestion_control above.

      For setsockopt() optlen specifies the length of the con-
      gestion-control  algorithm  name contained in the buffer
      pointed to by optval; this length need not  include  any
      terminating  null  byte.  The algorithm "reno" is always
      permitted; other algorithms may be available,  depending
      on  kernel configuration.  Possible errors from setsock-
      opt() include: algorithm not  found/available  (ENOENT);
      setting  this algorithm requires the CAP_NET_ADMIN capa-
      bility  (EPERM);  and  failure  getting  kernel   module
      (EBUSY).

--- tcp.7       2008-11-21 10:54:08.000000000 -0500
+++ tcp.7.TCP_CONGESTION.patch   2008-11-21 10:53:36.000000000 -0500
@@ -733,7 +733,58 @@
 socket options are valid on TCP sockets.
 For more information see
 .BR ip (7).
-.\" FIXME Document TCP_CONGESTION (new in 2.6.13)
+.TP
+.BR TCP_CONGESTION " (since Linux 2.6.13)"
+Get or set the congestion-control algorithm for this socket.
+The
+.I optval
+argument is a pointer to a character-string buffer.
+
+For
+.BR getsockopt ()
+.I *optlen
+specifies the amount of space available in the buffer pointed to by
+.IR optval ,
+which should be at least 16 bytes (defined by the kernel-internal constant
+.BR TCP_CA_NAME_MAX ).
+On return, the buffer pointed to by
+.I optval
+is set to a null-terminated string containing the name of the
+congestion-control algorithm for this socket, and
+.I *optlen
+is set to the minimum of its original value and
+.BR TCP_CA_NAME_MAX .
+If the value passed in
+.I *optlen
+is too small, then the string returned in
+.I *optval
+is silently truncated, and no terminating null byte is added.
+If an empty string is returned, then the socket is using the default
+congestion-control algorithm, determined as described under
+.I tcp_congestion_control
+above.
+
+For
+.BR setsockopt ()
+.I optlen
+specifies the length of the congestion-control algorithm name
+contained in the buffer pointed to by
+.IR optval ;
+this length need not include any terminating null byte.
+The algorithm "reno" is always permitted;
+other algorithms may be available, depending on kernel configuration.
+Possible errors from
+.BR setsockopt ()
+include:
+algorithm not found/available
+.RB ( ENOENT );
+setting this algorithm requires the
+.B CAP_NET_ADMIN
+capability
+.RB ( EPERM );
+and failure getting kernel module
+.RB ( EBUSY ).
+.I
 .TP
 .B TCP_CORK
 If set, don't send out partial frames.


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
