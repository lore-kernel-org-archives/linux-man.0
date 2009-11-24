From: =?UTF-8?B?6JSh6L+w5a6q?= <caishuxian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: bug report: rtnetlink(7)
Date: Tue, 24 Nov 2009 20:15:50 +0800
Message-ID: <63526fa40911240415v5473ea18y9e09b9bf9546bfe2@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

version: online pages

number of errors: 2

classification: typos

bug description:

RTNETLINK(7)                  Linux Programmer's Manual
  RTNETLINK(7)
...
DESCRIPTION
...

  Messages
  ...
    RTM_NEWADDR, RTM_DELADDR, RTM_GETADDR
              Add, remove or receive information about an IP address
associated with
              an interface.  In Linux 2.2 an interface can carry multiple IP

              addresses, this replaces the alias device concept in
2.0.  In Linux 2.2
              these messages support IPv4 and IPv6 addresses.  They contain an
              ifaddrmsg structure, optionally followed by rtaddr
routing attributes.
                                                          ~~~~~typo for "rtattr"
    ...
    RTM_NEWNEIGH, RTM_DELNEIGH, RTM_GETNEIGH
              ...
              The rtaddr struct has the following meanings for the
rta_type field:
                  ~~~~~typo for "rtattr"
              ...
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
