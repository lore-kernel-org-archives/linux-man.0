From: Jussi Lehtola <jussilehtola-rxtnV0ftBwyoClj4AeEUq9i2O/JbrIOy@public.gmane.org>
Subject: Bug in scanf() man page
Date: Tue, 6 Nov 2012 00:05:19 +0200
Message-ID: <20121106000519.35cf80c4@tb900.no-ip.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

EOF  is also  returned if a read error occurs, in which case the error
indicator for the stream (see ferror(3)) is set, and errno is  set
indicate the error.

The latter clause is lacking a 'to'.
-- 
Jussi Lehtola
Fedora Project Contributor
jussilehtola-rxtnV0ftBwyoClj4AeEUq9i2O/JbrIOy@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
