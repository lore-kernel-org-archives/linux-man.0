From: Tobias Deiminger <haxtibal-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>
Subject: SCM credentials in netlink packets
Date: Sat, 30 Dec 2017 16:11:57 +0100
Message-ID: <10305795.8iTnX5OQzp@deepthought>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi!

I'd like to ask about SCM credentials for netlink, and the meaning of pid == 0 
in particular. SCM credentials are documented for AF_UNIX in unix(7), see 
"Ancillary messages". It says "they are AF_UNIX specific". However, the Linux 
kernel supports them for AF_NETLINK too. Would it be reasonable to mention SCM 
credentials in netlink(7) as it is done in unix(7)?

The next part is about the meaning of nl_pid (netlink port id) == 0 versus 
credentials pid == 0 in netlink packets. There was a mail [1] from Eric 
Biederman saying "If in the senders address nl_pid == 0 then the message is 
from the kernel. [...] Looking anywhere else at anything else is bogus." Some 
user space tools ([2], [3]) assert SCM credentials pid == 0 instead of 
checking nl_pid. So I'm curious if using SCM credentials for this purpose is 
bogus, and why?

AFAICT credentials pid == 0 means a netlink packet is from kernel:
-there was a kernel patch "Force passing credentials if none given", to
guarantee credentials are always included in netlink packets [4]
-task_tgid(current) is assigned to pid, which is 0 for all kernel threads
-it works within user and network namespaces

Tobias

[1] https://lists.linuxfoundation.org/pipermail/containers/2015-May/036032.html
[2] https://github.com/lathiat/avahi/blob/6242e5f0fe001b7de2ccaa9431db279b2ee76b83/avahi-core/netlink.c#L83-L86
[3] https://github.com/NetworkManager/NetworkManager/blob/4650a4e1a1ff7ee03e2fb0b3dc6f31b911c2583d/src/platform/nm-linux-platform.c#L6666-L6673
[4] git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e0e3cea46d31d23dc40df0a49a7a2c04fe8edfea
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
