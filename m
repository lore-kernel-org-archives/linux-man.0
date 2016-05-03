From: =?iso-8859-1?Q?J=F6rn?= Engel <joern-BHEL68pLQRGGvPXPguhicg@public.gmane.org>
Subject: get_mempolicy(2) type mismatch
Date: Mon, 2 May 2016 17:58:21 -0700
Message-ID: <20160503005821.GC9613@cork>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The manpage seems to have the wrong type for "addr".

Manpage:
       int get_mempolicy(int *mode, unsigned long *nodemask,
                         unsigned long maxnode, unsigned long addr,
                         unsigned long flags);

/usr/include/numaif.h:
extern long get_mempolicy(int *policy, const unsigned long *nmask,
                        unsigned long maxnode, void *addr, int flags);

J=F6rn

--
The more any quantitative social indicator is used for social decision-=
making,
the more subject it will be to corruption pressures and the more apt it=
 will
be to distort and corrupt the social processes it is intended to monito=
r.
-- Campbell's law
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
