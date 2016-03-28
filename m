From: mitch-mA1pf0pi6YpWk0Htik3J/w@public.gmane.org
Subject: [patch] add_key.2: Empty payloads are not allowed in user-defined
 keys.
Date: Mon, 28 Mar 2016 20:45:28 +0000 (UTC)
Message-ID: <alpine.LNX.2.00.1603281843250.15978@sisyphus>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

---
  man2/add_key.2 | 3 ---
  1 file changed, 3 deletions(-)

diff --git a/man2/add_key.2 b/man2/add_key.2
index ae0d59f..6d318c1 100644
--- a/man2/add_key.2
+++ b/man2/add_key.2
@@ -74,9 +74,6 @@ may be any valid string, though it is preferred that the description be
  prefixed with a string representing the service to which the key is of interest
  and a colon (for instance
  .RB \*(lq afs:mykey \*(rq).
-The
-.I payload
-may be empty or NULL for keys of this type.
  .TP
  .B \*(lqkeyring\*(rq
  Keyrings are special key types that may contain links to sequences of other
-- 
Both add_key and the utility "keyctl add" return EINVAL when attempting to 
add a user key with an empty or NULL payload.

The manpage implies that this should be valid.

>From my reading of the kernel source, this has not been possible since at 
least linux kernel commit 1da177e4 (2.6.12-rc2 on 2005-04-16).

Until kernel commit cf7f601c, 
security/keys/user_defined.c:user_instantiate returned -EINVAL if datalen 
<= 0.  That commit only moved this behavior to a new user_preparse 
function, where it remains today in b562e44f (4.5.0 on 2016-03-13).

I'm glad to provide some code to demonstrate this, if desired.

Sincerely,

Mitch Walker
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
