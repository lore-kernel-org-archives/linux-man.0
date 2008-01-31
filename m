From: Heikki Orsila <heikki.orsila-X3B1VOXEql0@public.gmane.org>
Subject: regex.3 - make text more explicit
Date: Thu, 31 Jan 2008 16:08:04 +0200
Message-ID: <20080131140804.GB32382@jolt.modeemi.cs.tut.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello, this change makes regex (3) text more explicit by identifying
what "end offset" exactly is. "end offset" could mean

a) the last character in the matching text
b) the first character after the matching text (this is what it means)

diff -ur man-pages-2.76-org/man3/regex.3 man-pages-2.76/man3/regex.3
--- man-pages-2.76-org/man3/regex.3	2008-01-31 15:59:25.000000000 +0200
+++ man-pages-2.76/man3/regex.3	2008-01-31 16:00:47.000000000 +0200
@@ -195,7 +195,8 @@
 substring match within the string.
 The relative
 .I rm_eo
-element indicates the end offset of the match.
+element indicates the end offset of the match, which is the first character
+after the matching text.
 .SS "Posix Error Reporting"
 .BR regerror ()
 is used to turn the error codes that can be returned by both

-- 
Heikki Orsila			Barbie's law:
heikki.orsila-X3B1VOXEql0@public.gmane.org		"Math is hard, let's go shopping!"
http://www.iki.fi/shd
