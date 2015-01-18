From: JWP <elseifthen-KK0ffGbhmjU@public.gmane.org>
Subject: [PATCH][COVER LETTER] tzset.3: correct file paths and TZ use
Date: Sat, 17 Jan 2015 19:30:16 -0500
Message-ID: <54BAFE98.2090402@gmx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Everyone,

This is my first contribution to the linux-man
project and I do not know what level of proof is
required for changes, so I'll try to be brief.

tzset.3 says that /usr/share/zoneinfo/localtime
is used for the system timezone if TZ is not set.

glibc does not use this file, and its Makeconfig
comments discourages the use of it at all:

# Where to install default configuration files.  These include the local
# timezone specification and network data base files.
ifndef sysconfdir
sysconfdir = $(prefix)/etc
endif
inst_sysconfdir = $(install_root)$(sysconfdir)

# Where to install the "localtime" timezone file; this is the file whose
# contents $(localtime) specifies.  If this is a relative pathname, it is
# relative to $(zonedir).  It is a good idea to put this somewhere
# other than there, so the zoneinfo directory contains only universal data,
# localizing the configuration data elsewhere.
ifndef localtime-file
localtime-file = $(sysconfdir)/localtime
endif

As shown above the localtime file is in etc/

Further, the manual says if the TZ filespec is
omitted it will use /usr/share/zoneinfo/localtime,
but glibc actually will use UTC in that case,
which the manual states in the third paragraph of
the DESCRIPTION section.

I made some other minor changes that I hopefully
do not need to justify.

Thank you

J William Piggott (1):
  tzset.3: correct file paths and TZ use

 man3/tzset.3 | 81 +++++++++++++++++++++++++++---------------------------------
 1 file changed, 37 insertions(+), 44 deletions(-)

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
