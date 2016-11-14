From: dwilder <dwilder@us.ibm.com>
Subject: [patch] netlink.7: srcfix Change buffer size in example code about
 reading netlink message.
Date: Mon, 14 Nov 2016 14:20:19 -0800
Message-ID: <e9409957290af5249750afa0f10de3a6@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: mtk.manpages@gmail.com
Cc: linux-man@vger.kernel.org, netdev@vger.kernel.org
List-Id: linux-man@vger.kernel.org

The example code in netlink(7) (for reading netlink message) suggests 
using
a 4k read buffer with recvmsg.  This can cause truncated messages on 
systems
using a page size is >4096.  Please see:
linux/include/linux/netlink.h (in the kernel source)

<snip>
/*
  *      skb should fit one page. This choice is good for headerless 
malloc.
  *      But we should limit to 8K so that userspace does not have to
  *      use enormous buffer sizes on recvmsg() calls just to avoid
  *      MSG_TRUNC when PAGE_SIZE is very large.
  */
#if PAGE_SIZE < 8192UL
#define NLMSG_GOODSIZE  SKB_WITH_OVERHEAD(PAGE_SIZE)
#else
#define NLMSG_GOODSIZE  SKB_WITH_OVERHEAD(8192UL)
#endif

#define NLMSG_DEFAULT_SIZE (NLMSG_GOODSIZE - NLMSG_HDRLEN)
<snip>

I was troubleshooting some up-stream code on a ppc64le system
(page:size of 64k) This code had duplicated the example from netlink(7) 
and
was using a 4k buffer.  On x86-64 with a 4k page size this is not a 
problem,
however on the 64k page system some messages were truncated.  Using an 
8k buffer
as implied in netlink.h prevents problems with any page size.

Lets change the example so others don't propagate the problem further.

Signed-off-by David Wilder <dwilder@us.ibm.com>

--- man7/netlink.7.orig 2016-11-14 13:30:36.522101156 -0800
+++ man7/netlink.7      2016-11-14 13:30:51.002086354 -0800
@@ -511,7 +511,7 @@
  .in +4n
  .nf
  int len;
-char buf[4096];
+char buf[8192];
  struct iovec iov = { buf, sizeof(buf) };
  struct sockaddr_nl sa;
  struct msghdr msg;
