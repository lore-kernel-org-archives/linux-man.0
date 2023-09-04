Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2470AC83F3F
	for <linux-man@archiver.kernel.org>; Mon,  4 Sep 2023 18:54:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236572AbjIDSyO (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 4 Sep 2023 14:54:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239733AbjIDSyM (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 4 Sep 2023 14:54:12 -0400
Received: from a3.inai.de (a3.inai.de [IPv6:2a01:4f8:10b:45d8::f5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDB3E109
        for <linux-man@vger.kernel.org>; Mon,  4 Sep 2023 11:54:07 -0700 (PDT)
Received: by a3.inai.de (Postfix, from userid 65534)
        id 28CB85863A11D; Mon,  4 Sep 2023 20:54:06 +0200 (CEST)
Received: from a4.inai.de (a4.inai.de [IPv6:2a01:4f8:10b:45d8::f8])
        by a3.inai.de (Postfix) with ESMTP id B112D5863A11A;
        Mon,  4 Sep 2023 20:54:05 +0200 (CEST)
From:   Jan Engelhardt <jengelh@inai.de>
To:     alx@kernel.org
Cc:     linux-man@vger.kernel.org
Subject: [PATCH v2 1/2] fmod.3: add note how to obtain modulus/LPR
Date:   Mon,  4 Sep 2023 20:53:48 +0200
Message-ID: <20230904185405.89180-1-jengelh@inai.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <9a0c757e-b5e5-873c-a545-a8ea5e292394@kernel.org>
References: <9a0c757e-b5e5-873c-a545-a8ea5e292394@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Signed-off-by: Jan Engelhardt <jengelh@inai.de>
---
 man3/fmod.3 | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/man3/fmod.3 b/man3/fmod.3
index ee2333fdc..944bf4167 100644
--- a/man3/fmod.3
+++ b/man3/fmod.3
@@ -58,6 +58,20 @@ is the quotient of
 /
 .IR y ,
 rounded toward zero to an integer.
+.PP
+To obtain the modulus, more specifically, the Least Positive Residue, you will
+need to adjust the result from fmod like so:
+.PP
+.RS 4
+.nf
+z = fmod(x, y);
+if (z < 0)
+	z += y;
+.fi
+.RE
+.PP
+An alternate way to express this is with "fmod(fmod(x, y) + y, y)", but the
+second fmod usually costs way more than the one branch.
 .SH RETURN VALUE
 On success, these
 functions return the value \fIx\fP\ \-\ \fIn\fP*\fIy\fP,
-- 
2.42.0

