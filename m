From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: indent in the elf.5
Date: Thu, 11 Feb 2010 21:13:26 +0300
Message-ID: <20100211211326.2eb251c3@keeper.home.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/G_hvBEnnGkF_QO9Uf6GyTb7"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--MP_/G_hvBEnnGkF_QO9Uf6GyTb7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello.

Tiny patch for adding indent.

-- 
Best Regards,
Yuri Kozlov


--MP_/G_hvBEnnGkF_QO9Uf6GyTb7
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=elf.5.diff

--- /tmp/elf.5	2010-02-11 20:59:36.000000000 +0300
+++ elf.5	2010-02-11 21:04:57.000000000 +0300
@@ -845,6 +845,7 @@
 An object file does not have sections for
 these special indices:
 .\" .Bl -tag -width "SHN_LORESERVE"
+.RS
 .TP 14
 .BR SHN_UNDEF
 This value marks an undefined, missing, irrelevant or otherwise meaningless
@@ -884,6 +885,7 @@
 inclusive.
 The section header table does not contain entries for the
 reserved indices.
+.RE
 .\" .El
 .PP
 The section header has the following structure:

--MP_/G_hvBEnnGkF_QO9Uf6GyTb7--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
