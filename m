From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] Minor formatting fix in keyrings.7
Date: Sat, 2 Sep 2017 03:35:34 +0200
Message-ID: <20170902013031.GA17201@asgard.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello.

I'm not quite sure that providing absolute indentation there was
intentional, but I assume it didn't, as the output doesn't exceed 80
character width and the resulting rendering does look a bit ugly.

Eugene Syromyatnikov (1):
  ffix: keyrings.7: indentation for key list example

 man7/keyrings.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
