From: Alexander Miller <alex.miller-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH] Makefile: Drop compression support and screen target
Date: Mon, 18 Apr 2016 21:45:44 +0200
Message-ID: <20160418214544.0fddf8ee.alex.miller@gmx.de>
References: <20160418183024.GX5369@vapier.lan>
	<20160418212955.498ce1dd.alex.miller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160418212955.498ce1dd.alex.miller-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Fixup.
---
Sorry, I messed it up.
I forgot to delete the part of the initial comment mentioning screen.
please append this to the previous patch and apply them together.
---
diff --git a/Makefile b/Makefile
index eef45ef..f494e8f 100644
--- a/Makefile
+++ b/Makefile
@@ -1,5 +1,3 @@
-# Do "make screen" first, if you want to protect already installed,
-# more up-to-date manual pages than the ones included in this package.
 # Do "make install" to copy the pages to their destination.
 
 DESTDIR=
-- 
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
