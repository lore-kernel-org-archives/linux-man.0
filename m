Return-Path: <SRS0=ta0X=ZU=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E1C9C432C0
	for <linux-man@archiver.kernel.org>; Thu, 28 Nov 2019 12:47:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5199F215A5
	for <linux-man@archiver.kernel.org>; Thu, 28 Nov 2019 12:47:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M1+SxLJi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726653AbfK1MrN (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Thu, 28 Nov 2019 07:47:13 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:50853 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726320AbfK1MrM (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Thu, 28 Nov 2019 07:47:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574945232;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=mVLKBwSJ98GuK4IjQPbP0h4VqUx2MBnbh+pRXt276T8=;
        b=M1+SxLJi/IHrqQE1goReJWlv/tDWXd//oQEatasc6DY+gmjU87bDI3yg3AnMMHYSNDL3JR
        MRdZ/iJ2HOtzajEJgb2CD3Yo+4x7SGnkcMU5mWOWNyzJHeLRMiEim9Egl01tfqsTnjoj61
        B/OFkBxk3utDdlOk/74nsjH5lX4WcDM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-H9m4zoFGPIObyVb1gOkBxw-1; Thu, 28 Nov 2019 07:47:10 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 958938017CC;
        Thu, 28 Nov 2019 12:47:09 +0000 (UTC)
Received: from dcbz.redhat.com (ovpn-116-142.ams2.redhat.com [10.36.116.142])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C4CC65D9E1;
        Thu, 28 Nov 2019 12:47:08 +0000 (UTC)
From:   Adrian Reber <areber@redhat.com>
To:     mtk.manpages@gmail.com,
        Christian Brauner <christian.brauner@ubuntu.com>
Cc:     linux-man@vger.kernel.org
Subject: [PATCH 1/2] clone.2: tfix
Date:   Thu, 28 Nov 2019 13:46:49 +0100
Message-Id: <20191128124650.364810-1-areber@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: H9m4zoFGPIObyVb1gOkBxw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

added two missing parentheses

Signed-off-by: Adrian Reber <areber@redhat.com>
---
 man2/clone.2 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man2/clone.2 b/man2/clone.2
index e5ab2a096..076b9258e 100644
--- a/man2/clone.2
+++ b/man2/clone.2
@@ -1349,13 +1349,13 @@ For example, on aarch64,
 .I stack
 must be a multiple of 16.
 .TP
-.BR EINVAL " (" clone3 "() only"
+.BR EINVAL " (" clone3 "() only)"
 .B  CLONE_DETACHED
 was specified in the
 .I flags
 mask.
 .TP
-.BR EINVAL " (" clone "() only"
+.BR EINVAL " (" clone "() only)"
 .B CLONE_PIDFD
 was specified together with
 .B CLONE_DETACHED

base-commit: 445fc03eebeee9b0e9ccaa4e2361f91f30749e8e
--=20
2.23.0

