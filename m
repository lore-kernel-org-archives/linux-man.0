From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/5] add_key.2: change wording regarding storing of big_key
 payload
Date: Tue, 15 Nov 2016 11:44:14 +0300
Message-ID: <20161115084414.GA20638@obsidian>
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
 man2/add_key.2 | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/man2/add_key.2 b/man2/add_key.2
index b693927..78b1b99 100644
--- a/man2/add_key.2
+++ b/man2/add_key.2
@@ -126,8 +126,9 @@ contains a ':' that is preceded by other characters.
 This key type is similar to
 .IR """user""" ,
 but may hold a payload of up to 1 MiB.
-If the key payload is large,
-then it may be stored in swap space rather than kernel memory.
+If the key payload is large enough,
+then it may be stored in tmpfs (which can be swapped out) rather than kernel
+memory.
 .PP
 For further details on these key types, see
 .BR keyrings (7).
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
