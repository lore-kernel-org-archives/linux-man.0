From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH draft_keys 2/7] keyrings.7: minor clarification rearding
 storage method used in keyrings
Date: Fri, 25 Nov 2016 04:00:57 +0300
Message-ID: <20161125010057.GA345@obsidian>
References: <51643019-bb42-4066-c824-c55b9e668ac6@man7.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <51643019-bb42-4066-c824-c55b9e668ac6-ASgREoAs3yw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

---
 man7/keyrings.7 | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/man7/keyrings.7 b/man7/keyrings.7
index 81de084..ed3bbee 100644
--- a/man7/keyrings.7
+++ b/man7/keyrings.7
@@ -117,7 +117,10 @@ to which the key is of interest
 .IR """afs:mykey""" ).
 .TP
 .I """keyring"""
-Keyrings are special keys whose payload consists of a set of links
+'\" Note that keyrings use different fields in struct key in order to store
+'\" their data - index_key instead of type/description and name_link/keys
+'\" instead of payload.
+Keyrings are special keys which store a set of links
 to other keys (including other keyrings),
 analogous to a directory holding links to files.
 The main purpose of a keyring is to prevent other keys from
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
