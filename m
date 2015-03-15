From: =?UTF-8?q?St=C3=A9phane=20Aulery?= <saulery-GANU6spQydw@public.gmane.org>
Subject: [PATCH] find_repeated_words.sh: Do not process files that are redirects.
Date: Sun, 15 Mar 2015 01:15:24 +0100
Message-ID: <1426378524-31758-1-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: =?UTF-8?q?St=C3=A9phane=20Aulery?= <saulery-GANU6spQydw@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
---
 scripts/find_repeated_words.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/find_repeated_words.sh b/scripts/find_repeated_wor=
ds.sh
index 50133be..747872e 100644
--- a/scripts/find_repeated_words.sh
+++ b/scripts/find_repeated_words.sh
@@ -25,6 +25,9 @@
 #
=20
 for file in "$@" ; do=20
+   # Do not process files that are redirects.
+   grep -qE "^\.so man.*" "$file"
+   if test $? -ne 0; then
     words=3D$(MANWIDTH=3D2000 man -l "$file" 2> /dev/null | col -b | \
 	tr ' \008' '\012' | sed -e '/^$/d' | \
 	sed 's/ *$//' |=20
@@ -33,4 +36,5 @@ for file in "$@" ; do
     if test -n "$words"; then
         echo "$file: $words"
     fi
+   fi
 done
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
