From: =?UTF-8?B?RGF2aWQgUHLDqXZvdA==?= <david-EYFo4vFR6XNAfugRpC6u6w@public.gmane.org>
Subject: [PATCH] getent.1: ffix
Date: Fri, 09 Mar 2012 23:12:02 -0400
Message-ID: <4F5AC682.5080708@tilapin.org>
References: <1331330821-25895-1-git-send-email-taffit@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1331330821-25895-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Michael,

Just spotted this one too while reviewing the translation: as the
previous one, the purpose is to comply with man(1) conventions.

Regards

David

diff --git a/man1/getent.1 b/man1/getent.1
index 8caf8aa..1b3f3de 100644
--- a/man1/getent.1
+++ b/man1/getent.1
@@ -28,7 +28,7 @@ getent \- get entries from Name Service Switch libraries
 .IR database " [" key " ...]"
 .SH DESCRIPTION
 The
-.I getent
+.B getent
 command displays entries from databases supported by the
 Name Service Switch libraries,
 which are configured in
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
