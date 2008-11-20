From: Michael Kerrisk <mtk.manpages@googlemail.com>
Subject: CLONE_NEWNET documentation
Date: Thu, 20 Nov 2008 13:20:06 -0500
Message-ID: <4925AA56.9030409@gmail.com>
References: <492489D1.5080502@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-net-owner@vger.kernel.org>
In-Reply-To: <492489D1.5080502@gmail.com>
Sender: linux-net-owner@vger.kernel.org
Cc: Pavel Emelyanov <xemul@openvz.org>, David Miller <davem@davemloft.net>, "Eric W. Biederman" <ebiederm@xmission.com>, lkml <linux-kernel@vger.kernel.org>, linux-man@vger.kernel.org, Subrata Modak <subrata@linux.vnet.ibm.com>, Stephen Hemminger <shemminger@linux-foundation.org>, adobriyan@gmail.com, Patrick McHardy <kaber@trash.net>, den@openvz.org, Daniel Lezcano <dlezcano@fr.ibm.com>, linux-net@vger.kernel.org
List-Id: linux-man@vger.kernel.org

Based on my reading of some of the kernel source, various
documentation that I've now read, and comments I received
from people to my earlier mail ("Current state of Network
Namespaces (NETNS, CLONE_NEWNET)?"), I've written the patch
below to document the CLONE_NEWNET clone(2) flag.
Fixes and suggestions for improvements welcome.

Cheers,

Michael

   CLONE_NEWNET (since Linux 2.6.24)
      (The  implementation  of this flag is not yet com-
      plete, but probably will  be  mostly  complete  by
      about Linux 2.6.28.)

      If CLONE_NEWNET is set, then create the process in
      a new network namespace.  If this flag is not set,
      then  (as with fork(2)), the process is created in
      the same network namespace as the calling process.
      This  flag  is  intended for the implementation of
      containers.

      A network namespace provides an isolated  view  of
      the  networking  stack (network device interfaces,
      IPv4 and IPv6 protocol stacks, IP routing  tables,
      firewall  rules,  the /proc/net and /sys/class/net
      directory trees, sockets, etc.).  A physical  net-
      work device can live in exactly one network names-
      pace.  A virtual network device ("veth") pair pro-
      vides  a pipe-like abstraction that can be used to
      create tunnels between network namespaces, and can
      be  used  to create a bridge to a physical network
      device in another namespace.

      Use of this flag  requires:  a  kernel  configured
      with the CONFIG_NET_NS option and that the process
      be privileged (CAP_SYS_ADMIN).

--- a/man2/clone.2
+++ b/man2/clone.2
@@ -286,10 +285,41 @@ and
 configuration options and that the process be privileged
 .RB ( CAP_SYS_ADMIN ).
 This flag can't be specified in conjunction with
 .BR CLONE_SYSVSEM .
 .TP
+.BR CLONE_NEWNET " (since Linux 2.6.24)"
+(The implementation of this flag is not yet complete,
+but probably will be mostly complete by about Linux 2.6.28.)
+
+If
+.B CLONE_NEWNET
+is set, then create the process in a new network namespace.
+If this flag is not set, then (as with
+.BR fork (2)),
+the process is created in the same network namespace as
+the calling process.
+This flag is intended for the implementation of containers.
+
+A network namespace provides an isolated view of the networking stack
+(network device interfaces, IPv4 and IPv6 protocol stacks,
+IP routing tables, firewall rules, the
+.I /proc/net
+and
+.I /sys/class/net
+directory trees, sockets, etc.).
+A physical network device can live in exactly one
+network namespace.
+A virtual network device ("veth") pair provides a pipe-like abstraction
+that can be used to create tunnels between network namespaces,
+and can be used to create a bridge to a physical network device
+in another namespace.
+
+Use of this flag requires: a kernel configured with the
+.B CONFIG_NET_NS
+option and that the process be privileged
+.RB ( CAP_SYS_ADMIN ).
+.TP
 .BR CLONE_NEWNS " (since Linux 2.4.19)"
 Start the child in a new mount namespace.

 Every process lives in a mount namespace.
 The
@@ -822,10 +852,18 @@ but the kernel was not configured with the
 and
 .BR CONFIG_IPC_NS
 options.
 .TP
 .B EINVAL
+.BR CLONE_NEWNET
+was specified in
+.IR flags ,
+but the kernel was not configured with the
+.B CONFIG_NET_NS
+option.
+.TP
+.B EINVAL
 .BR CLONE_NEWPID
 was specified in
 .IR flags ,
 but the kernel was not configured with the
 .B CONFIG_PID_NS
@@ -844,10 +882,11 @@ Cannot allocate sufficient memory to allocate a task structure for the
 child, or to copy those parts of the caller's context that need to be
 copied.
 .TP
 .B EPERM
 .BR CLONE_NEWIPC ,
+.BR CLONE_NEWNET ,
 .BR CLONE_NEWNS ,
 .BR CLONE_NEWPID ,
 or
 .BR CLONE_NEWUTS
 was specified by a non-root process (process without \fBCAP_SYS_ADMIN\fP).
