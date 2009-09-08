From: gsauthof-If1cxaH3S3JVgF+RW+Bo1SZEdBbF94EN@public.gmane.org
Subject: setenv may set errno
Date: Tue, 8 Sep 2009 11:12:36 +0200
Message-ID: <20090908091236.GF15639@lenovo.private>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

in setenv(3) in the section 'RETURN VALUE' it is not mentioned, that
setenv() may set errno. For unsetenv() the section mentions this.

Best regards
Georg Sauthoff
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
