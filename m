From: Marcel Moreaux <marcelm-MO7g/Hy4xaE@public.gmane.org>
Subject: Small error in crypt() manpage
Date: Sun, 18 Apr 2010 19:17:18 +0200
Message-ID: <20100418171718.GB25938@zuul.luon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hey,

The Linux manpage for crypt()[1] contains the following statement as the
last sentence of the NOTES section:

    In the SHA implementation the entire key is significant (instead of
    only the first 8 bytes in MD5).

It should probably say "DES" where it says "MD5" (and maybe "MD5/SHA"
where it says "SHA"), because in MD5 password hashing, the entire key is
significant, not just the first 8 bytes.

Quoting the glibc documentation[2]:

    For the MD5-based algorithm, [...] Every character in the key is
    significant. 



Best regards,

Marcel Moreaux



[1] http://www.kernel.org/doc/man-pages/online/pages/man3/crypt.3.html
[2] http://www.gnu.org/s/libc/manual/html_node/crypt.html#crypt
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
