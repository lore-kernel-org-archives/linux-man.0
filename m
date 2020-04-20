Return-Path: <SRS0=zzzS=6E=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45F84C3815B
	for <linux-man@archiver.kernel.org>; Mon, 20 Apr 2020 14:48:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 29AED206D5
	for <linux-man@archiver.kernel.org>; Mon, 20 Apr 2020 14:48:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726878AbgDTOr7 (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 20 Apr 2020 10:47:59 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:35381 "EHLO
        smtpout1.mo529.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726102AbgDTOr7 (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 20 Apr 2020 10:47:59 -0400
Received: from mxplan6.mail.ovh.net (unknown [10.109.138.17])
        by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 69DF3308485A;
        Mon, 20 Apr 2020 16:47:57 +0200 (CEST)
Received: from jwilk.net (37.59.142.96) by DAG4EX2.mxp6.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Mon, 20 Apr
 2020 16:47:56 +0200
From:   Jakub Wilk <jwilk@jwilk.net>
To:     <bpf@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>
CC:     <linux-man@vger.kernel.org>,
        Michael Kerrisk <mtk.manpages@gmail.com>
Subject: [PATCH] bpf: Fix reStructuredText markup
Date:   Mon, 20 Apr 2020 16:47:53 +0200
Message-ID: <20200420144753.3718-1-jwilk@jwilk.net>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG8EX1.mxp6.local (172.16.2.71) To DAG4EX2.mxp6.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: e9a003d9-0f12-4db7-aa11-c3e0773969a1
X-Ovh-Tracer-Id: 13122644893197588262
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrgeefgdektdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgggfgtihesthekredtredttdenucfhrhhomheplfgrkhhusgcuhghilhhkuceojhifihhlkhesjhifihhlkhdrnhgvtheqnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnheirdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepjhifihhlkhesjhifihhlkhdrnhgvthdprhgtphhtthhopehmthhkrdhmrghnphgrghgvshesghhmrghilhdrtghomh
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Fixes:

    $ scripts/bpf_helpers_doc.py > bpf-helpers.rst
    $ rst2man bpf-helpers.rst > bpf-helpers.7
    bpf-helpers.rst:1105: (WARNING/2) Inline strong start-string without end-string.

Signed-off-by: Jakub Wilk <jwilk@jwilk.net>
---
 include/uapi/linux/bpf.h       | 2 +-
 tools/include/uapi/linux/bpf.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
index 2e29a671d67e..c879c155bf3b 100644
--- a/include/uapi/linux/bpf.h
+++ b/include/uapi/linux/bpf.h
@@ -1642,7 +1642,7 @@ union bpf_attr {
  * 		ifindex, but doesn't require a map to do so.
  * 	Return
  * 		**XDP_REDIRECT** on success, or the value of the two lower bits
- * 		of the **flags* argument on error.
+ * 		of the **flags** argument on error.
  *
  * int bpf_sk_redirect_map(struct sk_buff *skb, struct bpf_map *map, u32 key, u64 flags)
  * 	Description
diff --git a/tools/include/uapi/linux/bpf.h b/tools/include/uapi/linux/bpf.h
index 2e29a671d67e..c879c155bf3b 100644
--- a/tools/include/uapi/linux/bpf.h
+++ b/tools/include/uapi/linux/bpf.h
@@ -1642,7 +1642,7 @@ union bpf_attr {
  * 		ifindex, but doesn't require a map to do so.
  * 	Return
  * 		**XDP_REDIRECT** on success, or the value of the two lower bits
- * 		of the **flags* argument on error.
+ * 		of the **flags** argument on error.
  *
  * int bpf_sk_redirect_map(struct sk_buff *skb, struct bpf_map *map, u32 key, u64 flags)
  * 	Description
-- 
2.26.1

