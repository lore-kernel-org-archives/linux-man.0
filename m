From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: some unification section headers in the man pages
Date: Sun, 6 Dec 2009 13:05:19 +0300
Message-ID: <20091206130519.7d997197@keeper.home.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello.

$grep -r 'Authors and Copyright Conditions' man-pages-git/
man-pages-git/man4/intro.4:.SS Authors and Copyright Conditions
man-pages-git/man6/intro.6:.SS Authors and Copyright Conditions
man-pages-git/man5/intro.5:.SS Authors and Copyright Conditions
man-pages-git/man8/intro.8:.SS Authors and Copyright Conditions
man-pages-git/man7/intro.7:.SS Authors and Copyright Conditions

$ grep -r 'Authors and Copyright Terms' man-pages-git/
man-pages-git/man2/intro.2:.SS Authors and Copyright Terms
man-pages-git/man3/intro.3:.SS Authors and Copyright Terms

May be choose just one?

-- 
Best Regards,
Yuri Kozlov

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
