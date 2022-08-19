Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FD85C32771
	for <linux-man@archiver.kernel.org>; Fri, 19 Aug 2022 19:27:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351251AbiHST1L (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 19 Aug 2022 15:27:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349705AbiHST1K (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Fri, 19 Aug 2022 15:27:10 -0400
X-Greylist: delayed 1056 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 19 Aug 2022 12:27:09 PDT
Received: from 10.mo548.mail-out.ovh.net (10.mo548.mail-out.ovh.net [46.105.77.235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00B8281B2F
        for <linux-man@vger.kernel.org>; Fri, 19 Aug 2022 12:27:09 -0700 (PDT)
Received: from mxplan6.mail.ovh.net (unknown [10.109.146.192])
        by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 33ADE2264C;
        Fri, 19 Aug 2022 19:09:03 +0000 (UTC)
Received: from jwilk.net (37.59.142.95) by DAG4EX1.mxp6.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 19 Aug
 2022 21:09:02 +0200
Authentication-Results: garm.ovh; auth=pass (GARM-95G00192096de1-08c7-4526-83f1-88d8231b98a3,
                    504186192CBDCCB46C37AA7B8534EBBC1F215137) smtp.auth=jwilk@jwilk.net
X-OVh-ClientIp: 5.172.255.242
From:   Jakub Wilk <jwilk@jwilk.net>
To:     Michael Kerrisk <mtk.manpages@gmail.com>,
        Alejandro Colomar <alx.manpages@gmail.com>
CC:     <linux-man@vger.kernel.org>
Subject: [PATCH 02/10] landlock_restrict_self.2: tfix
Date:   Fri, 19 Aug 2022 21:08:51 +0200
Message-ID: <20220819190859.6248-2-jwilk@jwilk.net>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220819190859.6248-1-jwilk@jwilk.net>
References: <20220819190859.6248-1-jwilk@jwilk.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG1EX1.mxp6.local (172.16.2.1) To DAG4EX1.mxp6.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d92e5265-cda8-4dd0-ac64-0d40a7d541d6
X-Ovh-Tracer-Id: 16127108791052064736
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeiuddgudefjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvvefufffkofgjfhgggfgtihesthekredtredttdenucfhrhhomheplfgrkhhusgcuhghilhhkuceojhifihhlkhesjhifihhlkhdrnhgvtheqnecuggftrfgrthhtvghrnhepieetheevtdffvddvkeegveeujeekheegteelvdehgfdtueejfffhleduveeuueevnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghniedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehjfihilhhksehjfihilhhkrdhnvghtpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqmhgrnhesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheegke
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk@jwilk.net>
---
 man2/landlock_restrict_self.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/landlock_restrict_self.2 b/man2/landlock_restrict_self.2
index b83f3bedb..32ace3b26 100644
--- a/man2/landlock_restrict_self.2
+++ b/man2/landlock_restrict_self.2
@@ -33,7 +33,7 @@ A domain can only be updated in such a way that
 the constraints of each past and future composed rulesets
 will restrict the thread and its future children for their entire life.
 It is then possible to gradually enforce tailored access control policies
-with multiple independant rulesets coming from different sources
+with multiple independent rulesets coming from different sources
 (e.g., init system configuration, user session policy,
 built-in application policy).
 However, most applications should only need one call to
-- 
2.37.2

