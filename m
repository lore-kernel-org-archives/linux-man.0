From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/5] add_key.2: wording change regarding the reasons of call
 faliure
Date: Tue, 15 Nov 2016 11:43:58 +0300
Message-ID: <20161115084358.GA20227@obsidian>
References: <9a5cc2a7-a505-9d0d-5b78-4bc5ab100ff1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <9a5cc2a7-a505-9d0d-5b78-4bc5ab100ff1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

---
 man2/add_key.2 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man2/add_key.2 b/man2/add_key.2
index 1dfbd7d..b693927 100644
--- a/man2/add_key.2
+++ b/man2/add_key.2
@@ -37,8 +37,8 @@ attaches it to the nominated
 .IR keyring ,
 and returns the key's serial number.
 .P
-The key type may reject the data if it is in the wrong format or
-is in some other way invalid.
+The key may be rejected if the provided data is in the wrong format or
+it is invalid in some other way.
 .P
 If the destination
 .I keyring
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
