Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14B1AC433F5
	for <linux-man@archiver.kernel.org>; Sat,  5 Mar 2022 18:10:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231703AbiCESKr (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sat, 5 Mar 2022 13:10:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229806AbiCESKr (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sat, 5 Mar 2022 13:10:47 -0500
Received: from smtp.gentoo.org (mail.gentoo.org [IPv6:2001:470:ea4a:1:5054:ff:fec7:86e4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFB9C3DDD2
        for <linux-man@vger.kernel.org>; Sat,  5 Mar 2022 10:09:57 -0800 (PST)
Received: by smtp.gentoo.org (Postfix, from userid 559)
        id 73C9B34305A; Sat,  5 Mar 2022 18:09:57 +0000 (UTC)
From:   Mike Frysinger <vapier@gentoo.org>
To:     Michael Kerrisk <mtk.manpages@gmail.com>
Cc:     linux-man@vger.kernel.org
Subject: [PATCH] printf.3: fix prototype indentation
Date:   Sat,  5 Mar 2022 13:10:01 -0500
Message-Id: <20220305181001.20757-1-vapier@gentoo.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 man3/printf.3 | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/man3/printf.3 b/man3/printf.3
index 4fa1f11f3c25..e39fb069b133 100644
--- a/man3/printf.3
+++ b/man3/printf.3
@@ -47,19 +47,19 @@ vsprintf, vsnprintf \- formatted output conversion
 .BI "int sprintf(char *restrict " str ,
 .BI "            const char *restrict " format ", ...);"
 .BI "int snprintf(char *restrict " str ", size_t " size ,
-.BI "            const char *restrict " format ", ...);"
+.BI "             const char *restrict " format ", ...);"
 .PP
 .B #include <stdarg.h>
 .PP
 .BI "int vprintf(const char *restrict " format ", va_list " ap );
 .BI "int vfprintf(FILE *restrict " stream ,
-.BI "            const char *restrict " format ", va_list " ap );
+.BI "             const char *restrict " format ", va_list " ap );
 .BI "int vdprintf(int " fd ,
-.BI "            const char *restrict " format ", va_list " ap );
+.BI "             const char *restrict " format ", va_list " ap );
 .BI "int vsprintf(char *restrict " str ,
-.BI "            const char *restrict " format ", va_list " ap );
+.BI "             const char *restrict " format ", va_list " ap );
 .BI "int vsnprintf(char *restrict " str ", size_t " size ,
-.BI "            const char *restrict " format ", va_list " ap );
+.BI "              const char *restrict " format ", va_list " ap );
 .fi
 .PP
 .RS -4
-- 
2.34.1

