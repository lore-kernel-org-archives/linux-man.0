From: Colin Watson <cjwatson-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] Fix incorrect encoding declaration in iso_8859-13(7)
Date: Sat, 22 Aug 2009 14:31:53 +0100
Message-ID: <20090822133152.GX11691@riva.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Lefteris Dimitroulakis <edimitro-6VGm6rrshF0@public.gmane.org>
List-Id: linux-man@vger.kernel.org

This managed to expose a bug in my man-db development tree (which never
made it into any released version), because 0xAE does not exist in
ISO-8859-7 so the conversion tool got very confused. I'll fix my code,
of course, but the manual page will only display the correct characters
if the correct coding: tag is used.

diff --git a/man7/iso_8859-13.7 b/man7/iso_8859-13.7
index d05ee06..ae32482 100644
--- a/man7/iso_8859-13.7
+++ b/man7/iso_8859-13.7
@@ -1,4 +1,4 @@
-'\" t -*- coding: ISO-8859-7 -*-
+'\" t -*- coding: ISO-8859-13 -*-
 .\" Copyright 2009   Lefteris Dimitroulakis (edimitro-6VGm6rrshF0@public.gmane.org)
 .\"
 .\" This is free documentation; you can redistribute it and/or

Thanks,

-- 
Colin Watson                                       [cjwatson-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org]
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
