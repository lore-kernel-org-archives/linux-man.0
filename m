From: =?windows-1252?Q?David_Pr=E9vot?= <davidp-whniv8GeeGkdnm+yROfE0A@public.gmane.org>
Subject: [patch] hosts.5, protocols.5, spufs.7, termio.7: Uniform description
 (Was: armscii-8.7, koi8-r.7, koi8-u.7, unicode.7)
Date: Mon, 25 Oct 2010 08:38:49 -0400
Message-ID: <ia3toq$lvd$1@dough.gmane.org>
References: <ia2bm0$2lt$1@dough.gmane.org> <AANLkTi=DngvZdHPMqQmH9DQZ750ukoKZfzayWLDkBOQw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTi=DngvZdHPMqQmH9DQZ750ukoKZfzayWLDkBOQw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Michael,

> All changes are now pushed to git; you may wish to check.

Seems fine, thanks.

> Thanks. Applied for 3.30. I prefer without "the", and made that chang=
e also.

Agreed. Please find inline another tiny patch in order to shrink the de=
finite
article from some other pages (found with =93rgrep -i ' \\\- the' man*/=
=94).


diff --git a/man5/hosts.5 b/man5/hosts.5
index cb9b253..513a4e3 100644
--- a/man5/hosts.5
+++ b/man5/hosts.5
@@ -26,7 +26,7 @@
 .\"
 .TH HOSTS 5 2002-06-16 "Linux" "Linux Programmer's Manual"
 .SH NAME
-hosts \- The static table lookup for hostnames
+hosts \- static table lookup for hostnames
 .SH SYNOPSIS
 .B /etc/hosts
 .SH DESCRIPTION
diff --git a/man5/protocols.5 b/man5/protocols.5
index d414093..9c644f7 100644
--- a/man5/protocols.5
+++ b/man5/protocols.5
@@ -27,7 +27,7 @@
 .\"
 .TH PROTOCOLS 5 2008-09-23 "Linux" "Linux Programmer's Manual"
 .SH NAME
-protocols \- the protocols definition file
+protocols \- protocols definition file
 .SH DESCRIPTION
 This file is a plain ASCII file, describing the various DARPA internet
 protocols that are available from the TCP/IP subsystem.
diff --git a/man7/spufs.7 b/man7/spufs.7
index 64c4357..ee65298 100644
--- a/man7/spufs.7
+++ b/man7/spufs.7
@@ -25,7 +25,7 @@
 .\"
 .TH SPUFS 7 2007-12-20 Linux "Linux Programmer's Manual"
 .SH NAME
-spufs \- the SPU file system
+spufs \- SPU file system
 .SH DESCRIPTION
 The SPU file system is used on PowerPC machines that implement the
 Cell Broadband Engine Architecture in order to access Synergistic
diff --git a/man7/termio.7 b/man7/termio.7
index d6c20c0..bfa9003 100644
--- a/man7/termio.7
+++ b/man7/termio.7
@@ -24,7 +24,7 @@
 .\"
 .TH TERMIO 7 2006-12-28 "Linux" "Linux Programmer's Manual"
 .SH NAME
-termio \- the System V terminal driver interface
+termio \- System V terminal driver interface
 .SH DESCRIPTION
 .B termio
 is the name of the old System V terminal driver interface.


Cheers

David


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
