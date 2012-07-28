From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] netlink.7: nlmsg_pid/nl_pid is *not* the process ID
Date: Sat, 28 Jul 2012 18:04:29 +0200
Message-ID: <CAKgNAkj4AqyvFw37ajVEMOR4N+-qOEq6gjmzLho3xOV6rJQ3gA@mail.gmail.com>
References: <1343084387-18616-1-git-send-email-spaillard@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1343084387-18616-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Simon,

On Tue, Jul 24, 2012 at 12:59 AM, Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wrote:
> See cf130cb102487723bdfc53e4abde1227a7563797 in kernel
> Reported-By: Herbert Xu <herbert-lOAM2aK0SrRLBo1qDEOMRrpzq4S04n8Q@public.gmane.org>
> Bug-Debian: http://bugs.debian.org/383296
> ---
>  man7/netlink.7 |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/man7/netlink.7 b/man7/netlink.7
> index 9f2e654..e918dce 100644
> --- a/man7/netlink.7
> +++ b/man7/netlink.7
> @@ -139,7 +139,7 @@ struct nlmsghdr {
>      __u16 nlmsg_type;   /* Type of message content. */
>      __u16 nlmsg_flags;  /* Additional flags. */
>      __u32 nlmsg_seq;    /* Sequence number. */
> -    __u32 nlmsg_pid;    /* PID of the sending process. */
> +    __u32 nlmsg_pid;    /* Sending process port ID */
>  };
>  .fi
>  .in
> @@ -291,7 +291,7 @@ not equal 0).
>  struct sockaddr_nl {
>      sa_family_t     nl_family;  /* AF_NETLINK */
>      unsigned short  nl_pad;     /* Zero. */
> -    pid_t           nl_pid;     /* Process ID. */
> +    pid_t           nl_pid;     /* port ID. */
>      __u32           nl_groups;  /* Multicast groups mask. */
>  };
>  .fi
> --
> 1.7.10.4

I modifies this slightly, applying the below.

Cheers,

Michael

diff --git a/man7/netlink.7 b/man7/netlink.7
index 9f2e654..2b60fe3 100644
--- a/man7/netlink.7
+++ b/man7/netlink.7
@@ -4,7 +4,7 @@
 .\" Based on the original comments from Alexey Kuznetsov
 .\" Modified 2005-12-27 by Hasso Tepper <hasso-262Luud3QqmzQB+pC5nmwQ@public.gmane.org>
 .\" $Id: netlink.7,v 1.8 2000/06/22 13:23:00 ak Exp $
-.TH NETLINK  7 2012-04-14 "Linux" "Linux Programmer's Manual"
+.TH NETLINK  7 2012-07-28 "Linux" "Linux Programmer's Manual"
 .SH NAME
 netlink \- Communication between kernel and userspace (AF_NETLINK)
 .SH SYNOPSIS
@@ -139,7 +139,7 @@ struct nlmsghdr {
     __u16 nlmsg_type;   /* Type of message content. */
     __u16 nlmsg_flags;  /* Additional flags. */
     __u32 nlmsg_seq;    /* Sequence number. */
-    __u32 nlmsg_pid;    /* PID of the sending process. */
+    __u32 nlmsg_pid;    /* Sender port ID. */
 };
 .fi
 .in
@@ -291,7 +291,7 @@ not equal 0).
 struct sockaddr_nl {
     sa_family_t     nl_family;  /* AF_NETLINK */
     unsigned short  nl_pad;     /* Zero. */
-    pid_t           nl_pid;     /* Process ID. */
+    pid_t           nl_pid;     /* Port ID. */
     __u32           nl_groups;  /* Multicast groups mask. */
 };
 .fi


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
