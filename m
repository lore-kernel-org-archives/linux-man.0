From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: inet_aton man page
Date: Sat, 19 Apr 2014 09:15:29 +0200
Message-ID: <53522291.20302@gmail.com>
References: <534205BE.7040003@beamcommunications.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <534205BE.7040003-5IW6GhIdNBM/ppqrhe30yRZCeNDtXRbv@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Craig McQueen <craig.mcqueen-5IW6GhIdNBM/ppqrhe30yRZCeNDtXRbv@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/07/2014 03:56 AM, Craig McQueen wrote:
> In the inet_aton man page, should it say "Class A" where it currently 
> says "Class C"?

Okay, I see the problem now, and have changed as you suggest.

Cheers,

Michael


diff --git a/man3/inet.3 b/man3/inet.3
index ce9bba8..611655d 100644
--- a/man3/inet.3
+++ b/man3/inet.3
@@ -108,7 +108,7 @@ Part
 .I b
 is interpreted as a 24-bit value that defines the rightmost three bytes
 of the binary address.
-This notation is suitable for specifying (outmoded) Class C
+This notation is suitable for specifying (outmoded) Class A
 network addresses.
 .TP
 .I a



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
