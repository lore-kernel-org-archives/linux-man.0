From: "Kevin O'Gorman" <kogorman-NxXWyeNFQoAMpU4w9OhIGA@public.gmane.org>
Subject: Bug in man pages for aio_*(3) functions
Date: Wed, 23 Apr 2008 20:22:28 -0700 (PDT)
Message-ID: <Pine.SOC.4.64.0804232018090.25844@falcon>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk-manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Re: man-pages 2.78

The manual pages for aio_read(3) and similar aio_* functions appear to be 
incomplete in that they omit mention of the need for a "-lrt" switch when
linking.  This is true at least on Fedora 7 and Gentoo.

++ kevin
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
