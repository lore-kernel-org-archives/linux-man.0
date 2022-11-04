Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E35CC4332F
	for <linux-man@archiver.kernel.org>; Fri,  4 Nov 2022 16:49:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232089AbiKDQtV (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 4 Nov 2022 12:49:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232100AbiKDQsl (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Fri, 4 Nov 2022 12:48:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A55BB4045B
        for <linux-man@vger.kernel.org>; Fri,  4 Nov 2022 09:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667580451;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=mOsqR13r1ta7XS+7ChZLP2YDd5qLU+o1FWqQi+e25+w=;
        b=NfPzQpa+q9rZJBJHMf7iLHEN37cTavu7IyuZ4wZHCs7snOtlgCizzYuf95zCdX9f0WVXS7
        d6hCvE8FC2YQYaK+nlx/RsWofhgBYhat344NNgqqzS79amWm6yvgqrn6h7cI8N/EngZSQn
        tbdbl0uSm2Nw+WTU6+9qk+xbi0LMwXA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-502-B5yg2burNRqAZDb7r77rqQ-1; Fri, 04 Nov 2022 12:47:30 -0400
X-MC-Unique: B5yg2burNRqAZDb7r77rqQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A04A380451B
        for <linux-man@vger.kernel.org>; Fri,  4 Nov 2022 16:47:30 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.2.16.19])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id B9BB040C6EE9
        for <linux-man@vger.kernel.org>; Fri,  4 Nov 2022 16:47:29 +0000 (UTC)
From:   Florian Weimer <fweimer@redhat.com>
To:     linux-man@vger.kernel.org
Subject: [PATCH] nsswitch.conf.5: Current glibc reloads this configuration file
Date:   Fri, 04 Nov 2022 17:47:27 +0100
Message-ID: <87mt96zmxs.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

The implementation happened across multiple glibc commits, but the work
was completed for glibc 2.33.

Signed-off-by: Florian Weimer <fweimer@redhat.com>

---
 man5/nsswitch.conf.5 | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/man5/nsswitch.conf.5 b/man5/nsswitch.conf.5
index 098585cf1..7049455ad 100644
--- a/man5/nsswitch.conf.5
+++ b/man5/nsswitch.conf.5
@@ -402,11 +402,13 @@ for respective databases:
 .PD
 .RE
 .SH NOTES
-Within each process that uses
-.BR nsswitch.conf ,
-the entire file is read only once.
-If the file is later changed, the
-process will continue using the old configuration.
+Starting with glibc 2.33,
+.\" https://sourceware.org/bugzilla/show_bug.cgi?id=12459
+.B nsswitch.conf
+is automatically reloaded if the file is changed.  In earlier
+versions, the entire file was read only once within each process, and
+if the file was later changed, the process would continue using the
+old configuration.
 .PP
 Traditionally, there was only a single source for service information,
 often in the form of a single configuration

base-commit: b106cd5bf43fe806100bb5266b78f92bac90b6e0

