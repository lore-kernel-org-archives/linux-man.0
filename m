From: Simon Paillard <simon.paillard-RGJHTEmuthQGuQl/6FzYuenJ6Cvpl5oe@public.gmane.org>
Subject: getaddrinfo_a.3: format fix for consistency
Date: Wed, 6 Oct 2010 20:50:25 +0200
Message-ID: <20101006185025.GA28069@dedibox.ebzao.info>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="+HP7ph2BbKc20aGI"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

While translating getaddrinfo_a to french, I noticed that the english
formatting was not very consistent from the synchronous to the
asynchronous description.

  Perform the look-ups synchronously; <--- ;
[..]
 .B GAI_NOWAIT
 Perform the look-ups asynchronously. <--- .

Quite minor, patch attached.

-- 
Simon Paillard

--+HP7ph2BbKc20aGI
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-getaddrinfo_a.3-format-fix-for-consistency.patch"

>From 21b0256966c330c7194bc540db75eebf5979e1a8 Mon Sep 17 00:00:00 2001
From: Simon Paillard <simon.paillard-RGJHTEmuthQGuQl/6FzYuenJ6Cvpl5oe@public.gmane.org>
Date: Wed, 6 Oct 2010 20:43:57 +0200
Subject: [PATCH] getaddrinfo_a.3: format fix for consistency


diff --git a/man3/getaddrinfo_a.3 b/man3/getaddrinfo_a.3
index ad2b899..e50753e 100644
--- a/man3/getaddrinfo_a.3
+++ b/man3/getaddrinfo_a.3
@@ -51,22 +51,22 @@ The
 function performs the same task as
 .BR getaddrinfo (3),
 but allows multiple name look-ups to be performed asynchronously,
 with optional notification on completion of look-up operations.
 
 The
 .I mode
 argument has one of the following values:
 .TP
 .B GAI_WAIT
-Perform the look-ups synchronously;
-the call blocks until the look-ups have completed.
+Perform the look-ups synchronously.
+The call blocks until the look-ups have completed.
 .TP
 .B GAI_NOWAIT
 Perform the look-ups asynchronously.
 The call returns immediately,
 and the requests are resolved in the background.
 See the discussion of the
 .I sevp
 argument below.
 .PP
 The array
-- 
1.5.6.5


--+HP7ph2BbKc20aGI--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
