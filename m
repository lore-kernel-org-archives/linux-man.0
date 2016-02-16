From: =?UTF-8?Q?Niklas_Hamb=c3=bcchen?= <mail-7wQd5C9ZzNw@public.gmane.org>
Subject: net.ipv4.tcp_rmem does override net.core.rmem_max?
Date: Tue, 16 Feb 2016 18:04:18 +0100
Message-ID: <56C35692.7010807@nh2.me>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

`man tcp` says `net.ipv4.tcp_rmem`'s max value *does not override*
`net.core.rmem_max` (see [1] [2]) but I found in practice it does.

The person in this thread
http://stackoverflow.com/questions/31546835/tcp-receiving-window-size-higher-than-net-core-rmem-max/35438236
confirms my finding.

Is the man page (and ip-sysctl.txt) outdated?

Thanks for clarifying!

Niklas

[1]
https://github.com/mkerrisk/man-pages/blob/af54e3b7163998cbe1f487f4dca040615fbf949b/man7/tcp.7#L745
[2]
https://github.com/torvalds/linux/blob/34229b277480f46c1e9a19f027f30b074512e68b/Documentation/networking/ip-sysctl.txt#L512
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
