Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E4E4C49EA6
	for <linux-man@archiver.kernel.org>; Thu, 24 Jun 2021 17:38:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76D05613DC
	for <linux-man@archiver.kernel.org>; Thu, 24 Jun 2021 17:38:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232456AbhFXRkx (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Thu, 24 Jun 2021 13:40:53 -0400
Received: from mail1.protonmail.ch ([185.70.40.18]:54102 "EHLO
        mail1.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbhFXRkw (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Thu, 24 Jun 2021 13:40:52 -0400
Date:   Thu, 24 Jun 2021 17:38:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spmail.info;
        s=protonmail2; t=1624556311;
        bh=YuLP0x2q2xuK1KSTlbH5NZFGYbKe4IwGfH5HVJndj1c=;
        h=Date:To:From:Reply-To:Subject:From;
        b=hMEZrZxO+dE96WIoMBBPUNpv0rYsMi/GQIeLkZb7486z5XoCTk7DXtgJDZ5Gvc2Ev
         RHSAIzVTxJgjtOQOW6HhiyoegrTeafeRSZg+PMjiHrOyn/UF1+6dKEbyNcVZv8mfad
         +VJJiE3OskWPGBQOl1vFwecrq2usrJSBiW0+f1FrJG/w3eKRLEKcZP23OPBGIb7PRE
         uxAokd5mM3CVMZds3WHpBUuWaFlx+2nK/lUQ6OtA82ttlBVCyBEFHsTGMRjJC1crYS
         kEfUH8NbmpBxUkftbNHz0Z+9EhT7fli8izl42zmuLrCSuxlI+tTfzVLOmmMVW68+bV
         Ot2wEAPM+87mQ==
To:     "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>,
        Alejandro Colomar <alx.manpages@gmail.com>,
        Michael Kerrisk <mtk.manpages@gmail.com>
From:   Sergey Petrakov <kr@spmail.info>
Reply-To: Sergey Petrakov <kr@spmail.info>
Subject: [PATCH] printf.3: wfix
Message-ID: <OS__dSBxRx5DHJbgzyVTGxQ5GDBYmp9SjHoKTnxdL-t-y60vMFJUa9J7wrZIUrvgOcROHoSowVhKznMQJ7lOqbb1rv9M8vB8RdzXhp9Q-zA=@spmail.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Signed-off-by: Sergey Petrakov <kr@spmail.info>
---
 man3/printf.3 | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/man3/printf.3 b/man3/printf.3
index fcc3bd6f3..28435af62 100644
--- a/man3/printf.3
+++ b/man3/printf.3
@@ -114,9 +114,8 @@ is the same as
 .BR fprintf ()
 except that it outputs to a file descriptor,
 .IR fd ,
-instead of to a
-.I stdio
-stream.
+instead of to the given output
+.IR stream .
 .PP
 The functions
 .BR snprintf ()
--
2.20.1

