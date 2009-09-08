From: gsauthof-If1cxaH3S3JVgF+RW+Bo1SZEdBbF94EN@public.gmane.org
Subject: Definition of orphaned process group missing
Date: Tue, 8 Sep 2009 11:29:06 +0200
Message-ID: <20090908092906.GG15639@lenovo.private>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

setpgid(2) and exit(3) use the term 'orphaned process group', but they
don't define it.

And if I am not missing it, the term is not defined in a referenced man
page, either.

Suggested fix: add the defintion of 'orphaned process group' to the 'right'
place(s) (man-page).

Best regards
Georg Sauthoff
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
