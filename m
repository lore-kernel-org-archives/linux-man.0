From: "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
Subject: typoes in current man pages
Date: Tue, 18 Mar 2014 15:05:44 -0400 (EDT)
Message-ID: <alpine.LFD.2.11.1403181453060.4573@localhost>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


  based on current git repo:

_XOPEN_SOURCE typoes:

man3/strtoul.3:XOPEN_SOURCE\ >=\ 600 || _BSD_SOURCE || _SVID_SOURCE || _ISOC99_SOURCE ||
man3/strtol.3:XOPEN_SOURCE\ >=\ 600 || _BSD_SOURCE || _SVID_SOURCE || _ISOC99_SOURCE ||

_BSD_SOURCE typoes:

man2/fcntl.2:.BR BSD_SOURCE ,

_GNU_SOURCE typoes:

man7/socket.7:.B GNU_SOURCE

rday
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
