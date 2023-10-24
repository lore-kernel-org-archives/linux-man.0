Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8338BC00A8F
	for <linux-man@archiver.kernel.org>; Tue, 24 Oct 2023 19:29:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234736AbjJXT3Y (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 24 Oct 2023 15:29:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234703AbjJXT3W (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Tue, 24 Oct 2023 15:29:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB37B10C3
        for <linux-man@vger.kernel.org>; Tue, 24 Oct 2023 12:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1698175715;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to; bh=zjlevQOu/yghQf861DLPGggZezjaEwlSa6VXYuP/88Q=;
        b=Dz4kx7uHPXQlP+BNmuY+UZzooNS/r/mTiRYXppKF7SJYSZXlUOV7vbvdSSUU6L7x7t5RtE
        y24e6gb9hy6pnsa2mASSVrC/+Bxe+ivvIlJkeVwTfp1y7DgnVxXKlIE56Th/87UTVTUEvT
        GBdCePknkVELO17tAU2qd1gyK62LbdQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-evfrbg8_P62TWySNP6Ea2w-1; Tue, 24 Oct 2023 15:28:32 -0400
X-MC-Unique: evfrbg8_P62TWySNP6Ea2w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C433E101A53B;
        Tue, 24 Oct 2023 19:28:31 +0000 (UTC)
Received: from greed.delorie.com (unknown [10.22.8.21])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id A34391121314;
        Tue, 24 Oct 2023 19:28:31 +0000 (UTC)
Received: from greed.delorie.com.redhat.com (localhost [127.0.0.1])
        by greed.delorie.com (8.15.2/8.15.2) with ESMTP id 39OJSUG03982866;
        Tue, 24 Oct 2023 15:28:30 -0400
From:   DJ Delorie <dj@redhat.com>
To:     Alejandro Colomar <alx@kernel.org>
Cc:     adhemerval.zanella@linaro.org, vincent@vinc17.net,
        linux-man@vger.kernel.org, libc-alpha@sourceware.org
Subject: Re: [PATCH] mcheck.3, mtrace.3: update examples for glibc 2.34
In-Reply-To: <ZTgQi4afYgYFzUBV@debian>
Date:   Tue, 24 Oct 2023 15:28:30 -0400
Message-ID: <xnjzrbu8f5.fsf@greed.delorie.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Alejandro Colomar <alx@kernel.org> writes:
> Why was it moved to a different library?

Security.  Moving unneeded code out of libc.so makes it unavailable to
hackers.  The malloc-related code in glibc is a common target for such
things.

