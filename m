From: Rodrigo Campos <rodrigo-aOqSs0FX/Gu4Tu3zPC53fQ@public.gmane.org>
Subject: [PATCH v2] futex.2: Fix link to Rusty's futex example library
Date: Mon, 30 Sep 2013 19:50:43 +0100
Message-ID: <1380567043-10102-1-git-send-email-rodrigo@sdfg.com.ar>
References: <1380056659-24306-1-git-send-email-rodrigo@sdfg.com.ar>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1380056659-24306-1-git-send-email-rodrigo-aOqSs0FX/Gu4Tu3zPC53fQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rodrigo Campos <rodrigo-aOqSs0FX/Gu4Tu3zPC53fQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

When I asked to webmaster-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Konstantin Ryabitsev answered that the
".nl." is "an obsolete scheme and really should be changed to just
ftp.kernel.org". So this patch does just this change.

I also did a git grep for "\..*\.kernel.org" and didn't find anything wierd.
Just an example using ftp.us.kernel.org in man3/getaddrinfo_a.3 where other
domains used in the example also don't work. I'm not sure we want to fix this,
but if we want, we should probably do it in a separate patch.

Signed-off-by: Rodrigo Campos <rodrigo-aOqSs0FX/Gu4Tu3zPC53fQ@public.gmane.org>
---
 man2/futex.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/futex.2 b/man2/futex.2
index 78e3de0..a59b0a4 100644
--- a/man2/futex.2
+++ b/man2/futex.2
@@ -326,5 +326,5 @@ read the sources of the futex user-space library referenced below.
 .PP
 Futex example library, futex-*.tar.bz2 at
 .br
-.UR ftp://ftp.nl.kernel.org\:/pub\:/linux\:/kernel\:/people\:/rusty/
+.UR ftp://ftp.kernel.org\:/pub\:/linux\:/kernel\:/people\:/rusty/
 .UE
-- 
1.8.4.rc3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
