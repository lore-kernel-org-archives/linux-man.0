From: noname-CuI0ZDT4mYnsrOwW+9ziJQ@public.gmane.org
Subject: "Writing" instead of "Warning" in dlopen(3) manpage
Date: Tue, 31 Dec 2013 16:42:09 +0400
Message-ID: <20131231124209.GA4814@darkstar>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

dlopen C code example contains following comment:

/* Writing: cosine = (double (*)(double)) dlsym(handle, "cos");
   ... */

"Writing:" should be replaced with "Warning:".
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
