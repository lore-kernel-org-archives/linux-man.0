From: Georg Sauthoff <mail-vzQcyvifq/Y@public.gmane.org>
Subject: strtok - strings without delimiters
Date: Sun, 12 May 2013 22:22:12 +0200
Message-ID: <20130512202212.GL21458@x220.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

the strtok man-page does not specify what happens if `str` does not
contain any `delim`iters.

If you don't already know strtok one might assume then either:

- the delimiter-less string is considered the next token and thus
  returned upon the first call to strtok
- on the first call NULL is returned because there are not any tokens

Related issue: is the non-empty `str`-suffix after the last `delim`
returned as a token or not?

I know how strtok works - but perhaps it makes sense to explicitly
address these issues in the Linux man page.

Best regards
Georg
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
